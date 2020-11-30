Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB3D2C82C3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 12:02:52 +0100 (CET)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgxH-00025o-9i
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 06:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrt-0006kj-QQ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjgrr-000665-5I
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606733834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvCNeNeGTjGF8SPxJZozP0n7zHpwAzwX5Dfx0lMZilY=;
 b=NaC0Zi3bNBeAiVqzP4xfiJAIsXrbgdV+ls7mCnCYdei82BvpjPRDcR5uaPz3w/af3uHptZ
 lP5XmD+3fnoOCPE/njBBZjzmu7w8xnMSwOiX/1g1RmBjQOe/iWOkM2liIZ4xkZCpGqhQpt
 vLYK71xs24NAeVblcdByi35qLOeIMKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-lEXHzzIhNTWeinrq3Xa9ag-1; Mon, 30 Nov 2020 05:57:10 -0500
X-MC-Unique: lEXHzzIhNTWeinrq3Xa9ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1135B8F4E9;
 Mon, 30 Nov 2020 10:57:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C36C260BD9;
 Mon, 30 Nov 2020 10:57:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] crypto: Fix memory leaks in set_loaded for tls-*
Date: Mon, 30 Nov 2020 11:56:14 +0100
Message-Id: <20201130105615.21799-4-kwolf@redhat.com>
In-Reply-To: <20201130105615.21799-1-kwolf@redhat.com>
References: <20201130105615.21799-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, jasowang@redhat.com, fnu.vikram@xilinx.com,
 berrange@redhat.com, pisa@cmp.felk.cvut.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you set the loaded property to true when it was already true, the
state is overwritten without freeing the old state first. Change the
set_loaded callback so that it always frees the old state (which is a
no-op if nothing was loaded) and only then load if requestsd.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
index dd7267ccdb..ed6e1dc202 100644
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
2.28.0


