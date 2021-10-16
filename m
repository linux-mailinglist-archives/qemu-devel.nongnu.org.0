Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DDA430430
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:28:31 +0200 (CEST)
Received: from localhost ([::1]:52334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboQ2-0003TF-8W
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDY-0008Mj-84
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDT-00021P-2M
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id gn3so3948090pjb.0
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZhqGge9vu+6Bc5Ne+L+64OR4mcrgGsrXPqV5KkLFEY=;
 b=vky+mf1FtvxY4hcoYLpbmdxa1aTtkkFm3S3HhlXb8AuJp0TwkFnkNuwYVn2vRbRIgV
 BssUWDPywYAjRhssP/yTpF8HUdWMxq+6xcsa5FDOmqPA08nUTfHSvyVuGNH0IfUjVZHD
 5cdXZchOHLWhKh6GFN7UpbFTaaHOsNEUv70wIMhcurCoqGZGvqL5MjQN0T+YWm9RSGAU
 5aTlpTOs34v0zAx8DRppZpb47O/qtR+X71reYh80XwFGs6+T5f8jgHABNhJB+oBPuSzg
 S9u377ikiKed1aP61zC7DHQZKzBXebW8yA2pzfAahydS4/BYALC0hxd97YAgVyKTn2w4
 JaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZhqGge9vu+6Bc5Ne+L+64OR4mcrgGsrXPqV5KkLFEY=;
 b=vveMuqtTgtQ12UU/oQA2gd1vaF6gPFXCcOUNOHF/uj5CN/HQXg/u5/wHQiiI2TUac1
 Ar9MZ/VZDxzZZrUzVTyy9pPf1K6sbLpSHM0UAAYQz4ZZNouLdkMjRoC50TTn4MNRStpk
 i/CIBHoipedKaco9aJY2L4QyzgjA37r8/ci/AhZbdjIytFMdn3awLJWMvoi2QrN1M/tf
 Ag9y0H/LWIGiSsL440K3r05nJU6/qlqYNPnHbuO/TXzZY9ohyD1pHcMT1koLrMbajjTC
 biDFejjDpasmiF55hznt0KT4tkoViQJTCdx5yF9pZa/v6JrJhKzOHi8uyX3eDmZpHD8O
 9TIA==
X-Gm-Message-State: AOAM532BRsUzaAt9ltw94EP+ePCHK4nmrodlx6hXnFOT7UX880ZVEh+K
 FyTS3UVfwYOhHZ4T+KYCS+F3NGXgL3s=
X-Google-Smtp-Source: ABdhPJyQvWmYqZYlMiAA/0u8AnbO2sBEiR8/PHkmiXwvQE74ndzOc10Qg5lne3s4gXhkHZHvGSuzLg==
X-Received: by 2002:a17:90b:1910:: with SMTP id
 mp16mr21729927pjb.30.1634408129213; 
 Sat, 16 Oct 2021 11:15:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] target/mips: Drop exit checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:04 -0700
Message-Id: <20211016181514.3165661-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 50 +++++++++++++------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index f239f9ffc0..0e59b97190 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4823,12 +4823,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         gen_save_pc(dest);
-        if (ctx->base.singlestep_enabled) {
-            save_cpu_state(ctx, 0);
-            gen_helper_raise_exception_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -11788,10 +11783,6 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
             } else {
                 tcg_gen_mov_tl(cpu_PC, btarget);
             }
-            if (ctx->base.singlestep_enabled) {
-                save_cpu_state(ctx, 0);
-                gen_helper_raise_exception_debug(cpu_env);
-            }
             tcg_gen_lookup_and_goto_ptr();
             break;
         default:
@@ -16111,28 +16102,23 @@ static void mips_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    if (ctx->base.singlestep_enabled && ctx->base.is_jmp != DISAS_NORETURN) {
-        save_cpu_state(ctx, ctx->base.is_jmp != DISAS_EXIT);
-        gen_helper_raise_exception_debug(cpu_env);
-    } else {
-        switch (ctx->base.is_jmp) {
-        case DISAS_STOP:
-            gen_save_pc(ctx->base.pc_next);
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        case DISAS_NEXT:
-        case DISAS_TOO_MANY:
-            save_cpu_state(ctx, 0);
-            gen_goto_tb(ctx, 0, ctx->base.pc_next);
-            break;
-        case DISAS_EXIT:
-            tcg_gen_exit_tb(NULL, 0);
-            break;
-        case DISAS_NORETURN:
-            break;
-        default:
-            g_assert_not_reached();
-        }
+    switch (ctx->base.is_jmp) {
+    case DISAS_STOP:
+        gen_save_pc(ctx->base.pc_next);
+        tcg_gen_lookup_and_goto_ptr();
+        break;
+    case DISAS_NEXT:
+    case DISAS_TOO_MANY:
+        save_cpu_state(ctx, 0);
+        gen_goto_tb(ctx, 0, ctx->base.pc_next);
+        break;
+    case DISAS_EXIT:
+        tcg_gen_exit_tb(NULL, 0);
+        break;
+    case DISAS_NORETURN:
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


