Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65A25230A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:42:02 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAghd-0001gD-I4
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg4Q-0000jU-Ui
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:01:34 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:38476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg4N-00024b-LW
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:01:30 -0400
Received: by mail-pj1-x1044.google.com with SMTP id ls14so123596pjb.3
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4nKzEtDvQ/HGhwSfCseZ1hDjTvu3zAu+DRp/TAzlmzg=;
 b=DcvCRwslCknsxHkRwtcpZTJSq4zNwX766iDx86bRNa1/6ceKX5EzMSyZf0BAJ0IXEy
 9ECtFCiM+AqWUvl9nGEPxl9sV7ppKbAquJX5wpMKDFlWKGHbuvLYZASIeTTYGIA+4OFI
 xRQUEZ48agKzlK2UezQfXkdNocAwCOe9iVQQmwPyzcPI3tXywgeslrPnK80sMlNDQNd6
 kzMBrw8vqW0xGwNZqM5d52v30kDybN02lPAV2mpTd2at8xLbYBvM295OzUgTDnVc/lY7
 nTj36jv4oM/wPHZHJz9NOciZ3Il+i9ie15PENjGTYwn21YGnGK6Vf9iQGGOrsi8K1RPw
 5wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4nKzEtDvQ/HGhwSfCseZ1hDjTvu3zAu+DRp/TAzlmzg=;
 b=LiuuyqeOtzhlq2kTKX8jx+xET+sKwJePdjeAYF4YyDWfPGYFunFFcppY7tUPe/C2Ki
 mFz9kY8MIaaXC1yobwGpgBh2k+9bpVYFyFxZBpTgpVO3bgKsko+xWPn1M5fKNcoyV0iO
 9JyRemqwnkjvWOu61+HFTR66Rtsrrjh7dut6Szhm5OX1oeXbZ3ORoWhhcl5Vwb/9LPEp
 WQYMOQ7VXi/G6Kc9guuVDhFmy6Cp+HbSGVFA94fTYYqw9ZCnnPMPxuc1f1NAy6R9zpBu
 seZIO+Hjo8YD+TvssVbjgA/5Mfzj0q5zYt00rwXRbUBNBHDkqEQQtaIvyC4/YK8ByfA7
 y3vQ==
X-Gm-Message-State: AOAM533Oi22Ka57v33ZlMBFSMgPhJ8qiUbLYMtuccCwIQpdX4+QlUbE6
 ePd1LMTHby4rgnb276IEXq67HVfGS4xzYQ==
X-Google-Smtp-Source: ABdhPJw2b+rlSFs3/+lDsZHrJlMeC4RZGBwwdOv1kuC26TlstdowLw7Hrnx5+FIbRhIjNzYVlx3LJw==
X-Received: by 2002:a17:90b:1108:: with SMTP id
 gi8mr2963573pjb.7.1598389285841; 
 Tue, 25 Aug 2020 14:01:25 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:01:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 71/77] target/microblaze: Convert msrclr, msrset to decodetree
Date: Tue, 25 Aug 2020 13:59:44 -0700
Message-Id: <20200825205950.730499-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split this out of dec_msr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/insns.decode |  6 +++
 target/microblaze/translate.c  | 85 +++++++++++++++++++---------------
 2 files changed, 54 insertions(+), 37 deletions(-)

diff --git a/target/microblaze/insns.decode b/target/microblaze/insns.decode
index f12e85b492..e80283cce6 100644
--- a/target/microblaze/insns.decode
+++ b/target/microblaze/insns.decode
@@ -24,6 +24,7 @@
 &typeb          rd ra imm
 &typeb_br       rd imm
 &typeb_bc       ra imm
+&type_msr       rd imm
 
 # Include any IMM prefix in the value reported.
 %extimm         0:s16 !function=typeb_imm
@@ -55,6 +56,8 @@
 %ieimm          6:5 0:5
 @typeb_ie       ...... rd:5 ra:5 ..... ..... . .....    &typeb imm=%ieimm
 
+@type_msr       ...... rd:5 ...... imm:15               &type_msr
+
 ###
 
 add             000000 ..... ..... ..... 000 0000 0000  @typea
