Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BB53B5F9E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:08:06 +0200 (CEST)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrvh-0000NU-UL
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmr-00036Q-ND
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmb-00061x-JV
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y3so1999468wrq.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9E74MPT3ybVV57GDlruswg0m9Iqe4oPECULw0v5ivl0=;
 b=JfaKf03xleAvSflBHEEk4YHIagi3zZgVPVH5F7qQIOVSEd5olZPWHfLq5ZHny7v9Qq
 rnFJ1GuabtipkCtlLOui4SooxpC7ZUdX300W0jUiWG9EfZxxGvTXjHPQtKr2D/bf7HBF
 5LF/PrKDHp5/DEz88mWyi8i7XIKnUSWfwCLy2zrOE/M7fDDieCe+g/aLYQ3LH3NOa7v/
 MG+wTFXlXjeyOjgg8s8fub1u+zWWhJAPQzSws4KtOXQsgZEY/W6N/+Z8t/A/JMakwb2J
 V2Zk+3dXPgoAANwJpv4mMivBaMQvByJHQfRko6Ivsxwz7kqSPzlJlvguDumb4rPOGVRn
 IHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9E74MPT3ybVV57GDlruswg0m9Iqe4oPECULw0v5ivl0=;
 b=HnrazK42urjzjn5Z1+ZnuHLUZ9dHhl4uSAdB0x2gK7jhVJKQ5L+5g6JLiPBED3UNEY
 0yx0XyixzoVhDFZsG5jbHWQKsKncUHGIzA2T3Sa8oUz8vrQbyQ+trznXDABdbD8vdJqm
 z1Fi/fkF5EsqdTOE9GWniJo0p2dduIodGVmQKsrJN5xAvQMy39MfOwmwVDWjbkNJOJT6
 PqC0PRl3u/odaK8XkdwV0v9QPUUbDDQKkFbiDXJJgie35t3rsjOk2CEtlafZNZq1rbdZ
 63aVg7DMJ9Qd4cGNaJW+R63kSRPiVwzrxzodqixXVtXcSXKM8hmwKo+EkvXdWLiF1+35
 qNYw==
X-Gm-Message-State: AOAM533Br+Uf+hZnsFH2mRwLwV67h2tTDiI2idiMouWocOV++r/LdGJ4
 mD/dIdBgP3UVoPUT7La5iIkKUA==
X-Google-Smtp-Source: ABdhPJzOexE4+GsL+HxzvMzStVOSLbDTEihiX5Ho0yoF3PX46cqF5cFDeUVq2D1R6cX9DdW8JcEO8g==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr2067204wrn.408.1624888720280; 
 Mon, 28 Jun 2021 06:58:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/18] target/arm: Use asimd_imm_const for A64 decode
Date: Mon, 28 Jun 2021 14:58:21 +0100
Message-Id: <20210628135835.6690-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The A64 AdvSIMD modified-immediate grouping uses almost the same
constant encoding that A32 Neon does; reuse asimd_imm_const() (to
which we add the AArch64-specific case for cmode 15 op 1) instead of
reimplementing it all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     |  3 +-
 target/arm/translate-a64.c | 86 ++++----------------------------------
 target/arm/translate.c     | 17 +++++++-
 3 files changed, 24 insertions(+), 82 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6c8d5f6ede1..e2f056c32c2 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -540,7 +540,8 @@ static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
  * VMVN and VBIC (when cmode < 14 && op == 1).
  *
  * The combination cmode == 15 op == 1 is a reserved encoding for AArch32;
- * callers must catch this.
+ * callers must catch this; we return the 64-bit constant value defined
+ * for AArch64.
  *
  * cmode = 2,3,4,5,6,7,10,11,12,13 imm=0 was UNPREDICTABLE in v7A but
  * is either not unpredictable or merely CONSTRAINED UNPREDICTABLE in v8A;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7f74d0e81a9..97b4a41a0c7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -8199,8 +8199,6 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
 {
     int rd = extract32(insn, 0, 5);
     int cmode = extract32(insn, 12, 4);
-    int cmode_3_1 = extract32(cmode, 1, 3);
-    int cmode_0 = extract32(cmode, 0, 1);
     int o2 = extract32(insn, 11, 1);
     uint64_t abcdefgh = extract32(insn, 5, 5) | (extract32(insn, 16, 3) << 5);
     bool is_neg = extract32(insn, 29, 1);
@@ -8219,83 +8217,13 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
         return;
     }
 
