Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD05064E4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:54:40 +0200 (CEST)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghl1-0002l5-Ox
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglz-0001AC-11
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglu-0004Qv-Sy
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:32 -0400
Received: by mail-wr1-x431.google.com with SMTP id k22so20924239wrd.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54DtW3V9fXKiMM8ZvlFi5rLnJng8Z0PQBdNNEZOkJFU=;
 b=PtZ9TUslypFyaLhFQzGkR0CZtL+efLQpfonqczAWiq9sy49l/OO0N9VKHFUiARIsjD
 7swKxn3OKOy4VVMuMPP3DsQfYL4voDvzkFrU9Libp9R0p2hB29wCJ4ygMtRUt4U8Zi03
 SXLgSO6UWwQnTRjhkota9GwzEP1ktM5le/DL3/4xlYX/wsxyXostvtbL+UrGiNM2DXDx
 YyU5dvjNynow5O6RVXLIbUoelxXPaQ2mS1VUiYapOaBLnFXQzOE/CD+l/8DDyju0kk4E
 k1UhHgo9vVw2f2sgpehMKBo2eCbTcJAC+Iz13ohs6dbMBuHa2vE+Q3JNnDUu5dWqIvxl
 hqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=54DtW3V9fXKiMM8ZvlFi5rLnJng8Z0PQBdNNEZOkJFU=;
 b=x1zXQNhq3pEGDCnZskwbfdAb8H8nyQTtD8HtHR8bx4DKTe6LG1bMRd/Jym68H/nkrD
 mUXnNwR88d5gXoy9uaFZWqVTOpBRaxwi8XE7OMyd7s0k1YQIsl19cPBbr+hX0M9wl497
 P2ZZNGAyAHcDaFD0lP6wgiwmRvQQT7lhSntN2Yp+ymN/XoncObhpl1fVfWoyHBYu1Cc4
 l3pIjoNZwEo6XO6IWRPhhEYgHlNGSIDqGHgrlhjptzaFqTIHvqs+OD+825l8b4CceoYG
 8LYlzMwLJT4JL+2ZpjVe/2S6ENkBNpDAi01nGFuOirLvwyNw4Z4nV5D/cOYUK9erTtnG
 pNqA==
X-Gm-Message-State: AOAM531b3n66PWjJE77w0ycSnkGzVPFHkQcEgrK0Bwuacz/uPbNf2mjb
 3TgUbRdP7CyzD5AeyzD026ErFveiIg9Fwg==
X-Google-Smtp-Source: ABdhPJwljDg76rmbWVoLJQMvDsd8hbCa6q2OBxrB7LSDlQzxGC2+Bo11M1gFuO1oUwyL86D0/a0cEg==
X-Received: by 2002:a5d:49c1:0:b0:20a:a65b:4648 with SMTP id
 t1-20020a5d49c1000000b0020aa65b4648mr1374632wrs.707.1650347489143; 
 Mon, 18 Apr 2022 22:51:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/53] include: move coroutine IO functions to coroutine.h
Date: Tue, 19 Apr 2022 07:50:40 +0200
Message-Id: <20220419055109.142788-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-20-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu-common.h    | 23 -----------------------
 include/qemu/coroutine.h | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 2e1e76014a..fdb0b16166 100644
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
index c828a95ee0..284571badb 100644
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
2.35.1



