Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F64488ACD
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:08:01 +0100 (CET)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bfi-0005Sg-IR
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avK-0006Ai-Cc
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:02 -0500
Received: from [2607:f8b0:4864:20::12c] (port=43638
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avI-0007BS-Rj
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:02 -0500
Received: by mail-il1-x12c.google.com with SMTP id d3so9260242ilr.10
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mc4CUh2gJxot/MQaLDy06nT8Q11jcB6ohTSNqNi0sPk=;
 b=c2mppuBHEt8e/Uf9TuWnL2f16aAw5kcQEkTXrGn0im1ASCNfAD4LWChmBCCqKU11c5
 qtHxrmMAFxmtUm6FNTSBGth8qCOfJUlTtLEl2ViUxxVfwqf/H0vyLXUDeS9eZch5AtcK
 2LK3gHruOaLp42D6YFSGNJ5IXyHXPo3gl3R1XntRDpkFGeGI3WcyE12BRPL6dK7P8Upj
 vbVmPyLotinR9XIGPNpNtWaTt3CDSmJb69L2qnZnmRRtVQiiXhB2jMCBx/QhpKfi2nkv
 xhEQ+vfPzkUuVBvkrZyVAx47fu3irRtak154q/1Vgmxf0DRdPEzer0wkpgigibepsan7
 IqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mc4CUh2gJxot/MQaLDy06nT8Q11jcB6ohTSNqNi0sPk=;
 b=65uhCkHG44K0dZrxDcKtVDr6XMNz8vsJM4vPubtpYHyrvri35GXZqMUKQ/IgeUc1ve
 HzsdeOikVBCcxG6YoeHCy3NXPfje1jLTOgRGvetZFBQy+Q6vDc/TGMWlogtqqaKTOKyN
 rfuuULLPhKaE98Bq8rGi2yqWgM/xfUzyDdGp1wP4n/ccymtksSJcCh3yle1l8e/xyzT9
 LMDcs1o/9IbZ39XXe5IfACd4q9rN+KvPc9WSzwULqxXXUsEDgDHEu7WBEgcNdtVpYvQ1
 IJtN2LgmlcQcoLY2BROh1PEoPRwyHervwtMqW7uHVvLM1CxPuw4GP0Bnd1u17rOCbls4
 1M3w==
X-Gm-Message-State: AOAM531A5o2ii6K4cYofGxD4YSRiLseCz9GFTOaXWoXevYnARIhujvVJ
 bZBWGDBF5Zj11GPL/vphHUw2Gq5+ajS6UXQZ
X-Google-Smtp-Source: ABdhPJzOdyDcBA7+X3OSEXZNnoQwBXSy4MZn6IBaGg+K0nPQB8uiHkNg+C3+ucMLA5b3JetahoBHdg==
X-Received: by 2002:a92:cc92:: with SMTP id x18mr8851996ilo.196.1641745199660; 
 Sun, 09 Jan 2022 08:19:59 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/30] bsd-user/signal.c: do_sigaltstack
Date: Sun,  9 Jan 2022 09:19:23 -0700
Message-Id: <20220109161923.85683-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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

Implement the meat of the sigaltstack(2) system call with do_sigaltstack.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  1 +
 bsd-user/signal.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index c643d6ba246..fcdea460ed2 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -226,6 +226,7 @@ int host_to_target_signal(int sig);
 void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
 void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
 long do_sigreturn(CPUArchState *regs, abi_ulong addr);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 int do_sigaction(int sig, const struct target_sigaction *act,
                 struct target_sigaction *oact);
 void QEMU_NORETURN force_sig(int target_sig);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index f055d1db407..e5e5e28c60c 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -528,6 +528,72 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     cpu_exit(thread_cpu);
 }
 
+/* do_sigaltstack() returns target values and errnos. */
+/* compare to kern/kern_sig.c sys_sigaltstack() and kern_sigaltstack() */
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
+{
+    int ret;
+    target_stack_t oss;
+
+    if (uoss_addr) {
+        /* Save current signal stack params */
+        oss.ss_sp = tswapl(target_sigaltstack_used.ss_sp);
+        oss.ss_size = tswapl(target_sigaltstack_used.ss_size);
+        oss.ss_flags = tswapl(sas_ss_flags(sp));
+    }
+
+    if (uss_addr) {
+        target_stack_t *uss;
+        target_stack_t ss;
+        size_t minstacksize = TARGET_MINSIGSTKSZ;
+
+        ret = -TARGET_EFAULT;
+        if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
+            goto out;
+        }
+        __get_user(ss.ss_sp, &uss->ss_sp);
+        __get_user(ss.ss_size, &uss->ss_size);
+        __get_user(ss.ss_flags, &uss->ss_flags);
+        unlock_user_struct(uss, uss_addr, 0);
+
+        ret = -TARGET_EPERM;
+        if (on_sig_stack(sp)) {
+            goto out;
+        }
+
+        ret = -TARGET_EINVAL;
+        if (ss.ss_flags != TARGET_SS_DISABLE
+            && ss.ss_flags != TARGET_SS_ONSTACK
+            && ss.ss_flags != 0) {
+            goto out;
+        }
+
+        if (ss.ss_flags == TARGET_SS_DISABLE) {
+            ss.ss_size = 0;
+            ss.ss_sp = 0;
+        } else {
+            ret = -TARGET_ENOMEM;
+            if (ss.ss_size < minstacksize) {
+                goto out;
+            }
+        }
+
+        target_sigaltstack_used.ss_sp = ss.ss_sp;
+        target_sigaltstack_used.ss_size = ss.ss_size;
+    }
+
+    if (uoss_addr) {
+        ret = -TARGET_EFAULT;
+        if (copy_to_user(uoss_addr, &oss, sizeof(oss))) {
+            goto out;
+        }
+    }
+
+    ret = 0;
+out:
+    return ret;
+}
+
 static int fatal_signal(int sig)
 {
 
-- 
2.33.1


