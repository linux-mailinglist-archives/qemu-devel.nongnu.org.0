Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF523C5D48
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:28:44 +0200 (CEST)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vzH-0000Bs-Gj
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vbP-0001uF-JE
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:04:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vbN-0006AH-BE
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuijaGsrrKHF5U6H3x1r7TRHe5ZdnYoXcJTuAQYTGKI=;
 b=NMoqUFtryDAzAVk+jARBrUDw5yS+hFvDaimJa41cFl+yvERDII9H41PsZFHRuRcjrgCAT+
 zKmR6VPw+0S1PFY08Wbu6y1NFBrdLjunzE7100Vu+qp6pWizg/jiv+W+FJijC4EaZXEptc
 OnCCywveAbfIbcNNsyoDRLfDr8VlKKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-dfvsoepUOUaIS3FENoWK1Q-1; Mon, 12 Jul 2021 09:03:57 -0400
X-MC-Unique: dfvsoepUOUaIS3FENoWK1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95E61100CCC0;
 Mon, 12 Jul 2021 13:03:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDA315C1D1;
 Mon, 12 Jul 2021 13:03:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/22] crypto: add crypto tests for single block DES-ECB and
 DES-CBC
Date: Mon, 12 Jul 2021 14:02:09 +0100
Message-Id: <20210712130223.1825930-9-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GNUTLS crypto provider doesn't support DES-ECB, only DES-CBC.
We can use the latter to simulate the former, if we encrypt only
1 block (8 bytes) of data at a time, using an all-zeros IV. This
is a very inefficient way to use the QCryptoCipher APIs, but
since the VNC authentication challenge is only 16 bytes, this
is acceptable. No other part of QEMU should be using DES. This
test case demonstrates the equivalence of ECB and CBC for the
single-block case.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-cipher.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/unit/test-crypto-cipher.c b/tests/unit/test-crypto-cipher.c
index fd0a8de34c..7dca7b26e4 100644
--- a/tests/unit/test-crypto-cipher.c
+++ b/tests/unit/test-crypto-cipher.c
@@ -149,6 +149,29 @@ static QCryptoCipherTestData test_data[] = {
             "39f23369a9d9bacfa530e26304231461"
             "b2eb05e2c39be9fcda6c19078c6a9d1b",
     },
+    {
+        /*
+         * Testing 'password' as plaintext fits
+         * in single AES block, and gives identical
+         * ciphertext in ECB and CBC modes
+         */
+        .path = "/crypto/cipher/des-rfb-ecb-56-one-block",
+        .alg = QCRYPTO_CIPHER_ALG_DES_RFB,
+        .mode = QCRYPTO_CIPHER_MODE_ECB,
+        .key = "0123456789abcdef",
+        .plaintext = "70617373776f7264",
+        .ciphertext = "73fa80b66134e403",
+    },
+    {
+        /* See previous comment */
+        .path = "/crypto/cipher/des-rfb-cbc-56-one-block",
+        .alg = QCRYPTO_CIPHER_ALG_DES_RFB,
+        .mode = QCRYPTO_CIPHER_MODE_CBC,
+        .key = "0123456789abcdef",
+        .iv = "0000000000000000",
+        .plaintext = "70617373776f7264",
+        .ciphertext = "73fa80b66134e403",
+    },
     {
         .path = "/crypto/cipher/des-rfb-ecb-56",
         .alg = QCRYPTO_CIPHER_ALG_DES_RFB,
-- 
2.31.1


