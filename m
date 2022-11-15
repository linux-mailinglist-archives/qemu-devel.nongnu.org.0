Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB15629BFC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwqv-0006zB-6M; Tue, 15 Nov 2022 09:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr>)
 id 1ouwqs-0006u4-H3
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:23:50 -0500
Received: from mail.cri.epita.fr ([91.243.117.197]
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr>)
 id 1ouwqq-0004j6-Mc
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:23:50 -0500
Received: from localhost (unknown [185.123.26.202])
 (Authenticated sender: damhet_a)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id 4D9D23FC81;
 Tue, 15 Nov 2022 15:23:43 +0100 (CET)
From: antoine.damhet@shadow.tech
To: qemu-devel@nongnu.org
Cc: vm@shadow.tech, Antoine Damhet <antoine.damhet@shadow.tech>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/2] crypto: TLS: introduce `check_pending`
Date: Tue, 15 Nov 2022 15:23:28 +0100
Message-Id: <20221115142329.92524-2-antoine.damhet@shadow.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115142329.92524-1-antoine.damhet@shadow.tech>
References: <20221115142329.92524-1-antoine.damhet@shadow.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=91.243.117.197;
 envelope-from=SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Antoine Damhet <antoine.damhet@shadow.tech>

The new `qcrypto_tls_session_check_pending` function allows the caller
to know if data have already been consumed from the backend and is
already available.

Signed-off-by: Antoine Damhet <antoine.damhet@shadow.tech>
---
 crypto/tlssession.c         | 14 ++++++++++++++
 include/crypto/tlssession.h | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index b302d835d2..1e98f44e0d 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -493,6 +493,13 @@ qcrypto_tls_session_read(QCryptoTLSSession *session,
 }
 
 
+size_t
+qcrypto_tls_session_check_pending(QCryptoTLSSession *session)
+{
+    return gnutls_record_check_pending(session->handle);
+}
+
+
 int
 qcrypto_tls_session_handshake(QCryptoTLSSession *session,
                               Error **errp)
@@ -615,6 +622,13 @@ qcrypto_tls_session_read(QCryptoTLSSession *sess,
 }
 
 
+size_t
+qcrypto_tls_session_check_pending(QCryptoTLSSession *session)
+{
+    return 0;
+}
+
+
 int
 qcrypto_tls_session_handshake(QCryptoTLSSession *sess,
                               Error **errp)
diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index 15b9cef086..571049bd0e 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -248,6 +248,17 @@ ssize_t qcrypto_tls_session_read(QCryptoTLSSession *sess,
                                  char *buf,
                                  size_t len);
 
+/**
+ * qcrypto_tls_session_check_pending:
+ * @sess: the TLS session object
+ *
+ * Check if there are unread data in the TLS buffers that have
+ * already been read from the underlying data source.
+ *
+ * Returns: the number of bytes available or zero
+ */
+size_t qcrypto_tls_session_check_pending(QCryptoTLSSession *sess);
+
 /**
  * qcrypto_tls_session_handshake:
  * @sess: the TLS session object
-- 
2.38.1


