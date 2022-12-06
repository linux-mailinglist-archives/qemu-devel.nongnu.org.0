Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B866643C37
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:23:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POn-0003RT-6a; Mon, 05 Dec 2022 23:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POl-0003QT-Cq
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:39 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POi-0006zf-Gd
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:38 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1443a16b71cso12564303fac.13
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v17zjlYfVEAhqtn7LQ/etK4ihaKCJvMvqmpjlspRWPw=;
 b=iv5dHE8d5wXuoWx7ZnbxoIKLmGIciA91X4GfSMtQpYvUGiLkesxyoQBUMBsEDA35D8
 Rgda0MXqHgY6qduxy4Y7mZTEbshG8QyM5ds0dTjngqgBokx5DBwZ2POg9Y/WlMFzVM3r
 R1VWUE93wXBI6a/+MU0Y0TNit7pmY67sG+K33MIqCmou3RMhr5D6gEOueu8W9S3e5R+j
 j2g+QIHbcws9dWm0wx5TeY4usypyOKdzZtH5ljiTDj1cHTHwfHxROSzdN/ih/vRxx17L
 2KOi4rolmmvDBdIWVqmAD1cN7UMeHbPR4g64JQJlScV5DPYmiqyKFj8+xQH9jMWT5eQi
 HksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v17zjlYfVEAhqtn7LQ/etK4ihaKCJvMvqmpjlspRWPw=;
 b=yMXrIHxzgrM0sOVIcwgwVa5kDCai9t/jUgPp8y3bq087Q0k9ga7Mcm9vFZa6RTkt5Z
 oBotB6tQpodrfBHOj9WWDg3Jbwp2JgJ6R9SAqzp2yXcll/WWfDjCrW/PJxbNJ93RTpKe
 pDzNbyWXmjMwaLUIyTYuMIp0WyES1IJJmyQ8uoS+3Nw+mE3zn0u/dmWl3TbcqDtnIhNW
 3suIfZH9M0CdQ3teCARlSvVV3lb1fNE6HUgeXH8yNzmiH4RM+ZhtLBmPckM8Zyct0pIS
 Z0+9Khu5Nk4YtR2lDPB9VF3FLez2T5yBqMlhLLBxLLJ1FZTXjfhDQQYSZZ+dCQwVDlKx
 nyLA==
X-Gm-Message-State: ANoB5pmaDpO/5MwMcuJ4JjWdVN8JjxIavRelrTrP4Rfw2JwdSCRDg8JS
 WiJ49r1ubWpyL6IcktaUz3t8nqVDGGWpTye1bus=
X-Google-Smtp-Source: AA0mqf6151q4fWwbe/W/O64m2/Ybiz0kcJF0myGcxd/9g88Tdw1B3cPfbvICdy7LshPvCBx/YHRrmQ==
X-Received: by 2002:a05:6870:c20a:b0:144:3ed1:c66 with SMTP id
 z10-20020a056870c20a00b001443ed10c66mr9338456oae.2.1670300255235; 
 Mon, 05 Dec 2022 20:17:35 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 13/22] tcg: Move tb_target_set_jmp_target declaration to tcg.h
Date: Mon,  5 Dec 2022 22:17:06 -0600
Message-Id: <20221206041715.314209-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 3 +++
 tcg/aarch64/tcg-target.h     | 4 ----
 tcg/arm/tcg-target.h         | 5 -----
 tcg/i386/tcg-target.h        | 3 ---
 tcg/loongarch64/tcg-target.h | 3 ---
 tcg/mips/tcg-target.h        | 5 -----
 tcg/ppc/tcg-target.h         | 4 ----
 tcg/riscv/tcg-target.h       | 4 ----
 tcg/s390x/tcg-target.h       | 4 ----
 tcg/sparc64/tcg-target.h     | 4 ----
 tcg/tci/tcg-target.h         | 4 ----
 11 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 993aafa1a2..6f3b602564 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -837,6 +837,9 @@ void tcg_func_start(TCGContext *s);
 
 int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start);
 
+void tb_target_set_jmp_target(const TranslationBlock *, int,
+                              uintptr_t, uintptr_t);
+
 void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 9b0927012c..dc16fd0da6 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -151,10 +151,6 @@ typedef enum {
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     0
-
-void tb_target_set_jmp_target(const TranslationBlock *, int,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 743a725aa7..13ad721438 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -150,11 +150,6 @@ extern bool use_neon_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     0
-
-/* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b64317bf40..4b4ceacfa5 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -218,9 +218,6 @@ extern bool have_movbe;
 #define TCG_TARGET_extract_i64_valid(ofs, len) \
     (((ofs) == 8 && (len) == 8) || ((ofs) + (len)) == 32)
 
-void tb_target_set_jmp_target(const TranslationBlock *, int,
-                              uintptr_t, uintptr_t);
-
 /* This defines the natural memory order supported by this
  * architecture before guarantees made by various barrier
  * instructions.
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 6a6c8d6941..87f40d935c 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -170,9 +170,6 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 57154ec808..31236d8e81 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -203,11 +203,6 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-/* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t)
-    QEMU_ERROR("code path is reachable");
-
 #define TCG_TARGET_NEED_LDST_LABELS
 
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 02764c3331..5ffb41fb57 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -180,12 +180,8 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_bitsel_vec       have_vsx
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 21d455a081..ff2f861e82 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -160,10 +160,6 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
-/* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index d9a45e20a8..274cb3cc5d 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -171,10 +171,6 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw);
-
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index f70fa9e350..ca7e4da6d3 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -153,10 +153,6 @@ extern bool use_vis3_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 5d1a77d078..4b4b26a89f 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -169,8 +169,4 @@ typedef enum {
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-/* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #endif /* TCG_TARGET_H */
-- 
2.34.1


