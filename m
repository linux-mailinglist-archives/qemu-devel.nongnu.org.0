Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8642EAC5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:56:59 +0200 (CEST)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbI5K-0004eJ-K4
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHw9-0006Ps-2g
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHw5-0002O5-TA
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:28 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g5so5895876plg.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f/VG08rCMn6Oa8GvnexKSICu68ZZRylKEu1QJKpNoCU=;
 b=Ew0cGzE+AjeAqve/UWY3m/gQJN8kYjYnX/hT7dBHwC3FCSQqAjGiY/cG1dCjHSeyGv
 YeuAxdk+Ghi03aJCH0CRglr8H8w4Y1LPUo26jrsfWjWS9G9CdpfG42LVXCPRnp1nMXhz
 FqxEQ6B9QAGR4r7lL1tuvB5coK2kaa5NnYUmj60VOaNDnTYqhxFc9ypBFQp83QD2vDnp
 3qsS//WLKPHGBW444ISbICTcSxYMSC+q1jnssj7KTjXQpjvfzqf2X+ylpd9vq29ixq24
 G0d5ht7mA++s8JQ6Azgt3pIKDdfiMvl2/aB6dQGqrWuJYKSJOcSYJg0PYRk4W3QdJsNF
 K1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f/VG08rCMn6Oa8GvnexKSICu68ZZRylKEu1QJKpNoCU=;
 b=tujSA63DO1+WAqZrBDUw1yFbu/uXTZEFZEi+DYFAFqeopqrb1ohi+08y2zJXFmTxEG
 mnsLR2BC537V8RwHsPsW6TIhKIiMYrJVQcAQD+ZajQVF4qYNi20NC4xSs9JaPuC/+Dkj
 WY9AUavOYlAhKBoR1NMeDQQ1ylGFCowOO7Emrvsrnto5OSOcNI1kKcrjf/CKphkevIhp
 jEQpfrxYd/RBlI2YQAX0gOCdaxXLxKwsCcl39MSjy1tC+0ilWmD/+QfcAkZ5YUBQw9tt
 1227z81jEww5SC/Myfk4pN9IpBSa0qy8he2ZStZsz8OHHdTsG0yI8zMn04Yp6/D+uDIs
 w+gg==
X-Gm-Message-State: AOAM531JoTNBw9WuQfjX4bSNUGuj0TSo2x+UvAR7zlCG61mnYOrmNaWe
 TRmKEViWJJOVWRWir4SnboJgqSMTmx+Rp54a
X-Google-Smtp-Source: ABdhPJyP7zLiDHTullUJ1lMNJi+AkifEWNQhVeB2M8SD7tvL+AzAlO24ulGXOmHi7/xQB8mfN+KeWg==
X-Received: by 2002:a17:90b:390d:: with SMTP id
 ob13mr11779239pjb.49.1634284044432; 
 Fri, 15 Oct 2021 00:47:24 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 13/78] target/riscv: rvv-1.0: add fractional LMUL
Date: Fri, 15 Oct 2021 15:45:14 +0800
Message-Id: <20211015074627.3957162-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Introduce the concepts of fractional LMUL for RVV 1.0.
In RVV 1.0, LMUL bits are contiguous in vtype register.

Also rearrange rvv bits in TB_FLAGS to skip MSTATUS_VS (0x600)
and MSTATUS_FS (0x6000) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           | 22 ++++++++++++----------
 target/riscv/translate.c     | 16 ++++++++++++++--
 target/riscv/vector_helper.c | 16 ++++++++++++++--
 3 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fb41c1cea7c..1bd9b4123da 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -103,10 +103,10 @@ typedef struct CPURISCVState CPURISCVState;
 
 #define RV_VLEN_MAX 256
 
-FIELD(VTYPE, VLMUL, 0, 2)
-FIELD(VTYPE, VSEW, 2, 3)
-FIELD(VTYPE, VEDIV, 5, 2)
-FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
+FIELD(VTYPE, VLMUL, 0, 3)
+FIELD(VTYPE, VSEW, 3, 3)
+FIELD(VTYPE, VEDIV, 8, 2)
+FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
@@ -391,14 +391,16 @@ typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
-FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, LMUL, 3, 3)
 FIELD(TB_FLAGS, SEW, 6, 3)
-FIELD(TB_FLAGS, VILL, 9, 1)
+/* Skip MSTATUS_VS (0x600) bits */
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
+FIELD(TB_FLAGS, VILL, 12, 1)
+/* Skip MSTATUS_FS (0x6000) bits */
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 10, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
-FIELD(TB_FLAGS, MSTATUS_HS_VS, 13, 2)
+FIELD(TB_FLAGS, HLSX, 15, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
+FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 174ef0564e6..6a3f105d431 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,7 +76,19 @@ typedef struct DisasContext {
     bool hlsx;
     /* vector extension */
     bool vill;
-    uint8_t lmul;
+    /*
+     * Encode LMUL to lmul as follows:
+     *     LMUL    vlmul    lmul
+     *      1       000       0
+     *      2       001       1
+     *      4       010       2
+     *      8       011       3
+     *      -       100       -
+     *     1/8      101      -3
+     *     1/4      110      -2
+     *     1/2      111      -1
+     */
+    int8_t lmul;
     uint8_t sew;
     uint16_t vlen;
     bool vl_eq_vlmax;
@@ -606,7 +618,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-    ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
+    ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->cs = cs;
     ctx->w = false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ac6c7298bc0..866bfb35714 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -86,9 +86,21 @@ static inline uint32_t vext_vm(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VM);
 }
 
-static inline uint32_t vext_lmul(uint32_t desc)
+/*
+ * Encode LMUL to lmul as following:
+ *     LMUL    vlmul    lmul
+ *      1       000       0
+ *      2       001       1
+ *      4       010       2
+ *      8       011       3
+ *      -       100       -
+ *     1/8      101      -3
+ *     1/4      110      -2
+ *     1/2      111      -1
+ */
+static inline int32_t vext_lmul(uint32_t desc)
 {
-    return FIELD_EX32(simd_data(desc), VDATA, LMUL);
+    return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
 
 static uint32_t vext_wd(uint32_t desc)
-- 
2.25.1


