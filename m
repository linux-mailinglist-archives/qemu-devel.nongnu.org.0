Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F14E4B2A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 03:57:07 +0100 (CET)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWrBK-0001iz-Gk
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 22:57:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWr7R-00055I-FY
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 22:53:05 -0400
Received: from [2607:f8b0:4864:20::102f] (port=41571
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nWr7P-0005kQ-SC
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 22:53:05 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so493905pjm.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 19:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sg3To/7UT7Td+uZYPu+oDeRZF15OaGdKfSNym1I4/hE=;
 b=4UFMN77XWGnYrRYUy3LKDWngeQjcECwfMkSuMWtxxC01Akzeu9rHwKC/nGRbsx3p+2
 VCxF52uasYyYrHRkyOh+UL7ZleClsNHlJIG/BgTX+n29BknYqaJXgHYex7zkFcJEnxWM
 s9dy6tEJouexU56Y7ZW51UabbJhg1PQIHTEBlWZ6yB2YbPwFblRZPeN9zCxo6ABbHmWD
 J4dYAVyp/ryWLppvP0GCLaSmmX8MhocgX0iU3QNHiSKEwHw8j+2vVXS5nXaelIXbmubL
 sJLeCDJMldX4Af4DaoOeTzzuNfhczd498hcReSq2TmrFmzcMq1F6xIgMagR9Fjp2CQe+
 PsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sg3To/7UT7Td+uZYPu+oDeRZF15OaGdKfSNym1I4/hE=;
 b=rgjg/e1OK4SoFZCn74jpET1la2nghfIv1ZXOp2H4a7+WupJ8kPnl7DHJSaQQtQXAUh
 TJhu8lpyjzZSW+NdfA+gsH1XlJztPX3RDCTqXaW1ZrVrOf6kJh6CqnRLz4DlDiDRytsA
 5+0jwuGQU/AGKERqlqKAmI3ROExkYzlAsQf/QWXSGMjOpGp3QutcK+Uwp6gU9kJZMr37
 B10JM+IaTdgUe/mERDn38E8o+4HNElRaqzaeRRL7Ud7n6bLGPJbOCJtMg0U6Iv6OC4BN
 xlBcSZhCLf75sqxxw2wjpnSK6IoEDWtZ5PZoW2sUBrPdfmB52SPHEObdoBub2B1IpMk6
 zwYQ==
X-Gm-Message-State: AOAM531Na0uHvucNlXkCbG9KSoT0JGO2FVJWk9FSVKblO3SUcllVwMgD
 uYpY09EBzIOktzOwLdpzSOlPWg==
X-Google-Smtp-Source: ABdhPJzz4RA92uPgrSrtlvMjFp57uCew5sRe8hpZlNEi889wNBDUneICR+l2GiXixacITs4a6375sw==
X-Received: by 2002:a17:902:7049:b0:151:e52e:ae42 with SMTP id
 h9-20020a170902704900b00151e52eae42mr22231853plt.118.1648003982647; 
 Tue, 22 Mar 2022 19:53:02 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a63a602000000b0038062a0bc6fsm18104869pge.67.2022.03.22.19.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 19:53:01 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com,
	mst@redhat.com
Subject: [PATCH v3 2/6] crypto-akcipher: Introduce akcipher types to qapi
Date: Wed, 23 Mar 2022 10:49:08 +0800
Message-Id: <20220323024912.249789-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220323024912.249789-1-pizhenwei@bytedance.com>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: herbert@gondor.apana.org.au, jasowang@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 Lei He <helei.sig11@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lei He <helei.sig11@bytedance.com>

Introduce akcipher types, also include RSA & ECDSA related types.

Signed-off-by: Lei He <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qapi/crypto.json | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 1ec54c15ca..d44c38e3b1 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -540,3 +540,89 @@
   'data': { '*loaded': { 'type': 'bool', 'features': ['deprecated'] },
             '*sanity-check': 'bool',
             '*passwordid': 'str' } }
+##
+# @QCryptoAkcipherAlgorithm:
+#
+# The supported algorithms for asymmetric encryption ciphers
+#
+# @rsa: RSA algorithm
+# @ecdsa: ECDSA algorithm
+#
+# Since: 7.0
+##
+{ 'enum': 'QCryptoAkcipherAlgorithm',
+  'prefix': 'QCRYPTO_AKCIPHER_ALG',
+  'data': ['rsa', 'ecdsa']}
+
+##
+# @QCryptoAkcipherKeyType:
+#
+# The type of asymmetric keys.
+#
+# Since: 7.0
+##
+{ 'enum': 'QCryptoAkcipherKeyType',
+  'prefix': 'QCRYPTO_AKCIPHER_KEY_TYPE',
+  'data': ['public', 'private']}
+
+##
+# @QCryptoRsaHashAlgorithm:
+#
+# The hash algorithm for RSA pkcs1 padding algothrim
+#
+# Since: 7.0
+##
+{ 'enum': 'QCryptoRsaHashAlgorithm',
+  'prefix': 'QCRYPTO_RSA_HASH_ALG',
+  'data': [ 'md2', 'md3', 'md4', 'md5', 'sha1', 'sha256', 'sha384', 'sha512', 'sha224' ]}
+
+##
+# @QCryptoRsaPaddingAlgorithm:
+#
+# The padding algorithm for RSA.
+#
+# @raw: no padding used
+# @pkcs1: pkcs1#v1.5
+#
+# Since: 7.0
+##
+{ 'enum': 'QCryptoRsaPaddingAlgorithm',
+  'prefix': 'QCRYPTO_RSA_PADDING_ALG',
+  'data': ['raw', 'pkcs1']}
+
+##
+# @QCryptoCurveId:
+#
+# The well-known curves, referenced from https://csrc.nist.gov/csrc/media/publications/fips/186/3/archive/2009-06-25/documents/fips_186-3.pdf
+#
+# Since: 7.0
+##
+{ 'enum': 'QCryptoCurveId',
+  'prefix': 'QCRYPTO_CURVE_ID',
+  'data': ['nist-p192', 'nist-p224', 'nist-p256', 'nist-p384', 'nist-p521']}
+
+##
+# @QCryptoRsaOptions:
+#
+# Specific parameters for RSA algorithm.
+#
+# @hash-algo: QCryptoRsaHashAlgorithm
+# @padding-algo: QCryptoRsaPaddingAlgorithm
+#
+# Since: 7.0
+##
+{ 'struct': 'QCryptoRsaOptions',
+  'data': { 'hash-algo':'QCryptoRsaHashAlgorithm',
+            'padding-algo': 'QCryptoRsaPaddingAlgorithm'}}
+
+##
+# @QCryptoEcdsaOptions:
+#
+# Specific parameter for ECDSA algorithm.
+#
+# @curve-id: QCryptoCurveId
+#
+# Since: 7.0
+##
+{ 'struct': 'QCryptoEcdsaOptions',
+  'data': { 'curve-id': 'QCryptoCurveId' }}
-- 
2.25.1


