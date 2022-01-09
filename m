Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF36488ABA
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:59:46 +0100 (CET)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bXk-0007wm-Pz
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avI-00068l-O2
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:00 -0500
Received: from [2607:f8b0:4864:20::135] (port=42497
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avH-0007B7-7Z
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:00 -0500
Received: by mail-il1-x135.google.com with SMTP id f4so825026ilr.9
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gTX3zM6smFoEquaIJybdvpTjFCFbJNXb/5rINY7LIQo=;
 b=L/MSVHwB8AVpORzYnUuqFaAdnQx0MCkgnFhOe7jlr4ciQCDlHpFabpUNvjnZobtT8k
 xPIB2iPULl580r5B2XNxFA3+husDOZgXXJmLNjNWwP0zgZDQFysLgVjemosimel6hrwL
 u16gjUPikS7GRD4yrXQ2OlFEeTa4Ja3am0w5Mv3iimceXcTdN5V/Xyz0dYBaAUTTU3K/
 2D0lvTamTe61yel6dtHN3BvONrJeF8q4XlTW0ajIKXZLxVPhfYzOMBGxT5JbwyBDFk41
 IHHGwkFE0j7w6CMONVzyqdN1MdO2tFOvALFhPE8fX0C+exeF9Hr8I6aViWtZIO6WlM0f
 orfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTX3zM6smFoEquaIJybdvpTjFCFbJNXb/5rINY7LIQo=;
 b=Nhk+JuWpPXf70mUz0kOk6M1D6l1khzP+pNcHWsSUoQjzdstWy0ZcETcN53aVCMPxRU
 8X+oxFn9I+eakiuAVDqK0GlCKh21KmGTLhgs0G6A3uov746jd+C4ShwIZbEpobOB6Qy1
 /FwO7WOxO3Uvt8VhtW9nc0cmDee9T/8YvGlhped03aEzMiLbyWIinArQ9r6Cz8PoCq1J
 gbtLOZc7fccV3Q02qebu+PLW8X+P3b7njwyzNgSWB4/7qL3rXGdoOh72MZu+QeYvpgc/
 npSdgN18un69gZHwwDv9aFoIzVk1GaqNifyiua264PjLpP5RYxU2SxPAz2AUxWCsH2wf
 alDA==
X-Gm-Message-State: AOAM531jc1qJLzCCyDvE8TYbP8oR8TE9xcuQllXhzX0ls9HDb89mej+A
 W6wFTiMog5xV07LOWpTWOusGDbeWjG10lTDi
X-Google-Smtp-Source: ABdhPJyL+DddUt3yBauKrxNVP+niqC/M+lRsyQI/mONEXB6aUjdqnIB2ApAaesMMa8WtFnTUcfyUSA==
X-Received: by 2002:a05:6e02:16cb:: with SMTP id
 11mr35774063ilx.59.1641745198112; 
 Sun, 09 Jan 2022 08:19:58 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:57 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/30] bsd-user/signal.c: implement do_sigreturn
Date: Sun,  9 Jan 2022 09:19:21 -0700
Message-Id: <20220109161923.85683-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implements the meat of a sigreturn(2) system call via do_sigreturn, and
helper reset_signal_mask. Fix the prototype of do_sigreturn in qemu.h
and remove do_rt_sigreturn since it's linux only.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  3 +--
 bsd-user/signal.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 011fdfebbaa..b8c64ca0e5b 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -219,14 +219,13 @@ extern int do_strace;
 /* signal.c */
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
-long do_sigreturn(CPUArchState *env);
-long do_rt_sigreturn(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 int target_to_host_signal(int sig);
 int host_to_target_signal(int sig);
 void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
 void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
+long do_sigreturn(CPUArchState *regs, abi_ulong addr);
 void QEMU_NORETURN force_sig(int target_sig);
 int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right);
 
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 1dd6dbb4ee1..d11f5eddd7e 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -640,6 +640,62 @@ give_sigsegv:
     force_sig(TARGET_SIGSEGV);
 }
 
+static int reset_signal_mask(target_ucontext_t *ucontext)
+{
+    int i;
+    sigset_t blocked;
+    target_sigset_t target_set;
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++)
+        if (__get_user(target_set.__bits[i],
+                    &ucontext->uc_sigmask.__bits[i])) {
+            return -TARGET_EFAULT;
+        }
+    target_to_host_sigset_internal(&blocked, &target_set);
+    ts->signal_mask = blocked;
+    sigprocmask(SIG_SETMASK, &ts->signal_mask, NULL);
+
+    return 0;
+}
+
+long do_sigreturn(CPUArchState *regs, abi_ulong addr)
+{
+    long ret;
+    abi_ulong target_ucontext;
+    target_ucontext_t *ucontext = NULL;
+
+    /* Get the target ucontext address from the stack frame */
+    ret = get_ucontext_sigreturn(regs, addr, &target_ucontext);
+    if (is_error(ret)) {
+        return ret;
+    }
+    trace_user_do_sigreturn(regs, addr);
+    if (!lock_user_struct(VERIFY_READ, ucontext, target_ucontext, 0)) {
+        goto badframe;
+    }
+
+    /* Set the register state back to before the signal. */
+    if (set_mcontext(regs, &ucontext->uc_mcontext, 1)) {
+        goto badframe;
+    }
+
+    /* And reset the signal mask. */
+    if (reset_signal_mask(ucontext)) {
+        goto badframe;
+    }
+
+    unlock_user_struct(ucontext, target_ucontext, 0);
+    return -TARGET_EJUSTRETURN;
+
+badframe:
+    if (ucontext != NULL) {
+        unlock_user_struct(ucontext, target_ucontext, 0);
+    }
+    force_sig(TARGET_SIGSEGV);
+    return -TARGET_EFAULT;
+}
+
 void signal_init(void)
 {
     TaskState *ts = (TaskState *)thread_cpu->opaque;
-- 
2.33.1


