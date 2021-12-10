Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A5A46FCBC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:27:14 +0100 (CET)
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbFJ-0000vs-Iw
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:27:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanG-0004ua-MJ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:16 -0500
Received: from [2607:f8b0:4864:20::102d] (port=55138
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvan4-0006KC-Pa
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:14 -0500
Received: by mail-pj1-x102d.google.com with SMTP id np3so6248898pjb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCUlDPb5P1TcBQP0cKETsjbnRxTzw2FcAlNm40Vcg/8=;
 b=d6/qqq3XnrPOj6/Z+sPfNSdtvYc2rHXzWGJj2unCrF/o9inrccmHsVzc38dCWqRVxh
 NXEmeNMTiUofXUDkqBaCoTOtWF5S9V0BX4Bn4jTURy1bFBv2TjvSrhJOdpkINIu9mozt
 bufgQfdJYS9e1KYyj6uFc+1/WnwcwVajrnFhFxkLHYIt2xTDl/M+mf6pmpV3O9/ixahm
 yCtPgbiE80U8D+y4fexYeFKwNiGby9PRVYRmCkdu0rzujX4uL3p8neXaCuqSXOR9acy8
 Gi4GZ7YDmYvG27gRDoohXBPQF9/5lhyZRu1Q9qIXNxryYYt3XvPr6QXnY/q5EUHDLvGu
 xPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCUlDPb5P1TcBQP0cKETsjbnRxTzw2FcAlNm40Vcg/8=;
 b=YbARath1ZdP/vmNeep7QJU7MNhzn3aaq0/cn4VafS+4BpZNvHld4VPiCctSVQmTMvT
 cNIpAjPhGiBPOiQZlbWqv1dwHLI52tZhBlU1fD6NwRXwD8hkmTgliWEJxW0XLZEGx6cc
 hcj2ZhQ0pzZflsBPlRi8cQZ5W2w/qIgQq4NznlIC2QhiHd2/5gBsNWruUga8sd1kapjZ
 M+NYt8vsyCUIfMVhfg/9bFBr6+X5hIxlej5k6VANYl2TwFfWySBflFCBJyokjzzugqJv
 3mDGxot7nJFEk8TmqNuBk8hMSbFRrWtVu6flD1W3/K+yhNNp7HJmcnqX6iwTDsMpiC3M
 WUKw==
X-Gm-Message-State: AOAM531jQChUU0ejaNvNXSTPhPkhciJA3PPBHPN24GDIXhLSFzTIOT6x
 Bku9khcU7DrLfvbzsarDMifW9GIDzak12wIt
X-Google-Smtp-Source: ABdhPJyRxLHRQMRmE5t6CiZlGSQFvOxVKd+OaKe/ft6OMiYQ+WtXA5UIsEp2knMlJAkb3MKWw9Qy+w==
X-Received: by 2002:a17:902:e852:b0:142:19fe:982a with SMTP id
 t18-20020a170902e85200b0014219fe982amr75160342plg.13.1639123081414; 
 Thu, 09 Dec 2021 23:58:01 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:01 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 13/77] target/riscv: rvv-1.0: add fractional LMUL
Date: Fri, 10 Dec 2021 15:55:59 +0800
Message-Id: <20211210075704.23951-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
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
 target/riscv/cpu.h           | 26 ++++++++++++++------------
 target/riscv/translate.c     | 16 ++++++++++++++--
 target/riscv/vector_helper.c | 16 ++++++++++++++--
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eee2a2b19e..17414bfff7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -102,10 +102,10 @@ typedef struct CPURISCVState CPURISCVState;
 
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
@@ -403,18 +403,20 @@ typedef RISCVCPU ArchCPU;
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
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
-FIELD(TB_FLAGS, XL, 15, 2)
+FIELD(TB_FLAGS, XL, 20, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_ENABLED, 17, 1)
+FIELD(TB_FLAGS, PM_ENABLED, 22, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 17101d854b..3688e80d03 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -80,7 +80,19 @@ typedef struct DisasContext {
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
@@ -690,7 +702,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-    ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
+    ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ac6c7298bc..866bfb3571 100644
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
2.31.1


