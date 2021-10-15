Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C0E42EB02
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:06:00 +0200 (CEST)
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIE3-0003b4-Jk
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxP-0000KD-BI
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxN-0003VU-Jg
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:47 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 75so7878063pga.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jTm1MeiWxbxrtA34NqCU55ziGuGDL4gKwg3qbnMgdtA=;
 b=mjoYp1Rv/T4xXTYajki9PzH9hxDYUiboRYm+h1a15I6mfTUOIJ7ivC38iqbtKYXKl3
 O2NcStfCg0aEIdRgvq5ePfQ8300cBhbvdkHCmtI4+MFK7YdC+lFvRL6yPvhNz09ulWU0
 4VNyS/eJcs2ekdDefSlm734ZCmlmHr/jcA/jq3Fl1gXymg2CV8SYjb0TgiIRK9qFTqz9
 cEuehkz+he9O+5QZKheTDllv3cRxKMb45tr85VUi2teGTL6bcBMVqZ59nyTrGl09COgy
 pm3IMaIw7XXXXvZB+z3UtdmITE3IRWv5M48AIbxxjF7kfdFC+GyJCYB94hWOGpCKqgBV
 VYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jTm1MeiWxbxrtA34NqCU55ziGuGDL4gKwg3qbnMgdtA=;
 b=W7ngyN7rUbN017/t5bJ4+YUr9En6u7+QLhiSrVn19UD77vTB7rBBusuNC0zDooUqyv
 ZNos2UeoxrvF+1+8URGmmCAhuyzqzUWOYzteqZ0RgHGfGTds8bf5/aBiaQ5q8MYdmnAH
 To33B/DnDsS2ToM5wKHWnDn2pME79TAcIY3y2acDddNGVU/lqYy5e10ZqgaL7hySM4vr
 XfRJJoK+5AXFD+1bDybCvQ7D9R2kdmMxPDPAI02e/TRQ9ZMI5AAO24m4JdNiA3WZ5m76
 MBmzXaxez4Fk4xEbHUsUMPD6XvXN+x6JuMO2WcmuVRkvVc61MwhtJhAt2IYLqgW0Bb58
 7tLg==
X-Gm-Message-State: AOAM5331OKbFZAIoomKL8E92ubozChXbFyPY5Fyr0izD9yEl4SrQS2kt
 3PrC8mV3z+/Spaz5RtWzdWFHueEICz8yQTal
X-Google-Smtp-Source: ABdhPJwyGRrnB4k125SRKoK9DmDPdDSUBIjLnsScSOmMRXSKJkhJsSuS6wr9k2q2+KSGJckqIYqkrQ==
X-Received: by 2002:a63:1b23:: with SMTP id b35mr7946180pgb.262.1634284124084; 
 Fri, 15 Oct 2021 00:48:44 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 30/78] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
Date: Fri, 15 Oct 2021 15:45:38 +0800
Message-Id: <20211015074627.3957162-38-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3f30882aec4..7646567eb27 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1022,7 +1022,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e748f7ca714..4df2aa9cddc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -628,7 +628,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
-vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
+vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fc17e57d0f7..5376adca60c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2695,7 +2695,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
 }
 
 /* vmfirst find-first-set mask bit */
-static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
+static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2714,7 +2714,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 9451112b3da..f97783acf05 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4233,9 +4233,9 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
     return cnt;
 }
 
-/* vmfirst find-first-set mask bit*/
-target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
-                               uint32_t desc)
+/* vfirst find-first-set mask bit*/
+target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
+                              uint32_t desc)
 {
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
-- 
2.25.1


