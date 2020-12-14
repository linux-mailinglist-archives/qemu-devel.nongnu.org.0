Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C02D9969
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:06:54 +0100 (CET)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooV3-0003U2-FZ
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRm-0001Ys-O2
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:30 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRk-0003up-Po
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:30 -0500
Received: by mail-ot1-x344.google.com with SMTP id q25so15756126otn.10
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e4GkJv76UBMIB3dzCCmxjxbYnphaAHyABGBMlwHa+9g=;
 b=e6qb9pB8XU1J4St5tNl5X1Gk+/RxoTiVP3x8CX1fmEAvdXfOgUXxKjisvLENMopFag
 qJ1ZZybz+fuohhrOCYQAY5owdUp6b9QXvSSHYotKo7YcK8YU8zZUjROu0sLsSh6Hf54B
 h3SKTJF27hzSgf3YdGqP5yGBy+P7V1jwIBm6ATuP9ATc+tTpZYrTHKcaPLseG+zbH/zw
 OWOm+k4+A62gZcAI3Lwtrbirg7phgSIZ9dzetvXW70CcMDCzmOEqQHGm1/+wKdQlXi/A
 US/h9UlzKOvMc86vshcHtyU3PdjDxiOzVuah66sudjjO7puD7NoOIhd4gqKKojVK50vC
 imLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e4GkJv76UBMIB3dzCCmxjxbYnphaAHyABGBMlwHa+9g=;
 b=uMEq3yexGnJxIHaCtrCi93JyAo35shocb6QyH7vcZZLEWYB/TFq0ljgzuZ5Mu3IqiE
 Ot2T+JcLZqHiNw2VKw3ShsW3FPcN81HfZUBzEQMvNgdhlSfsmN4/kQpC7tuCxbJbc879
 ZO9jIrmgZRDJP5GJzCZ+fjDGun/LjpHbunHobLyrsse8qEmMOKWfRgwZqWXOwL5fVBZD
 bApURtZ0meKq7R6jPoHoAnRFZodrqd3L9jMtFHyTfqpnBHDyzmVaUk4jyradvTYTZl/d
 VF90clmq7lbnG6iIJ8nFdDW8SAxTRysjcS2d4RiHxtycrNLGWnQp79HLR9TOOqF5gAhj
 YUxg==
X-Gm-Message-State: AOAM5308QJeHLO4qmrx4l2VHCZgmcofNdmDMOkjVvZqxFv9uSrfW+nNw
 g65ouJSc9wmMLZPcaYZG1TSAvSQkcaFAlnkC
X-Google-Smtp-Source: ABdhPJwkUvNX9m9kmTrnj4A2IDm/ErG7NPCxeTVYu9ZeI/gR2kORHGpCc42WcR80uptpEb5SKdUwhw==
X-Received: by 2002:a05:6830:1e7a:: with SMTP id
 m26mr10520089otr.78.1607954605458; 
 Mon, 14 Dec 2020 06:03:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/43] tcg: Move tcg prologue pointer out of TCGContext
Date: Mon, 14 Dec 2020 08:02:36 -0600
Message-Id: <20201214140314.18544-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is constant across all thread-local copies of TCGContext,
so we might as well move it out of thread-local storage.

Use the correct function pointer type, and name the variable
tcg_qemu_tb_exec, which means that we are able to remove the
macro that does the casting.

Replace HAVE_TCG_QEMU_TB_EXEC with CONFIG_TCG_INTERPRETER,
as this is somewhat clearer in intent.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 9 ++++-----
 tcg/tcg.c         | 9 ++++++++-
 tcg/tci.c         | 3 ++-
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8ff9dad4ef..9cc412f90c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -621,7 +621,6 @@ struct TCGContext {
        here, because there's too much arithmetic throughout that relies
        on addition and subtraction working on bytes.  Rely on the GCC
        extension that allows arithmetic on void*.  */
-    void *code_gen_prologue;
     void *code_gen_epilogue;
     void *code_gen_buffer;
     size_t code_gen_buffer_size;
@@ -1222,11 +1221,11 @@ static inline unsigned get_mmuidx(TCGMemOpIdx oi)
 #define TB_EXIT_IDXMAX    1
 #define TB_EXIT_REQUESTED 3
 
-#ifdef HAVE_TCG_QEMU_TB_EXEC
-uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr);
+#ifdef CONFIG_TCG_INTERPRETER
+uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *tb_ptr);
 #else
-# define tcg_qemu_tb_exec(env, tb_ptr) \
-    ((uintptr_t (*)(void *, void *))tcg_ctx->code_gen_prologue)(env, tb_ptr)
+typedef uintptr_t tcg_prologue_fn(CPUArchState *env, void *tb_ptr);
+extern tcg_prologue_fn *tcg_qemu_tb_exec;
 #endif
 
 void tcg_register_jit(void *buf, size_t buf_size);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 675334e844..67065c2ede 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -162,6 +162,10 @@ static TCGContext **tcg_ctxs;
 static unsigned int n_tcg_ctxs;
 TCGv_env cpu_env = 0;
 
+#ifndef CONFIG_TCG_INTERPRETER
+tcg_prologue_fn *tcg_qemu_tb_exec;
+#endif
+
 struct tcg_region_tree {
     QemuMutex lock;
     GTree *tree;
@@ -1055,7 +1059,10 @@ void tcg_prologue_init(TCGContext *s)
     s->code_ptr = buf0;
     s->code_buf = buf0;
     s->data_gen_ptr = NULL;
-    s->code_gen_prologue = buf0;
+
+#ifndef CONFIG_TCG_INTERPRETER
+    tcg_qemu_tb_exec = (tcg_prologue_fn *)buf0;
+#endif
 
     /* Compute a high-water mark, at which we voluntarily flush the buffer
        and start over.  The size here is arbitrary, significantly larger
diff --git a/tcg/tci.c b/tcg/tci.c
index 82039fd163..d996eb7cf8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -475,8 +475,9 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 #endif
 
 /* Interpret pseudo code in tb. */
-uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
+uintptr_t tcg_qemu_tb_exec(CPUArchState *env, void *v_tb_ptr)
 {
+    uint8_t *tb_ptr = v_tb_ptr;
     tcg_target_ulong regs[TCG_TARGET_NB_REGS];
     long tcg_temps[CPU_TEMP_BUF_NLONGS];
     uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
-- 
2.25.1


