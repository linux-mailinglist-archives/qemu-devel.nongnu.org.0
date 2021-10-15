Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D642E7A5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:21:23 +0200 (CEST)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEig-0001aB-DC
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYn-00071e-Nh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:09 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYk-0000Bi-0j
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id 75so7458788pga.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BJUdaZcFQkGn0Ur44U4wi+Gizq9wqvJWic/PiqjpH80=;
 b=H8DucyRdyFs7Dzgt2Ow6Ng+qQogi/7hnlrrEBhxFn7AhnvPexNFAl5g9sLDV+rwNL7
 GNhhN5y8dVC8Zy1ilbb99b//lxDSIU6EBJyfWCQYBAOdKacWZrlmrVaFqa0Ik+oFLXh/
 eg62JbYJx4hTxYtq+A7McCMjEz2+GtE9yh8On/HICZ/TRvQv4eBWnZ9yi3i/dQm72cgQ
 oaQLNos4sbWkmLhZQsudIuKOuFmlIOAUEWTwG4oyNi+gJO9NxkpSNsiMtE8cUjgppa1X
 KJCGTJHU1wQVwmSetX0XsgJTjUSilwHZMoH+e4q3BZf6n+6WsMApqPMh04pCFDyzvESu
 FIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJUdaZcFQkGn0Ur44U4wi+Gizq9wqvJWic/PiqjpH80=;
 b=Pip/6Ag3bzMO/E+Vc+SquTluMFrFHmAfrEigo6B9Q0o6lD+ZGGPR9lj4vFFqU65Y1r
 GuzTyszG51gNZhnjCuuPGdxWVeZutibPwP7Ml1lRSLi77k8xhg2PMmZK62PJr6csEfnt
 HGMUYqn8jQ85BM7p0f4K34uSWDii4rRw23bMZfwz15ZzQEDBb6fGyNwpdOe3f+UlSfTa
 RnKrKUUxGGl/XA/Iyi29QqcrQZtqdRfW59qkoa8ue172CqkBzpuuOgIxq532wjkd/Ohm
 oW/3O3DPMKUOxFYkKXPuX3SIwl95udW2pKxa3kW44+BHVokoLW7YW0mcJcGTOovljIRP
 cqXw==
X-Gm-Message-State: AOAM532dBnZX/bFPIwPgIxqEzrugJRmbbBvO7PWieY8FBnRPeeXrTIAB
 8vzyL6xcr4aPeWmMW2+JtuW0BxCrlG4Mhw==
X-Google-Smtp-Source: ABdhPJzpX965P36+jPZiwOQOSw/JXlsSVaSxNpgk9Sjg3kudw9avthD23z4ghF1T4Qm9Qr8tqyzh0Q==
X-Received: by 2002:aa7:9542:0:b0:44c:6db9:f596 with SMTP id
 w2-20020aa79542000000b0044c6db9f596mr9437073pfq.21.1634271063536; 
 Thu, 14 Oct 2021 21:11:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/67] linux-user/host/alpha: Populate host_signal.h
Date: Thu, 14 Oct 2021 21:09:55 -0700
Message-Id: <20211015041053.2769193-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
 accel/tcg/user-exec.c               | 31 +---------------------
 2 files changed, 42 insertions(+), 30 deletions(-)
 create mode 100644 linux-user/host/alpha/host-signal.h

diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/host-signal.h
new file mode 100644
index 0000000000..e27704d832
--- /dev/null
+++ b/linux-user/host/alpha/host-signal.h
@@ -0,0 +1,41 @@
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef ALPHA_HOST_SIGNAL_H
+#define ALPHA_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.sc_pc;
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t *pc = (uint32_t *)host_signal_pc(uc);
+    uint32_t insn = *pc;
+
+    /* XXX: need kernel patch to get write flag faster */
+    switch (insn >> 26) {
+    case 0x0d: /* stw */
+    case 0x0e: /* stb */
+    case 0x0f: /* stq_u */
+    case 0x24: /* stf */
+    case 0x25: /* stg */
+    case 0x26: /* sts */
+    case 0x27: /* stt */
+    case 0x2c: /* stl */
+    case 0x2d: /* stq */
+    case 0x2e: /* stl_c */
+    case 0x2f: /* stq_c */
+        return true;
+    }
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e0cc765069..0db3c5cf3c 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -255,36 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__alpha__)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                           void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    uint32_t *pc = uc->uc_mcontext.sc_pc;
-    uint32_t insn = *pc;
-    int is_write = 0;
-
-    /* XXX: need kernel patch to get write flag faster */
-    switch (insn >> 26) {
-    case 0x0d: /* stw */
-    case 0x0e: /* stb */
-    case 0x0f: /* stq_u */
-    case 0x24: /* stf */
-    case 0x25: /* stg */
-    case 0x26: /* sts */
-    case 0x27: /* stt */
-    case 0x2c: /* stl */
-    case 0x2d: /* stq */
-    case 0x2e: /* stl_c */
-    case 0x2f: /* stq_c */
-        is_write = 1;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#elif defined(__sparc__)
+#if defined(__sparc__)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
                        void *puc)
-- 
2.25.1


