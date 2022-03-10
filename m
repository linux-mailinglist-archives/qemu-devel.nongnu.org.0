Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2DA4D45CC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:36:32 +0100 (CET)
Received: from localhost ([::1]:41748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSH5r-0005Ep-7c
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:36:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxE-00050l-RQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:37 -0500
Received: from [2607:f8b0:4864:20::42e] (port=46757
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxD-0007vY-9e
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:36 -0500
Received: by mail-pf1-x42e.google.com with SMTP id s11so4812792pfu.13
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLj6JkBIZs+pNXo0KcbHngyos4ugjFtFayVOvZJfdpk=;
 b=LdGuY8oX8KCnL3VZ0f5HoKPlY+taKpgKAemBRuz+nuarsPBkwzGRYtMslizFfwc4ja
 +QVqUVmc/VhETytNP9gxvJCkNg3YkR/Cibd+R7teLbYIUAaEDyJa0gURCAtoQW5HNqI8
 CzS1ev6A392a7MNm6VVY0lanXFQcBMXInRw0C3ISgD9hfttydPizy3UXATA4AgC+Tbgi
 tqxLMPSfKr2vPOqPINmucUVNtIpgn2wg0ASoBIlmMItViOA28jRrh1GdFA31gUScwkMU
 znb/oZqT4ywuwDpNKV9bseuC38pyd6TPTzW0KvwXvnO5W2nR4By69E6D71UEOdQNJnHD
 wb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLj6JkBIZs+pNXo0KcbHngyos4ugjFtFayVOvZJfdpk=;
 b=5bj2uPSE8UZ8V2vrUgsda+2YyXUtjTa9UF0T1H20nYs5AcF9f7gQ/H7i6l+7OtyIbJ
 GVFJPW3gny3VEWzyt7linlZnugtyyynGdT4o0y2ZGnlq341w21vqEDYudXILNp7IQTcu
 iaveK0p8ZAGWq/mLS/LezR8PB+UDwa06bcsyb1yNkwNKVQrfsmVESEnJDpRzGu2O1Fqh
 EoLDprJrJYtXORThOvtWbxXongiKz7Cg+S2EGLjEALWgHZTfQ3rrItbVWRJDrW9uQCx/
 je+u9wRVf1IdQgFau2AxPoWIAqDnaSLq21FatMEjf+BYqkL4NtBaDg8MSzlIyJFaBHc6
 r9mg==
X-Gm-Message-State: AOAM530q9xrY3R57L1OizTBOBQ7CMkJg+9c5FJGn+I8P5vrf+hi3Djof
 dgQJx80m6DNBydKLYkM5LD31jVS0XBsTdA==
X-Google-Smtp-Source: ABdhPJw/ek5rryPEPlMUACEthVvhM7f9LVKhYFc9NNTsEEdrNbI5lc1XHuUaNk6ECS0yHUe/OdlC/w==
X-Received: by 2002:a63:1c8:0:b0:380:189b:1e66 with SMTP id
 191-20020a6301c8000000b00380189b1e66mr3599120pgb.71.1646911653938; 
 Thu, 10 Mar 2022 03:27:33 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/48] target/nios2: Fix BRET instruction
Date: Thu, 10 Mar 2022 03:26:43 -0800
Message-Id: <20220310112725.570053-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had failed to copy BSTATUS back to STATUS, and diagnose
supervisor-only.  The spec is light on the specifics of the
implementation of bret, but it is an easy assumption that
the restore into STATUS should work the same as eret.

Therefore, reuse the existing helper_eret.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 7c2c430e99..3f7bbd6d7b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -407,12 +407,22 @@ static void ret(DisasContext *dc, uint32_t code, uint32_t flags)
     dc->base.is_jmp = DISAS_JUMP;
 }
 
-/* PC <- ba */
+/*
+ * status <- bstatus
+ * PC <- ba
+ */
 static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_BA]);
+    if (!gen_check_supervisor(dc)) {
+        return;
+    }
 
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- rA */
-- 
2.25.1


