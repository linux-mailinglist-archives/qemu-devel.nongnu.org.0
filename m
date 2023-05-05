Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED96F7A5B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:06:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtP-0001lD-DU; Thu, 04 May 2023 21:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtJ-0001Rj-Uv
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:45 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtH-0007ZI-HB
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ab032d9266so10810375ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248742; x=1685840742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITG8jjVwNOI0oWDo4I+IRi2yCELVv5S7qO6nRFbXJq4=;
 b=RC06wX60HSApaqrKDxJJ72bo4Fj+NyRyBrxHWNoUICyUVcS0XbHpQluTUnUZJw2x4T
 83A2KglSKtgZ3Kkeqm9hrLtM41CxHkzWKg+tQMfECfvKMoJv+jGbC4XhBtRT5HZRtSIP
 LKcw0j+bDSQ4VnA7TOYJY22Rw44v9uTUOfEaCEjrPXl0ocrjHPRNCxyMQvCFXR1XZU5G
 FitjqFMhjwJNEdKCfpBMvondeESSielVJCjxf2jYDhVc03kh6GUz8ab5iMlFHIRO+a4l
 yCFp2yWq58mZOM0No6qwdyeSFbLaM4Jyz/+eQ16m41533OfBe3olp7wSGlJjsnjieE1l
 6fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248742; x=1685840742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITG8jjVwNOI0oWDo4I+IRi2yCELVv5S7qO6nRFbXJq4=;
 b=es2KUKYP1yyPhzwwGEBysgZOja2Q1O4EGL1I+jaK2hHjbyHvyDOBRrRPR6uS/xyDym
 iwRnhWTztKPEEvZYW3f3iTTXiLludYZcQuFMBI+eoWALYONVvxMsSSgakbNiNjeM139I
 tYuFJBS4w5iB+4iOFJpKIc5EyUkO6qL6lVh8KBqDH0UAM/xXcQ5O0YfWlVUR/8vr7Vhw
 ZCHt7XEptFiyUov54fuWc4OT9pP8A0CBck1xZ02rc4mXmzIa2RW9z3ArkTte1bVXWIYu
 b9UnGIcbpRcsLyU29H68MFA3MqiiBsTggjpH7M/RkwJfGW4/73HtRT+rkqKDUqj53sWW
 ymfg==
X-Gm-Message-State: AC+VfDyjoX5KYZKMGr346cS7R1vqnCE2swf2tz/NxeUUpHNJihNFGTl/
 KJuZllujCCEbB69mPTs3HXE6sxFFy1iZKA==
X-Google-Smtp-Source: ACHHUZ7cR/TIOMisjtlBU0LLh/A96WjKcan57NPmmRhMlZyT0o92wD/MRvhQLxIy5XpCk+a7C4HD1w==
X-Received: by 2002:a17:903:41d2:b0:1aa:d545:462e with SMTP id
 u18-20020a17090341d200b001aad545462emr7576350ple.13.1683248741952; 
 Thu, 04 May 2023 18:05:41 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:41 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 42/89] target/riscv: remove cpu->cfg.ext_e
Date: Fri,  5 May 2023 11:01:54 +1000
Message-Id: <20230505010241.21812-43-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Create a new "e" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVE. Instances of cpu->cfg.ext_e and similar are
replaced with riscv_has_ext(env, RVE).

Remove the old "e" property and 'ext_e' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-11-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                        |  1 -
 target/riscv/cpu.c                        | 10 +++++-----
 target/riscv/insn_trans/trans_rvzce.c.inc |  2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 479b654d54..2b42de60b1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_e;
     bool ext_g;
     bool ext_m;
     bool ext_s;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f082748569..33db4fa4b2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -831,13 +831,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
+    if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
+    if (!riscv_has_ext(env, RVI) && !riscv_has_ext(env, RVE)) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
@@ -1150,7 +1150,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
-    if (riscv_cpu_cfg(env)->ext_e) {
+    if (riscv_has_ext(env, RVE)) {
         ext |= RVE;
     }
     if (riscv_cpu_cfg(env)->ext_m) {
@@ -1503,6 +1503,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVF, .enabled = true},
     {.name = "i", .description = "Base integer instruction set",
      .misa_bit = RVI, .enabled = true},
+    {.name = "e", .description = "Base integer instruction set (embedded)",
+     .misa_bit = RVE, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1525,7 +1527,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
@@ -1644,7 +1645,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index d75acbc4a6..a727169a4b 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -117,7 +117,7 @@ static uint32_t decode_push_pop_list(DisasContext *ctx, target_ulong rlist)
 {
     uint32_t reg_bitmap = 0;
 
-    if (ctx->cfg_ptr->ext_e && rlist > 6) {
+    if (has_ext(ctx, RVE) && rlist > 6) {
         return 0;
     }
 
-- 
2.40.0


