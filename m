Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA925526DB4
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 03:04:23 +0200 (CEST)
Received: from localhost ([::1]:42552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npgCk-0004dN-Jg
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 21:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npg87-0001ex-9W
 for qemu-devel@nongnu.org; Fri, 13 May 2022 20:59:35 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1npg82-0008Pj-BA
 for qemu-devel@nongnu.org; Fri, 13 May 2022 20:59:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso12258541pjb.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 17:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebyq3t0cku0JBJko0+i5+pZ5xMWPYwbiZj5xlzmmt5U=;
 b=MBM+xEUOV19dRN+3DfVQA7Wlr9RpJkVWY8j/eTWiojTA5dkgFe6+3neEqo7JubjKtV
 XvfkYqNg+NUWejB12xLuq45dBG/PbfdWWZQEf2YAOR0Pbekpj6/4D+RYIBkPT9FzuvA+
 gioijVsC0q1qEHfBkG5Tm2YnZXs26WH8kaZ4FlR0Yx2UnlQKH5o2kGS4J5jEzkDXDIXw
 xGCs+y+KcEdCFBkPdwpi4jPB7bmAFvrddCAvr6c3E5lxWG7Tj9FzCigYamlC2kK9xFpx
 6bWy/h0SVYsROsoEw+LtVwJ1//xKFkQM4l0cQhmpvPGCZMf+5EUVBhuKoqD3Tce/zpLb
 Kqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebyq3t0cku0JBJko0+i5+pZ5xMWPYwbiZj5xlzmmt5U=;
 b=oGaU0xkdNAcYUNOHVwayBFpEyX7w8IOQxFno6iMeHLLAwViGbuiocDRFLCccEZsOi1
 KbfCWXrH07/r3CzTAAYiV+qKBqfVpvI3k3M2nWHVnsMSRdZ/moYwZuihpAhEY1FU10Ri
 Q3r6BQRq0AlmdXns3pcn8o7rTB1ONMd/2v5icctJpJZNOsx1CVj6ZvaSD7TTG9hR+Lc3
 02HN/aWsisHjVQmSleaiBs5C2Pq5a0TGN9dKL+obZan8PqHMkMWL8FRbKImrswK7mcxx
 DtmrUngUpKvJCKMUmIAQ0BfVZGfuYQMf7am5SgsiUk3mDJh40H/sQ9dBvl0wR3GtbYQd
 ajSg==
X-Gm-Message-State: AOAM5338bc6Mlfb5ShNIeDU2isVOxuEHIwiTkIuppIexwWrp/p1TUxL8
 uphwSuyMrJdJoLPsW18lKdJv7Q==
X-Google-Smtp-Source: ABdhPJzdAV0iF8UJoVcS0p3PX/NAJVEJigVxH/GqJRP+2QqddMhi0uaS33V2DwRh1MiMUMiE9fnl8A==
X-Received: by 2002:a17:90a:ee96:b0:1dc:6680:6f2d with SMTP id
 i22-20020a17090aee9600b001dc66806f2dmr7516683pjz.174.1652489966136; 
 Fri, 13 May 2022 17:59:26 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170902b21800b0015e8d4eb1dbsm2466125plr.37.2022.05.13.17.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 17:59:25 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, pizhenwei@bytedance.com, cohuck@redhat.com
Subject: [PATCH v6 2/9] qapi: crypto-akcipher: Introduce akcipher types to qapi
Date: Sat, 14 May 2022 08:54:57 +0800
Message-Id: <20220514005504.1042884-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220514005504.1042884-1-pizhenwei@bytedance.com>
References: <20220514005504.1042884-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1029.google.com
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


