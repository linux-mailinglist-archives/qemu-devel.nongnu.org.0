Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E537A57E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:12:16 +0200 (CEST)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQJD-0001uL-EN
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXl-0003Dl-GU
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:13 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXb-0006TG-UG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728583; x=1652264583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T4xfBUHTz99KeO4XUesDnPxK/SiUu00qLVoeeLc7XQY=;
 b=LDvgIF425dGpYBhwaWwnt9HobO/8c1zzrzEnMyK0WNCcPMqDASXMRSG0
 sa6widk0OXRZYRYcqIpELrwCvWrHJENpuxgEvKAbUQ9mQY2CNEaO4//5r
 eV3tImJWYf33mzC4S8O4wUiaiFlglgIFWcdZuLXiCaXgk99EH5W+Lec2E
 JsFLeOujq87892nYUymzELuWyHhiAuGNZG9qjuNzokmEnnqI1FMxwiHj8
 3Oe+d9Sha8kTsdhhNZIeLiZFTX/NSgS9aaOmWJOMG0lGQe8CLUmL3m03b
 wDf3tEsPHZAeRTChwi6+0r+akG2bwuvFh7vATUL9ZFGbFkS0y4IbMQjSX g==;
IronPort-SDR: +oPTLSX78Vo70YPQvPGEp/oqd6jxDNr3RMhOj1btKwffaOP4N8WGPUaYA2ETKksWIMYPXgnQMA
 mb4M4hWMx4n7ce0FYJolhaq8QPbLE1XHnBcTqjbcdvsmnjTp0PkEwFrDOTuf4fZYkm2k2dG8sR
 Tlw+eojgdwVBkLoS1UZf67bENLM8hLOFp4gyLbQfLsTfDBZ4txKzxbZ+x4tApLtZF9qMErr4vR
 nCHes3r7fctjIAX2SAKR9iQHTXZn7DA9FoWYZwyIGFYYvDuoQ5II+G2Qn5Oq23ATpcDMVl6RB9
 QKg=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735502"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:59 +0800
IronPort-SDR: PwrKDVW8rNhmHLoQvqw2jurJIe3x5XtAquKR6Wr7N2DEkYrp7VlaHP3J3+YQfoMbAoaR1IeXmz
 4RpkqLAs80Qo2rv0FV9nPkHcV0pJUEWWGCptixEyX5PPWSo9GiuuEg0Cgu1fJPthTaVtZzGcs3
 ifWqn86AtC7psfvguawJZ1+WjQyTl9b4Ws00Gs9gYjgt7RwGNpx8ui7+0ICx72XVSpR4wPEMmd
 yJ8zVaKds9V4osIvi284TC4J0pWAqN4CmbnpGOhUdZmrH2hbRDLSOq2Do0NlLEc8aFmE9gIldX
 LQ1SD2yDqYR2xq/jPiOjkkJT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:59 -0700
IronPort-SDR: m3XlLOAlJm2ouuzOn2dNGSfhLfWbLLGu8LSwmx5d/oI3wziFTZSdurwWllcHm2iHA0j8B7e/XX
 ldp4xldqbZXJOMKqAu0xlgD3wpF0wWct2PdQacnq5opb6UILqkU22O11wD5JjM/w+W5WFnAXq3
 GgSth6bqA4bBBguY9waiKVf4aPLnyj0Kmu34omhqMf6HLxlbXxmV6eq8JiJzO4YV8acdED1Zo+
 oIzhRfZxGdfKUMeBmYRO6jvC83F3CJ0fjlHyb5WLwxOWtzuMlMGPCi7LM7pLCKS1cGC4PxA7PS
 ABk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:58 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 36/42] target/riscv: Remove the hardcoded MSTATUS_SD macro
Date: Tue, 11 May 2021 20:19:45 +1000
Message-Id: <20210511101951.165287-37-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: fcc125d96da941b56c817c9dd6068dc36478fc53.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h  | 10 ----------
 target/riscv/csr.c       | 12 ++++++++++--
 target/riscv/translate.c | 19 +++++++++++++++++--
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d738e2fdbd..6e30b312f0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -368,16 +368,6 @@
 #define MXL_RV64            2
 #define MXL_RV128           3
 
-#if defined(TARGET_RISCV32)
-#define MSTATUS_SD MSTATUS32_SD
-#define MISA_MXL MISA32_MXL
-#define MXL_VAL MXL_RV32
-#elif defined(TARGET_RISCV64)
-#define MSTATUS_SD MSTATUS64_SD
-#define MISA_MXL MISA64_MXL
-#define MXL_VAL MXL_RV64
-#endif
-
 /* sstatus CSR bits */
 #define SSTATUS_UIE         0x00000001
 #define SSTATUS_SIE         0x00000002
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 41951a0a84..e955753441 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -538,7 +538,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
-    mstatus = set_field(mstatus, MSTATUS_SD, dirty);
+    if (riscv_cpu_is_32bit(env)) {
+        mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
+    } else {
+        mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+    }
     env->mstatus = mstatus;
 
     return RISCV_EXCP_NONE;
@@ -614,7 +618,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     }
 
     /* misa.MXL writes are not supported by QEMU */
-    val = (env->misa & MISA_MXL) | (val & ~MISA_MXL);
+    if (riscv_cpu_is_32bit(env)) {
+        val = (env->misa & MISA32_MXL) | (val & ~MISA32_MXL);
+    } else {
+        val = (env->misa & MISA64_MXL) | (val & ~MISA64_MXL);
+    }
 
     /* flush translation cache */
     if (val != env->misa) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 26eccc5eb1..a596f80f20 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa & ext;
 }
 
+#ifdef TARGET_RISCV32
+# define is_32bit(ctx)  true
+#elif defined(CONFIG_USER_ONLY)
+# define is_32bit(ctx)  false
+#else
+static inline bool is_32bit(DisasContext *ctx)
+{
+    return (ctx->misa & RV32) == RV32;
+}
+#endif
+
 /*
  * RISC-V requires NaN-boxing of narrower width floating point values.
  * This applies when a 32-bit value is assigned to a 64-bit FP register.
@@ -369,6 +380,8 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
+    target_ulong sd;
+
     if (ctx->mstatus_fs == MSTATUS_FS) {
         return;
     }
@@ -376,13 +389,15 @@ static void mark_fs_dirty(DisasContext *ctx)
     ctx->mstatus_fs = MSTATUS_FS;
 
     tmp = tcg_temp_new();
+    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
 
     if (ctx->virt_enabled) {
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
     }
     tcg_temp_free(tmp);
-- 
2.31.1


