Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7754A5006
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:19:13 +0100 (CET)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEd8q-0005Qj-IU
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0004ls-Iv
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:15 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=36662
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnI-0002dc-RW
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:14 -0500
Received: by mail-io1-xd2e.google.com with SMTP id h7so18426579iof.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGJfV2pZjNq6/Lkgq5idUT85KpfDUjfI//YVpMiMT3c=;
 b=ASz31J81lA7yv78WrHgzg7lo+F4ndKfXkJKRC7nDqs21+qipa2pw3sMURp5qQo3mYr
 kmSC6g98Aw9e8dDkuJol+K50wXMta7imOeMxSDgaFahuUC2zm4RoR4dQEyCAbxd3J5qp
 4lT91F8tuQAsygFXnjUTMnSAJRJaYHNmwDBpePTkN0u6ryv9IzZIBwnYxpaLl4F7tHxB
 u7x/De7Gac1ghBFPfOaY28OziWD+1YBIQUvIiShAV5TtxmF+gYtPVAvyffbfFBYXrg7o
 zLb6WSaHa6eYRqFxbod8fdj77ju6keGFtmAyw3zA/2c2FSdDSRKRImHRoBMd4Yjcj/LU
 4Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGJfV2pZjNq6/Lkgq5idUT85KpfDUjfI//YVpMiMT3c=;
 b=jqI56Ct6arGh9NormjGC2s5zBC3mAuHvwnt+vPURKoyY2Uihn3TFnZRG4AEZ0UvRBB
 DhVFsIUNb8ehFimYVmhChCK/20/lkGFU7S9mDnHVqNh1sAZWT8qNPIVUEEYPQrTLNRUK
 tKrKKBhyQdESqDv2a9HC/vOwn4NyoKGmVakkEX923DOQKAf7WFzOYVxmbB6hIpFYIQeD
 8ED8I3YPmoL2ogUI4i6JO87X83zX7ycpZNiOp+eUNOglm7d2eG2KwzxD3RJCVt0FyU3y
 jV+5AK7zc9oZ0dX37ZbBLdBI7F9lQ4+/8YgUU8N9qL++rQsuMEnS++/u1wVg1aV7Ll2d
 OebQ==
X-Gm-Message-State: AOAM532oz4iEHp+zH098klJJbhafTC2a9k/kczR2aASPgdZz43eVvXQJ
 LCy9uS1VyVJX9/AFtLJaS3KBgagdWZiOBA==
X-Google-Smtp-Source: ABdhPJyIX1ivq6eo+rjEh2X/LRYp1bHctz7Sz0ULDqHeOtLx1igvZWvcLe85EZ6iqp0n1QeoLqw2Ng==
X-Received: by 2002:a05:6638:382a:: with SMTP id
 i42mr10148857jav.256.1643659000181; 
 Mon, 31 Jan 2022 11:56:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:39 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/40] bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
Date: Mon, 31 Jan 2022 12:56:06 -0700
Message-Id: <20220131195636.31991-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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


