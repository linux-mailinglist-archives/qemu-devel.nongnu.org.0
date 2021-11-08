Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57989447909
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:01:53 +0100 (CET)
Received: from [::1] (port=34662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvqx-0000ty-5z
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:01:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhr-0006PC-Ex
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:27 -0500
Received: from [2607:f8b0:4864:20::133] (port=42716
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhm-0002qd-G7
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:24 -0500
Received: by mail-il1-x133.google.com with SMTP id y17so15551539ilb.9
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NfUAHUW0Nh2J7SrWzMj/OqYpGUA/s6zV61PQbcFLFE=;
 b=OCsHhkjQd2BG0aNftGvJF9tJghGwdfOTKT3r63/Qq0fGMIWvXaNLR1NLUQsN+gNkf5
 bQ9K2qkTPiRVLNYro2J9guMPevRb2evctdUa+T6RBZk7VeBnl27oirIWK1XsVJqOzoJy
 rvOUMzrT+5lSDotn/w5a7rWfRIUiKIMKXpvdYp20LnA7hvbtpHxvlmmYACAvRrMMlK4u
 LlDFdICiWKgL7xTpFDHsYWGdi2lpAmn2QZ/xaS+SqUkr3ueW153lreL4C0hUyjR15O/r
 9UPrJ3jjzemIO1DOcKpfyUlpbX7iQD9+OSh6ahfg2X92VmbjRTa3Iblno8OvOgltzN7d
 y3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NfUAHUW0Nh2J7SrWzMj/OqYpGUA/s6zV61PQbcFLFE=;
 b=P2YXmN/60kiuypCVW0jyJJ5drOgVCyiFcYolPzjPYR8TXlzbaMkPB+BfNYR9UAjcjC
 HNCI0G2Ambu1NKR8agVkStVpvFfyes5yDJJhxa2HLJPkzWVm7LJpBb0W/dNdtPuyGWyw
 W9WN1kBNgYb6kIOM7VAi2/JPP+4AV/sv50R4tRgDyJLCaWYUpiVmKuMnnr9/psRT4GSD
 GEj4W6uwssEkFEaf/0QEAhCEzdJjz4KoXY8xNTsPowrUj+pJRRuZLV1G+y3GT1wzYH80
 InsLuyTIPBh6DiP2t7r6l/kyoc/+1wJY8H3gFODNXzPNDu8FNvUy7XxyqT5kwXxunCis
 Df2Q==
X-Gm-Message-State: AOAM530FrWSt5uK+/Yq5Qjxph9TyFiZcpiZJYOJrRxnYYtYf0Z5KeTAX
 5GxrCA9tbGFbf2p19XHP03MAhHUUZVpDSA==
X-Google-Smtp-Source: ABdhPJzAsgUa2hXcnoFk1De8IcHli9Tovs5Fg/XGg3HXNHbQLNx1o0IT1mJHbtB8o7YjRaW/x9MQzQ==
X-Received: by 2002:a05:6e02:12c7:: with SMTP id
 i7mr46483103ilm.253.1636343541334; 
 Sun, 07 Nov 2021 19:52:21 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:21 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/37] bsd-user/target_os_signal.h: Move signal prototypes
 to target_os_ucontext.h
Date: Sun,  7 Nov 2021 20:51:11 -0700
Message-Id: <20211108035136.43687-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to the CPUArchState typedef and move target-provided prototypes
to target_os_ucontext.h.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_ucontext.h | 11 +++++++++++
 bsd-user/i386/target_arch_signal.h    |  9 ---------
 bsd-user/x86_64/target_arch_signal.h  |  9 ---------
 3 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/bsd-user/freebsd/target_os_ucontext.h b/bsd-user/freebsd/target_os_ucontext.h
index 1d0c3c4e65..dd61aec7cc 100644
--- a/bsd-user/freebsd/target_os_ucontext.h
+++ b/bsd-user/freebsd/target_os_ucontext.h
@@ -32,4 +32,15 @@ G_STATIC_ASSERT(TARGET_MCONTEXT_SIZE == sizeof(target_mcontext_t));
 G_STATIC_ASSERT(TARGET_UCONTEXT_SIZE == sizeof(target_ucontext_t));
 #endif /* TARGET_MCONTEXT_SIZE */
 
+struct target_sigframe;
+
+abi_long set_sigtramp_args(CPUArchState *env, int sig,
+                           struct target_sigframe *frame,
+                           abi_ulong frame_addr,
+                           struct target_sigaction *ka);
+abi_long get_mcontext(CPUArchState *regs, target_mcontext_t *mcp, int flags);
+abi_long set_mcontext(CPUArchState *regs, target_mcontext_t *mcp, int srflag);
+abi_long get_ucontext_sigreturn(CPUArchState *regs, abi_ulong target_sf,
+                                abi_ulong *target_uc);
+
 #endif /* TARGET_OS_UCONTEXT_H */
diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index 982c7035c7..279dadc22c 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -88,13 +88,4 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-abi_long set_sigtramp_args(CPUX86State *env, int sig,
-                           struct target_sigframe *frame,
-                           abi_ulong frame_addr,
-                           struct target_sigaction *ka);
-abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
-abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
-abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
-                                abi_ulong *target_uc);
-
 #endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index b39b70466e..b4a0ebf2bd 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -96,13 +96,4 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
-abi_long set_sigtramp_args(CPUX86State *env, int sig,
-                           struct target_sigframe *frame,
-                           abi_ulong frame_addr,
-                           struct target_sigaction *ka);
-abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags);
-abi_long set_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int srflag);
-abi_long get_ucontext_sigreturn(CPUX86State *regs, abi_ulong target_sf,
-                                abi_ulong *target_uc);
-
 #endif /* !TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


