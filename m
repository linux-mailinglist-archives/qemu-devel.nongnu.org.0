Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613E6593A7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:14:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r6-0002zC-Cu; Thu, 29 Dec 2022 19:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r2-0002xK-QL
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:33 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r0-0002fT-0D
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:32 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 i12-20020a17090a4b8c00b0022632104a6eso2926223pjh.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5fURURdpD95K+AiPWNLzyWdmAHAOzWJ7x2HA9bfmtE=;
 b=WBBAfHYFqRhMSfloB9ZphZXOebPiRU4uPUGjadi2DNkRE7cafnAzSt88hKj9fAk3ry
 W3/LXFyr4W8f/d2h1JCvhTWmqkhG6o8pcqAXWELnSyjDNBCOysoJuUOZtGaPamfhx/KS
 FppZNVJ3evaM2GDX4Qfzie44EpexAqR9aubTiQGDUZdWdv1+V9tKNWruhTox4/uszkBT
 errTush2g2cbntfmBMim4VLmofeItnChnAIJ3kbKLG9pY5i5Ht/4KPbZEQaWOPCTBZGp
 KhW1u+OFkqKX9KbgpWfCmRwbVjtxXtY+hef/MXT8i4JXiizJFS72gWL7Mw7SLSvEPDMN
 yXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J5fURURdpD95K+AiPWNLzyWdmAHAOzWJ7x2HA9bfmtE=;
 b=feZRV/PcPgpa8v+mLvV4Eb4ZWJfLUOAYkGaH7Qx5iUPwAi44CyEz0UvBxOTcb2d1GR
 IV/oN86L3EQDMXoEzLDHtMFs8PUAz7S7AA2O/vg5gxPzsOjQVqhUnjefU4qs3sDHPPf6
 ooDYbTG71Iy+/A30jL/6wOV4oNIBcAP9pwVkhdtw9xM/bgMhnFNaKb6b3g3ahROlowyl
 sGB8UIibzYvi/LMDfomUoHuST62y1TJt8xOlMHCwqDFLqEbxxXe3TZflmrbX4orB5tHG
 0eC2qm26JPtdoyqmazOeMOesTMjMx8PxFgxRWlvAe+SgG3mOhrQWTc81hWRz8rkn2nSj
 l7tQ==
X-Gm-Message-State: AFqh2kpByVYpQJGub2EHeMqA9vbb58eBOIC391O8hIX6YzR9TrIKWwvQ
 9QX3jR5ZlefPUo1yby9bubkmvjG2GBD3eQkT
X-Google-Smtp-Source: AMrXdXvmrTZT9i1wTMGT0iuIzrMcAKfp5k9zOPJPXl5azFx1uoMm7lpq0Y1gF5E+kx2m5B7oXfJOEQ==
X-Received: by 2002:a17:902:cf0f:b0:188:f5de:8908 with SMTP id
 i15-20020a170902cf0f00b00188f5de8908mr31181127plg.65.1672358548710; 
 Thu, 29 Dec 2022 16:02:28 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/47] hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_mips_irq_request
Date: Thu, 29 Dec 2022 16:01:40 -0800
Message-Id: <20221230000221.2764875-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/mips_int.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index 2db5e10fe0..73437cd90f 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -32,17 +32,12 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
     MIPSCPU *cpu = opaque;
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    bool locked = false;
 
     if (irq < 0 || irq > 7) {
         return;
     }
 
-    /* Make sure locking works even if BQL is already held by the caller */
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    QEMU_IOTHREAD_LOCK_GUARD();
 
     if (level) {
         env->CP0_Cause |= 1 << (irq + CP0Ca_IP);
@@ -59,10 +54,6 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
-    }
 }
 
 void cpu_mips_irq_init_cpu(MIPSCPU *cpu)
-- 
2.34.1


