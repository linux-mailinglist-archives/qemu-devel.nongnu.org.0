Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1B4D0DAD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:49:03 +0100 (CET)
Received: from localhost ([::1]:48172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nROyD-0002u8-S3
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtp-0008Tp-L9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROtm-0006LI-T5
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+agItL/XUOQbbSqoHJElHeQQ7syR3OpEBARbARpSXuQ=;
 b=XTeFLlt5slNMMpzXKjNroai1X+//ic+oSo/VhqTtCb6Iu9ZPZnRJyuJ+1nr0y2Bps7+JHX
 m1jVL7/ALRBkP3bXPWEPQX8jyu12hnrMFkmTT9Roi28MNA0nYT9Krr1pSdbx8KOJNNHn4v
 iQOu/9CACmbR1i+VlRwPf6IgV4S/p/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-_hn9rgWgPnub08K1ktJ1Ew-1; Mon, 07 Mar 2022 20:44:24 -0500
X-MC-Unique: _hn9rgWgPnub08K1ktJ1Ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 460F01800D50
 for <qemu-devel@nongnu.org>; Tue,  8 Mar 2022 01:44:23 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCDC045C8C;
 Tue,  8 Mar 2022 01:44:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] crypto: mandate a hostname when checking x509 creds on a
 client
Date: Mon,  7 Mar 2022 19:44:05 -0600
Message-Id: <20220308014419.3056549-2-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
References: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Currently the TLS session object assumes that the caller will always
provide a hostname when using x509 creds on a client endpoint. This
relies on the caller to detect and report an error if the user has
configured QEMU with x509 credentials on a UNIX socket. The migration
code has such a check, but it is too broad, reporting an error when
the user has configured QEMU with PSK credentials on a UNIX socket,
where hostnames are irrelevant.

Putting the check into the TLS session object credentials validation
code ensures we report errors in only the scenario that matters.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220304193610.3293146-2-berrange@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 crypto/tlssession.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/crypto/tlssession.c b/crypto/tlssession.c
index a8db8c76d138..b302d835d215 100644
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
2.35.1


