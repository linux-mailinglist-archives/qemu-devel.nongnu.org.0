Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB250929C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:23:39 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIja-0000A2-GJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdv-0000LQ-Dk; Wed, 20 Apr 2022 18:17:47 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdt-00069s-Rd; Wed, 20 Apr 2022 18:17:47 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e5c42b6e31so3479474fac.12; 
 Wed, 20 Apr 2022 15:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FdChP+b9sA6wK3w8mdG13vTi2VXFo8x9jC2SfYkNg4=;
 b=kX4aJP9Ak6n/zILYCVgw9kDPyaYF/K7HlDia1apfc6EX1uTNwzCKLEyjncIIDlJZ1X
 64NXRhvA48e5wBsM5xXmFDsM/Erg0nZT9MhbW3mUK9FRCCTsbaqD/oKUvx2NipMmXm64
 ushmBW/Txita9q6bDBsGR8bA/1an4XiFerXQyqjBZ4h6WmFTer4RhXp9PawZgjAB2ZPl
 vHojYhRaxlkw28kubeDomep/OgOPVXbr84MpbyUlkflp2f9GOSPJZfM1uB3cZQRmw5nr
 sWgJXfcLP6FAokF85q2EgOzf704WDv0UWi/hdtuArWwG6XGg3dZPfmouyb2dBZyRkQz5
 uqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FdChP+b9sA6wK3w8mdG13vTi2VXFo8x9jC2SfYkNg4=;
 b=cnuD0BovWybNufK8QWRYqWzipsaWq0Xl4UgCqqJq0JmpjmDeO220Ebjp+r6VbUsGbW
 LJ56nn45RB/fsMPVCPu6b1tqF0my/EawQW8f2N9odKUwxcLdFItc+kCYJRc5TYYVd0nb
 KD8MdUlbUsRtXHQtcB5N3GkoRK/THvDPC0paZgqKyHeOJwfOkbmFZtX6OYyTERWizeO6
 ywSpKNHE5/+w8xPkK6euLj7kLHUgx9W+y7019ZzotaWZb5XxzinXh+7kOZjLobaoCuJU
 xVViWAN8bTUvhwamxfNJ4a94Z34KkKCZdDUJQp4sPg+Cr+FSrefTkL5jhDDoLJlxlmvw
 jUUw==
X-Gm-Message-State: AOAM531wYbRlKkwMhQHdMJQhIO8EZRNvUf2u9JvAHV1lzGuhSuCE94jq
 1hhZK8vwphXIxh0rv2pyJwoIQxbFVdY=
X-Google-Smtp-Source: ABdhPJz6qambiKPqdTvTcMPLavAfo/DBdUpxq+37wrcEKP3Z5FCLnD9rmswSF30Qy5tPKNr9IAjtAA==
X-Received: by 2002:a05:6870:23a8:b0:e2:f229:19f9 with SMTP id
 e40-20020a05687023a800b000e2f22919f9mr2532671oap.283.1650493064392; 
 Wed, 20 Apr 2022 15:17:44 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] softfloat: add int128_to_float128
Date: Wed, 20 Apr 2022 19:13:19 -0300
Message-Id: <20220420221329.169755-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Based on parts_sint_to_float, implements int128_to_float128 to convert a
signed 128-bit value received through an Int128 argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220330175932.6995-5-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 fpu/softfloat.c         | 29 +++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 57445b36e7..60b4702945 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3780,6 +3780,35 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
     return int64_to_bfloat16_scalbn(a, 0, status);
 }
 
+float128 int128_to_float128(Int128 a, float_status *status)
+{
+    FloatParts128 p = { };
+    int shift;
+
+    if (int128_nz(a)) {
+        p.cls = float_class_normal;
+        if (!int128_nonneg(a)) {
+            p.sign = true;
+            a = int128_neg(a);
+        }
+
+        shift = clz64(int128_gethi(a));
+        if (shift == 64) {
+            shift += clz64(int128_getlo(a));
+        }
+
+        p.exp = 127 - shift;
+        a = int128_lshift(a, shift);
+
+        p.frac_hi = int128_gethi(a);
+        p.frac_lo = int128_getlo(a);
+    } else {
+        p.cls = float_class_zero;
+    }
+
+    return float128_round_pack_canonical(&p, status);
+}
+
 float128 int64_to_float128(int64_t a, float_status *status)
 {
     FloatParts128 p;
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 8e026e5610..3994b7235d 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -183,6 +183,7 @@ floatx80 int64_to_floatx80(int64_t, float_status *status);
 
 float128 int32_to_float128(int32_t, float_status *status);
 float128 int64_to_float128(int64_t, float_status *status);
+float128 int128_to_float128(Int128, float_status *status);
 float128 uint64_to_float128(uint64_t, float_status *status);
 float128 uint128_to_float128(Int128, float_status *status);
 
-- 
2.35.1


