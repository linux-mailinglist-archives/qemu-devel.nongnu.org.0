Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E8488A82
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:22:47 +0100 (CET)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6axy-0008Mf-Ew
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:22:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aus-0005MD-H3
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:34 -0500
Received: from [2607:f8b0:4864:20::d31] (port=36360
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auq-00075Z-73
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:33 -0500
Received: by mail-io1-xd31.google.com with SMTP id w22so3878906iov.3
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pqqXPwF6yBDT7HgMyJ17HExIlciTQ3azRU2lsjDmYEg=;
 b=HTsI3WEuuXfxOpFAMcsDC1v9fpCtbL5XNlfevmloMjhjRI802y36v27cRbRfT/2ui4
 og6oP/GPG3mhkerCD9+XcMMg75SOqFhrwb9Ehi75JYtTeWUOUJFaKRNrcjsPYdjYeM+T
 PiLCx5QmRq1XfGhk2Riui/PQoQNpuF772nB7m+G2ayTwYPNIalHe8/TFGqTM1cRx3QLg
 qa+ENmIMtwnPdan4Fdv3NKHrEiwdtB9oGu5vg8zvQA+uF3UXLvdMq9ybykX3Nso9JmES
 5HS/w6ByTxjXghdhB526k7ePAGJJhR0c0k+mvXlKp7ySchmcqy0QnkPlSr09+j6eHhH/
 yM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pqqXPwF6yBDT7HgMyJ17HExIlciTQ3azRU2lsjDmYEg=;
 b=xNKf/ElTlFFIP7ZIx8U3GLTa9kcluz5A40byeDQNjN7Si7ZtaUv8d0lEuE29/frs6s
 RqVH+VmKdfhyHfEfO3QEiwtvow6DdYLZXRmwuVetjzpsO6c5++SdGXONkxQTPqxFYnmV
 VGUgu+iB9KfuJiVO8zrROcsNOBgMLDG/bgkVdbdnCa17p2fcsB2uC8GI9QueFGPsBlXc
 M9gE6Mkr5cYx5Gp2tDrVbfgTFe2l+ibnHjBjfOu+kuebe9wfLaFDo81+ydwddGWqQJF1
 3Y9x2ensHSEL9L0XGoIxpz0Ud0C49bVP5YAkWvPrfKqSNfAOg4vU4O+Nf10yLG5TwHh6
 /3Fw==
X-Gm-Message-State: AOAM53288rKoXS+yb0GRJJLc47LIkVM3hLlZ2vKsPMrZii9bczs8/VaS
 J4ZqibyqrQ1V6I02ffePvjP8Dq5nPMkCl1kU
X-Google-Smtp-Source: ABdhPJw+Dis2OIVPlkGuJsdBb6Xo75wHP0bJ8Dwsoj0X45Iovn+g5WFVxnU6TOPFhCRJzg7b8SsGdg==
X-Received: by 2002:a02:c60e:: with SMTP id i14mr28366490jan.207.1641745170909; 
 Sun, 09 Jan 2022 08:19:30 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:30 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/30] bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
Date: Sun,  9 Jan 2022 09:18:56 -0700
Message-Id: <20220109161923.85683-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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

First attempt at implementing cpu_loop_exit_sigsegv, mostly copied from
linux-user version of this function.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


