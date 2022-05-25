Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A85339D2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:20:28 +0200 (CEST)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnBr-0003Pt-Go
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1ntmuO-0002N8-4R
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:02:24 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:46497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1ntmuJ-0003F3-9D
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:02:20 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-d39f741ba0so25240362fac.13
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCoch/x6X6GaFx847RkiWvXsBs1288biCvAs5otO4gM=;
 b=aobJVulBOZzcbpVKDzF2ZVCsT4tWetifPDFEjXyUcOdrdlqY6JaT3Kw5A4SNzdypem
 aH/r9nAlH9P1+2l48EUJ7RDvT0eCvPHRfl3qHFrJsk81/OSXQk8QMXpMTm6NEvsh5hiQ
 xTZI+k+LWFjzliO6m91SJyORyMA1RW7sBnENCuoILlnes+GZ9h//ZcThuN17Su31M1//
 kazkc8RHdpsWsZmQ6Q++tBXjziTNtxWAeviOq7sdb6kPBrTaGwbVqAOE32u646fLyhmW
 RHXo5JAqAmPBHcvxaae7q96PtVrnQ08hIMdytg7ka9eyHjfLuotje8Y73QeIUZPZSvUu
 ybyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCoch/x6X6GaFx847RkiWvXsBs1288biCvAs5otO4gM=;
 b=XZk8ZUqjk/mPwf6b0G49Z6QhglfaWrnqYZjN1KEzTL+VC1HSOUQxaKeRciUmR9Mzfm
 cKyodLiPFUpfPvY5odHV8kUKCX8WIWls3EEtrZTmu/NR+hYGyMKCtg6o3le609VZKmQ6
 mST5AbKlaj+whLcJ6srJFSUiuC1DCsj8xObbuZkRSoVf5bN9kA1cUjT5W6CceBsPw035
 p9t9Do695ERv7+qcrp2zd3QuZ+fFGZyzEwf+WK4E4hRXkAIbjqjpVhZEEit61Cy2rgHX
 V3lkSCNM2StOMKvBZM3TXfbuUo3vhnRPu8iMbz6KRWJQBiIAKsuXokqWzFGTaZHNZmh8
 gm9w==
X-Gm-Message-State: AOAM533AcHaLVyQn8Amr9NG2HTMZYix4K2bDy0qwBaqY3+kiA5gSzWAT
 1agCaPHmre7iKiAzXZEOS642FPqMRwQ+2A==
X-Google-Smtp-Source: ABdhPJylbk+hiyTklGYugfK4QYfrfcIF+SMgCYz05NGrspNl/V/D+6Z+mnfQxgzC8Br2LHsgpnfOnQ==
X-Received: by 2002:a17:90b:4b4b:b0:1dc:8724:3f75 with SMTP id
 mi11-20020a17090b4b4b00b001dc87243f75mr9161069pjb.178.1653469327588; 
 Wed, 25 May 2022 02:02:07 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.226])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a17090a6aca00b001deb92de665sm1015424pjm.46.2022.05.25.02.02.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 May 2022 02:02:07 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, jasowang@redhat.com, cohuck@redhat.com,
 pizhenwei@bytedance.com, helei.sig11@bytedance.com
Subject: [PATCH 2/9] qapi: crypto-akcipher: Introduce akcipher types to qapi
Date: Wed, 25 May 2022 17:01:11 +0800
Message-Id: <20220525090118.43403-3-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220525090118.43403-1-helei.sig11@bytedance.com>
References: <20220525090118.43403-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=helei.sig11@bytedance.com; helo=mail-oa1-x29.google.com
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

Introduce akcipher types, also include RSA related types.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Lei He <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qapi/crypto.json | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 1ec54c15ca..f7bb9a42d0 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -540,3 +540,67 @@
   'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
             '*sanity-check': 'bool',
             '*passwordid': 'str' } }
+##
+# @QCryptoAkCipherAlgorithm:
+#
+# The supported algorithms for asymmetric encryption ciphers
+#
+# @rsa: RSA algorithm
+#
+# Since: 7.1
+##
+{ 'enum': 'QCryptoAkCipherAlgorithm',
+  'prefix': 'QCRYPTO_AKCIPHER_ALG',
+  'data': ['rsa']}
+
+##
+# @QCryptoAkCipherKeyType:
+#
+# The type of asymmetric keys.
+#
+# Since: 7.1
+##
+{ 'enum': 'QCryptoAkCipherKeyType',
+  'prefix': 'QCRYPTO_AKCIPHER_KEY_TYPE',
+  'data': ['public', 'private']}
+
+##
+# @QCryptoRSAPaddingAlgorithm:
+#
+# The padding algorithm for RSA.
+#
+# @raw: no padding used
+# @pkcs1: pkcs1#v1.5
+#
+# Since: 7.1
+##
+{ 'enum': 'QCryptoRSAPaddingAlgorithm',
+  'prefix': 'QCRYPTO_RSA_PADDING_ALG',
+  'data': ['raw', 'pkcs1']}
+
+##
+# @QCryptoAkCipherOptionsRSA:
+#
+# Specific parameters for RSA algorithm.
+#
+# @hash-alg: QCryptoHashAlgorithm
+# @padding-alg: QCryptoRSAPaddingAlgorithm
+#
+# Since: 7.1
+##
+{ 'struct': 'QCryptoAkCipherOptionsRSA',
+  'data': { 'hash-alg':'QCryptoHashAlgorithm',
+            'padding-alg': 'QCryptoRSAPaddingAlgorithm'}}
+
+##
+# @QCryptoAkCipherOptions:
+#
+# The options that are available for all asymmetric key algorithms
+# when creating a new QCryptoAkCipher.
+#
+# Since: 7.1
+##
+{ 'union': 'QCryptoAkCipherOptions',
+  'base': { 'alg': 'QCryptoAkCipherAlgorithm' },
+  'discriminator': 'alg',
+  'data': { 'rsa': 'QCryptoAkCipherOptionsRSA' }}
-- 
2.11.0


