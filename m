Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAFF3D73C2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:52:45 +0200 (CEST)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KhY-00012k-ML
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd7-0001fe-Pv
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd6-0004tT-35
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c16so4795638wrp.13
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J1y46jTpmN24nhOxSdJFJ5ckWOhPwyiZeykDSHzlJBs=;
 b=r4D+t8MZDfbrEw75Wnh7bavHqcneM2r/wfleUW8GJwNeQ1LNf+nHT3hUYL0pBHg4as
 me90h5bAiTlpu20tJLiWHm+Pfqd49qyDpTGNEFGUWlZ/ZseAWg7zYYjtIKHJ3GaWP9Z6
 XKacJStzX1zpfL/XoVWrcYasZyViMYx1Aia81iWOBPbuNDDTiYzI19gnk//Wi4oimlnf
 wcd03sx++hRFXSpb8LWsaYBt9bVePH8RxxDNZCVn/d6P9c1EjPDvXoFPSol6ouw2lwuD
 cPKhuGcAVHMTf3Y0e+cbbz5aEv0QoleanBZHIkWjVLmdf1OeRvfAwC9cyG1RuiQTh/K2
 mO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1y46jTpmN24nhOxSdJFJ5ckWOhPwyiZeykDSHzlJBs=;
 b=IQWw3fgtodRvYqOARobV10+ie2MzZlUyVYTOKbgg3x5oM/Vi6b3uR5ShDA0KZ62abw
 O0W7QXeNx7zZmOZib59piO3qqORn7ViWUUyj81RWF7tAejbvRHHMccqayGQv9HusqyUc
 jP+kmZfKNcgVM/VTc/upbxvRO0ZzWPC+rt/nA44du1rz/igyEs68kWzlpNq/YZMka88x
 +mX6G3k+WZ0GiJyxImBvYlcf2FzfrEJtOUqneLAeixwkosOJLXn9VvlKc9WPI9+F3r8T
 Y3rRbL8hpyOMgtdVKQVYnIUDIZPRq8+2bEs50P5aCVvWGBsIf1WIZuFlmsW7WvK/lB+A
 I04Q==
X-Gm-Message-State: AOAM530eNOwHqKakxH1lfvwlHH/CJn8r/W2F4eCG5+d6hKMe0ejLehQW
 txJ4+XZZdabNalz7voGuLkpYBmzXdiL5dQ==
X-Google-Smtp-Source: ABdhPJz9wSg6OhFcBgps6Lp60/Fsr8ppwdx1XDR42iCr4u1VdWuQAYqmlFuRdii+R3mb9x23pdrpiw==
X-Received: by 2002:adf:d225:: with SMTP id k5mr13849949wrh.10.1627382886843; 
 Tue, 27 Jul 2021 03:48:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] target/arm: Report M-profile alignment faults correctly
 to the guest
Date: Tue, 27 Jul 2021 11:47:52 +0100
Message-Id: <20210727104801.29728-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For M-profile, we weren't reporting alignment faults triggered by the
generic TCG code correctly to the guest.  These get passed into
arm_v7m_cpu_do_interrupt() as an EXCP_DATA_ABORT with an A-profile
style exception.fsr value of 1.  We didn't check for this, and so
they fell through into the default of "assume this is an MPU fault"
and were reported to the guest as a data access violation MPU fault.

Report these alignment faults as UsageFaults which set the UNALIGNED
bit in the UFSR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210723162146.5167-4-peter.maydell@linaro.org
---
 target/arm/m_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index f352346a964..20761c94877 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2248,6 +2248,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         env->v7m.sfsr |= R_V7M_SFSR_LSERR_MASK;
         break;
     case EXCP_UNALIGNED:
+        /* Unaligned faults reported by M-profile aware code */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
         break;
@@ -2320,6 +2321,13 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
             }
             armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
             break;
+        case 0x1: /* Alignment fault reported by generic code */
+            qemu_log_mask(CPU_LOG_INT,
+                          "...really UsageFault with UFSR.UNALIGNED\n");
+            env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                    env->v7m.secure);
+            break;
         default:
             /*
              * All other FSR values are either MPU faults or "can't happen
-- 
2.20.1


