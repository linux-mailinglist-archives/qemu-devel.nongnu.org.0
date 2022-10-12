Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499675FC92A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:24:40 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieX9-0007t1-3O
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieEH-0003B8-R1
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oieE8-0005VR-Ki
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665590700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PiH6T6gMly3jr1v1LsPfDdUntrgXMzzWBurcO7SULak=;
 b=GTGDo71eW7GDz0GMTyNbY83DGL824euRCnxlTy8//He3bj3bfUwboqM4Bk2woekPpn+imq
 2wApUVyKPTmMY5iiNmM3r772ZVFQoxqfIsviZkzT1HXbiWG8ORQshvDhU5iZut+GDJRrNR
 BAN5WqKm+loR/JC6uqiojoMd/y/Jm5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-Kq9cBApLPkmV7zgaL52M1Q-1; Wed, 12 Oct 2022 12:04:56 -0400
X-MC-Unique: Kq9cBApLPkmV7zgaL52M1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49C4C85A5A6;
 Wed, 12 Oct 2022 16:04:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 812A6404CD9B;
 Wed, 12 Oct 2022 16:04:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 2/7] osdep: make readv_writev() work with partial read/write
Date: Wed, 12 Oct 2022 20:04:39 +0400
Message-Id: <20221012160444.3762795-3-marcandre.lureau@redhat.com>
In-Reply-To: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
References: <20221012160444.3762795-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

With a pipe or other reasons, read/write may return less than the
requested bytes. This happens with the test-io-channel-command test on
Windows. glib spawn code uses a binary pipe of 4096 bytes, and the first
read returns that much (although more are requested), for some unclear
reason...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221006113657.2656108-2-marcandre.lureau@redhat.com>
---
 util/osdep.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 60fcbbaebe..746d5f7d71 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -538,18 +538,22 @@ int socket_init(void)
 
 
 #ifndef CONFIG_IOVEC
-/* helper function for iov_send_recv() */
 static ssize_t
 readv_writev(int fd, const struct iovec *iov, int iov_cnt, bool do_write)
 {
     unsigned i = 0;
     ssize_t ret = 0;
+    ssize_t off = 0;
     while (i < iov_cnt) {
         ssize_t r = do_write
-            ? write(fd, iov[i].iov_base, iov[i].iov_len)
-            : read(fd, iov[i].iov_base, iov[i].iov_len);
+            ? write(fd, iov[i].iov_base + off, iov[i].iov_len - off)
+            : read(fd, iov[i].iov_base + off, iov[i].iov_len - off);
         if (r > 0) {
             ret += r;
+            off += r;
+            if (off < iov[i].iov_len) {
+                continue;
+            }
         } else if (!r) {
             break;
         } else if (errno == EINTR) {
@@ -562,6 +566,7 @@ readv_writev(int fd, const struct iovec *iov, int iov_cnt, bool do_write)
             }
             break;
         }
+        off = 0;
         i++;
     }
     return ret;
-- 
2.37.3


