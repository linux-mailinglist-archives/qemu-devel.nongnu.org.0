Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7BE60FF56
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:33:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6jB-00048J-BF; Thu, 27 Oct 2022 13:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6j8-0003gY-MD
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6j7-0000tq-3K
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yt3VF6TJbzT/XElHId9jTiqzIgsxIeesnorIZpEWqAo=;
 b=JrbtM2QsquQX83JdlPeyRIRfU52SEMBO3akO8nZPjexBdjIgHITURV51g9lGFXgY4DVRcu
 Q7ClsxrtXqhRLphU/soDuZWZB22QysgFZbL3ta1cu8jaMbul/gDxQGEtHHAgrnbAvEo6Qd
 z4vM7PWfZbPXClXOWQSfbtR4LBsKoI8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-P14Z4CgxNF6B-GBW0pENHg-1; Thu, 27 Oct 2022 13:31:28 -0400
X-MC-Unique: P14Z4CgxNF6B-GBW0pENHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14BE71C0690F;
 Thu, 27 Oct 2022 17:31:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A07040C6EC3;
 Thu, 27 Oct 2022 17:31:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 08/20] crypto: check for and report errors setting PSK
 credentials
Date: Thu, 27 Oct 2022 18:30:51 +0100
Message-Id: <20221027173103.299479-9-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If setting credentials fails, the handshake will later fail to complete
with an obscure error message which is hard to diagnose.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/tlscredspsk.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index a4f9891274..546cad1c5a 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -109,7 +109,12 @@ qcrypto_tls_creds_psk_load(QCryptoTLSCredsPSK *creds,
             goto cleanup;
         }
 
-        gnutls_psk_set_server_credentials_file(creds->data.server, pskfile);
+        ret = gnutls_psk_set_server_credentials_file(creds->data.server, pskfile);
+        if (ret < 0) {
+            error_setg(errp, "Cannot set PSK server credentials: %s",
+                       gnutls_strerror(ret));
+            goto cleanup;
+        }
         gnutls_psk_set_server_dh_params(creds->data.server,
                                         creds->parent_obj.dh_params);
     } else {
@@ -135,8 +140,13 @@ qcrypto_tls_creds_psk_load(QCryptoTLSCredsPSK *creds,
             goto cleanup;
         }
 
-        gnutls_psk_set_client_credentials(creds->data.client,
-                                          username, &key, GNUTLS_PSK_KEY_HEX);
+        ret = gnutls_psk_set_client_credentials(creds->data.client,
+                                                username, &key, GNUTLS_PSK_KEY_HEX);
+        if (ret < 0) {
+            error_setg(errp, "Cannot set PSK client credentials: %s",
+                       gnutls_strerror(ret));
+            goto cleanup;
+        }
     }
 
     rv = 0;
-- 
2.37.3


