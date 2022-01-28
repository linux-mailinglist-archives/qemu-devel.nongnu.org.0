Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEDF4A046D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:42:24 +0100 (CET)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDasp-0007VU-TO
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:42:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf8-0000NY-E7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:14 -0500
Received: from [2607:f8b0:4864:20::d35] (port=34806
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf6-0001ZK-Rb
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:14 -0500
Received: by mail-io1-xd35.google.com with SMTP id i62so9720042ioa.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGJfV2pZjNq6/Lkgq5idUT85KpfDUjfI//YVpMiMT3c=;
 b=QWcIZtVhZIDHRFETahoxwHZ+ElEbZDAgdWLwPfTMDIOhcOMEuuCxsArgqcV7qfayXS
 YpkETfPkfrjJ6OxWJ2NiDX6Aoyx7m4Fz6f4rF+6Y7DA4u+aoWIy4yqzx4HYUZbhhuzaG
 zgbqtiCtVcyG8VoHeBCxDUNJFZAsK3jOjS1m9YFTO+KFcIR7z5+xQ4yao1dQTaV5oBAH
 LttDPbRgVf+73zGoE8ilH1hEcbjhQjZImMT02FnJT7Ks2GDIUcasba3lOO5Z2aR78FgT
 d+6pYjzcGp1AUMnCRgOaNMylbhfubM1lGm56m0nlI/lHpqwd58800BkgiFFHRoKpzuSH
 ZKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGJfV2pZjNq6/Lkgq5idUT85KpfDUjfI//YVpMiMT3c=;
 b=w0gRz6DawksI4dW2+9pgYroKsdPTNSl5eQ1ozCPnnDJu8FKZoNtGn7XCYTHgPvMnCB
 BP5olxcOQzOdNIMz7+hidC39thuCnaIkYSr/lUj357AQw0/DmFnWCpXT4YTQlyEMCNgZ
 YdYe1yE+gl0+tH/iDtHBVUHyftm6yN9K4dyDDU+/ZFBKkJgDI5BxZzWX758p0E1QWmOk
 vsYCkxXT9TKH4qYPrAtf6TurOEoyFfEexJipRc4GvLdD8qkd3tSrLthi2HDLaUDvvAEw
 kNEVRR3LPOYM/DaA5m2bsOvNBKW7sM1/6EHTTNoAhGalZRP6wzcR9FyUjcOsn+L5Zjli
 psEw==
X-Gm-Message-State: AOAM531b6E1MfEn8KYIw1TELaevC0nQhL5BnCuN3o0mvCdinYtQ9rhvP
 ik8QLBtOpYpAW9XdY/pXjdC5YsQiifJcfg==
X-Google-Smtp-Source: ABdhPJyWF5Y9qhfd7XTl/K0hHe/bu6obTBrzGG2Gju6I2qXXwA26VIiKBY7JHozU1AugtasTn8kWLw==
X-Received: by 2002:a02:2208:: with SMTP id o8mr2378771jao.72.1643412491562;
 Fri, 28 Jan 2022 15:28:11 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/40] bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
Date: Fri, 28 Jan 2022 16:27:35 -0700
Message-Id: <20220128232805.86191-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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

First attempt at implementing cpu_loop_exit_sigsegv, mostly copied from
linux-user version of this function.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 1206d0d728c..12de0e2dea4 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "signal-common.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 /*
  * Stubbed out routines until we merge signal support from bsd-user
@@ -63,9 +64,17 @@ void process_pending_signals(CPUArchState *cpu_env)
 void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
                            MMUAccessType access_type, bool maperr, uintptr_t ra)
 {
-    qemu_log_mask(LOG_UNIMP, "No signal support for SIGSEGV\n");
-    /* unreachable */
-    abort();
+    const struct TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+
+    if (tcg_ops->record_sigsegv) {
+        tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
+    }
+
+    force_sig_fault(TARGET_SIGSEGV,
+                    maperr ? TARGET_SEGV_MAPERR : TARGET_SEGV_ACCERR,
+                    addr);
+    cpu->exception_index = EXCP_INTERRUPT;
+    cpu_loop_exit_restore(cpu, ra);
 }
 
 void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
-- 
2.33.1


