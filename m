Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C21488AB3
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:53:00 +0100 (CET)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bRD-0002yN-ON
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:52:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avE-000655-Nh
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:57 -0500
Received: from [2607:f8b0:4864:20::d30] (port=33416
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avD-0007AK-5o
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:56 -0500
Received: by mail-io1-xd30.google.com with SMTP id s6so14447666ioj.0
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCMeGvHXcPe5nbOM6HUuXOOWBSNv3m2HcRt+xLifomg=;
 b=cRoIzdRtJCiqyel6RF2xA//EqUOgvI+nOVv7PrP5pm8dp80v3QZns4eO//mkbkyGNW
 Id0agKP4hU40odwAcgL8xp1ZilWBE75nfak44aT1xCUni1vccOG6apIWv1jtpI6HuybK
 F0pkP4MJmj1Hmf6lMFI48se3f+w0eTZbCUWurjDcuHQVAvZIOehx+7oUtZUVJ8AicQGA
 ucbJw9o7q6GwsCTwxu3WaZeK1raOcWXYB73dgCfwGY0hWKt5GqSC3OsnzYAvlsBrs4K+
 Ff2dy6MCj4JJSbVl+fg6/8qVr6PWZMtqSE5BSo6mkNm+qo3+jwwjVvJB2NwoxQ2aFyDj
 +NcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fCMeGvHXcPe5nbOM6HUuXOOWBSNv3m2HcRt+xLifomg=;
 b=LkvbhnuCZiA3Ez45oeL+qv2umhrlzqHRFJq8yCBzzFVqQaCWIvI+SciFIPkRFjeOz+
 MHldWVFXv5y8AWqAxk2dwukZyRUl1W6ikEQ/L6aPvDZMAtQ12X/xf2NReJ2PmMnuvPyz
 2gnwk2tE1fD3CLhMrmNGAeX/qXOQ2w+iwjLXHNnsvaQ960+kjig9RFqbl2ta1X6tPugp
 URP2ULM7D7uKfaHaV6j7zIIEZXVAQr21fJYpiSU6c+xJweMKb6m4TB2slH8lehmYJfOU
 DDFdlaexBmkSlhIt084dm+sqejc+k743RH75AZPuzNf9dorfVaPd4ohfH5uNJ0JMrYBM
 UO+Q==
X-Gm-Message-State: AOAM53007PFfkZZzmYNhovDO2zIllpl2sT1l18q4pty1g8B/UMb3E+Ja
 ipH033kGqTKtjVwXSiTs0G/d8qeQHQK4UumX
X-Google-Smtp-Source: ABdhPJyFTxbSaVXSeR8g0X8YpJBBtkqtHXn+FLQ9Tv9mThCLYzGcwmaIs7IyWOrbfouGAHd4BHMFIA==
X-Received: by 2002:a02:734b:: with SMTP id a11mr25761749jae.168.1641745193983; 
 Sun, 09 Jan 2022 08:19:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/30] bsd-user/signal.c: sigset manipulation routines.
Date: Sun,  9 Jan 2022 09:19:16 -0700
Message-Id: <20220109161923.85683-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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

target_sigemptyset: resets a set to having no bits set
qemu_sigorset:      computes the or of two sets
target_sigaddset:   adds a signal to a set
target_sigismember: returns true when signal is a member
host_to_target_sigset_internal: convert host sigset to target
host_to_target_sigset: convert host sigset to target
target_to_host_sigset_internal: convert target sigset to host
target_to_host_sigset: convert target sigset to host

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  3 ++
 bsd-user/signal.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e12617f5d69..e8c417c7c33 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -223,7 +223,10 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 int target_to_host_signal(int sig);
 int host_to_target_signal(int sig);
+void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
+void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
 void QEMU_NORETURN force_sig(int target_sig);
+int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right);
 
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 93c3b3c5033..8dadc9a39a7 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -32,6 +32,9 @@
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
+static void target_to_host_sigset_internal(sigset_t *d,
+        const target_sigset_t *s);
+
 
 int host_to_target_signal(int sig)
 {
@@ -43,6 +46,44 @@ int target_to_host_signal(int sig)
     return sig;
 }
 
+static inline void target_sigemptyset(target_sigset_t *set)
+{
+    memset(set, 0, sizeof(*set));
+}
+
+#include <signal.h>
+
+int
+qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right)
+{
+    sigset_t work;
+    int i;
+
+    sigemptyset(&work);
+    for (i = 1; i < NSIG; ++i) {
+        if (sigismember(left, i) || sigismember(right, i)) {
+            sigaddset(&work, i);
+        }
+    }
+
+    *dest = work;
+    return 0;
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
@@ -55,6 +96,54 @@ static inline void rewind_if_in_safe_syscall(void *puc)
     }
 }
 
+static void host_to_target_sigset_internal(target_sigset_t *d,
+        const sigset_t *s)
+{
+    int i;
+
+    target_sigemptyset(d);
+    for (i = 1; i <= TARGET_NSIG; i++) {
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
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
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
 /* Siginfo conversion. */
 static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
         const siginfo_t *info)
-- 
2.33.1


