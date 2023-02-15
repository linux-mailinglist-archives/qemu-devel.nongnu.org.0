Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A969829E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLsM-00050p-CZ; Wed, 15 Feb 2023 12:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsK-0004zl-AY
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSLsI-0005CN-Ii
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676483242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dyy/1RzvkVp1pdcd4XazalgcwoIuoecJZnqiF2nDZkw=;
 b=XegZQbpDikIeufpXYfwDLCnlaBgBKXdPTUTRsSFwC+TOkxE2p0K9iJHkrlsvdldJX8JVdE
 fvGj9+junoccB/GEgzp45GCfHiNyyxK2OKjFKUvdJRGBNXrk34c5q1GeJvtNQZsgqTrk+/
 gCll+YbuM2mhn6dg0v5ylUGg95cPzJA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-BtrkAbymNheruMBZZrsNMw-1; Wed, 15 Feb 2023 12:47:19 -0500
X-MC-Unique: BtrkAbymNheruMBZZrsNMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1C813811F34;
 Wed, 15 Feb 2023 17:47:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F046140C1423;
 Wed, 15 Feb 2023 17:47:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Antoine Damhet <antoine.damhet@shadow.tech>
Subject: [PULL 1/5] crypto: TLS: introduce `check_pending`
Date: Wed, 15 Feb 2023 17:47:08 +0000
Message-Id: <20230215174712.1894516-2-berrange@redhat.com>
In-Reply-To: <20230215174712.1894516-1-berrange@redhat.com>
References: <20230215174712.1894516-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.39.1


