Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEBD2B692C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:57:49 +0100 (CET)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3Ma-0006Jr-3T
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3LV-0005mt-8U
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:56:41 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3LS-0004a6-IK
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:56:40 -0500
Received: by mail-wr1-x444.google.com with SMTP id s8so23660125wrw.10
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbtN+t3/nZ+/wjXy+MgLGmSuQ3MGPFUppcgHnPJ0HW0=;
 b=HpsTD+LMjQIGeYyqmzA9sjeQ8x5ixsQLJ16B/EYe6UuQqjfqRhGrp5TdOiuqAgkS3R
 h8N9bChXslK4nQSOI0e5ujfxe5SjJaXWZD3o/O/RQdg+spSK6ExPyJ1iGetJwL8qRJ9E
 u/MlgmRq1X4dkEvNQI8RxxQ/BNiVELYl6NYpvjzmhRmi5u8mrXE0d3B36RcXX8OkK+nc
 sQ5wXuCUAfucTuUbL7lrTI0JZwp85G3NMWGvAuqRgJoDeP8UAWCAntkRpCZNqUrD+z+2
 /xNseuqeRa/hPKJ6Fej8cLecJQU6FsBLICn5Ozd3THUrpitHUUnno6CTUMW2UckCjc2F
 71Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbtN+t3/nZ+/wjXy+MgLGmSuQ3MGPFUppcgHnPJ0HW0=;
 b=CNcqzyDR/QVT7c5fgttyp8MC2tmqusCizZimGAyIObvmh9a9TgZRMuLKSJcSJpSCAA
 eUN9Nl7R74p15p+rKG29ju/Ph72GtkU5GXIEk+/UwIRGlF9MogGwe5nOifpOCoZcZkB+
 C+KJJQvRT5XGd93mzufm4HN2kgboAA4I5xpBD5RHsS8VnmdCMDd98KQqjC+DuXH7RVcH
 vVyr+8qeV85WBYcRaT374530TvuHi0s14MhXawEtELcZ5u3m6SEz7SwpQbQunIqkLpDB
 nH+mxcvFl531DurY9NRqM5WVxXiQrPA0t/6yDxmq637rZzCMsZ40tzm9UkIEBJv2MqIR
 fsFQ==
X-Gm-Message-State: AOAM530UVsUBm8vWQlCBkIugoRCID2fbkyIrCC6VBSvualVHOf+8HN6z
 t8VS5SckRqH4QF8ywE/8BM9SpQ==
X-Google-Smtp-Source: ABdhPJydCT5YyayVCmldChV0TCfJhVlVjuDS/nT0vRXqc7RaQ16UPjL1UXwGNbh74aNC8B5XzLFwXg==
X-Received: by 2002:a5d:4a50:: with SMTP id v16mr207592wrs.106.1605628596644; 
 Tue, 17 Nov 2020 07:56:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x63sm4464052wmb.48.2020.11.17.07.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 07:56:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] linux-user/arm: Deliver SIGTRAP for UDF patterns used as
 breakpoints
Date: Tue, 17 Nov 2020 15:56:34 +0000
Message-Id: <20201117155634.6924-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Linux kernel doesn't use the official bkpt insn for breakpoints;
instead it uses three instructions in the guaranteed-to-UNDEF space,
and generates SIGTRAP for these rather than the SIGILL that most
UNDEF insns generate:

https://elixir.bootlin.com/linux/v5.9.8/source/arch/arm/kernel/ptrace.c#L197

Make QEMU treat these insns specially too.  The main benefit of this
is that if you're running a debugger on a guest program that runs
into a GCC __builtin_trap() or LLVM "trap because execution should
never reach here" then you'll get the expected signal rather than a
SIGILL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is not a "fix" for LP:1904210, but it does bring QEMU's
behaviour into line with that of the real kernel on that binary.

---
 linux-user/arm/cpu_loop.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 13629ee1f6a..3d272b56ef0 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -205,6 +205,24 @@ do_kernel_trap(CPUARMState *env)
     return 0;
 }
 
+static bool insn_is_linux_bkpt(uint32_t opcode, bool is_thumb)
+{
+    /*
+     * Return true if this insn is one of the three magic UDF insns
+     * which the kernel treats as breakpoint insns.
+     */
+    if (!is_thumb) {
+        return (opcode & 0x0fffffff) == 0x07f001f0;
+    } else {
+        /*
+         * Note that we get the two halves of the 32-bit T32 insn
+         * in the opposite order to the value the kernel uses in
+         * its undef_hook struct.
+         */
+        return ((opcode & 0xffff) == 0xde01) || (opcode == 0xa000f7f0);
+    }
+}
+
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -234,6 +252,16 @@ void cpu_loop(CPUARMState *env)
                 /* FIXME - what to do if get_user() fails? */
                 get_user_code_u32(opcode, env->regs[15], env);
 
+                /*
+                 * The Linux kernel treats some UDF patterns specially
+                 * to use as breakpoints (instead of the architectural
+                 * bkpt insn). These should trigger a SIGTRAP rather
+                 * than SIGILL.
+                 */
+                if (insn_is_linux_bkpt(opcode, env->thumb)) {
+                    goto excp_debug;
+                }
+
                 rc = EmulateAll(opcode, &ts->fpa, env);
                 if (rc == 0) { /* illegal instruction */
                     info.si_signo = TARGET_SIGILL;
-- 
2.20.1


