Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D432814DDB5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 16:24:05 +0100 (CET)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixBfo-00006E-Hc
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 10:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeT-0007FF-PK
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeS-0007Sm-Od
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:41 -0500
Received: from relay.sw.ru ([185.231.240.75]:47756)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeQ-0007Ii-8e; Thu, 30 Jan 2020 10:22:38 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeK-0008C5-M3; Thu, 30 Jan 2020 18:22:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/3] block/file-posix: consider file size when fallback to
 max_align
Date: Thu, 30 Jan 2020 18:22:17 +0300
Message-Id: <20200130152218.7600-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130152218.7600-1-vsementsov@virtuozzo.com>
References: <20200130152218.7600-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we failed to probe request_align, we fallback to max_align. But
this is wrong, if file size is not aligned to our max_align. Let's
instead chose alignment so that file size is a multiple of it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/file-posix.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 7f366046c2..e9c4e509f6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -385,11 +385,25 @@ static void raw_probe_alignment(BlockDriverState *bs, int fd, Error **errp)
             align = alignments[i];
             if (raw_is_io_aligned(fd, buf, align)) {
                 /* Fallback to safe value. */
-                bs->bl.request_alignment = (align != 1) ? align : max_align;
+                bs->bl.request_alignment = align;
                 break;
             }
         }
         qemu_vfree(buf);
+
+        if (bs->bl.request_alignment == 1) {
+            /*
+             * Succeed to read with alignment = 1. But it may be unallocated
+             * area on XFS, and we'll fail later if keep request_alignment = 1.
+             *
+             * Chose safer alignment, keeping in mind file size if possible.
+             */
+
+            int64_t len = raw_getlength_fd(bs, fd);
+
+            bs->bl.request_alignment =
+                    len <= 0 ? max_align : MIN(max_align, len & ~(len - 1));
+        }
     }
 
     if (!s->buf_align) {
-- 
2.21.0


