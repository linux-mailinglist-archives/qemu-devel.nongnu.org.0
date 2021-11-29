Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD0461C98
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:18:59 +0100 (CET)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkIr-0004V3-Lb
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkEx-0002QJ-Sa
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:14:55 -0500
Received: from [2a00:1450:4864:20::42f] (port=39533
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkEw-0001Tc-B0
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:14:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a18so38434963wrn.6
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyxCRPNO6Jc52Ko0I+nv2kkDmAau474j9b256EDB6Mw=;
 b=JChVEm8T2v7horwNGPkAAZNNKFmrTVI8fCjrWDE832Y79cT0LaXj8/UTX7EzeHj5g4
 Qyn5N3ZKGtcmVqfnEoAW9kDc9LyUjVWeDTmE+AGaIDznPSacHh8lCwGIZSLRyANY4QaM
 yJ1UQvnXUwiADtf97AO4F2UwZDlvD68xNnl/tzKur3abKivMFM4lbcltk9hWwLqs+0ZL
 Cp23g8ox3IpxwnOQfjm3vvTFfzLrPu9tadL9y1GUhYu1Gv60Yum1UKRrTGeOdYKWYqWT
 e3eNhYj/BQph9sbReW3gZPJmLYHdEWg8ZTE9cVqNb4FkU4QlkAOIxKtAnopxqUs8tsRi
 3Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyxCRPNO6Jc52Ko0I+nv2kkDmAau474j9b256EDB6Mw=;
 b=TQT3DbD69i8ePCGpebS6zA2TqCy2Sa2Y/2r2s1L8Oq4vgduR5Ld49K+gXHif/+q8kP
 zJmSs3wh5/x/ZbOUvLsDW+yfAqTlkIaIsMhs32w3wl0TxDY1GzkTyxNzPnO+UzdGGYed
 6qRv84qIlyA6wNhcDwgnmOy1KoXXdOpxM/0kPD3kCMTjbAolslNaTB5ZLU1GC45O9IqG
 Fha/YV+BjbN+bFkD7Mmr1p2ZbHNHZtnuwubJNuSyVLmdYJHb5mHm/SEzd3GsnEgQcV/Q
 ouv1raq2pqA3Hdc6d7xmboM3nCOQOQaDbw0uvC+skip2hX2E9Yx4euh2qREfPX9w4vCP
 eVbg==
X-Gm-Message-State: AOAM532xIaYuE4SK5EVSVC1Rc4ThVimSHWGV5iZ4gs28ZzJa8eJluJMl
 5PAg4BCdmKBiMJCF3mRSkZ64xQ==
X-Google-Smtp-Source: ABdhPJzi9DVl2p/zLGRMU5AiSal0wZIyF31qVKPlTYzoqYaxWt2US2PwzYLMsVusXY/W6mD1el9MXA==
X-Received: by 2002:a5d:5272:: with SMTP id l18mr35642566wrc.208.1638206092006; 
 Mon, 29 Nov 2021 09:14:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 38sm14823247wrc.1.2021.11.29.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7A3B1FF98;
 Mon, 29 Nov 2021 17:14:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 1/8] accel/tcg: introduce CF_NOIRQ
Date: Mon, 29 Nov 2021 17:14:42 +0000
Message-Id: <20211129171449.4176301-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here we introduce a new compiler flag to disable the checking of exit
request (icount_decr.u32). This is useful when we want to ensure the
next block cannot be preempted by an asynchronous event.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211129140932.4115115-2-alex.bennee@linaro.org>

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6bb2a0f7ec..35d8e93976 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -503,6 +503,7 @@ struct TranslationBlock {
 #define CF_USE_ICOUNT    0x00020000
 #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
+#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 610cba58fe..c57204ddad 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -21,7 +21,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
 {
     TCGv_i32 count;
 
-    tcg_ctx->exitreq_label = gen_new_label();
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         count = tcg_temp_local_new_i32();
     } else {
@@ -42,7 +41,19 @@ static inline void gen_tb_start(const TranslationBlock *tb)
         icount_start_insn = tcg_last_op();
     }
 
-    tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
+    /*
+     * Emit the check against icount_decr.u32 to see if we should exit
+     * unless we suppress the check with CF_NOIRQ. If we are using
+     * icount and have suppressed interruption the higher level code
+     * should have ensured we don't run more instructions than the
+     * budget.
+     */
+    if (tb_cflags(tb) & CF_NOIRQ) {
+        tcg_ctx->exitreq_label = NULL;
+    } else {
+        tcg_ctx->exitreq_label = gen_new_label();
+        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
+    }
 
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         tcg_gen_st16_i32(count, cpu_env,
@@ -74,8 +85,10 @@ static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
                            tcgv_i32_arg(tcg_constant_i32(num_insns)));
     }
 
-    gen_set_label(tcg_ctx->exitreq_label);
-    tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
+    if (tcg_ctx->exitreq_label) {
+        gen_set_label(tcg_ctx->exitreq_label);
+        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
+    }
 }
 
 #endif
-- 
2.30.2


