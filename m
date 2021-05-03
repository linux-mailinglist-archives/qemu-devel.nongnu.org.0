Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F9E372335
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:48:25 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhMW-0006If-2p
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgre-00073P-DC
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:31 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrY-0000Lb-3V
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080183; x=1651616183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T4xfBUHTz99KeO4XUesDnPxK/SiUu00qLVoeeLc7XQY=;
 b=Q2f0VHNr0vEQIhI/AqdT6h0Q9fauDeyGOMPcYhFmRuDHBZ3BBYpNYjb4
 jqbgF/SxnWDPX5xmIHVvfz8KIhovAmGu6bpXKDW+2JU/11zWfaKxMIMtW
 M+8YE5tnVbgnPI82hZu9ToRRQGLyPKTcK9byeW+8tAqbLpE4w9C/b/ZfD
 PcCgSdbQAJx6q2v3RkSNzSx5qG7wzSk4Yx0IE8AcVmnLT3idQj9wChDyr
 NZaNLhuRywBrAOnCAXpBUx6g5V6UMt69XPjhGfxfw6TQsF5iE48Dh0b3W
 pNzw7U2ZZ/KwxBsw4sDu70RhtjEqMbO42WjR5LL43CGN2R0+R//5wd6NY w==;
IronPort-SDR: 0KiY4NnkUAAZeJb00H4ec+dX/D/Kq/bthDrXVnrFoUer/hB706ZFVdQmjrt64HlAS1nxqd4niZ
 xVgUePWZ7O37St8Vp6IYuKc82BDxEU5USd9Ptx/aJx+2MpkHjbFus7zYz+SuPysPcbrsSagHBN
 4Ei7ttePyS4DaoafO9fnC2vRiiFK5CH2Y7dQ1Lzl/B8X8txHpDQCAiKnz5M4/MphKtVIJkkSVa
 VqudONK49AZoA+lcmUmDVMLef2XI8F3hQtoIRx5HspzkKHrdjLLgpfq+u61ma0cS/LKssPJsCr
 Fu0=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114701"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:38 +0800
IronPort-SDR: g9MEy/v9G7ozeuS89IDXDYQI+QifGyk1OwpotLw/w9ASy8//UQSh761T9eYTWfB+716qcCGoow
 0s0J5qeVFPhiMmMHdnMW0WaJzTQSw7shafnI9C5N3k+yej3grCKPPJ5OWO+CxskthoVTFoBs01
 H46BRsinCtCnjlwV3V03MOEQYoh1mvtKv3OyLH1oPFTO670Y4OigHIO8ZSJgWC1jbVUyhEUlkX
 0wdQuMIlZQEB78Jmzm5QXzmfqlzf5CU6Z6SQoOv6aUKuGwvtwzgMaRXhRj+mwQHyl1WY/mvkpv
 4TGY4pksxXW0/oXb3bPT1s+z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:49 -0700
IronPort-SDR: orvxXZ4qTz3UC74z3SedsWqArsu8T2BgYr0sg90KU7NNjPUamIXfq2rOxiWUOXgj38nrIETCqQ
 Jq+o4WobewqU7MjNhcnMKGDQ9O/J4xt4WtAR5A0gjygTULE4OuqLGTBS+QOoRPHhBWUhSpubmu
 35MVZhQRpgzcFeR4ZZwDpoCdh56pfW8k5o2XXBenpNxrMu2PsE31no8xTpR+JTcmrW52KwzCSd
 9fnLR0hFCc6a+4ydt57/yDmVLNMdfWQd0Vz82q++DvoX5aPE7sgypiYY45/uidgJYuhaHCwxOG
 BxQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:36 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 36/42] target/riscv: Remove the hardcoded MSTATUS_SD macro
Date: Tue,  4 May 2021 08:13:21 +1000
Message-Id: <20210503221327.3068768-37-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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


