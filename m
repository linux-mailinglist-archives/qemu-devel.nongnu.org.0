Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EE43D0941
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:55:14 +0200 (CEST)
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m668P-0000u6-66
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vq-0005C1-UN
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:17 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vp-0005aV-ES
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:14 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 70so981690pgh.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Fd0k7maRz4Hvh/R97SBMlAMNFVW8IZR/FAfbKbq9Fxg=;
 b=Lel+ljlsnSDj/ONoSKuEu6dDAoEes7dthOvDtm9B+N2jOvnFWr2Udiv8HDzblH31GQ
 0Z4xbCH+lk83hjbdBxSWiEnvoXs0bDQo+e3KGN0rsAUDnGFI0pCKtgpYkusWQp5SJsWh
 6z/1wSen9To3laoJVj0wBr8T6xVxgyjPkOrqMtvJVa0JuPUMxIM1xfkl81XenlxNy1J0
 UQAsgrw58h/Fd0K1NSIYF0kvmu1BkNTEdbwEFqBEIWy1a7Wi5RqQStFcDRRSSQeHRcmc
 cYvwblc0FlxSUfKVOhynAbZifkwuS4Oh97aLC/IVnVEndxK8368Ccj2TpHGm0QCYAkSG
 mZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fd0k7maRz4Hvh/R97SBMlAMNFVW8IZR/FAfbKbq9Fxg=;
 b=c4c5xGVY0V2XAgUzJ4SJ4MexSvFeSw/rvaUKLSFQggXzxhy/+6pksPtxR667C4lOT/
 YoJBc7H86kH84Eg4t5oP7d94puv+xa0jSW+/ehDwP7n+yt/1zmNS/BRvZ6DLZXZfPh0x
 xyCp5y5y6GJbrr857M7flVLQEPNh4K8/zKjp4OdDl+7jPOGlCdgnET1lS6T0YKUyLglb
 3NBHzfA+LY4UUtIjhf/JLOnpClwhGELy3n3CBdzSB6qM4IogQ1TCENaIv+UeFturDhxR
 smwAgmpasiNGVE979JTRcEg1pXufrGiCJiZyGU4+pswis7cURty9iauxGIw/FyCSAqJj
 pQQA==
X-Gm-Message-State: AOAM532B+gnBi91GeTRkC4vqS+vMzj5fL7HU7pW5+aMCHACFqlgohSxq
 qb6Of6UHK/zRwkIzIeUmXqZ4Mx7ADosibQ==
X-Google-Smtp-Source: ABdhPJwoIGnEMYHYaKGiYj8FZIuUtduLdsgwveF4lcMnU0NkKY+2i3nmH8yExOrBgbybS3mJ82QgHA==
X-Received: by 2002:a63:4e04:: with SMTP id c4mr34077706pgb.294.1626849732158; 
 Tue, 20 Jul 2021 23:42:12 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 14/23] target/mips: Drop exit checks for
 singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:46 -1000
Message-Id: <20210721064155.645508-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 50 +++++++++++++------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 4d1e08cfb1..cc24d443cf 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4954,12 +4954,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
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
 
@@ -11929,10 +11924,6 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
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
@@ -16257,28 +16248,23 @@ static void mips_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


