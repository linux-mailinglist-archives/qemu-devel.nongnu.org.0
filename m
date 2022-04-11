Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940E4FBA20
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 12:52:16 +0200 (CEST)
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndreZ-0004Ft-DD
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 06:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1ndrZl-0006qE-Lt
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:47:18 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1ndrZj-0002WI-SF
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:47:17 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q142so13804154pgq.9
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T2tpQeswcKujfVdwIoHw1RfrV9uib5LWkvVd7zn6J2E=;
 b=CVqR85YK0kV1ew5YUb3MKn+PwqC2RZOKHCbao+qgSvMsIETamGFD9jCgpWNEtN4C6k
 H+RQP9uMXjyo2wdqC6/aN2iyj28Ans+K9/6FrjtHKaua2079TiC1j024zPO37h0HS/Cy
 q3DtobvPoZzMU2wUk6X8HfMYTDfPJgEcTzKA6QZHRNOzU0YUiYrXVH+EydNk/MdWRYom
 Gi0/CD5X0ZI3Q6qVX88MHAJr9DDgUWy9xZNM6bmkR0aZfZgF688948+SR42xez+1w5yw
 L1ydr7fmLrGBuSkaUMgO6fpcyqj0qQD7qCjxathDC782+hCBUb+FOBT2a8RXM54zLNid
 t24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2tpQeswcKujfVdwIoHw1RfrV9uib5LWkvVd7zn6J2E=;
 b=jULXKKHcW9usZXVufTcQzAdv7qSb0x+WhPbA7emVkIZ0C6O6lagQjSjngOx4aMo9Ei
 28M3y/yid7B42ib9iT3k0H6f9Kq+Bc1p42X/Sspb0cgZdk+jcH9+wpB2L7ZAu68msx5e
 /osT5s7E8abNM5Z64NOO2xHMkLkBStWD+S1NzzfOb9quSqbH2lhWc0NKfsIlP0EYH7kl
 KE1TYOLKp6Q9h6YT4gtRVHoEinBv1uEg7X3OEd6QOwCAodKLqFkUKgP2E4U0PaqJMsr9
 W9muiOZr/TWz2MMP3AZ7v0xiXMzZOChs4ZeX4LmTi8PLyxb/XGFrXf79713hZgagxS3w
 oNyQ==
X-Gm-Message-State: AOAM533rM6D39Lu5NsDdocpxjSz9dDLo3iM5DOQrkWq/lZeXSalsS6E5
 MutauvrZjGZvnYmTtWezw9nQ6Q==
X-Google-Smtp-Source: ABdhPJywzB2A8MdeFTx2U2wbcJIYP/g1Ica6qEgtJFifufvGAHLRLpTSa7YMRA+izmFa0y09OLt/eQ==
X-Received: by 2002:a63:1141:0:b0:39c:b664:c508 with SMTP id
 1-20020a631141000000b0039cb664c508mr20204916pgr.49.1649674034556; 
 Mon, 11 Apr 2022 03:47:14 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a636808000000b00398e9c7049bsm27541649pgc.31.2022.04.11.03.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 03:47:14 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	berrange@redhat.com,
	arei.gonglei@huawei.com
Subject: [PATCH v4 2/8] crypto-akcipher: Introduce akcipher types to qapi
Date: Mon, 11 Apr 2022 18:43:21 +0800
Message-Id: <20220411104327.197048-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411104327.197048-1-pizhenwei@bytedance.com>
References: <20220411104327.197048-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x52e.google.com
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

Signed-off-by: Lei He <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 qapi/crypto.json | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 1ec54c15ca..9e2b41fc82 100644
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
+  'base': { 'algorithm': 'QCryptoAkCipherAlgorithm' },
+  'discriminator': 'algorithm',
+  'data': { 'rsa': 'QCryptoAkCipherOptionsRSA' }}
-- 
2.20.1


