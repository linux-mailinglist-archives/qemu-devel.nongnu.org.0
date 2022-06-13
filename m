Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0F5481FD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:50:21 +0200 (CEST)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0fm7-0008U5-Ok
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fi7-0005tp-C4
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fi5-0001Kv-Kk
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c196so5170678pfb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUMRiTaOjwibWOsNGQok9jz9436AsuQas8uiTT1e+M8=;
 b=5j1+1HeYsj2zLWJQrJ9Y8D4ogysG7qFF1rgbfktewAfH3BZvJZAj7OmliImhIcq7pH
 0MXZpY5cl/eslfbWG3OtT44tAFu94pIPwB9V4LqdTVc9qSinzwBKu36zozgDwbcB1fJF
 zneOGUMcQNSrIHlvWMVKsIHOXdVg9XaTlkgyNvOwvnjQSlRAj33Fzjw7abbc885iZ1mA
 d0kEZaLmIxaGmfe28qhkHLmWOW+x9gqaH3Fg7GpMwLa5nM/P61mf0ixA75Pc1dJ+3uwq
 woIDtGPNLWdNK0rmNjVi377o8Sp7hknAANAfxjhnU63ZWm58MQLupt+f4nbs+2iMqBST
 TNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUMRiTaOjwibWOsNGQok9jz9436AsuQas8uiTT1e+M8=;
 b=z/7J4WfmRpvUPifLC0Cuf1TjSUSLlo0avhPKuLRDW0hvGFVdYrY7mrNrEkEJZodsya
 05jYPlAk/MWCg4skY7lhtyfyls7GJiZSdOCYAY48ryuCEOWPJF7WwecE3W8EAxjYglUF
 XjxSfQxMKf1eax2pzEQa/Zecz6zBRTlVVzefUTYPLJpFVZcwhD1MC6HcUvUxZPUZ/ZYB
 PLc9FrCZ1/N9zCgjB+IHby0N5jvGKpD83RSaaqocwGFYC9Ia+EKJyOFAXCzMSJKSLfkF
 qlILTLqyGv99dI+scf1oRbfxOIZNNRRHxHCCny547ueiDCGvxiu/0eI1Q/hhS3JjaZjZ
 lDvQ==
X-Gm-Message-State: AOAM530Kiq0WIOKv9gd1xCByumtzSQeJVEPg/mVhFrwFLKz7GqBcedGJ
 dqWpbJcUkVbffXftZrwVnmWdsw==
X-Google-Smtp-Source: ABdhPJzUHTsbkupT2wh/Cezz3y4wp2hqAljrQBSSEqL5xJUCip/4t3cIAVCPqJFIvWJuLi4x6pISpA==
X-Received: by 2002:a62:8702:0:b0:51b:c452:33cf with SMTP id
 i2-20020a628702000000b0051bc45233cfmr51406611pfe.72.1655109968190; 
 Mon, 13 Jun 2022 01:46:08 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.46.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:07 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 1/7] crypto: Introduce ECDSA algorithm API
Date: Mon, 13 Jun 2022 16:45:25 +0800
Message-Id: <20220613084531.8086-2-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220613084531.8086-1-helei.sig11@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Introduce ECDSA related structures to qapi-crypto.

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 qapi/crypto.json | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 653e6e3f3d..c2fcdaa13a 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -545,7 +545,7 @@
 ##
 { 'enum': 'QCryptoAkCipherAlgorithm',
   'prefix': 'QCRYPTO_AKCIPHER_ALG',
-  'data': ['rsa']}
+  'data': ['rsa', 'ecdsa']}
 
 ##
 # @QCryptoAkCipherKeyType:
@@ -587,6 +587,29 @@
             'padding-alg': 'QCryptoRSAPaddingAlgorithm'}}
 
 ##
+# @QCryptoCurveID:
+#
+# The known curved for ECC algorithms.
+#
+# Since: 7.1
+##
+{ 'enum': 'QCryptoCurveID',
+  'prefix': 'QCRYPTO_CURVE_ID',
+  'data': ['nist-p192', 'nist-p256', 'nist-p384']}
+
+##
+# @QCryptoAkCipherOptionsECDSA:
+#
+# Specific parameters for ECDSA algorithm.
+#
+# @curve-id: QCryptoCurveId
+#
+# Since: 7.1
+##
+{ 'struct': 'QCryptoAkCipherOptionsECDSA',
+  'data': { 'curve-id':'QCryptoCurveID' }}
+
+##
 # @QCryptoAkCipherOptions:
 #
 # The options that are available for all asymmetric key algorithms
@@ -597,4 +620,5 @@
 { 'union': 'QCryptoAkCipherOptions',
   'base': { 'alg': 'QCryptoAkCipherAlgorithm' },
   'discriminator': 'alg',
-  'data': { 'rsa': 'QCryptoAkCipherOptionsRSA' }}
+  'data': { 'rsa': 'QCryptoAkCipherOptionsRSA',
+            'ecdsa': 'QCryptoAkCipherOptionsECDSA' }}
-- 
2.11.0


