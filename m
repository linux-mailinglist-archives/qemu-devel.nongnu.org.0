Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F549A3CC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:03:54 +0100 (CET)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBBZ-0003Se-4J
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfE-0002HN-Qw
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::d34] (port=36419
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAf6-0001b3-UO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:25 -0500
Received: by mail-io1-xd34.google.com with SMTP id h7so3932729iof.3
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+J/ZcXBMkl7vIRUbXRkoafaooBA4s7iAGTsSYqX/VvY=;
 b=2diA3o40TXRs9BMo/oVpUPOE72XfIVQRq1RCua2JLRrzr3WJyhPUM/emD3EcojQkjN
 Ly6b551pXbZSWWEDpA4rdfbQ0akvo8GH1NRtHlZQBWONgZP07vPhEzwhN6tqn1A+cQV+
 JCtRIi5kgwTO5jwxhNaBui+MwoK406M4Yic2UYSwyhtaotQtNLQfaQaC6WC3D7UsCjfV
 APkMN/YxN8rnaufsk8hbbh+DCJvaoqazAMOhA/JzlnxGNWiwN8X8DQLdKHPaniuOyCKD
 yp//mEJ0FZdI7Ieg5RsgYuAqQfGto1HARLHdagDDsQb+AYuI3xI0l/a0JHS9ypnVP8ZV
 xL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+J/ZcXBMkl7vIRUbXRkoafaooBA4s7iAGTsSYqX/VvY=;
 b=gK9uAbexjt3oDA1q1BrzlsIaYADttz3FuZ9fy6sKzSrB4nvXDskvW3R+dOZofd35Xj
 U17Wk/TLU/gifwJUND0owdiii3Y9sOuFxuEZNMvjFJX+xPz4up524pvBjdflhu9NzAlN
 CChJVzfEnPpAEM3P3abfn/Gfxri69JCiFYaL0ek9y8jQ3vqRb0/2iGvjDOmrJvXtzMOX
 f5c6SOw585i1eb828VFp2OCurMoO3TLAQNd8U44z25ZbwqKioNJqKlPrQqhe2FK+TTRC
 G7TNKg82pB5X56FIHSI2579eEf1TVoGELTS+DK7UnQmWLbotp61Us0OTf8xDMYoBEysh
 9W0g==
X-Gm-Message-State: AOAM530qdxxFD4FZoRBIYQgCNEwUF0y81YzG8lurE8Q6oI3sz45fpmCO
 zOy2Pn31G1RkQkDS4ejgslk0nk08+y8TCA==
X-Google-Smtp-Source: ABdhPJxHkDtpx3p5hAUEKvEFB6jgVDXkkwwoOQC8OFir1SBHkjcpjdMf9NKKAurnZLL1Wx4EszHo2g==
X-Received: by 2002:a6b:5813:: with SMTP id m19mr2297652iob.172.1643074214034; 
 Mon, 24 Jan 2022 17:30:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/40] bsd-user/host/x86_64/host-signal.h: Implement
 host_signal_*
Date: Mon, 24 Jan 2022 18:29:28 -0700
Message-Id: <20220125012947.14974-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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

Implement host_signal_pc, host_signal_set_pc and host_signal_write for
x86_64.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/host/x86_64/host-signal.h | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 bsd-user/host/x86_64/host-signal.h

diff --git a/bsd-user/host/x86_64/host-signal.h b/bsd-user/host/x86_64/host-signal.h
new file mode 100644
index 00000000000..47ca19f8814
--- /dev/null
+++ b/bsd-user/host/x86_64/host-signal.h
@@ -0,0 +1,37 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2021 Warner Losh
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef X86_64_HOST_SIGNAL_H
+#define X86_64_HOST_SIGNAL_H
+
+#include <sys/ucontext.h>
+#include <machine/trap.h>
+#include <vm/pmap.h>
+#include <machine/pmap.h>
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.mc_rip;
+}
+
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
+{
+    uc->uc_mcontext.mc_rip = pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    /*
+     * Look in sys/amd64/amd64/trap.c. NOTE: mc_err == tr_err due to type
+     * punning between a trapframe and mcontext on FreeBSD/amd64.
+     */
+    return uc->uc_mcontext.mc_trapno == T_PAGEFLT &&
+        uc->uc_mcontext.mc_err & PGEX_W;
+}
+
+#endif
-- 
2.33.1


