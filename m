Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37125F2EF0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:41:21 +0200 (CEST)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIsz-0005N1-1i
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIfZ-0002TP-Re
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIfW-0001HB-Q3
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664792846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gO5e8GipU2lb7Gj7dImz2/iKsfHpM9U99DxEJu2DgbA=;
 b=Hfr51RrGOGjYkncRq3P+UmqDTDtEsKBongHZCruSDK3Dnxrkb/UFliKnTHywTHw1Vc4+El
 gE2STYcB9c0+VHKV8N+CpGU/VQC4+dhz9eHLfSZR4/PwVK1XVVKzeClUXQDqvV2aAjMeZI
 oHuSZD6rEDLUNqQmtfYwoEdU/AuKgjQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-wh--G2pvMfugVWZfiZ2zFQ-1; Mon, 03 Oct 2022 06:27:22 -0400
X-MC-Unique: wh--G2pvMfugVWZfiZ2zFQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62983800186;
 Mon,  3 Oct 2022 10:27:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E0C492B04;
 Mon,  3 Oct 2022 10:27:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/2] crypto: check for and report errors setting PSK
 credentials
Date: Mon,  3 Oct 2022 11:27:17 +0100
Message-Id: <20221003102718.600058-2-berrange@redhat.com>
In-Reply-To: <20221003102718.600058-1-berrange@redhat.com>
References: <20221003102718.600058-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

If setting credentials fails, the handshake will later fail to complete
with an obscure error message which is hard to diagnose.

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


