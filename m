Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D9513665
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:08:36 +0200 (CEST)
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4os-0006We-Pw
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nk4l5-0003Xm-GA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:04:40 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nk4kw-0007uM-Gb
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:04:35 -0400
Received: by mail-pl1-x631.google.com with SMTP id b12so4449332plg.4
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebyq3t0cku0JBJko0+i5+pZ5xMWPYwbiZj5xlzmmt5U=;
 b=Ewaj6GD+7ylmnl7Nek9NISo81xfEOut07vgy8s3rYiTDvsgLhHLZYC0i3FM+bIkrF9
 egJxdmCLlgMgh3msobyc33KZ+40c0Kr0X72uKjHSvmPApdqXjErVzyoJuP/t7Usddyxs
 V37gmYW40Qs3Pyb3fZqkT70FmE9grSf1HUSiF9gZ95EoAexvJ3y9q4s3gkm/HxzshGuf
 84FHRdEQ7c66VTWyITIZGlJL0u8a8joS8OsOdko7GDzvmQC2mKnZGM4XMAzFyc+aHGdh
 etU1YoD1+CfaiJjDubhco9bEvaUfILSIrCrRf5Yk7xbZLVD5aLbE6xrgDMc6g1LCyVEo
 F14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebyq3t0cku0JBJko0+i5+pZ5xMWPYwbiZj5xlzmmt5U=;
 b=NKekzDBaWomNTasK/Cj3/1BkjCZ5HJCNRp7SpQXfwrxCiztPstVVN8kwQI7HeN7hbe
 2MGmMEdZetYBi/HLckFC5zLju+R3I8AzRZYc6Sqb7BTWs8nxcw/CZ1S66w3KGvyrws+u
 S89x5WEvE8NYQNRFuR21ze9X8TTeKDsY8KaWiXJbFxJAb0TSFM6IPJk+ZgTum3W5InLC
 jVty88LaQDiKGDGYkoiFlkroehiWNIPODG1vdl+EXaDP6NiOPE7q40GwY/lxvOb0VWCo
 hammDACP12/T0G+KnK7k0mUfJfa5lZzCjLwkWPdWdlRN7DyPtBPy8d3mNZJDvpVoREg+
 Sr+w==
X-Gm-Message-State: AOAM531p3D8F60s/Rk3iQL35GdLC+aMyDjlyfS9e3o2RJsDZTx38RnOb
 9/2s52oalrVz0Qwo4ef2NvRfbA==
X-Google-Smtp-Source: ABdhPJzFXOB4Yvy392O4Xx60+klDrMds8MRiFy7ceV16DQ5b0HI6aGVA1VUPZtKkkrvCgYvI8wN7vQ==
X-Received: by 2002:a17:90b:1b03:b0:1d2:a338:c568 with SMTP id
 nu3-20020a17090b1b0300b001d2a338c568mr50432960pjb.129.1651154669248; 
 Thu, 28 Apr 2022 07:04:29 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a623187000000b0050835f6d6a1sm38975pfx.9.2022.04.28.07.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:04:28 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Subject: [PATCH v5 2/9] qapi: crypto-akcipher: Introduce akcipher types to qapi
Date: Thu, 28 Apr 2022 21:59:36 +0800
Message-Id: <20220428135943.178254-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428135943.178254-1-pizhenwei@bytedance.com>
References: <20220428135943.178254-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x631.google.com
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
Cc: helei.sig11@bytedance.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lei He <helei.sig11@bytedance.com>

Introduce akcipher types, also include RSA related types.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Lei He <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qapi/crypto.json | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
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
2.20.1


