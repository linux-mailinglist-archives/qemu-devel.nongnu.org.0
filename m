Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87D3EB60B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:21:42 +0200 (CEST)
Received: from localhost ([::1]:34236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEX81-0002I5-VN
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4k-0005zX-0R
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4h-00019b-Dn
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso6902151wms.2
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z1jD/SaL+e0IFj9uD3ovecMKRiP3oqP49v8hJs55uWQ=;
 b=KNNFrDzHl8/oQlOxebYW+s06ZqZfncN7TzCvMbW8C9i6AUY85RBqFrRosCj3h+rkYY
 TnYcWWRkeVYEGr9n5dSic/C8wDfngmeKp8vdQqg4fXksSVpUcIbTyZJY21G9p7qQEUGO
 QqN6bBmeP6ppHlQQdYJp1F9ZKh2LhbV3yMED4mu72bizV/HkOQGS0EwAdo5JjYHSrCq5
 IJ3qBtLW4Kghw2FqFm+z+bq5js3Lgl1M3twoS0+huEh+b7xKpnWssCtxvoyz/KpSX9vZ
 o40kxWB8AgiGzKTOGzjiXpSn3GCfQw3MGfeM4WWUZl0+z5/6p3iRxfZyAntFmgNb0tSh
 JMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z1jD/SaL+e0IFj9uD3ovecMKRiP3oqP49v8hJs55uWQ=;
 b=W42YzF5TUVxlzqojcinXJCnRn12QyOjDE+KbWLtA/CZRbzrrWr4hAFvZov27HtNpVE
 r5F1qwZhtcvwbRzAFVovL+AL+1oLcrJCMllRZViziltpuazuM3kkG+pksmzwYO+DaXLq
 KrraShh/C2YAiHw6SsT9UFosTyONKI4Ztd3seb/B5aXpqKbQu8jpKx0T6nqftBvgVdw/
 iv5Wiv+Re+s0VkXtozFId+CJQkFMKEXpGOrOZlmslangCU3V+lQgAV0WM9V8v1De0unW
 3apDg8RY8WV/L9TCs/Go6PkEDHWodbWPTC6hPeqp/sh3NvMuWeZhzTXUL/XEKA7+DK3A
 X6HA==
X-Gm-Message-State: AOAM530OMgx1HdMAlGOfn1o6NKBk5y9VuEfbIt/uM31OkvgPOVvfn7MQ
 wN/pydPaB3y9BHbzQQHl4RVNwnjjlQw0vw==
X-Google-Smtp-Source: ABdhPJzo3lSLFc/eppqPQXJyxE9z8l+gsepaENzwYFOQc24hpFXoUcU+qLBHNXCNn/OfhUuKojetGw==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr2685272wmi.85.1628860693904; 
 Fri, 13 Aug 2021 06:18:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 3/7] linux-user/arm: Use force_sig() to deliver fpa11
 emulation SIGFPE
Date: Fri, 13 Aug 2021 14:18:05 +0100
Message-Id: <20210813131809.28655-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
---
 linux-user/arm/cpu_loop.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 007752f5b74..44324976196 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -266,16 +266,13 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
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
2.20.1


