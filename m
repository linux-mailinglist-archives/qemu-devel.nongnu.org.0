Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4993A8E3C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:21:52 +0200 (CEST)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKFb-0004iC-Gn
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6U-0005ZD-DU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:26 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6O-0008Ro-Ra
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:26 -0400
Received: by mail-pg1-x532.google.com with SMTP id n12so550602pgs.13
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxD3kImzZTzoHPM9GMiHPmLRd+HKsnHLojrn5hai3Qk=;
 b=aOQuwuQL8kpqTLCKNO0+VxCtz6OnYin3YdNyb6G+E3/wvXS9i93YEUrrw4VRyzticr
 cHhZDZptkyWgmWkvUnlw18SD9V+MIGIr5N6h8HGeXAnxP/frwfYT0e4f6QGU2qxhgOaF
 JxbekotCcrAFm8qb4QDsxMtgW7Xt5+hBdXk5DgSwyAd3J+eBxMv0o3APOwTQFOdBWSor
 JXrMbk6Kg3Nsd102S0OHiMfZNc46qcABOgDgXDrs5RIqzCqSCwvsyTTg7hr69BpHDfRO
 qU40/Jz3JwWU5rSsyC2a4p0bgyOwlkNdpCgwnGkDQu3VVW1FZ3gQMnyIy5QG39M/px/v
 guHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxD3kImzZTzoHPM9GMiHPmLRd+HKsnHLojrn5hai3Qk=;
 b=L8T3/s3NiHLkMOeNJqaOksswS/C8QysX9cicrwqQTl/CHWiK61dO2Xda+g/WejVAuC
 qHUy68ZVEx0c6CQXP8FISUo9dqbj69SLlep1JGb9vETqK9oGiSyR63M30hJ+M9pRgY3X
 0uyEs/OvPMmcl4HRwdYp4wpf6TMLbobguWZRAaggqXgS+xpCEmskzlUgXCGsv1a77gaf
 Ss/1H5SdRZzynDjRmM9VTtUjjFe8whsFDxMUjesClo5IOIe+7erNvHG8HcIzRoAPfCJ5
 m3baPRr34Z/SQoZ9hne8Q2u8TPfEhQ81e5CE/Zfr/yh8ND8TlCsKAmXaLBU3z1KZFPeV
 P93g==
X-Gm-Message-State: AOAM530JvCulX8oVInVDktQS+peA+TNxaR/gsv4oWeJPERLKmi3yBUVY
 VRq1CA2Rh6Jy2iiDJm5Vxe64qvkiRUwIhg==
X-Google-Smtp-Source: ABdhPJyUfKFT5/Mdwdzadrj7wqUO/ace83jNk4fPOGkxNdJe9XvEBhcR3wEBa8GlauJv96mMYUE9uQ==
X-Received: by 2002:a63:9515:: with SMTP id p21mr2321596pgd.333.1623805939666; 
 Tue, 15 Jun 2021 18:12:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/21] linux-user/openrisc: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:02 -0700
Message-Id: <20210616011209.1446045-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/target_signal.h |  2 ++
 linux-user/openrisc/signal.c        | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/target_signal.h b/linux-user/openrisc/target_signal.h
index 8283eaf544..077ec3d5e8 100644
--- a/linux-user/openrisc/target_signal.h
+++ b/linux-user/openrisc/target_signal.h
@@ -26,4 +26,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* OPENRISC_TARGET_SIGNAL_H */
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 5c5640a284..b411b01864 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -37,7 +37,6 @@ typedef struct target_ucontext {
 typedef struct target_rt_sigframe {
     struct target_siginfo info;
     target_ucontext uc;
-    uint32_t retcode[4];  /* trampoline code */
 } target_rt_sigframe;
 
 static void restore_sigcontext(CPUOpenRISCState *env, target_sigcontext *sc)
@@ -115,14 +114,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1; l.nop; l.nop */
-    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, frame->retcode + 0);
-    __put_user(0x20000001, frame->retcode + 1);
-    __put_user(0x15000000, frame->retcode + 2);
-    __put_user(0x15000000, frame->retcode + 3);
-
     /* Set up registers for signal handler */
-    cpu_set_gpr(env, 9, frame_addr + offsetof(target_rt_sigframe, retcode));
+    cpu_set_gpr(env, 9, default_rt_sigreturn);
     cpu_set_gpr(env, 3, sig);
     cpu_set_gpr(env, 4, frame_addr + offsetof(target_rt_sigframe, info));
     cpu_set_gpr(env, 5, frame_addr + offsetof(target_rt_sigframe, uc));
@@ -168,3 +161,18 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 4, 0);
+    assert(tramp != NULL);
+
+    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1; l.nop; l.nop */
+    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, tramp + 0);
+    __put_user(0x20000001, tramp + 1);
+    __put_user(0x15000000, tramp + 2);
+    __put_user(0x15000000, tramp + 3);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 4 * 4);
+}
-- 
2.25.1


