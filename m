Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B04308BA0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:37:49 +0100 (CET)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XiO-00034z-9S
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJG-0003Su-D0
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XJ4-00074c-LG
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5W85jRKRkTM28M78Uqk941jBiKL2UVivuVHcLvFjqho=;
 b=YCnWpdj3yWEORMIuoKDXYzv2TZvaC01Gj6mY9O5zbJvA+Jlb4UGNFeJ5M1RPUBIdLvGhb7
 RvwFFxECB5+LmldzT8I4uCQevNfpXkfR19O27Dyrb/ep0SIOd66Xmc7i+BaMrPDoetCmtY
 CgXoDvoVFCiOaavCd4tQmaj3Rk66Oio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-e06Ux8S9PXqbEopQX8-eAA-1; Fri, 29 Jan 2021 12:11:34 -0500
X-MC-Unique: e06Ux8S9PXqbEopQX8-eAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33E89107ACE6;
 Fri, 29 Jan 2021 17:11:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DD5A5D705;
 Fri, 29 Jan 2021 17:11:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] crypto: Fix memory leaks in set_loaded for tls-*
Date: Fri, 29 Jan 2021 17:10:53 +0000
Message-Id: <20210129171102.4109641-5-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

If you set the loaded property to true when it was already true, the
state is overwritten without freeing the old state first. Change the
set_loaded callback so that it always frees the old state (which is a
no-op if nothing was loaded) and only then load if requestsd.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/tlscredsanon.c | 3 +--
 crypto/tlscredspsk.c  | 3 +--
 crypto/tlscredsx509.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/crypto/tlscredsanon.c b/crypto/tlscredsanon.c
index 30275b6847..bea5f76c55 100644
--- a/crypto/tlscredsanon.c
+++ b/crypto/tlscredsanon.c
@@ -123,10 +123,9 @@ qcrypto_tls_creds_anon_prop_set_loaded(Object *obj,
 {
     QCryptoTLSCredsAnon *creds = QCRYPTO_TLS_CREDS_ANON(obj);
 
+    qcrypto_tls_creds_anon_unload(creds);
     if (value) {
         qcrypto_tls_creds_anon_load(creds, errp);
-    } else {
-        qcrypto_tls_creds_anon_unload(creds);
     }
 }
 
diff --git a/crypto/tlscredspsk.c b/crypto/tlscredspsk.c
index e26807b899..f5a31108d1 100644
--- a/crypto/tlscredspsk.c
+++ b/crypto/tlscredspsk.c
@@ -192,10 +192,9 @@ qcrypto_tls_creds_psk_prop_set_loaded(Object *obj,
 {
     QCryptoTLSCredsPSK *creds = QCRYPTO_TLS_CREDS_PSK(obj);
 
+    qcrypto_tls_creds_psk_unload(creds);
     if (value) {
         qcrypto_tls_creds_psk_load(creds, errp);
-    } else {
-        qcrypto_tls_creds_psk_unload(creds);
     }
 }
 
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index c89dd62435..dbadad4df2 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -694,10 +694,9 @@ qcrypto_tls_creds_x509_prop_set_loaded(Object *obj,
 {
     QCryptoTLSCredsX509 *creds = QCRYPTO_TLS_CREDS_X509(obj);
 
+    qcrypto_tls_creds_x509_unload(creds);
     if (value) {
         qcrypto_tls_creds_x509_load(creds, errp);
-    } else {
-        qcrypto_tls_creds_x509_unload(creds);
     }
 }
 
-- 
2.29.2


