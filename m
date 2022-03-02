Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B794CACA6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:57:15 +0100 (CET)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTDu-00017u-Mn
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7b-0006fU-Nu
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7Z-0008Fu-EZ
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvHFBbRTmwVPlF5r2fbx7Pmn4LhPvDqieoQ/2PM/D40=;
 b=Pcb66iqagHL/5OEvKWxTYD4ZeIKdKWkbMYP1tz49yova1tgTZnbMTSKPkVD+zDx1o5RMfv
 FyTgqTuHvHJcwmkPz8XL25/0BPlsSWTHF58g6mE5LOjwVaoiVYt6NXR7c9THudkmgxdiIF
 /X4w3iEjbtOqLlZVAmCQtJXD9PMQVuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-pWHA4S--MDGa1Cq8vjysFg-1; Wed, 02 Mar 2022 12:50:37 -0500
X-MC-Unique: pWHA4S--MDGa1Cq8vjysFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B4C1854E26
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:50:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1C538000B;
 Wed,  2 Mar 2022 17:50:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/18] crypto: mandate a hostname when checking x509 creds on
 a client
Date: Wed,  2 Mar 2022 17:49:20 +0000
Message-Id: <20220302174932.2692378-7-berrange@redhat.com>
In-Reply-To: <20220302174932.2692378-1-berrange@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the TLS session object assumes that the caller will always
provide a hostname when using x509 creds on a client endpoint. This
relies on the caller to detect and report an error if the user has
configured QEMU with x509 credentials on a UNIX socket. The migration
code has such a check, but it is too broad, reporting an error when
the user has configured QEMU with PSK credentials on a UNIX socket,
where hostnames are irrelevant.

Putting the check into the TLS session object credentials validation
code ensures we report errors in only the scenario that matters.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/tlssession.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index a8db8c76d1..b302d835d2 100644
--- a/crypto/tlssession.c
+++ b/crypto/tlssession.c
@@ -373,6 +373,12 @@ qcrypto_tls_session_check_certificate(QCryptoTLSSession *session,
                                session->hostname);
                     goto error;
                 }
+            } else {
+                if (session->creds->endpoint ==
+                    QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
+                    error_setg(errp, "No hostname for certificate validation");
+                    goto error;
+                }
             }
         }
 
-- 
2.34.1


