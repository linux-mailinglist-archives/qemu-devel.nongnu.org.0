Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809A3BC90B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:08:13 +0200 (CEST)
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hzw-0004iD-6o
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrw-00054U-Jp
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrp-00011b-V3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilR3akOKsaO8tnMszYxhd0t5S6CBdNHLFdbmeH6O8As=;
 b=XxasZHRksIU/Mz1BbK4SCFakfio4bOMxuO7UZk4Lx31pmniqaIwNTF38CQHNJb66gRdCE3
 ZwKj5gLn4Koh8cpg2rA5UDt12CNawxMfFEo/RGoU/xLoi3NH/X5Bx9l8JL6sH28vXbDJ/Z
 YO5nx5YTc3PmDqQ94h9b4bXYNDYGFWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-r7uXipy2N6-OIapJ5LYxhg-1; Tue, 06 Jul 2021 05:59:47 -0400
X-MC-Unique: r7uXipy2N6-OIapJ5LYxhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82097106B7EB
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:46 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 901B65D6A1;
 Tue,  6 Jul 2021 09:59:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/18] crypto: add crypto tests for single block DES-ECB and
 DES-CBC
Date: Tue,  6 Jul 2021 10:59:14 +0100
Message-Id: <20210706095924.764117-9-berrange@redhat.com>
In-Reply-To: <20210706095924.764117-1-berrange@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GNUTLS crypto provider doesn't support DES-ECB, only DES-CBC.
We can use the latter to simulate the former, if we encrypt only
1 block (8 bytes) of data at a time, using a all-zeros IV. This
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


