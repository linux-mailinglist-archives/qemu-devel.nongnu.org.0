Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F3521AEE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 16:02:10 +0200 (CEST)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noQRE-0003j4-VV
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 10:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noJZz-0005tb-U7
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:42:44 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noJZx-0008UM-L5
 for qemu-devel@nongnu.org; Tue, 10 May 2022 02:42:43 -0400
Received: by mail-pg1-x52a.google.com with SMTP id l11so8307492pgt.13
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dh1XMFQ415BeLKG6zfLTyGUJuvdcM31S82dzTnhBsE0=;
 b=1GBxhzWq4e1NOr4q3mTTJ991I78kXj5R9WALNUNjMLVgxJjjLBhfdRHnGCBMeMGfU+
 i6wjM2S6PAzGkTtMWkfYNqNqhiljNf1qoH50EB01B1SmTGPH5L6Ha0d5rD+QIcG65ZIe
 +q4ULHm2SXviiHnWg7ny4MnODPy5f3Ma+6SiZzIvzgCLYaaIiykgPmhv4KyGiJ8Zs7ou
 ctQFfGURfctnYTghatk7N+D+SZdo4QPJ5kvhmRTltBFrXndX+2TtopUGjOHgKOTPeXVf
 nTUwJaznn3zseQMGCv7Gp9H88EEwny2CHf9psh0cZOObdgT8q0Wx8QEMYpHfHYH4xra+
 a7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dh1XMFQ415BeLKG6zfLTyGUJuvdcM31S82dzTnhBsE0=;
 b=iWW7OxCLPLBH1BYbmMOgev1PJU5V/XsrfhNLdloMohOYutC6mDjjpAL8+FPifiaYi/
 OHMakADEi1X9oKhwMCb0/MX6KYZbRv4tKbZV3lCydbN/Tzohvqj+7cZiyq3x4s3S0vP8
 BD6XMAVbuBN1nVXLj/1QFwIww10vh4P0xxOH355XFqVCuxlOYN+CK9fvI684D6xKHH09
 Hbr48XxP7dwk7ckEACd7RXUY3FpDhOLxtUBSRAvtm2mhR3MRl/j/zWHDs+mTqhCDUtR2
 bWWTlv+B6xLY+gDAf/Ckb5sO3ZyPBJ/gC73vCgFi+Nz66p7Ni6nqKQnAS4WEnBdWzTi7
 rTpw==
X-Gm-Message-State: AOAM531/m2Ga/hMdrWVR9CTe8/hLwcuk0z6xq9HSR5S8RCO+uptd6fnT
 e2Kgd83vJAO3YgdvzPh5tNcXOeePIkg8Cw==
X-Google-Smtp-Source: ABdhPJxqAikwqB4KqWKsnKTMJOuu8TCR9Nfbsdvk0GFxt5WUI2Cmy/hMGIl7BBwkUrU82RCYC/rmcQ==
X-Received: by 2002:aa7:93b3:0:b0:50d:56d2:e752 with SMTP id
 x19-20020aa793b3000000b0050d56d2e752mr19316779pff.82.1652164958983; 
 Mon, 09 May 2022 23:42:38 -0700 (PDT)
Received: from daolu.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a17090331cd00b0015e8d4eb247sm1078082ple.145.2022.05.09.23.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:42:38 -0700 (PDT)
From: Dao Lu <daolu@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 1/1] Add Zihintpause support
Date: Mon,  9 May 2022 23:42:31 -0700
Message-Id: <20220510064231.1384670-2-daolu@rivosinc.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220510064231.1384670-1-daolu@rivosinc.com>
References: <20220510064231.1384670-1-daolu@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=daolu@rivosinc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 May 2022 09:56:51 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added support for RISC-V PAUSE instruction from Zihintpause extension, enabeld
by default.

Signed-off-by: Dao Lu <daolu@rivosinc.com>
---
 target/riscv/cpu.c                      |  2 ++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              |  7 ++++++-
 target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee215..183fb37fdf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
@@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
      *    extensions by an underscore.
      */
     struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe6c9a2c92..e466a04a59 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -394,6 +394,7 @@ struct RISCVCPUConfig {
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_zihintpause;
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4033565393..595fdcdad8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
 sra      0100000 .....    ..... 101 ..... 0110011 @r
 or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
-fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
+
+{
+  pause  0000 0001   0000   00000 000 00000 0001111
+  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
+}
+
 fence_i  ---- ----   ----   ----- 001 ----- 0001111
 csrrw    ............     ..... 001 ..... 1110011 @csr
 csrrs    ............     ..... 010 ..... 1110011 @csr
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index f1342f30f8..528c30c9a2 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -18,6 +18,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_ZIHINTPAUSE(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zihintpause) {      \
+        return false;         \
+    }                         \
+} while (0)
+
 static bool trans_illegal(DisasContext *ctx, arg_empty *a)
 {
     gen_exception_illegal(ctx);
@@ -796,6 +802,18 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
     return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
 }
 
+static bool trans_pause(DisasContext *ctx, arg_pause *a)
+{
+    REQUIRE_ZIHINTPAUSE(ctx);
+
+    /*
+     * PAUSE is a no-op in QEMU,
+     * however we need to clear the reservation
+     */
+    tcg_gen_movi_tl(load_res, -1);
+
+    return true;
+}
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
-- 
2.36.0


