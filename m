Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFE325C30
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:56:48 +0100 (CET)
Received: from localhost ([::1]:60378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUFC-000600-QI
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjT-00026e-Cl
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:59 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjR-0002Ow-UV
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:59 -0500
Received: by mail-pj1-x102f.google.com with SMTP id s23so5282785pji.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Yt30Q32C4cuAIMO7vok+bB0yDg0NLnfe8ThfRKMB4z0=;
 b=CXJBS1qVyntRNXvNtOOgvoxoTrJgKpTCBVZJbGPEsXa4o/2cQLto4ANKnWhApFowzr
 LF/soQQ67ojhDIgzYQRtKNj9POcDjRZgOYss0i8akKcLnfHPtDL4lMznDqSDUOyf11Op
 jM13TeumbSyKpeoAyCiC6oehrg0ef/nEH3WG7/jQHdzhBzCXrmskQOyd2enm8FU8wcxv
 QTHveDQZFNdN6cAID6NfthzdEy7TqBExqiIgMjkHQFd9UootwZJSquwk8eIHD7Tqi/go
 +bmOo1BcIBJi76e9J/wUdMYuZMVAEep6vuC8YfVKsg9JzRtj+ovRPWVJrFRrCRNXc5hP
 pVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Yt30Q32C4cuAIMO7vok+bB0yDg0NLnfe8ThfRKMB4z0=;
 b=SqfjxX0uIZ9Ec+yl1I7/4G6Lc0TACKw0i9ABOhWuM9yly6BR2IiWWZ8Vui6k9JoNVs
 bv72W+62dqx5wEr1cXNgzHXrj5PYy3E5Gj8kdHLXNmbQodxyshVh8LhjgOIU4PAnKHmz
 FwJdqippPhU1UQSkCtPBK1qP19mDjuCDyt/ky5jj12R56v7upHTjy1LATSy1vsqjXw2y
 XaW2qjuHyACI7/6Hx9A0xvKFYOGzNC8cVB1ce3rxh/wruzlhY1uq09ssU3QXwzodHc/9
 Y0sZbOgKbhV/OfmL+lZPJwFPmnib9pukwcF3zO8hVg1UYtbujTj3eajGs9kHMhBMsZXZ
 dmmg==
X-Gm-Message-State: AOAM530L5aiUflCIm2rmDzRgqNxEV1VdgNHLhXkRv5FV9h6W4ZyeNq7a
 FPwOKpmoIK8B1UIAk7CtwtcajI/PfBLa7w==
X-Google-Smtp-Source: ABdhPJyeWHEHKfWRB0U2jUjXUYIr1c6p1Q4ckl+xTGocySd0MZBExA6XRPWeVCpwZ9SStMR2W8euTw==
X-Received: by 2002:a17:90a:fd89:: with SMTP id
 cx9mr606585pjb.93.1614309836546; 
 Thu, 25 Feb 2021 19:23:56 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:56 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 48/75] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Fri, 26 Feb 2021 11:18:32 +0800
Message-Id: <20210226031902.23656-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 523c6cf7f6d..8386f4f2aa8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2881,7 +2881,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 93ed6f54e99..a2ef6b708c8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4440,7 +4440,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4450,9 +4449,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.17.1


