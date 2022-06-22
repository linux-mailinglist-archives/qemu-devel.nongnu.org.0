Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE95544D4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:22:57 +0200 (CEST)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3wZc-0007Xy-3V
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wTO-0000Tr-OU
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:30 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o3wT9-0007JR-2u
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:16:27 -0400
Received: by mail-pf1-x431.google.com with SMTP id 128so8530460pfv.12
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bedEv8kPUBwcLd77LuagpTBOJ8uCIJxbwZbwc24pZBQ=;
 b=kZc3lURBau3IrF8Y0sgcESp3T+QsIujTuKk3VjcbADM8fNSSILsqL2anSIwhNvaJbN
 du0QO1JEko4BKlUuBAk71eLvRTY2/NI/0sBdIzgqoDiBoCCHGHx2ugwaclxaGWGG2ijY
 2/DJG+au/BYQh4LRlYDlu5BLeXdDyDKocdzqVKYXuhPorLp+d+aNBq3IA1NOPDk0s5D0
 L1jIjHzsyfjfcjCQ5bMRnVvSY7AgncZSXWZynmtG7uz4E/HhQolRAtqsF9nyKc2pl5r9
 FLMct+RjQRCxZqZxhL03E68yHoFeUX72pT0j4qHTpVxUtcYl5+iJ5fHcouQEkZRXnEir
 e3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bedEv8kPUBwcLd77LuagpTBOJ8uCIJxbwZbwc24pZBQ=;
 b=VQEdOUJEX+Ax/Mj7fwqKAYY/QD5fVo/QhR60YevPL8n71vHQQp0qNcGrEEkMuoYVY/
 q8rECzUPS7O5rvYAc2gJLZQZPCn2sAVFEw9iqFMMeZ6w5G4u3KU5Q5Fa0ecdnlEGYhbp
 rV421OyznLrmewT+pRmCS7tF+5uH4yil8L9Y2sNfr57tI+hn5nNv75dGmgMPBWQ0F65y
 lBqBO1rtbDQ932TMVw+Khmjz7Nx0lsRGLyWw4CzuI9jNeTqEbE8celeeWLizXgKLo/Rh
 HV6Sb3jLjjRvLzBC5xnsJOSsK04mnHdgGkXVoomLa8E5Ya7n1FWr7w7oxNimIwuShpfx
 ykRg==
X-Gm-Message-State: AJIora89MKdMB/zcvKY2GrBMIdZ9OeT3IhHGdwkepVgzqzwUqFhFkr5f
 45XiYTiSB3sJ3vIGZjVTjUK7hwiklti4Dj43
X-Google-Smtp-Source: AGRyM1u2cSBbUoKFYv01N4y8NSsrKMbavSf7Vr6ZJOZcpZmP0HcJp8irdN4be99liZlc0ShO6TjuHg==
X-Received: by 2002:a05:6a00:cc6:b0:525:443f:8e9e with SMTP id
 b6-20020a056a000cc600b00525443f8e9emr2961069pfv.56.1655889373035; 
 Wed, 22 Jun 2022 02:16:13 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.234])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a170902efcd00b0016a087cfad8sm9833900plb.264.2022.06.22.02.16.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:16:12 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: qemu-devel@nongnu.org,
	berrange@redhat.com,
	f4bug@amsat.org
Cc: mst@redhat.com, pizhenwei@bytedance.com, jasowang@redhat.com,
 helei.sig11@bytedance.com
Subject: [PATCH v2 1/7] crypto: Introduce ECDSA algorithm API
Date: Wed, 22 Jun 2022 17:15:43 +0800
Message-Id: <20220622091549.31115-2-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220622091549.31115-1-helei.sig11@bytedance.com>
References: <20220622091549.31115-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pf1-x431.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/crypto.json | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 653e6e3f3d..c42e281494 100644
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
+  'data': { 'curve-id': 'QCryptoCurveID' }}
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


