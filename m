Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011534A503C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:36:41 +0100 (CET)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdPi-0005OZ-Gh
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:36:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnZ-0004jo-MG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:14 -0500
Received: from [2607:f8b0:4864:20::129] (port=47042
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcmx-0002az-Lw
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:39 -0500
Received: by mail-il1-x129.google.com with SMTP id e8so12374825ilm.13
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxfL+Uf67jAojsgUJ24l/wKbWp/n0flIHdow2eRHTNw=;
 b=ZQ+0VT2UdAMhVBqqlyLV7JySPuBLd200HYv2qTevSMndBjiiovDkc4f1OcO/CJgIb6
 kBowo1HbEN6cHX4t0L716EzxGPY7tmDRYAIrIzXh0wM+kI+w+MS2d81pAYNMgDr72HxW
 t5/AzdwazzRY20Qfn7ChQSBFgcwOXfHycPOvVFa1isTt79pEncLsaknhLkQFM7k/b5sd
 kjw3Y0MiJ+CXK61Q2NMz7j6tn2YEaQWIi/LA8bRfQS92uby099HPR33RwexRaiZoz1Jv
 TWrxu4tSH+INXRYYaXsmaqJs2G4SFxzs7iXAU8to7j8WnOFPi9tTlT0SOBjn/vgHtbBs
 lD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxfL+Uf67jAojsgUJ24l/wKbWp/n0flIHdow2eRHTNw=;
 b=CJWl0FaBLiFVMRCHTgSaq+8FhBJZBWyeNLxhEdLPwFm5hxEQhR3waRyV/58W17WFvU
 bN4e1bn/vu4rwBHgp93+Ad83BSwufJ6oh9QxsfaCfeKumHgiLS9rGBnl5H8qoo5OE6MF
 wqcGZOz9E+UHW55DXLIeqf/2zN6eJr3DgAy2zTqLHbs0t04Dm5Ufdjq6aFue3TD+L9g4
 kFUfcXxJCjwfmxr78I/utovQcdYDWEeXmKeSykesxCgUBrV5huTQw3ccVgzwa84odhqL
 XCRqlW+nzX+mBMJ4lQ5ZHlIjLo3JukSFJiz01aqf8mnfNgxsmsu3ZnVIOjTorlGrsvqC
 O3LA==
X-Gm-Message-State: AOAM530UMezTkpl+mW/FzB5rhXnaS0aN6ifHL3HbvhpkfoKR1qq+UyKS
 bEIaxWGE3ECY5AWthGNaHsqF+6V4m69/eg==
X-Google-Smtp-Source: ABdhPJw3RnZS4pdfjb/KqxONmDOU2SDJvzSjYlRbcjK5f14cNWDIpZStaJ+iwyLzB+zT9bsPLZKkGA==
X-Received: by 2002:a05:6e02:1a4d:: with SMTP id
 u13mr2113590ilv.136.1643658992588; 
 Mon, 31 Jan 2022 11:56:32 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:32 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/40] bsd-user: Create setup_sigframe_arch to setup sigframe
 context
Date: Mon, 31 Jan 2022 12:55:58 -0700
Message-Id: <20220131195636.31991-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define setup_sigframe_arch whose job it is to setup the mcontext for the
sigframe. Implement for x86 to just call mcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_signal.h |  3 +++
 bsd-user/i386/signal.c              | 13 +++++++++++++
 bsd-user/x86_64/signal.c            | 13 +++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 3ed454e086d..43700d08f71 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -4,6 +4,9 @@
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
 
+abi_long setup_sigframe_arch(CPUArchState *env, abi_ulong frame_addr,
+                             struct target_sigframe *frame, int flags);
+
 /* Compare to sys/signal.h */
 #define TARGET_SIGHUP  1       /* hangup */
 #define TARGET_SIGINT  2       /* interrupt */
diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
index 2939d32400c..5dd975ce56a 100644
--- a/bsd-user/i386/signal.c
+++ b/bsd-user/i386/signal.c
@@ -32,6 +32,19 @@ abi_long set_sigtramp_args(CPUX86State *env, int sig,
     return 0;
 }
 
+/*
+ * Compare to i386/i386/exec_machdep.c sendsig()
+ * Assumes that the memory is locked if frame points to user memory.
+ */
+abi_long setup_sigframe_arch(CPUX86State *env, abi_ulong frame_addr,
+                             struct target_sigframe *frame, int flags)
+{
+    target_mcontext_t *mcp = &frame->sf_uc.uc_mcontext;
+
+    get_mcontext(env, mcp, flags);
+    return 0;
+}
+
 /* Compare to i386/i386/machdep.c get_mcontext() */
 abi_long get_mcontext(CPUX86State *regs, target_mcontext_t *mcp, int flags)
 {
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index 8885152a7da..c3875bc4c6a 100644
--- a/bsd-user/x86_64/signal.c
+++ b/bsd-user/x86_64/signal.c
@@ -30,6 +30,19 @@ abi_long set_sigtramp_args(CPUX86State *regs,
     return 0;
 }
 
+/*
+ * Compare to amd64/amd64/exec_machdep.c sendsig()
+ * Assumes that the memory is locked if frame points to user memory.
+ */
+abi_long setup_sigframe_arch(CPUX86State *env, abi_ulong frame_addr,
+                             struct target_sigframe *frame, int flags)
+{
+    target_mcontext_t *mcp = &frame->sf_uc.uc_mcontext;
+
+    get_mcontext(env, mcp, flags);
+    return 0;
+}
+
 /* Compare to amd64/amd64/machdep.c get_mcontext() */
 abi_long get_mcontext(CPUX86State *regs,
                 target_mcontext_t *mcp, int flags)
-- 
2.33.1