-    /* See AdvSIMDExpandImm() in ARM ARM */
-    switch (cmode_3_1) {
-    case 0: /* Replicate(Zeros(24):imm8, 2) */
-    case 1: /* Replicate(Zeros(16):imm8:Zeros(8), 2) */
-    case 2: /* Replicate(Zeros(8):imm8:Zeros(16), 2) */
-    case 3: /* Replicate(imm8:Zeros(24), 2) */
-    {
-        int shift = cmode_3_1 * 8;
-        imm = bitfield_replicate(abcdefgh << shift, 32);
-        break;
-    }
-    case 4: /* Replicate(Zeros(8):imm8, 4) */
-    case 5: /* Replicate(imm8:Zeros(8), 4) */
-    {
-        int shift = (cmode_3_1 & 0x1) * 8;
-        imm = bitfield_replicate(abcdefgh << shift, 16);
-        break;
-    }
-    case 6:
-        if (cmode_0) {
-            /* Replicate(Zeros(8):imm8:Ones(16), 2) */
-            imm = (abcdefgh << 16) | 0xffff;
-        } else {
-            /* Replicate(Zeros(16):imm8:Ones(8), 2) */
-            imm = (abcdefgh << 8) | 0xff;
-        }
-        imm = bitfield_replicate(imm, 32);
-        break;
-    case 7:
-        if (!cmode_0 && !is_neg) {
-            imm = bitfield_replicate(abcdefgh, 8);
-        } else if (!cmode_0 && is_neg) {
-            int i;
-            imm = 0;
-            for (i = 0; i < 8; i++) {
-                if ((abcdefgh) & (1 << i)) {
-                    imm |= 0xffULL << (i * 8);
-                }
-            }
-        } else if (cmode_0) {
-            if (is_neg) {
-                imm = (abcdefgh & 0x3f) << 48;
-                if (abcdefgh & 0x80) {
-                    imm |= 0x8000000000000000ULL;
-                }
-                if (abcdefgh & 0x40) {
-                    imm |= 0x3fc0000000000000ULL;
-                } else {
-                    imm |= 0x4000000000000000ULL;
-                }
-            } else {
-                if (o2) {
-                    /* FMOV (vector, immediate) - half-precision */
-                    imm = vfp_expand_imm(MO_16, abcdefgh);
-                    /* now duplicate across the lanes */
-                    imm = bitfield_replicate(imm, 16);
-                } else {
-                    imm = (abcdefgh & 0x3f) << 19;
-                    if (abcdefgh & 0x80) {
-                        imm |= 0x80000000;
-                    }
-                    if (abcdefgh & 0x40) {
-                        imm |= 0x3e000000;
-                    } else {
-                        imm |= 0x40000000;
-                    }
-                    imm |= (imm << 32);
-                }
-            }
-        }
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (cmode_3_1 != 7 && is_neg) {
-        imm = ~imm;
+    if (cmode == 15 && o2 && !is_neg) {
+        /* FMOV (vector, immediate) - half-precision */
+        imm = vfp_expand_imm(MO_16, abcdefgh);
+        /* now duplicate across the lanes */
+        imm = bitfield_replicate(imm, 16);
+    } else {
+        imm = asimd_imm_const(abcdefgh, cmode, is_neg);
     }
 
     if (!((cmode & 0x9) == 0x1 || (cmode & 0xd) == 0x9)) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 97eea935433..3cb9996a509 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -121,8 +121,8 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
     case 14:
         if (op) {
             /*
-             * This is the only case where the top and bottom 32 bits
-             * of the encoded constant differ.
+             * This and cmode == 15 op == 1 are the only cases where
+             * the top and bottom 32 bits of the encoded constant differ.
              */
             uint64_t imm64 = 0;
             int n;
@@ -137,6 +137,19 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
         imm |= (imm << 8) | (imm << 16) | (imm << 24);
         break;
     case 15:
+        if (op) {
+            /* Reserved encoding for AArch32; valid for AArch64 */
+            uint64_t imm64 = (uint64_t)(imm & 0x3f) << 48;
+            if (imm & 0x80) {
+                imm64 |= 0x8000000000000000ULL;
+            }
+            if (imm & 0x40) {
+                imm64 |= 0x3fc0000000000000ULL;
+            } else {
+                imm64 |= 0x4000000000000000ULL;
+            }
+            return imm64;
+        }
         imm = ((imm & 0x80) << 24) | ((imm & 0x3f) << 19)
             | ((imm & 0x40) ? (0x1f << 25) : (1 << 30));
         break;
-- 
2.20.1


