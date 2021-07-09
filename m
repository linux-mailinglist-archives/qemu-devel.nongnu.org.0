Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE53C276F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:21:16 +0200 (CEST)
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tFc-0006I8-1j
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4u-0001PP-UA
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4s-0000tY-3b
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id m2so1815693wrq.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dKDIzuvtaX8JxLTVV3qVEDghKCjpF+iPJawU1M1UYxo=;
 b=POPCJin69Q/KQhpXM5N7RR4u3HnyxsFcUDZHKBE4e5qM0u/f6V3ex3DQ2fW89ao4Us
 a+zrpuR3kD4xkBa7ej6zmcHertJknzV2T3sQPGepM4UXaX9yApuSp3FZ6vDJjlkJsQiD
 ZvBV9T7dJVtSqROQTOwPld6Q9+ogUGKbVChVTKf/EQvAyJdZ6QKSz8Z1oFD3ZYTSBB5V
 8e6Tuou6Uhif3jP7XudT82+1EBLlKauDUdHOjGltkJEVMw6//SKllnJCf4YvfNQvKfc/
 25tvRhpFy0vdvjU8S6aGuBvmm9CL3D3pe/LqMY+yL06VDHkhoTaPpWV4wKP5VSVNDr0K
 HONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKDIzuvtaX8JxLTVV3qVEDghKCjpF+iPJawU1M1UYxo=;
 b=BXmp2iIs6WfnGQWM9vSqU38pWAKee55g6SCVDr2yQGOW34EEE2r8pxhz3gg+sKCR6D
 Nhnt7g990QEVPLzwbYJp++YQk6sMtvZKUrZrtyI5mYNVEZpE6Vnlo1rXwXspT3k0oPE1
 lO+vSINgzUe2EyMVqgAOLjD8cS+qBaxXOqoZX4JOolh+4cKADh14no66ctNs8X3BkCSt
 dEa3raR1RpQ4qeFLsctvwLg6W0SXOmq9/MxrKoEWl9iA3Fr46f75o/QCzkTKIfd0/H3V
 IL0KbdebD9f6ui29pjtuRfhVRNylgMSu2dbFZVmITJ+cgR3D1fobaSnnaiOLWSp6FqBQ
 qjyA==
X-Gm-Message-State: AOAM533T5QbRK+cHZyTutSq7u3MeDmzC4+t5EmhEBt3Ut30n5bhgEhg9
 AOrF/m+Q325g3KTUavLozuuMxqEye7rmAiL5
X-Google-Smtp-Source: ABdhPJxik5TPdY27kaEp2qvnM/UzgNRT6OA5MZ7wBP4ufrf2T8VUj246GTHAlfP8jKsWx900kRzGRA==
X-Received: by 2002:a5d:6281:: with SMTP id k1mr4393849wru.369.1625847008799; 
 Fri, 09 Jul 2021 09:10:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in
 icv_[dir|eoir]_write
Date: Fri,  9 Jul 2021 17:09:51 +0100
Message-Id: <20210709161003.25874-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Ricardo Koller <ricarkol@google.com>

icv_eoir_write() and icv_dir_write() ignore invalid virtual IRQ numbers
(like LPIs).  The issue is that these functions check against the number
of implemented IRQs (QEMU's default is num_irq=288) which can be lower
than the maximum virtual IRQ number (1020 - 1).  The consequence is that
if a hypervisor creates an LR for an IRQ between 288 and 1020, then the
guest is unable to deactivate the resulting IRQ. Note that other
functions that deal with large IRQ numbers, like icv_iar_read, check
against 1020 and not against num_irq.

Fix the checks by using GICV3_MAXIRQ (1020) instead of the number of
implemented IRQs.

Signed-off-by: Ricardo Koller <ricarkol@google.com>
Message-id: 20210702233701.3369-1-ricarkol@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3e0641aff97..a032d505f53 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1227,7 +1227,7 @@ static void icv_dir_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_icv_dir_write(gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if (irq >= GICV3_MAXIRQ) {
         /* Also catches special interrupt numbers and LPIs */
         return;
     }
@@ -1262,7 +1262,7 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icv_eoir_write(ri->crm == 8 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= cs->gic->num_irq) {
+    if (irq >= GICV3_MAXIRQ) {
         /* Also catches special interrupt numbers and LPIs */
         return;
     }
-- 
2.20.1


