Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13D670CD4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:11:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6v-0003WJ-Cy; Tue, 17 Jan 2023 18:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6t-0003VL-Tl
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:20 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6r-0001NN-Rr
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id d8so2804020pjc.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4D63I7URPIRiLTFdgx7OEAOrc3rmBYgeJtF+eMWvzIk=;
 b=LGc5eLFebJGdZ330Kx4pJZZ6EgrwUf0gtahfeALga6c2nh3Q1e5tdJbFc6olyRRXDt
 dmVP8Z+zAi6IpGdf2UcehtgV/R7Wy4QDJnJii/bbfmpkfOvtPOirUPV8BEdTvb+gzjgJ
 X68tb3hM0DX8YFnI/Y/ZMcTzsqwQ9fV+hkXq1t1pNqdQbKrgVPrjJe0zvxbu+0o1CMHe
 Plp5FNqnis+dt8+ibmdKbGJmSrpP+kN0OxnahU1nMjValn/+RsVV9pQ76hGzIrbcgqS9
 ymTmW0C0tcCxD7nzftweKusORBZSVFHP6OjuaHl+x8lrlyEWuEstc2uBrM1vvZHX9VeY
 w3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4D63I7URPIRiLTFdgx7OEAOrc3rmBYgeJtF+eMWvzIk=;
 b=rxk8VcsYmqmgu9XMx0yCr0JCzxpnA2QsEWiGTMwk2CNGoxW11eSQn9uAu/hRUB3WzP
 zKD6+O0emlY5ixOl1B0/0tEyWXNY5soTB1MbkBebc1yrv3Sau/xfSMu8wyZkdir/wHBb
 1aFWnGs7FnPKV1ZegtGMEYOqml+Dm/yrWQRRt6uv9nEycyOY6SzbKW8OszCB9DIFMz2J
 YAUSwo83S9u0QBgtUP+Nc9IcV5pvWxT0UDRAST+whsHWgX+08NwlLCb2CnE2hv4swGH5
 qTCAiTNbB9eXskpxj9X0vtY9Q2iHMui4ibEg4kr97K/G8DLJuRznMHLdS1CpCnKqjNlZ
 DXcA==
X-Gm-Message-State: AFqh2kqWNGmqs7/EA2Cpr3JsF3cmxHLid/7wOShdS/UOzVpRjUPthNcw
 /1/LcDDiYQfzrnaqB6ZqdgwjybI0krOi6F1o
X-Google-Smtp-Source: AMrXdXtPOdLT76LeQTX6vmBHQkCOj6+ufaYu3nYFbQ2jucPbEFaE8V91PATZufND/FQQ6Y/gYJjwTw==
X-Received: by 2002:a05:6a21:1507:b0:af:98cd:7df1 with SMTP id
 nq7-20020a056a21150700b000af98cd7df1mr5010272pzb.24.1673997076248; 
 Tue, 17 Jan 2023 15:11:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 13/22] tcg: Move tb_target_set_jmp_target declaration to tcg.h
Date: Tue, 17 Jan 2023 13:10:42 -1000
Message-Id: <20230117231051.354444-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index c2d5430b5a..6f497172f8 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -833,6 +833,9 @@ void tcg_func_start(TCGContext *s);
 
 int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start);
 
+void tb_target_set_jmp_target(const TranslationBlock *, int,
+                              uintptr_t, uintptr_t);
+
 void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index d491c198da..a585d035d9 100644
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
index 4c1433093c..d347a5dc53 100644
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
index 7500ceaab9..d3705da2ed 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -220,9 +220,6 @@ extern bool have_movbe;
 #define TCG_TARGET_extract_i64_valid(ofs, len) \
     (((ofs) == 8 && (len) == 8) || ((ofs) + (len)) == 32)
 
-void tb_target_set_jmp_target(const TranslationBlock *, int,
-                              uintptr_t, uintptr_t);
-
 /* This defines the natural memory order supported by this
  * architecture before guarantees made by various barrier
  * instructions.
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index a150c3c7b2..5782c6887c 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -171,9 +171,6 @@ typedef enum {
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index d1adf3e326..82b40100cf 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -205,11 +205,6 @@ extern bool use_mips32r2_instructions;
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
index bce164fde2..c9af6d592f 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -165,10 +165,6 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
-/* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_DEFAULT_MO (0)
 
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 57ba165800..9f5d1cf1c7 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -174,10 +174,6 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw);
-
 #define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 282833bd8d..b78a545581 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -154,10 +154,6 @@ extern bool use_vis3_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index f9ee83d751..359d62c2f3 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -176,8 +176,4 @@ typedef enum {
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
 
-/* not defined -- call should be eliminated at compile time */
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t, uintptr_t);
-
 #endif /* TCG_TARGET_H */
-- 
2.34.1


