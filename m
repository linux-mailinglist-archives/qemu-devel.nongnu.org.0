Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91F4A5044
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:38:53 +0100 (CET)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdRs-0001HU-Ev
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:38:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnf-0004v5-3M
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: from [2607:f8b0:4864:20::130] (port=33306
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002fY-CJ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:18 -0500
Received: by mail-il1-x130.google.com with SMTP id o10so12440938ilh.0
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rw3tCyrqXVGsCR1NJHkGgUyguO31bINLvGmuRP6N6Bw=;
 b=POiBvCAzXizOIiO/66fPR/S/qHCDH0ZBsOMuWzzSw9vBdlxSgfImFkSlKBREvn6bJp
 91da2dHHKdYoUTAGEZd/PVTOxKYbpOiNBeBHfCtgfDlUt9s85o6lJkAZlB/jCuUC/k0O
 dL62d5a/KHbcGT8i9TTkBsDx5BAV6Qq+beOmTFxTUaqsewmfLQJuphc1K7bX8pnJ1J+3
 yBBaNVtigdZpGvtkYIFnHCs5MX/aqzUe5cm6Wl9UwLaBaxPzgCX4JI+zz2GGGTu68mx7
 5cX+0YZUlzwBkhFi4QftvHRbb5oMZGkARvrnIdPA5oO5EeUakV8dfryXEyHgkjwwXIGc
 LfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rw3tCyrqXVGsCR1NJHkGgUyguO31bINLvGmuRP6N6Bw=;
 b=p7Y/u5/7jc2kTwEzWAMR85IcbUxH8gfZy6F0D9pAtBbEemerYWhvwPA+TaLnQERCtW
 /kkfmBjvoW13n24ScNW2wF8glSeDKemGKeTIcVexKG6QSSI5XkT0KkjUEz/mfHwgv7E1
 +2MIpdJjooWd85eYw5G98YSdwcdE+kcYvsQIdGmSrilYvNRLNTZgJLbZEHCWf8DFP0w/
 Lu9EwazSNRRaz69QYTbVfW0nrmAnuNZGllZ4xeYfbe23uBmBocuyJN/XnLV2S9dwVCX/
 PdyGBD0wanPpH6FubQeEObC+sJn/Nt/T2Fj6hiqfNM8AawSy3Xs1krz3miMW/iYzRXta
 8CKg==
X-Gm-Message-State: AOAM532XPGZXSPwbvaWNswNxMLlv6Y88R/aFZPMjswUD9b4Nl3Y1KQmv
 vAaWiXAhbr2W8iPIlSrYjaLl8aPKpew6PQ==
X-Google-Smtp-Source: ABdhPJxBm3pXSBRaz/63meW2w6qqaBNy0XGAba0yCPSvLhbq0FrvjyBkvSO0O9itDMYPjNv6vwTVAQ==
X-Received: by 2002:a05:6e02:216a:: with SMTP id
 s10mr2307594ilv.287.1643659020225; 
 Mon, 31 Jan 2022 11:57:00 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/40] bsd-user/signal.c: sigset manipulation routines.
Date: Mon, 31 Jan 2022 12:56:26 -0700
Message-Id: <20220131195636.31991-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_sigemptyset: resets a set to having no bits set
target_sigaddset:   adds a signal to a set
target_sigismember: returns true when signal is a member
host_to_target_sigset_internal: convert host sigset to target
host_to_target_sigset: convert host sigset to target
target_to_host_sigset_internal: convert target sigset to host
target_to_host_sigset: convert target sigset to host

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal-common.h |  2 ++
 bsd-user/signal.c        | 74 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 80e9503238a..ee819266f54 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -14,11 +14,13 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
 int host_to_target_signal(int sig);
+void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
 void process_pending_signals(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, int si_type,
                   target_siginfo_t *info);
 void signal_init(void);
 int target_to_host_signal(int sig);
+void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
 
 /*
  * Within QEMU the top 8 bits of si_code indicate which of the parts of the
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 34663f7a28a..84dafa4e9fe 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -32,6 +32,9 @@
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
+static void target_to_host_sigset_internal(sigset_t *d,
+        const target_sigset_t *s);
+
 
 /*
  * The BSD ABIs use the same singal numbers across all the CPU architectures, so
@@ -48,6 +51,25 @@ int target_to_host_signal(int sig)
     return sig;
 }
 
+static inline void target_sigemptyset(target_sigset_t *set)
+{
+    memset(set, 0, sizeof(*set));
+}
+
+static inline void target_sigaddset(target_sigset_t *set, int signum)
+{
+    signum--;
+    uint32_t mask = (uint32_t)1 << (signum % TARGET_NSIG_BPW);
+    set->__bits[signum / TARGET_NSIG_BPW] |= mask;
+}
+
+static inline int target_sigismember(const target_sigset_t *set, int signum)
+{
+    signum--;
+    abi_ulong mask = (abi_ulong)1 << (signum % TARGET_NSIG_BPW);
+    return (set->__bits[signum / TARGET_NSIG_BPW] & mask) != 0;
+}
+
 /* Adjust the signal context to rewind out of safe-syscall if we're in it */
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
@@ -60,6 +82,58 @@ static inline void rewind_if_in_safe_syscall(void *puc)
     }
 }
 
+/*
+ * Note: The following take advantage of the BSD signal property that all
+ * signals are available on all architectures.
+ */
+static void host_to_target_sigset_internal(target_sigset_t *d,
+        const sigset_t *s)
+{
+    int i;
+
+    target_sigemptyset(d);
+    for (i = 1; i <= NSIG; i++) {
+        if (sigismember(s, i)) {
+            target_sigaddset(d, host_to_target_signal(i));
+        }
+    }
+}
+
+void host_to_target_sigset(target_sigset_t *d, const sigset_t *s)
+{
+    target_sigset_t d1;
+    int i;
+
+    host_to_target_sigset_internal(&d1, s);
+    for (i = 0; i < _SIG_WORDS; i++) {
+        d->__bits[i] = tswap32(d1.__bits[i]);
+    }
+}
+
+static void target_to_host_sigset_internal(sigset_t *d,
+        const target_sigset_t *s)
+{
+    int i;
+
+    sigemptyset(d);
+    for (i = 1; i <= TARGET_NSIG; i++) {
+        if (target_sigismember(s, i)) {
+            sigaddset(d, target_to_host_signal(i));
+        }
+    }
+}
+
+void target_to_host_sigset(sigset_t *d, const target_sigset_t *s)
+{
+    target_sigset_t s1;
+    int i;
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        s1.__bits[i] = tswap32(s->__bits[i]);
+    }
+    target_to_host_sigset_internal(d, &s1);
+}
+
 static bool has_trapno(int tsig)
 {
     return tsig == TARGET_SIGILL ||
-- 
2.33.1


