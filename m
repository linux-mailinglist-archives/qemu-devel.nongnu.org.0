Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DC5F655F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:46:35 +0200 (CEST)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogPKk-0001tT-G0
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBf-0003JV-R9
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogPBc-0000tm-H4
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665056227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NkOORsYWNnkKOl4yWuSB0pKUtZT0PTBRUW29bBje2oY=;
 b=UJgPVifXTX3T4v/0RbwWp+WpMkzAPE2Nk3pv46vYrAV1NW8wNv6IpmpXm55oxTTji2m3Kp
 iRONOR+HCGgZMVoGKmhN6Fpu1GRGjiWG6y7vF6Ui00p6n0l0LOKuFPalO1IQf6VqAZn3BP
 it9azPq90fZvVOxSQgvy5e/cZMmaUyw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-1FTNQyj5PN-Tq64-jHHSlw-1; Thu, 06 Oct 2022 07:37:06 -0400
X-MC-Unique: 1FTNQyj5PN-Tq64-jHHSlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9F085A59D
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 11:37:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F5191402BFE;
 Thu,  6 Oct 2022 11:37:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 1/6] osdep: make readv_writev() work with partial read/write
Date: Thu,  6 Oct 2022 15:36:52 +0400
Message-Id: <20221006113657.2656108-2-marcandre.lureau@redhat.com>
In-Reply-To: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
References: <20221006113657.2656108-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


