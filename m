Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F143041F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:18:32 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboGN-0002nd-NV
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDR-0008JZ-9j
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:30 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDL-0001ty-61
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:26 -0400
Received: by mail-pj1-x102f.google.com with SMTP id oa4so9488080pjb.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZzipROVCGm3vugHKiKwRWSZnnTR1LGc1zdt9OBaajQ=;
 b=shg5tAYkhfXbQ9XO/wcQP7/aGt0LbULZKCN6/CpoR4qIrWQ5IUmH2jWgXGubKHDAlk
 Bsm83CKjTgiZvXifsHJiyn1p7GA3ncvowkyUTgyGMd0GN9aDvkokEpTAdXfEXgbONUdQ
 wH0Kv8s/2CrYj4zWPq1RzJLxa/ikdZpJ7nxhf0HhnYXLyOBdnfOXubUQGVNw0mxmys3j
 Z1p6q4vGvmd6+GpmxnH1D9qq2/Nh9pqJ65DmHNkAP9qLmVtvaHc2BmhcQPYYXOX2+1Di
 fMWK5P3xI5izLmR3NllXOor4NphxbDWdS0r3cNYxlQFV+vHa3zSuPujZrmVI5jjUeqml
 DgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZzipROVCGm3vugHKiKwRWSZnnTR1LGc1zdt9OBaajQ=;
 b=PCdk1B+BNeB0D/I4+iS5moZXAYUYHSQ1gFptJDwL27ozCZululLN/G8JzLIydKGs1F
 bbavau7amUtm4+OaNUlKSweK4qf9zIofb11bDB+eMcZESIa/k9JlXGRRzXsos+d1st7V
 D5dyr9NpH1OEiJ85qJ9NrSTEX/WrlfRNRjJR6TWoBUOt7ajX+1wbKkg744DM9b4JMOQx
 OJ/5Yk5kxyt/vtg3a3ciTvyqB18SfXdmGJg1OK6cllIbF0Bqh3+lZv4MOe5YkuYkx/TG
 4akvwt300SakyZsA2RLb4WmrwcHzjU6vXN8Su1Us+EXmz3N05uR1Cxj96GogkymSuJK6
 ilqQ==
X-Gm-Message-State: AOAM530MZOtwk7Ed34NM35Lc2zisqxRMeoN+MkqzJvVKsnsY5YeBBPw5
 Q6eqHItpenHBc1KscLnSZvmOlP6PwJOWtA==
X-Google-Smtp-Source: ABdhPJwZYKhrDlWv4pQychI65zSVs04KdrzdvaqFdqoYYdxl/j98w9lP1Fw1PHytmOjsg1sMnvE+mw==
X-Received: by 2002:a17:90a:4e43:: with SMTP id
 t3mr36370149pjl.163.1634408121343; 
 Sat, 16 Oct 2021 11:15:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] target/hexagon: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:14:55 -0700
Message-Id: <20211016181514.3165661-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
 target/hexagon/translate.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 4f05ce3388..159931e8ee 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -69,11 +69,7 @@ static void gen_end_tb(DisasContext *ctx)
 {
     gen_exec_counters(ctx);
     tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_raw(EXCP_DEBUG);
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -614,11 +610,7 @@ static void hexagon_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_TOO_MANY:
         gen_exec_counters(ctx);
         tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
-        if (ctx->base.singlestep_enabled) {
-            gen_exception_raw(EXCP_DEBUG);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     case DISAS_NORETURN:
         break;
-- 
2.25.1


