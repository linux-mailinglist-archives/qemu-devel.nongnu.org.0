Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2463B098B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:51:09 +0200 (CEST)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvig8-0007wg-R5
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvida-00051V-3w
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:30 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidV-0005IM-93
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:29 -0400
Received: by mail-pg1-x534.google.com with SMTP id p9so3076354pgb.1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDiLqe9dSt4bFFEx812mp6CpLrrp0+muqbfaUvci+sc=;
 b=Zy+LECNr7q7qANSSmJjSQ656quOM4XRilI1m51YfBi57GCT+9QX5+PO8nlCZUxW9qI
 kV1FgWgYusYERxJImw1pV3lxcPUEzX+K7/jBxK6HYJYSomVnBzVsq6vg6ykQyQyf2x8/
 y0WhEZPF81IQ/qkRb1xHmHHyFjj2QlqeJBgeV+pfdk5RLne/FjwfnqSNimjzoRjM2XPz
 wRkHws+ZzpULxytrknuIdGWtL7NtscdjgWmvTSX1hGHvQu0B97F5AI2FHKaGLtVhUZT5
 EI3pezyT00Q4N7iv2koxpeK8p14MFbUyiO0BwhRNXiy+45QVzh8ZCQDt31GY0t9NneNA
 pe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDiLqe9dSt4bFFEx812mp6CpLrrp0+muqbfaUvci+sc=;
 b=Y9SiRfDvorDvL74KggfhoREajpj0UzBnxuMeCcM3aqTvhVSRzPLJsWJ/g127kcHVNH
 C6edWH9jvMkCPTWwyzSr5H1Tzvu8EwwqlvwAcardywFlAP4inKB7M1D3P5/1jbJ3Sfqe
 oZngs5oCmzDlK610ElZMQHsExagfks/GDMwEfaGe1aci9Uknq2n+W5p4vZJxbIMF/RDm
 kNP6dYCKUPaAqo0cactJ8F0Eg9P5Y6sv6cm37dWsHtwmazK151Ndsy96Z89xvVAVL+e0
 gxAqv+XbCmKiI0ZjbEbbDI2hnisZG5VB8ShgtjffGfCs3NaMtskPSN25gEy5R4+11vO5
 yzEg==
X-Gm-Message-State: AOAM533Gveb9p5vFtu5jkCt1yuwWHrLmInUwzQJ961xY3WshHseXTovI
 k9LHpv3Zaw7jXv0bbfDKLQZ3nTTcXwqRVw==
X-Google-Smtp-Source: ABdhPJzho50Zr5C4IhMFX1r3cFN0iUoVc0O29zRiqZZ8Ydtq7cJtRo0xRqKbAX8W2Qs1kDIDnlnb9w==
X-Received: by 2002:a63:d710:: with SMTP id d16mr4299022pgg.214.1624376903766; 
 Tue, 22 Jun 2021 08:48:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] target/cris: Replace DISAS_TB_JUMP with
 DISAS_NORETURN
Date: Tue, 22 Jun 2021 08:48:08 -0700
Message-Id: <20210622154820.1978982-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
which is the same as DISAS_NORETURN -- we've exited the tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 8c1bad9564..e086ff9131 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -55,7 +55,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3242,12 +3241,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                     gen_goto_tb(dc, 1, dc->jmp_pc);
                     gen_set_label(l1);
                     gen_goto_tb(dc, 0, dc->pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else if (dc->jmp == JMP_DIRECT) {
                     cris_evaluate_flags(dc);
                     gen_goto_tb(dc, 0, dc->jmp_pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else {
                     TCGv c = tcg_const_tl(dc->pc);
@@ -3309,7 +3308,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                    to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        case DISAS_TB_JUMP:
+        case DISAS_NORETURN:
             /* nothing more to generate */
             break;
         }
-- 
2.25.1


