Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5149A21D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:48:22 +0100 (CET)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAwX-0001Um-5A
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAer-00020d-T8
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:06 -0500
Received: from [2607:f8b0:4864:20::136] (port=35413
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeq-0001Qs-9b
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:05 -0500
Received: by mail-il1-x136.google.com with SMTP id w5so11303429ilo.2
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGJfV2pZjNq6/Lkgq5idUT85KpfDUjfI//YVpMiMT3c=;
 b=zaznoxWd0srZPl+qaqHf1GF7dHQJgiY5Uiv9kBHEwzWmcIeqXmbMWvfmsJNFx5Nl9c
 +Fbq9Gx4FYkJozpK79dyhqTWbI1TCD4WCgu7L2ecsZwHt/ZU/gNdFsBdyLYzy9fPSnRn
 kMA2MCZG9Tqw0yMkSvkxB1pWSo4uV8hSLYsmAlOen3KdKW5kA6xNATNO54AnJAX8bvK+
 pwRYfTVL5ty35mIEScE943LrewJqO7YW5+Nak4Ppq62iXoVRKafUJtNXltSw5B7Tf7gJ
 vUb47ZqHzidGZLerlQx5cfChCFldCKzIiTDaVlal3Ze4eMVXZfKsIYnXohIuNxibxm0W
 zIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGJfV2pZjNq6/Lkgq5idUT85KpfDUjfI//YVpMiMT3c=;
 b=keg91uoA+hoi2GnOhlV2uM8nW4wqOHQ2szHzXtAnqHN+EQqu2VQHhaYr13x4g/IPDa
 YRVnGXm+LZpxiAHeO1Ss2gkk9L4HLqZDWJOpceoO1ry6hebx7JTKEEfSTbH2+Rjgo1Ik
 U4tTjng9GCzT4SGFvo9hWxW4Ne5bKBJPu+8wc7oIXU2w/fdyUPFx/V9drXU5vjMlDcy+
 iktIoHZTu7wreydcEm+jlvjY1xw7y3J6aTGwXQs6dW4+x3gcVEx3bpfrsu5dI2F9U5BF
 Zh3AnhjRyE3LSpgKZhBqQhR59xVQMz35cqZGDn040qZFyK1VCBE4S1w86DbfuFswvEKq
 5pqA==
X-Gm-Message-State: AOAM532ur+uBb32LzFspf6QArcJVl8b9WZ+h7j7bB7bq9FhcYR3mWl2N
 Cxgr3In51eqpKxbV3uAV4hKVr1baiumKZw==
X-Google-Smtp-Source: ABdhPJwsdvU540BXAfubCYvr5g11mSxESkAkcltajNiEn8GjH+6Cfo68YgUMUCFSVIxSvjKP/XHI6Q==
X-Received: by 2002:a92:874f:: with SMTP id d15mr10587613ilm.194.1643074203056; 
 Mon, 24 Jan 2022 17:30:03 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:02 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/40] bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
Date: Mon, 24 Jan 2022 18:29:17 -0700
Message-Id: <20220125012947.14974-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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


