Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6E33BDFEA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:54:36 +0200 (CEST)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0utf-00021Q-Au
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up6-0001Js-59
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up0-0006eI-N4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:51 -0400
Received: by mail-pl1-x635.google.com with SMTP id y2so51252plc.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jv0AKUAYCfq8gx2BZJi7SVG0aTCPQkqBNcO1pY7PIho=;
 b=iQXX8E1ZI69fJpbq3/OXKIscKs5hnShvqJg32c6OKrcRS/DHr+/jsGrTPzcdfuh7L0
 1RwS7J/UwlUshn13iBiyCMe9e2LT+YpGcIwLoSW4fhhtBpoFRpY7UxznJYs3w08/RguL
 3AVROREGO4MlA9dtlLxpYQEN0XOS9lcqDB2IBKf21qXqhN1gwuuvR+LVsn0mgedeNDLI
 qCmTtALHhhbPtsWbFo+9wpA4LuyqqOMMjvRdPHBGPPNFB7KE20L1WiPp/LA/4wNh3OfR
 9FwpOYJGfqi26CeagCYVLih8sc/YWp5UzNtXT7cqumifxYnRIAPQUUd1lMx2+svwurWl
 Ff9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jv0AKUAYCfq8gx2BZJi7SVG0aTCPQkqBNcO1pY7PIho=;
 b=Y+1sHKLhxyjy6U0QtEuYZtXQovZcW1Eqkxdjw4759I3koVtccYeyQTMr8xbf9kiBTR
 yRef9uQsf+9IsjuRv9ulcyrYgTVXoWMe1uZvisaIbpmm3nv6kafiGUPWUW4IM52sWnCu
 HjE8hori5gV70ewjusbgBSGdFeSZyzuD6FT8bsXBCLMuKyEMzRAn5JtrFHF3DGTygp+k
 JDD13rWJcA1w488PsxE+rf2kAge0oHnVc4hnlvRiOweO1wL+PtlM5WHyY2YcmAMldkDX
 8uxcu6DkQw+ucVTceHjqEu7W5RLjruaATZzqiZUwsM+MN1Mo6LAr0qeUcKk6t/tsCIsU
 YrpQ==
X-Gm-Message-State: AOAM5331u1ab0hgs3vBmDyG7SPtJTG0XTXkAVIgt7fUBigsVStkQ+76k
 wzE/wmEslN0glkdNNoTCIzFfrNlvP3dcKw==
X-Google-Smtp-Source: ABdhPJygcSRr/7kYVoYgGtaE1IRGiNuqd3ZFquCgCYO1pOwSJRIC161y/g1XesKIdjvkF9iB31QTEA==
X-Received: by 2002:a17:902:8343:b029:122:eb4:218f with SMTP id
 z3-20020a1709028343b02901220eb4218fmr18852396pln.71.1625615384737; 
 Tue, 06 Jul 2021 16:49:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/36] linux-user/alpha: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:13 -0700
Message-Id: <20210706234932.356913-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use ka_restorer.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_signal.h |  1 +
 linux-user/alpha/signal.c        | 34 +++++++++++++++++++-------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 250642913e..0b6a39de65 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -93,6 +93,7 @@ typedef struct target_sigaltstack {
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #define TARGET_ARCH_HAS_KA_RESTORER
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 1129ffeea1..e15f5438c3 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -54,13 +54,11 @@ struct target_ucontext {
 
 struct target_sigframe {
     struct target_sigcontext sc;
-    unsigned int retcode[3];
 };
 
 struct target_rt_sigframe {
     target_siginfo_t info;
     struct target_ucontext uc;
-    unsigned int retcode[3];
 };
 
 #define INSN_MOV_R30_R16        0x47fe0410
@@ -141,12 +139,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb() */
-        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
+        r26 = default_sigreturn;
     }
 
     unlock_user_struct(frame, frame_addr, 1);
@@ -195,12 +188,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb(); */
-        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
+        r26 = default_rt_sigreturn;
     }
 
     if (err) {
@@ -268,3 +256,21 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6 * 4, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(INSN_MOV_R30_R16, &tramp[0]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn, &tramp[1]);
+    __put_user(INSN_CALLSYS, &tramp[2]);
+
+    default_rt_sigreturn = sigtramp_page + 3 * 4;
+    __put_user(INSN_MOV_R30_R16, &tramp[3]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn, &tramp[4]);
+    __put_user(INSN_CALLSYS, &tramp[5]);
+
+    unlock_user(tramp, sigtramp_page, 6 * 4);
+}
-- 
2.25.1