@@ -176,6 +179,9 @@ lwi             111010 ..... ..... ................     @typeb
 
 mbar            101110 imm:5 00010 0000 0000 0000 0100
 
+msrclr          100101 ..... 100010 ...............     @type_msr
+msrset          100101 ..... 100000 ...............     @type_msr
+
 mul             010000 ..... ..... ..... 000 0000 0000  @typea
 mulh            010000 ..... ..... ..... 000 0000 0001  @typea
 mulhu           010000 ..... ..... ..... 000 0000 0011  @typea
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 71ceabfffd..e05523bd5b 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1338,16 +1338,61 @@ static void msr_write(DisasContext *dc, TCGv_i32 v)
     tcg_gen_andi_i32(cpu_msr, v, ~(MSR_C | MSR_CC | MSR_PVR));
 }
 
+static bool do_msrclrset(DisasContext *dc, arg_type_msr *arg, bool set)
+{
+    uint32_t imm = arg->imm;
+
+    if (trap_userspace(dc, imm != MSR_C)) {
+        return true;
+    }
+
+    if (arg->rd) {
+        msr_read(dc, cpu_R[arg->rd]);
+    }
+
+    /*
+     * Handle the carry bit separately.
+     * This is the only bit that userspace can modify.
+     */
+    if (imm & MSR_C) {
+        tcg_gen_movi_i32(cpu_msr_c, set);
+    }
+
+    /*
+     * MSR_C and MSR_CC set above.
+     * MSR_PVR is not writable, and is always clear.
+     */
+    imm &= ~(MSR_C | MSR_CC | MSR_PVR);
+
+    if (imm != 0) {
+        if (set) {
+            tcg_gen_ori_i32(cpu_msr, cpu_msr, imm);
+        } else {
+            tcg_gen_andi_i32(cpu_msr, cpu_msr, ~imm);
+        }
+        dc->cpustate_changed = 1;
+    }
+    return true;
+}
+
+static bool trans_msrclr(DisasContext *dc, arg_type_msr *arg)
+{
+    return do_msrclrset(dc, arg, false);
+}
+
+static bool trans_msrset(DisasContext *dc, arg_type_msr *arg)
+{
+    return do_msrclrset(dc, arg, true);
+}
+
 static void dec_msr(DisasContext *dc)
 {
     CPUState *cs = CPU(dc->cpu);
-    TCGv_i32 t0, t1;
     unsigned int sr, rn;
-    bool to, clrset, extended = false;
+    bool to, extended = false;
 
     sr = extract32(dc->imm, 0, 14);
     to = extract32(dc->imm, 14, 1);
-    clrset = extract32(dc->imm, 15, 1) == 0;
     dc->type_b = 1;
     if (to) {
         dc->cpustate_changed = 1;
@@ -1361,40 +1406,6 @@ static void dec_msr(DisasContext *dc)
         extended = extract32(dc->imm, e_bit[to], 1);
     }
 
-    /* msrclr and msrset.  */
-    if (clrset) {
-        bool clr = extract32(dc->ir, 16, 1);
-
-        if (!dc->cpu->cfg.use_msr_instr) {
-            /* nop??? */
-            return;
-        }
-
-        if (trap_userspace(dc, dc->imm != 4 && dc->imm != 0)) {
-            return;
-        }
-
-        if (dc->rd)
-            msr_read(dc, cpu_R[dc->rd]);
-
-        t0 = tcg_temp_new_i32();
-        t1 = tcg_temp_new_i32();
-        msr_read(dc, t0);
-        tcg_gen_mov_i32(t1, *(dec_alu_op_b(dc)));
-
-        if (clr) {
-            tcg_gen_not_i32(t1, t1);
-            tcg_gen_and_i32(t0, t0, t1);
-        } else
-            tcg_gen_or_i32(t0, t0, t1);
-        msr_write(dc, t0);
-        tcg_temp_free_i32(t0);
-        tcg_temp_free_i32(t1);
-        tcg_gen_movi_i32(cpu_pc, dc->base.pc_next + 4);
-        dc->base.is_jmp = DISAS_UPDATE;
-        return;
-    }
-
     if (trap_userspace(dc, to)) {
         return;
     }
-- 
2.25.1


