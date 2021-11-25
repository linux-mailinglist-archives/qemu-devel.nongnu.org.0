Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C97C45DDC5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:43:32 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGuJ-0000IU-Fe
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsj-0006ZN-4l
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:53 -0500
Received: from [2a00:1450:4864:20::42c] (port=35821
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsh-0002JC-7D
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id i5so12553975wrb.2
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i6Sa/S7mYt2OQVGTXQQ5ol9j8zL0KNw6Xyxd4wnAmmg=;
 b=zxn0mXl6jo5xUZG/a6ouevDKUP09VGykBhtkoOq04stxP3+tZaBVDFuMJKOqVqI3mj
 ffeckEi74ql1Ps6+a6bhoWd04s/nvYul+ehAOua4XFYk1XwPl5ZLKJtc+xvDqc2lsjXl
 yISQeXcTrIplhpmZp0nCPgj+OLkI4nyq1QYk156Pgs09eIO3EBvoWSskZFMt3g+Xa1jB
 tU1y7duUu9tmX3DbIeWEWxTaMZbiG5zU4je32Gikl4bXhgtq+XtIMfDM01Hky7VxHPPk
 v/P+YQ+Sth26s1H181Ebsj41VnxPICyhFI+MGSKgMmIoFEe43PKk/RKt+e+JENmq6MCU
 y8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6Sa/S7mYt2OQVGTXQQ5ol9j8zL0KNw6Xyxd4wnAmmg=;
 b=nRO31ERchAYIASTnp9HitMbdW3yDfUnMm7mc9PwhKpIaId0Vz4u66+TMd23qSByvb5
 m6sTLEXwlmI2spCz0LRNzvYIj8F5GMsURxqRIA8J2RzB9LFAMQzcbhO5osn4ookatIMr
 5VMoxOMgAUdPUDYWVr9XOFYqQNgfrLNKMq1/1cr25aINeTKP7KKaSzeU7rensDnI8gdP
 4he8Qu9Nam6FVO8977NQz1bSnBowqY0Ws+jhxelBHJW3j/6EkJuMaI0D7M/6yttMBWGe
 tXJP/Z9JRTYV/1pxeO77Q010DIFhOwhARUmr/667CB+DK6bYkGPysa6mGNOykJr8FWjh
 ZJRA==
X-Gm-Message-State: AOAM53132uZqhfWVBelbiypjR62cs5LnXHbQzntL69bTyL8mMLVzRvxL
 2w4j09m3F05z/xGslo4PJRGYAg==
X-Google-Smtp-Source: ABdhPJw4aosVE1fDU+xUgZioTVPyJVyVkzvb5dWEt9JXiYsDNBkylFtJ2UreIQt4MkYihM9MNSc2GA==
X-Received: by 2002:adf:8010:: with SMTP id 16mr7431949wrk.559.1637854909439; 
 Thu, 25 Nov 2021 07:41:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm9577700wmq.5.2021.11.25.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:41:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 164341FF98;
 Thu, 25 Nov 2021 15:41:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 1/7] accel/tcg: introduce CF_NOIRQ
Date: Thu, 25 Nov 2021 15:41:38 +0000
Message-Id: <20211125154144.2904741-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125154144.2904741-1-alex.bennee@linaro.org>
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here we introduce a new compiler flag to disable the checking of exit
request (icount_decr.u32). This is useful when we want to ensure the
next block cannot be preempted by an asynchronous event.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - split from larger patch
  - reword the check in cpu_handle_interrupt and scope to CF_NOIRQ only
---
 include/exec/exec-all.h   |  1 +
 include/exec/gen-icount.h | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

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


