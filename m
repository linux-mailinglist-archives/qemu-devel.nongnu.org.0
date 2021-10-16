Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D008643042D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:26:31 +0200 (CEST)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboO6-0007YR-Rg
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDW-0008LY-4e
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:35 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDQ-0001xh-W3
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:31 -0400
Received: by mail-pj1-x1035.google.com with SMTP id ls18so9474442pjb.3
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Quiv5vbH7lzjgQxwPWoCohOnwSfDfP+7M3aharRivYE=;
 b=mmegxJlWCTJ7CDrKT3RrkkLStiUacxvMwslT2RHp6XkkJsWAqNoFo7TY5LQUlaOWHi
 tvW9sOrHH9oiscDHz1qMBwaHa5S02wMWNqx97PVC0rfQXHt3qnd4WO6M7tUWp1SzLgOj
 6U87WM4Xs21INNRcb0nZH4ZXaM0aH/VAsItBQzfICbfGlkqytwU9/E2HLKf19jz9C0g0
 dSlsbHEVuUyqd3HXp0UdttgBlumi0U4Rzzs2JZ1pxxfeHbDA89BOzaFuxjLtVmz7g6cz
 Rp22TQEdSF/zoQA+wd7Fr1vcv7kcCWSEX+6ilbeKd/GxW5AzcTyedHYAqsPc4Z9Ailc8
 LnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Quiv5vbH7lzjgQxwPWoCohOnwSfDfP+7M3aharRivYE=;
 b=S5JJpWbLcnTpOH4x+xWk9MdOahM/cWeRqjZ4j+CmSHD+xn6+YQ9W1RfdzCwpmh3k/6
 uAEVSTc+uKQlRTMBoEzKSmUY005iOl1gUwHRC+h00o/bezS7IqagA5/0yIssKTlLwsXS
 6XJ7Xz/ShjWyyd3qsG1SOHgnicOo+ragCmMVwkfEhTs9LsN0f9FA9zCFiM0QnohX+OUd
 +JvDtv+yVc/Mi3221Al9zaKpDzPkpsenO8DgXevGxzuE/0+BfeDkba/ga64n+dDlJ9Wg
 dM3qw3mxLmBDeJW8RGscrKjXYehP2UYD+9qMXVgJST3200U96UsSgK6AveCRBQ587mBI
 MkHg==
X-Gm-Message-State: AOAM530h9r/5QitWBuTE9wzwqkCZdmaKR0AcgEaZdkWZfybUXHh0Oy0k
 MXLGKymkbJ6jk3BlgXVZQr719VPI4kXINA==
X-Google-Smtp-Source: ABdhPJwHgbbwWXdZx9NL28bzyOpxZfqop06WABOp+vq+r7uioQ+p5UFIX8b1q7rZz5SCMaBQVIa/wg==
X-Received: by 2002:a17:902:64d6:b0:13e:a5a9:c6d6 with SMTP id
 y22-20020a17090264d600b0013ea5a9c6d6mr17980241pli.52.1634408124865; 
 Sat, 16 Oct 2021 11:15:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/24] target/i386: Drop check for singlestep_enabled
Date: Sat, 16 Oct 2021 11:14:59 -0700
Message-Id: <20211016181514.3165661-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
 target/i386/helper.h          | 1 -
 target/i386/tcg/misc_helper.c | 8 --------
 target/i386/tcg/translate.c   | 4 +---
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 574ff75615..ac3b4d1ee3 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -56,7 +56,6 @@ DEF_HELPER_2(syscall, void, env, int)
 DEF_HELPER_2(sysret, void, env, int)
 #endif
 DEF_HELPER_FLAGS_2(pause, TCG_CALL_NO_WG, noreturn, env, int)
-DEF_HELPER_FLAGS_1(debug, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(reset_rf, void, env)
 DEF_HELPER_FLAGS_3(raise_interrupt, TCG_CALL_NO_WG, noreturn, env, int, int)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, int)
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index baffa5d7ba..5769db5ace 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -110,14 +110,6 @@ void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
     do_pause(env);
 }
 
-void QEMU_NORETURN helper_debug(CPUX86State *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
 uint64_t helper_rdpkru(CPUX86State *env, uint32_t ecx)
 {
     if ((env->cr[4] & CR4_PKE_MASK) == 0) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c8d919bc3f..e9e1451540 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2660,9 +2660,7 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
     if (s->base.tb->flags & HF_RF_MASK) {
         gen_helper_reset_rf(cpu_env);
     }
-    if (s->base.singlestep_enabled) {
-        gen_helper_debug(cpu_env);
-    } else if (recheck_tf) {
+    if (recheck_tf) {
         gen_helper_rechecking_single_step(cpu_env);
         tcg_gen_exit_tb(NULL, 0);
     } else if (s->flags & HF_TF_MASK) {
-- 
2.25.1


