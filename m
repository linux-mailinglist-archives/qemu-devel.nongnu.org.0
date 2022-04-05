Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924594F3D76
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 21:59:03 +0200 (CEST)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbpKQ-0006UH-L6
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 15:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHt-00047X-GD; Tue, 05 Apr 2022 15:56:26 -0400
Received: from [187.72.171.209] (port=24543 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nbpHs-00049c-1z; Tue, 05 Apr 2022 15:56:25 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 5 Apr 2022 16:56:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 967868000CB;
 Tue,  5 Apr 2022 16:56:07 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 6/9] host-utils: Implemented signed 256-by-128 division
Date: Tue,  5 Apr 2022 16:55:55 -0300
Message-Id: <20220405195558.66144-7-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2022 19:56:08.0123 (UTC)
 FILETIME=[30F340B0:01D84927]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org,
 Luis Pires <luis.pires@eldorado.org.br>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Based on already existing QEMU implementation created a signed
256 bit by 128 bit division needed to implement the vector divide
extended signed quadword instruction from PowerISA 3.1

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h |  1 +
 util/host-utils.c         | 51 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 6da6a93f69..d0b444a40f 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -864,4 +864,5 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
 }
 
 Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
 #endif
diff --git a/util/host-utils.c b/util/host-utils.c
index c6a01638c7..d221657e43 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -394,3 +394,54 @@ Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
         return rem;
     }
 }
+
+/*
+ * Signed 256-by-128 division.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    bool neg_quotient = false, neg_remainder = false;
+    Int128 unsig_hi = *phigh, unsig_lo = *plow;
+    Int128 rem;
+
+    if (!int128_nonneg(*phigh)) {
+        neg_quotient = !neg_quotient;
+        neg_remainder = !neg_remainder;
+
+        if (!int128_nz(unsig_lo)) {
+            unsig_hi = int128_neg(unsig_hi);
+        } else {
+            unsig_hi = int128_not(unsig_hi);
+            unsig_lo = int128_neg(unsig_lo);
+        }
+    }
+
+    if (!int128_nonneg(divisor)) {
+        neg_quotient = !neg_quotient;
+
+        divisor = int128_neg(divisor);
+    }
+
+    rem = divu256(&unsig_lo, &unsig_hi, divisor);
+
+    if (neg_quotient) {
+        if (!int128_nz(unsig_lo)) {
+            *phigh = int128_neg(unsig_hi);
+            *plow = int128_zero();
+        } else {
+            *phigh = int128_not(unsig_hi);
+            *plow = int128_neg(unsig_lo);
+        }
+    } else {
+        *phigh = unsig_hi;
+        *plow = unsig_lo;
+    }
+
+    if (neg_remainder) {
+        return int128_neg(rem);
+    } else {
+        return rem;
+    }
+}
-- 
2.31.1


