Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB52B64F8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:52:56 +0100 (CET)
Received: from localhost ([::1]:48954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1Pj-0008VN-EA
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Le-0003OT-CJ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lc-0001ua-FK
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id w24so3296687wmi.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C58kbuRhu6Y3HnOM5/hgbQ3AFR4hHsag4KuDHeck0VU=;
 b=TQ4VMIqsg9qjwTlVr4Eb4J8oWPELFn2+3pFdpSwMIOonqO8N3DWIgBFRW03AHjmqt0
 1/TV5W3LoEh+QN5SbCsh+oiFWnBcdLgMjSZhbBZYjdul8WGr2ovpwJ0HoBmJQ1IUsKdo
 BKqebfCwdq+d/vXDOMdTyyTkx8K5V81F3oyLzAGDjEpt8krU4EetJIKlfZ9sAsz+hulI
 shpvMRQeX4Z6NTBOG8GtxFIweHf4/CbYyK82txoh8hlJhFj2HyDiR5t2BPl3cUFYsnA/
 VXheILj0NaXAJz8Zij/ypfzQXjKvabW2ytkJ98y3b8sAPrhG4Yv73bQKlZ3Wq2fHreX/
 wouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C58kbuRhu6Y3HnOM5/hgbQ3AFR4hHsag4KuDHeck0VU=;
 b=kgrLEOpyr21+kJmXsAWvpMGbsfFHuzrgCdmfX6x2wwwAVusqDu4c3yUL/X1QZzuGZ2
 IRr7oKANSBNwZRspaICeVe2fPLyzkPMEXtlaZ7YHldfjGLZTX1xw+Dnn/8kwVdVSbusd
 Wrv3GDNAZw2F67tgDbsUHEaIJoiBLnvatKn7EhlZ2XQv8FKnuu15Y1+m643J484euvoR
 35xmlQ1OLVf8Q9YmVRzfSB6nVz4GkN5cGWEcNIJi9zeGlXGY2WKeX6azjNqhu3QnRMFU
 0WIL3SNRgfzu6yzweRK1nOe/C2TciCnEuff/XyVUr79qDcsYElglwFfzP/I75Ct2Tdg6
 U8Iw==
X-Gm-Message-State: AOAM531Ld08R/YDqpxoWCN99i5J/COVghuM70Avr0NzMouya7OZKEf4y
 +KElrQVAZ10NhSqklNect34MSlfMOuS6Qg==
X-Google-Smtp-Source: ABdhPJz2zq4/dExuxL5ngq1f9KuovwOBR0K4COosZEYEUPlfUo83Yw9B3tu4m+g8kOw3uoBy0Iqiyg==
X-Received: by 2002:a7b:cf31:: with SMTP id m17mr4436340wmg.62.1605620918892; 
 Tue, 17 Nov 2020 05:48:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] exynos: Fix bad printf format specifiers
Date: Tue, 17 Nov 2020 13:48:27 +0000
Message-Id: <20201117134834.31731-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-id: 20201111073651.72804-1-alex.chen@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 4 ++--
 hw/timer/exynos4210_pwm.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 08ee3ca76c0..439053acd2a 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -537,7 +537,7 @@ static void exynos4210_gcomp_raise_irq(void *opaque, uint32_t id)
     /* If CSTAT is pending and IRQ is enabled */
     if ((s->reg.int_cstat & G_INT_CSTAT_COMP(id)) &&
             (s->reg.int_enb & G_INT_ENABLE(id))) {
-        DPRINTF("gcmp timer[%d] IRQ\n", id);
+        DPRINTF("gcmp timer[%u] IRQ\n", id);
         qemu_irq_raise(s->irq[id]);
     }
 }
@@ -1003,7 +1003,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
                     MCT_CFG_GET_DIVIDER(s->reg_mct_cfg));
 
     if (freq != s->freq) {
-        DPRINTF("freq=%dHz\n", s->freq);
+        DPRINTF("freq=%uHz\n", s->freq);
 
         /* global timer */
         tx_ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 4fa3d873969..de181428b47 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -169,7 +169,7 @@ static void exynos4210_pwm_update_freq(Exynos4210PWMState *s, uint32_t id)
 
     if (freq != s->timer[id].freq) {
         ptimer_set_freq(s->timer[id].ptimer, s->timer[id].freq);
-        DPRINTF("freq=%dHz\n", s->timer[id].freq);
+        DPRINTF("freq=%uHz\n", s->timer[id].freq);
     }
 }
 
@@ -183,14 +183,14 @@ static void exynos4210_pwm_tick(void *opaque)
     uint32_t id = s->id;
     bool cmp;
 
-    DPRINTF("timer %d tick\n", id);
+    DPRINTF("timer %u tick\n", id);
 
     /* set irq status */
     p->reg_tint_cstat |= TINT_CSTAT_STATUS(id);
 
     /* raise IRQ */
     if (p->reg_tint_cstat & TINT_CSTAT_ENABLE(id)) {
-        DPRINTF("timer %d IRQ\n", id);
+        DPRINTF("timer %u IRQ\n", id);
         qemu_irq_raise(p->timer[id].irq);
     }
 
@@ -202,7 +202,7 @@ static void exynos4210_pwm_tick(void *opaque)
     }
 
     if (cmp) {
-        DPRINTF("auto reload timer %d count to %x\n", id,
+        DPRINTF("auto reload timer %u count to %x\n", id,
                 p->timer[id].reg_tcntb);
         ptimer_set_count(p->timer[id].ptimer, p->timer[id].reg_tcntb);
         ptimer_run(p->timer[id].ptimer, 1);
-- 
2.20.1


