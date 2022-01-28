Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5894A2A99
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:29:00 +0100 (CET)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbbv-0003Cl-E5
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDag3-0000t9-Ix
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:12 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=42735
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bE-UP
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: by mail-io1-xd2b.google.com with SMTP id r144so9659744iod.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rw3tCyrqXVGsCR1NJHkGgUyguO31bINLvGmuRP6N6Bw=;
 b=E2/5Eu6z3Y+04KpoPr9MjkG+22j5QaD6K/agC+9iTnYs/wzeIH0DyOPqxaSvbilo4P
 sivx84dV9/NExuVYe4z8sLiNpt6OJepwXcyyHUwLLdf3/P3tyRaV2TU6dvTVMEFQQGaY
 5mwyy3qePV+kmaValGkTibw8mlK8WTVMQOfOyZa1y+nZtFJmFtLtVDsM31yytOkXu+6l
 XpA345B6Imx+zkXtl8/Y5Fv0Gbl8lLqwrmDizQXPhsB4q7JHAl/duczYbpknMf6boJWE
 nWjM6D+YLA0kzGX5pCSvDExkmX93x3l8KgyjOIB0ZnQoJpDlDn+ygvLJOlwzQer2PmRU
 n+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rw3tCyrqXVGsCR1NJHkGgUyguO31bINLvGmuRP6N6Bw=;
 b=PGw0ZTZ0NOl1hb85GRZtr9TXe34fnuSaliW6VVBH75kBjAAlkdDDsSAdld9Slxq16h
 72ExQzX9SXyRNNk80Exz/AsdXz/6PKfAkpVf241GWd040Sy4g2n61KpOGOpbYY2oUjkx
 SZVMT/TeLTAW74PplE9HzTAZ3awlVNQ5CAboNCiRmsbkTBelEqggTsTs00Ij90Izai1O
 brgr5OvzDYa35arsAOKPSbR/R1XiWqayS5D+cYPNkWyHCO2YBHuJbxcM4GX0FVcD+R1t
 FW/a4599hlo1oQ+VX3xjvWCL9VtqlnbmxDu1aSMctGHmXAC/T2tN9zgZDV5L00WEIcak
 qdRA==
X-Gm-Message-State: AOAM530Rt9/pvB3oqvIYKzipmes9Uv+g98Uq62CLvT244zModwRDiuf6
 LFyygPL4+icRHZ/afZjmPTDSeqLpCb+/Mw==
X-Google-Smtp-Source: ABdhPJwIFN4GL+CZYKhWlCcTfdk+T5Ii3Ulez/L6YtVM6AMMNmPt5zRK/gs+vsnGAWU9NhV6PKqaig==
X-Received: by 2002:a6b:8e89:: with SMTP id q131mr6634114iod.77.1643412516161; 
 Fri, 28 Jan 2022 15:28:36 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:35 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/40] bsd-user/signal.c: sigset manipulation routines.
Date: Fri, 28 Jan 2022 16:27:55 -0700
Message-Id: <20220128232805.86191-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


