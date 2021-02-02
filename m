Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5176330C97F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:21:10 +0100 (CET)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70IX-0000O9-B3
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu0-0005Xj-A6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:48 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztp-0002H6-TR
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:48 -0500
Received: by mail-wm1-x336.google.com with SMTP id l12so2225926wmq.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SQ4xA2yLq/phDq6xvwhKfOz8fL2buou5U7Bfn4DEe+E=;
 b=e3i34LADxU6ACmvk7RsDDsxrI+XEZsye3obE7td+/cmM50v2dnDOzC7whGUfo0Tx1x
 LU3cmam0GecPSX5+N/2zZ/AOqj0j2jfOO9truCceZmNU96cPD4hpHVEolnjxkgGbHhbE
 7pase01eLY56P8blu0YztrpcubM5WT0t/qC+VA3qLuU0iN9BPyjqB2w5xq2sFDQJNGAG
 p1eeAclYfTOkoJrB53MqVEQniHE4VzNb9gX17VT0+iB6ZOZPl9hdFgoJxisNnKdEqZd5
 4ZjRmY8lHBliBNCXWnR1F8t7kiERwLFNXFKNqoRaWw0YjGlC4n6TcNH0eMGcr2mzzgXN
 VnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQ4xA2yLq/phDq6xvwhKfOz8fL2buou5U7Bfn4DEe+E=;
 b=FIpccIexutro/S6cDOrh+P+SMDZOqwMdwI6vWPuRPj/YqnHIMlUqq0s0LTSH31GAnA
 TYQ5KUXJhag9iaCApIDnXBQWkNkPOYT+mzARG1HeHRb8jB9Ly2rHYkRSBK7eijq/j8x2
 5SqdWWT5/H2D2zhBqpV8LsTGMdNEKTQJi2+WSexNHUKNkECXNQGOyp/+h2MT7nkj7euj
 d0HKBiyUYhNnVo1N+iJK8ZBIRpGN+J+/XcyF4g3/h8efxv9oB6TOYO7nvsYr5p6GPpKv
 38UBjRxRj53CAC/ezAUAC8u9f9l90xQP2/uR7Bhi1vxixz+BPVs/Vmvy4IohDubPsG8N
 Y2Dg==
X-Gm-Message-State: AOAM53184eaFI//OauGd0VdozDb1sS/zoa5L+H+Mo8PbyZ8j1evhoabE
 cBCxFO9hR8PYp815eclCLbTJtkGwJ29/Kg==
X-Google-Smtp-Source: ABdhPJyFbKQJK8w/EfyLG2VS4byRL73xsKLz/mWnJgegAO8exgHJrWIYJEw9XXr4cYIM2cCF3XGGSw==
X-Received: by 2002:a1c:46c6:: with SMTP id t189mr4763302wma.57.1612288534094; 
 Tue, 02 Feb 2021 09:55:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
Date: Tue,  2 Feb 2021 17:55:11 +0000
Message-Id: <20210202175517.28729-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per the ARM Generic Interrupt Controller Architecture specification
(document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
not 10:

  - 4.3 Distributor register descriptions
  - 4.3.15 Software Generated Interrupt Register, GICD_SG

    - Table 4-21 GICD_SGIR bit assignments

    The Interrupt ID of the SGI to forward to the specified CPU
    interfaces. The value of this field is the Interrupt ID, in
    the range 0-15, for example a value of 0b0011 specifies
    Interrupt ID 3.

Correct the irq mask to fix an undefined behavior (which eventually
lead to a heap-buffer-overflow, see [Buglink]):

   $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
   [I 1612088147.116987] OPENED
  [R +0.278293] writel 0x8000f00 0xff4affb0
  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13

This fixes a security issue when running with KVM on Arm with
kernel-irqchip=off. (The default is kernel-irqchip=on, which is
unaffected, and which is also the correct choice for performance.)

Cc: qemu-stable@nongnu.org
Fixes: 9ee6e8bb853 ("ARMv7 support.")
Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210131103401.217160-1-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index c33b1c8c4bc..a994b1f0245 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1477,7 +1477,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
         int target_cpu;
 
         cpu = gic_get_current_cpu(s);
-        irq = value & 0x3ff;
+        irq = value & 0xf;
         switch ((value >> 24) & 3) {
         case 0:
             mask = (value >> 16) & ALL_CPU_MASK;
-- 
2.20.1


