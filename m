Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440549A216
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:42:22 +0100 (CET)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAqj-0002L8-D4
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:42:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAek-0001iE-KW
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:58 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=46735
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAei-0001KT-9k
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:58 -0500
Received: by mail-io1-xd2d.google.com with SMTP id e79so21848863iof.13
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLMMLGn5PlEMmATCOZX5ewFX0bdTWxFb8sG6Cl9Zh90=;
 b=fyZp1PcQdFyP0fwjRM4b1lnL46PH6FqfifOva+maIyvxdD8VD4U5M06RMqhjJNIwzA
 t60KtmXlD91EzSpo9ClvxjX8Z0d7fgHWJfBgJdi835MD5LMWQ7NW/mgb38MTnUiPN89Y
 txqFItbadCZBX8WBPNhF3obqzhu5bXiYPFs+aNUyrco4I1O4p2CcOcRA8k1EW5v/UUcm
 UnF5lXacTKq2KxpjYT/0R1+AI1snhZVNOukGgUSCVR2KYa7FBTWDaMRXsy43ASNuU/Q0
 WdrKcscl7g0EvaKPVnRLBkeiP+FQQLLtqDS6XhVLCF0vbly88xSSLx+dqtvSQUXuTlyc
 PUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLMMLGn5PlEMmATCOZX5ewFX0bdTWxFb8sG6Cl9Zh90=;
 b=Wap5OsZMdbr3JetUgBu/dKwUpFWvKuSVAbrZ9UBQumOKbR4i0IYOOwmRxjR7cAkZdy
 g/waMWl+Lds0VI+YghplNZnAdLOCXcM2rW2XL/9JQnnQ0vN488BlyQe5Ylg0MXHervIR
 JgEymNKLM7d6mG5YxZjgXhkPUE4Gc705Uawmkn7xki2WohHndb3ZFN43RwMxYASRAVZf
 ZWVSk6z0XvgPeMkqVYNBxJqHdmqsrr2M2bv0SaFYeZ7EWobbTMwUGdtl1GXyTpsP4E4u
 L1I5Pz6AF/QFIop/JhXOu2YuFSMdjfwl01dFzQSSqg6WD9xpAlTAH/Ml6c1txQ9RVQag
 6o7Q==
X-Gm-Message-State: AOAM533heeFY+B6BVFXglKWzZu6TgDNKBRpd3FhQ7n22T2v5ZvGp7u8v
 KnRgt2RlSRtLLt2VjxBTiZ47GqucoqP2EQ==
X-Google-Smtp-Source: ABdhPJyUim9Mw7erIwl6+IQaOA3YtyPNxUEC0lfFT2dA6fQ2XoqTRcdEtAjgy91KPa3FFgJF1lY5xw==
X-Received: by 2002:a02:1d07:: with SMTP id 7mr1779385jaj.154.1643074195067;
 Mon, 24 Jan 2022 17:29:55 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:54 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/40] bsd-user: Create setup_sigframe_arch to setup
 sigframe context
Date: Mon, 24 Jan 2022 18:29:09 -0700
Message-Id: <20220125012947.14974-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define setup_sigframe_arch whose job it is to setup the mcontext for the
sigframe. Implement for x86 to just call mcontext.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_signal.h |  3 +++
 bsd-user/i386/signal.c              | 13 +++++++++++++
 bsd-user/x86_64/signal.c            | 13 +++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
index 3ed454e086d..7491629477a 100644
--- a/bsd-user/freebsd/target_os_signal.h
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -4,6 +4,9 @@
 #include "target_os_siginfo.h"
 #include "target_arch_signal.h"
 
+abi_long setup_sigframe_arch(CPUArchState *regs, abi_ulong frame_addr,
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


