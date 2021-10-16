Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D1430438
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:33:39 +0200 (CEST)
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboV0-0002Nt-Oc
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDb-0008Nk-2m
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:41 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDT-00021v-93
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so9740806pjb.0
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LSu5I85LJ7NrP6NesMckEJI2d8OPaq48KotVTNPiZYU=;
 b=mqUjoUcgUt4eABcbSe5Rgnn7FSF6WAuOswfGmcIh9t+yaP1z1AmCEeBMtCeKb3yyTq
 rs0kCIR2gWMlZ6SVQwJd26PwLGWboyL71eUqGn7QbQ0ObCp6Hf/fhz3DzeutvlZF26PJ
 KzeAxtuBQsMORlcja/kZrf9qrNtKdqW+Fvm6G/9NxSPW/VXtcMf/npzS68iF44UA/HYg
 F/DIph4HW/k4qNvJ4dZn23+FeI289gFEhzZciN5Tww9j0q1M81/up5M0pyJGT3X9MlZt
 H4MiOBNiVWL1KVt9o5/YJQm+AggOuN4b3cg8aaxFrnu4yheGb3V0ELoQwSI+DgJMzdyA
 NeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LSu5I85LJ7NrP6NesMckEJI2d8OPaq48KotVTNPiZYU=;
 b=PC/7E4B6PfvYZVUKMybki7E3obwMobgfur6tYiZ8zBR3Hx8QSl3k61/CPHTGRpHvcn
 hGWzXGByMqlVJVu0OQOkhJt9wuf9aD+a/n6FkODeaLho6qUjPrmj0uEtGYZuV+see/H6
 j9RHTGHPHDdpM120FYMitApAvVUB1yKxc2LJwSUzDM9SV8Kv7EtPEJs04eepyrU2BckG
 7x8aNEOehuw2UAx4czt68qF52Z3ariANgqIFWKGyMgsWo1ClrIUFfpyc+PvnNAr4BUDd
 erJOBEGVKjzZBYOwH7PWYdQ9bewI8s0v2KkTXNojFZ1Juj+GNYSbo2RzuHj0mFtKS9ed
 Vl6A==
X-Gm-Message-State: AOAM533/PNtV6QbqQ+SfOww21QszMBWOh7z8OvBBKiqXRKphpFHLL7fD
 icfG/Aw3pQ73xIhZMvuObwr6BHQlJFPYbw==
X-Google-Smtp-Source: ABdhPJx8mIO5EJb8JyrIVkcKl/dq0roNX+d4tUWOHqC/DQ4bJDto/WqfUssAn3JAMckrhunEDs3Maw==
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr21542901pjb.111.1634408129898; 
 Sat, 16 Oct 2021 11:15:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/24] target/openrisc: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:05 -0700
Message-Id: <20211016181514.3165661-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 target/openrisc/translate.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 5f3d430245..ca79e609da 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1659,11 +1659,7 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
             /* The jump destination is indirect/computed; use jmp_pc.  */
             tcg_gen_mov_tl(cpu_pc, jmp_pc);
             tcg_gen_discard_tl(jmp_pc);
-            if (unlikely(dc->base.singlestep_enabled)) {
-                gen_exception(dc, EXCP_DEBUG);
-            } else {
-                tcg_gen_lookup_and_goto_ptr();
-            }
+            tcg_gen_lookup_and_goto_ptr();
             break;
         }
         /* The jump destination is direct; use jmp_pc_imm.
@@ -1680,19 +1676,11 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
             break;
         }
         tcg_gen_movi_tl(cpu_pc, jmp_dest);
-        if (unlikely(dc->base.singlestep_enabled)) {
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         break;
 
     case DISAS_EXIT:
-        if (unlikely(dc->base.singlestep_enabled)) {
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


