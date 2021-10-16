Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716A7430424
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:21:50 +0200 (CEST)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboJZ-0008OA-H8
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDM-0008JV-PS
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDI-0001s2-Tb
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id i5so2249952pla.5
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=krNZ+k36Q7kVN35RCh7k4261FBntNustDkikqfFBngI=;
 b=w5lDP6pfJjtE0s4oqR5NR/pIy3vBepwIcxvbaJeacS+FmGXpxOBbcUdWXQgaFZRNPb
 k+nB1Z/PXnX/ed2SuGmbRgo0OJxMbTtQ3O8nRu3R80G5iJjoJw5b8JEX/fL22wrtpLQk
 3l0o4oxu3H4+dmCRvEvJCrKCnwHyZ69TEq+nF8m/haIW8szCzeeJymEm4hViG8FCDSya
 JOCeDiFqSMMad/STkd9GPdcSrCdNje/Ay55t2Si9afjRcbRjft6Fa68sVeJG0HlqrpeD
 pNv2UPVXCUUhFujqrs/iiJoMVumXoLnM4aLRCsvFi70Jd9cRXaOFc95HXo7RdcFH4ND+
 NkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=krNZ+k36Q7kVN35RCh7k4261FBntNustDkikqfFBngI=;
 b=0ZRZ7XCw35ntKie94kdKQx8veqJgmndZdEIZBfkzXf4BfnmObBHSBGzdTYuQTH7TOu
 F4crqYmtKlS/ScQ1iz9uIRTxLCFBuCJ0WmoXsLPAvZ+AScNaq3ycEyU35f31bejavmFe
 AbepdnhomQPjpEWv+3OBjXBz2s/c33czT2KX06UStAI+U8eWmOOU3eFrqCj7ShHOpj2d
 +njT3sm8IRJZazTZKbGbpkx9Vrzs3q8pRuAMvpDCHZxTOpjdW3bxATZiqDZG/GZFkoF3
 GsN64OnTtKPZq1gz39K6nY7WADIxrB3SGDbs0+42soUTR6R5Y2yxIYQqb1cQPTeh2nZv
 HcnA==
X-Gm-Message-State: AOAM532V5kqorr01+HrCy3qEQr3VDtRLj1BC66rCKKhyBfzUcoa/e4nb
 h04ox1jOUyMJBt398ERkGIXEH7N4hZpVdA==
X-Google-Smtp-Source: ABdhPJzTfWseQKZ/gcqiRm4GmRihgywrUF7m5BKSGglp/E5Q3UeuWzI3eQfsrKZlJT685ghWOCpcXQ==
X-Received: by 2002:a17:902:8bc3:b0:13e:9d00:a8f5 with SMTP id
 r3-20020a1709028bc300b0013e9d00a8f5mr17673992plo.79.1634408119557; 
 Sat, 16 Oct 2021 11:15:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/24] target/avr: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:14:53 -0700
Message-Id: <20211016181514.3165661-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Tested-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 438e7b13c1..af8a3e0f9c 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1087,11 +1087,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -3009,17 +3005,10 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_movi_tl(cpu_pc, ctx->npc);
         /* fall through */
     case DISAS_LOOKUP:
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        }
-        /* fall through */
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_EXIT:
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


