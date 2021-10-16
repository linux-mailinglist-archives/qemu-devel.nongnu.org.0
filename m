Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAF43042B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:24:50 +0200 (CEST)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboMO-0005u4-WB
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDT-0008Kc-CD
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:31 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDO-0001vN-Cb
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:30 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i76so9121253pfe.13
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8F0yKfEV2474L4Ct30BbTSDAfxIN/YXChfrODh7eN4=;
 b=ZHTAsCbf9K9kTYJJNR9Cbexq581ns+5OMuaykQZFeHCGPoYMOs30yADt7SmD6e6ZaF
 gNo42PY7IgT93YXh0yJc6VivTS4dotGo0vpxyHSsYvGcTpRVGPVUwlbEWhnCfAl3N6ql
 u8adFPDOCXDesslnjul4VT4IjE9yFuNdjgZEkFGNXhUSDDM6tPPgJoqCBoX6Rswxgwmn
 IQS1QlUj4xTjZibBENZsmXHmCp+CHlqCxDAJnW+fVjAsjAHkx9pelsNPGNaNybc4r4Y1
 fJOmfswCtkhovsAzPv28HX/x7GHFoDdChXj34WxRF5k2aBsHuLfkRkci7J7bHfgpKWnf
 LfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8F0yKfEV2474L4Ct30BbTSDAfxIN/YXChfrODh7eN4=;
 b=JBZYdZrLzxqCk9h4ifH6qVV7iN/4pPNgpxy3suMdA9aBsYx2qcei5h/phmWsmmIMtg
 tn8P7drU46Vfb2Dolt5GF2F6JWiOPyMQiVlPYp3t6fHNgqVL3j/pR50s5ApkkZCUCNCD
 lbeMFyVYemDayXrtzTd0cwQt2HghvTKNsQS/evia2O9ufXKYowanmSyamZfrWbGtSHy+
 WXnmX1ghfK09LawsmAZUN9XSJvmAyfprwD2ZyBDmmJ90DPaBuFveQZlekHi+kLjWStBS
 yQdcZAumSOnwy5VjhJlVgSIainCkTPmxp1i82V2nYRc2cIH9TaRzYcjxmSD7l6Dfqf3a
 v7RA==
X-Gm-Message-State: AOAM532Tq0+A40NtTvlIvAPajMsmBPpkDlkGHvze/gduCvW2+HvNqH/r
 NQwao4DVZenaMSQ1h7T76O7hFUu4emPgkQ==
X-Google-Smtp-Source: ABdhPJyZA8+99UNhhi1KdWsFHA2yd1iufYIodoLYkDwTc2b1R41fxBZAkJ0BFYHhZXSLB52bqMCODw==
X-Received: by 2002:a63:5914:: with SMTP id n20mr14725639pgb.164.1634408123230; 
 Sat, 16 Oct 2021 11:15:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/24] target/hppa: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:14:57 -0700
Message-Id: <20211016181514.3165661-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
 target/hppa/translate.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index c3698cf067..3b9744deb4 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -814,11 +814,7 @@ static void gen_goto_tb(DisasContext *ctx, int which,
     } else {
         copy_iaoq_entry(cpu_iaoq_f, f, cpu_iaoq_b);
         copy_iaoq_entry(cpu_iaoq_b, b, ctx->iaoq_n_var);
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -2346,11 +2342,7 @@ static bool do_rfi(DisasContext *ctx, bool rfi_r)
         gen_helper_rfi(cpu_env);
     }
     /* Exit the TB to recognize new interrupts.  */
-    if (ctx->base.singlestep_enabled) {
-        gen_excp_1(EXCP_DEBUG);
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 
     return nullify_end(ctx);
@@ -4274,10 +4266,9 @@ static void hppa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         nullify_save(ctx);
         /* FALLTHRU */
     case DISAS_IAQ_N_UPDATED:
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG);
-        } else if (is_jmp != DISAS_IAQ_N_STALE_EXIT) {
+        if (is_jmp != DISAS_IAQ_N_STALE_EXIT) {
             tcg_gen_lookup_and_goto_ptr();
+            break;
         }
         /* FALLTHRU */
     case DISAS_EXIT:
-- 
2.25.1


