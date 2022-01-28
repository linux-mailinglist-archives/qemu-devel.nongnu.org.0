Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8F4A0444
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:36:30 +0100 (CET)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDan7-0006E0-J4
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:36:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf1-0008Tm-Fk
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:07 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=44823
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaey-0001X5-Df
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:07 -0500
Received: by mail-io1-xd2a.google.com with SMTP id p63so8828911iod.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxfL+Uf67jAojsgUJ24l/wKbWp/n0flIHdow2eRHTNw=;
 b=Cy5fD63LEKmvglTo90Kgza9uNxYTowdqL3l83Rhhx4x2TS2t/ES6Ka3xZ33ZXmR2wa
 L6kW5G4J3qOwBvNE8lyKNJ7pKu6bRnebmkGC3xNIPNzEvKE74VX2JEtYH70ecN3I1+FP
 y1mj7HRjjRtmYm9aI+3r1p9i1u6MRK6vF7aEssInzEqGv8qUirTBG7E54LdIKd3r9soZ
 k0lQakEHRAzd5/OdP9hjivHoGsk255ClU57mcB/ZVVYmInzNk/Iabiax36RLVEnT6M3p
 K4D9wRJPupprXH7u4O0WACtYnL/nFclXCVO87YyNhCS1Za9jmi29vpX5OXPY26hrjM4q
 CGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxfL+Uf67jAojsgUJ24l/wKbWp/n0flIHdow2eRHTNw=;
 b=EONK/dIijZ/SRmiuH5tAUXgL67zYUo/s/gm6XCWAAvw4hDOcUWknDatFs+GFioVrsT
 HmgNn+PRLGT5MlD+Eid5MqRJKOXAYyI9axhRDBA7t3+T89j8rnQQarqCsBFaNXLI4jeN
 NXtJJj3gmNixuQgnbUCL65MAIFYU2Q/Vp2ViXNGy0Eh7w59/OIDxwN10LuUya1Wdtw7q
 qrb2K0pTdyUc0kfweAn9QT95nafpVsiT960mGGzYyS18QFRdcC4xg+mGhBq4oLIUH7dW
 CPT77vTsDIqe8mXF2IaID9WtfsMBUPD+5hCr5pwYg6aSQr3Xg3NQrU4YQeWrgS6OKGNh
 vw8g==
X-Gm-Message-State: AOAM531/RZEoxMBozQi09/xo0m3SKUPgsDP9NUfrwqf7td+FpRztGcSp
 9QcwUH5lZJWgs2KLk66JLa6WWcq73QXr/A==
X-Google-Smtp-Source: ABdhPJwgthcwvCOVUNIs7s3X0PHgjKnUr5OJHQ3eb3Qa6pogUJaHjQbYIporGUL7BI7g/KRNQxhO3A==
X-Received: by 2002:a05:6602:121a:: with SMTP id
 y26mr6673673iot.1.1643412483104; 
 Fri, 28 Jan 2022 15:28:03 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:02 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/40] bsd-user: Create setup_sigframe_arch to setup
 sigframe context
Date: Fri, 28 Jan 2022 16:27:27 -0700
Message-Id: <20220128232805.86191-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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


