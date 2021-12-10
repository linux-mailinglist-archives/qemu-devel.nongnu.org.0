Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530046FD98
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:20:46 +0100 (CET)
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvc57-00013p-HF
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:20:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaph-0000cC-AE
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:48 -0500
Received: from [2607:f8b0:4864:20::62c] (port=35417
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvape-00085W-Q5
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:00:45 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b13so5764855plg.2
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kG+KZuSSZ8I30JU4tHyktEsJcWAryy8E5f237UVpCbs=;
 b=e0DoBQ9MXKfXEl1PbLmQPg2VDI5YvGoG5tPRe3d4HTmtMIklY0b/iGHGXYpqf+BEWI
 0SmINKNHtx7jAD2FtSae1Khp9M0iNLugUW4Rvga+/FOvS2ukWsX4WEQQc6AAq6lvnEW/
 5HHcBOekBPIaCN2Tt1CYo87wfRvA02piTie5qHALbKbTQ40mSHZa69c4DtEvuedqOYRn
 aZ4wXhagqztEL5m5uwwe8NH9P6ywfo/KtA2FwrMGUvWM/rEnsrsWql7CdYiMJ291vZ8s
 h6Gcl8xVvlsllu7yl804wdopyTXCF9oOIP9TGiJ5VueVEHVJPs/aWIKW3QuYKHNBeJoE
 wmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kG+KZuSSZ8I30JU4tHyktEsJcWAryy8E5f237UVpCbs=;
 b=686VnzWeOMSzGTyeBz+NtIq1UQlR4GzrYGa55RzrzsZdJQwB39MjXLk1Te85Kq8N0D
 Gz//laKsBDUJn/UjPxroX+P3Ez4liQnWjRSbVQalKx4TPoTPvx3PtGpdd/9hUAz+T87l
 Zx9Cv9rvYb79DDEUqsbJmzBZsG6NuuwIfoj8N/4JZAzT28xEn/j+gM0n4m2aHO0JyYmx
 1Q1oUruDU0OoVJ7//C0Fq+WIc4Kl/gZh9HIX8HxqvBSxPRlK0BkpbVQzul5unp2W1NOi
 gJsgH2LucMeILLluvKwglp6rWvahY51yHFwxezwRUp+F7KcWdYxhRQwtn5/eSES3TDHN
 e3Jg==
X-Gm-Message-State: AOAM53162foJYt/xo8U07z/CCFhhQ0o9yPSdqpFb8AchaIqeLk0ViNVX
 WdXHKBgFQpDVd8qoE2ALItcFbB6ce/goiJhN
X-Google-Smtp-Source: ABdhPJyr0RARgzaO7gAaXJtilwtUTgB+VS+Ki8lBMeYZyZR5mReZ2DaQitIEgXWPpyt4uuAG8/EM2A==
X-Received: by 2002:a17:903:185:b0:141:f5f3:dae with SMTP id
 z5-20020a170903018500b00141f5f30daemr73914014plg.56.1639123240961; 
 Fri, 10 Dec 2021 00:00:40 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.10.00.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:00:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 72/77] target/riscv: rvv-1.0: add vsetivli instruction
Date: Fri, 10 Dec 2021 15:56:58 +0800
Message-Id: <20211210075704.23951-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
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
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d7c6bc9af2..3b6524bad9 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -79,6 +79,7 @@
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
 @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -672,6 +673,7 @@ vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
+vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
 # *** RV32 Zba Standard Extension ***
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ff8f6df8f7..e540b5d33c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -160,6 +160,26 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     return true;
 }
 
+static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
+{
+    TCGv dst;
+
+    if (!require_rvv(s) || !has_ext(s, RVV)) {
+        return false;
+    }
+
+    dst = dest_gpr(s, rd);
+
+    gen_helper_vsetvl(dst, cpu_env, s1, s2);
+    gen_set_gpr(s, rd, dst);
+    mark_vs_dirty(s);
+    tcg_gen_movi_tl(cpu_pc, s->pc_succ_insn);
+    tcg_gen_lookup_and_goto_ptr();
+    s->base.is_jmp = DISAS_NORETURN;
+
+    return true;
+}
+
 static bool trans_vsetvl(DisasContext *s, arg_vsetvl *a)
 {
     TCGv s2 = get_gpr(s, a->rs2, EXT_ZERO);
@@ -172,6 +192,13 @@ static bool trans_vsetvli(DisasContext *s, arg_vsetvli *a)
     return do_vsetvl(s, a->rd, a->rs1, s2);
 }
 
+static bool trans_vsetivli(DisasContext *s, arg_vsetivli *a)
+{
+    TCGv s1 = tcg_const_tl(a->rs1);
+    TCGv s2 = tcg_const_tl(a->zimm);
+    return do_vsetivli(s, a->rd, s1, s2);
+}
+
 /* vector register offset from env */
 static uint32_t vreg_ofs(DisasContext *s, int reg)
 {
-- 
2.31.1


