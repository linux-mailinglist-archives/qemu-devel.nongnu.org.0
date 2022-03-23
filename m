Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAD4E564A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:24:33 +0100 (CET)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3mi-0003zD-FS
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:24:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PH-0005HL-K6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PF-0005M6-Pg
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmJ0zia0xB9F8E9cUHoWzojDoEiZURQYe5S4EP8W6l8=;
 b=DC1QfbiI32F5I6dmzoaZo20daMDT/Xc548Por5fF18nAM0V/xW1lNNpcvZfQ5D/KEHk+Lx
 wtUJ7T1dSLMSeuXrsVGjZxTZcT1Fd6mtsztOrvxe7p5+YWxfAsAGpBH9z9WZFjI5iNjiSi
 09E/vC+DjjsBOxgwy+U0ouMQ5jYHS7U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-z4CTaXohNKaUao4br3aVBA-1; Wed, 23 Mar 2022 12:00:15 -0400
X-MC-Unique: z4CTaXohNKaUao4br3aVBA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAC47804183
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 16:00:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D069B401E39;
 Wed, 23 Mar 2022 16:00:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 19/32] include: move coroutine IO functions to coroutine.h
Date: Wed, 23 Mar 2022 19:57:30 +0400
Message-Id: <20220323155743.1585078-20-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h    | 23 -----------------------
 include/qemu/coroutine.h | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 2e1e76014a5f..fdb0b16166a5 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -45,29 +45,6 @@ bool set_preferred_target_page_bits(int bits);
  */
 void finalize_target_page_bits(void);
 
-/**
- * Sends a (part of) iovec down a socket, yielding when the socket is full, or
- * Receives data into a (part of) iovec from a socket,
- * yielding when there is no data in the socket.
- * The same interface as qemu_sendv_recvv(), with added yielding.
- * XXX should mark these as coroutine_fn
- */
-ssize_t qemu_co_sendv_recvv(int sockfd, struct iovec *iov, unsigned iov_cnt,
-                            size_t offset, size_t bytes, bool do_send);
-#define qemu_co_recvv(sockfd, iov, iov_cnt, offset, bytes) \
-  qemu_co_sendv_recvv(sockfd, iov, iov_cnt, offset, bytes, false)
-#define qemu_co_sendv(sockfd, iov, iov_cnt, offset, bytes) \
-  qemu_co_sendv_recvv(sockfd, iov, iov_cnt, offset, bytes, true)
-
-/**
- * The same as above, but with just a single buffer
- */
-ssize_t qemu_co_send_recv(int sockfd, void *buf, size_t bytes, bool do_send);
-#define qemu_co_recv(sockfd, buf, bytes) \
-  qemu_co_send_recv(sockfd, buf, bytes, false)
-#define qemu_co_send(sockfd, buf, bytes) \
-  qemu_co_send_recv(sockfd, buf, bytes, true)
-
 void qemu_progress_init(int enabled, float min_skip);
 void qemu_progress_end(void);
 void qemu_progress_print(float delta, int max);
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c828a95ee092..284571badb8a 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -343,4 +343,27 @@ void qemu_coroutine_decrease_pool_batch_size(unsigned int additional_pool_size);
 
 #include "qemu/lockable.h"
 
+/**
+ * Sends a (part of) iovec down a socket, yielding when the socket is full, or
+ * Receives data into a (part of) iovec from a socket,
+ * yielding when there is no data in the socket.
+ * The same interface as qemu_sendv_recvv(), with added yielding.
+ * XXX should mark these as coroutine_fn
+ */
+ssize_t qemu_co_sendv_recvv(int sockfd, struct iovec *iov, unsigned iov_cnt,
+                            size_t offset, size_t bytes, bool do_send);
+#define qemu_co_recvv(sockfd, iov, iov_cnt, offset, bytes) \
+  qemu_co_sendv_recvv(sockfd, iov, iov_cnt, offset, bytes, false)
+#define qemu_co_sendv(sockfd, iov, iov_cnt, offset, bytes) \
+  qemu_co_sendv_recvv(sockfd, iov, iov_cnt, offset, bytes, true)
+
+/**
+ * The same as above, but with just a single buffer
+ */
+ssize_t qemu_co_send_recv(int sockfd, void *buf, size_t bytes, bool do_send);
+#define qemu_co_recv(sockfd, buf, bytes) \
+  qemu_co_send_recv(sockfd, buf, bytes, false)
+#define qemu_co_send(sockfd, buf, bytes) \
+  qemu_co_send_recv(sockfd, buf, bytes, true)
+
 #endif /* QEMU_COROUTINE_H */
-- 
2.35.1.273.ge6ebfd0e8cbb


