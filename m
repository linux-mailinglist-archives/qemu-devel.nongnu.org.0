Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD74ECB77
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:12:23 +0200 (CEST)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcnu-0006ne-3T
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:12:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbj-0000XK-NF; Wed, 30 Mar 2022 13:59:47 -0400
Received: from [187.72.171.209] (port=21948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbi-0004ik-2z; Wed, 30 Mar 2022 13:59:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D747580060F;
 Wed, 30 Mar 2022 14:59:34 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 4/8] softfloat: add int128_to_float128
Date: Wed, 30 Mar 2022 14:59:28 -0300
Message-Id: <20220330175932.6995-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 17:59:35.0309 (UTC)
 FILETIME=[EA6E03D0:01D8445F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Based on parts_sint_to_float, implements int128_to_float128 to convert a
signed 128-bit value received through an Int128 argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


