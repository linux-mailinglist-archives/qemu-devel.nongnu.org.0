Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745A3F3D5E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:59:32 +0200 (CEST)
Received: from localhost ([::1]:49914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHedq-0007h1-Fa
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaG-0007gi-JZ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:44 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaE-0000Z6-0M
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id oa17so9841835pjb.1
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3z2Cv7lHE53m9POhYgaeHFo5xT8ZP8ac0XeVQmhvwQ=;
 b=BoxTtglYPFlrwXK9iX545hsKNtVKGnxuf/L2GOiyYn3L7G+M9OJjAHNPl7L9yvtd1s
 WF02wxLUbTSaQPlISIYyBccBonWjKtHW9jzcdXCZgQ+HMt6zBIlVz6zmr72kyae7rgN/
 zQLpV3lPY1Ihg3FseIedz4+xOPcG5jIoGckeflKrR6C7FwHtt/gBiHjtlJEgBjWyDDUi
 n/VR9CIo/Otp8mx2dlXslzgr+a2Qm5+hXwcs/NFsel18hfrn4OILt1/5V8e7D+zQ/KW4
 uGOI4Kh8HbuTgOvRR1CvsF83WpYGI2Wheu8WzG5SGIqvdO6mpe3fZUm+6MnW2SO8tk59
 uboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3z2Cv7lHE53m9POhYgaeHFo5xT8ZP8ac0XeVQmhvwQ=;
 b=p9ddI2vJIvA05IdDYwvgUNH5RNrfots4h3WiN0Fd0m8vZSu48Lab2x/hzTvpj7+X2i
 DzpIeFospdm3zJLrwsIg6qAf4kQ6L4Ib1Uo/vBI5fouipmWnxeuN8sJSdKkSCrGcU+zy
 R2kZqw+n/hZo1fwh3Qdmn2VlYlsv/ZmmwpR3WEQztqr1DHoqKtRhuwUyGFcfCH7HMkDG
 4stpvlxkK12xtObDL8n/TYsAxww5jXpe6jLnDyDxBqODz8Shu50S9funPEzdyXv5aLm2
 aKpZttRHuYeeYm5E/GaTAceGGZZzlNBPVOH/+si3J2CXh/qtPeO+QYjj/GW1M/2HIYJK
 /R9w==
X-Gm-Message-State: AOAM532+/n+Ra+RjlGusipt7eBxSfoD5nDtjz4rYcqDCnAkUa9EOpKgN
 WqjBQ0D/0yKghsU6EiS2tXzXNMqjsqvSIQ==
X-Google-Smtp-Source: ABdhPJw6+kfd698utgXNJ4MirX5qIpS/VXOWbKzBtNf1EnIkmmdf9wmRlaSkOwJByijewVZdeakdmA==
X-Received: by 2002:a17:90a:bf14:: with SMTP id
 c20mr12576889pjs.184.1629604540708; 
 Sat, 21 Aug 2021 20:55:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/30] linux-user/arm: Use force_sig() to deliver fpa11
 emulation SIGFPE
Date: Sat, 21 Aug 2021 20:55:10 -0700
Message-Id: <20210822035537.283193-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In the Arm target code, when the fpa11 emulation code tells us we
need to send the guest a SIGFPE, we do this with queue_signal(), but
we are using the wrong si_type, and we aren't setting the _sifields
union members corresponding to either the si_type we are using or the
si_type we should be using.

As the existing comment notes, the kernel code for this calls the old
send_sig() function to deliver the signal.  This eventually results
in the kernel's signal handling code fabricating a siginfo_t with a
SI_KERNEL code and a zero pid and uid.  For QEMU this means we need
to use QEMU_SI_KILL.  We already have a function for that:
force_sig() sets up the whole target_siginfo_t the way we need it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210813131809.28655-4-peter.maydell@linaro.org>
[rth: Include signal-common.h]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 007752f5b7..b8ece169f9 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
@@ -266,16 +267,13 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     ts->fpa.fpsr |= raise & ~enabled;
 
     if (raise & enabled) {
-        target_siginfo_t info = { };
-
         /*
          * The kernel's nwfpe emulator does not pass a real si_code.
-         * It merely uses send_sig(SIGFPE, current, 1).
+         * It merely uses send_sig(SIGFPE, current, 1), which results in
+         * __send_signal() filling out SI_KERNEL with pid and uid 0 (under
+         * the "SEND_SIG_PRIV" case). That's what our force_sig() does.
          */
-        info.si_signo = TARGET_SIGFPE;
-        info.si_code = TARGET_SI_KERNEL;
-
-        queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+        force_sig(TARGET_SIGFPE);
     } else {
         env->regs[15] += 4;
     }
-- 
2.25.1


