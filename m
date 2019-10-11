Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B2CD3C02
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:12:41 +0200 (CEST)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqyW-0004az-7A
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIqtM-0005we-57
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIqtL-0004BC-5P
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:07:20 -0400
Received: from relay.sw.ru ([185.231.240.75]:60310)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIqtH-000476-OP; Fri, 11 Oct 2019 05:07:15 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIqtD-0000XM-Vc; Fri, 11 Oct 2019 12:07:12 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/5] hbitmap: handle set/reset with zero length
Date: Fri, 11 Oct 2019 12:07:07 +0300
Message-Id: <20191011090711.19940-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011090711.19940-1-vsementsov@virtuozzo.com>
References: <20191011090711.19940-1-vsementsov@virtuozzo.com>
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Passing zero length to these functions leads to unpredicted results.
Zero-length set/reset may occur in active-mirror, on zero-length write
(which is unlikely, but not guaranteed to never happen).

Let's just do nothing on zero-length request.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 util/hbitmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/hbitmap.c b/util/hbitmap.c
index fd44c897ab..86b0231046 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -387,6 +387,10 @@ void hbitmap_set(HBitmap *hb, uint64_t start, uint64_t count)
     uint64_t first, n;
     uint64_t last = start + count - 1;
 
+    if (count == 0) {
+        return;
+    }
+
     trace_hbitmap_set(hb, start, count,
                       start >> hb->granularity, last >> hb->granularity);
 
@@ -477,6 +481,10 @@ void hbitmap_reset(HBitmap *hb, uint64_t start, uint64_t count)
     uint64_t first;
     uint64_t last = start + count - 1;
 
+    if (count == 0) {
+        return;
+    }
+
     trace_hbitmap_reset(hb, start, count,
                         start >> hb->granularity, last >> hb->granularity);
 
-- 
2.21.0


