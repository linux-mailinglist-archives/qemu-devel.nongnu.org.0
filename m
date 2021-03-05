Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A332F273
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:26:16 +0100 (CET)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF9T-0003xL-Un
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3m-0007Nh-30
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3G-0007hO-Ag
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so2920351wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yno/jUsJ2y5gZLpiAHhe+wuHQakn7csip0OCdgbDC6o=;
 b=ExsZh3zAZo1TrM+vPRiLXRNsNNbiSWbeQE084z0rho4CLc8CYFiAAkLyCH+ZL+lCk4
 ZWdeyfvH5BzgGUsksInx+6ax4qP9B8SO1YFJyXb4QPJg33dLZV7fJaGHN+5SAv5P8+WJ
 zH8BUBq8XzJ1lUJY8lkcLn8iWAvB6CShByK/ZGnr7k3XZHXd1o0FavBGzML36FjljVys
 sWPcLkyeCuH0s5fug32FsWKAkAELW58n1Rv5IrmEnYKlRb2sdiuevKqKOt3jhOiyFHGh
 /BHoU4/DlqM+o2ZJAc+MlRr5o0KfoJ1dHcRjZs9nGGalM1bzRmKFzcjD/r+PdMz5NnJ3
 yjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yno/jUsJ2y5gZLpiAHhe+wuHQakn7csip0OCdgbDC6o=;
 b=Ok3boFC1pIOYgjUDOgPnr9N7R8bRXDimXuXKhPO+4LPTk78GoJdkm0vojleS7xEZf2
 9w2aNIvChKxagEZ2GcEoLBQfXKvrNXH07CYhNrUIJ/jGgVKzv8C2ORK9sQrrSw4WvN3J
 igWTWGpqoDlOs7gZ/k8ywoH/1lQR2H3bEpU6MbKiE16w1ZbWAZ4TOoWs71eGtUw9eFUc
 M2Iw82GUC2Y6Mv6G54MefQCV+QujDm2w5pVQ+at6ikvuTE5LPkrukhyDeBBRN7JUgjYS
 kTUm7s1HmAyksbw6677vN9L36FPeBFcvPQ++Aly63/VXN+yjob0kyEsJmeax26o6SYg+
 Qi4A==
X-Gm-Message-State: AOAM533fyvEGZetZMpoH8ryvU6xgg55l+coBNzEWY/aKLnCjy+5ey/Aj
 2Ucm3Pg5EC1M6f02a04FCvdjJXKAFlmYew==
X-Google-Smtp-Source: ABdhPJyeLfJDBiWlz5reIUgwJzn/cef8lQ3WXFchHOOVd+cxABuSZJuKhQNtPIItW7kTMHNEqLiPgg==
X-Received: by 2002:adf:f841:: with SMTP id d1mr10380118wrq.36.1614964544637; 
 Fri, 05 Mar 2021 09:15:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/49] hw/arm/mps2-tz: Size the uart-irq-orgate based on the
 number of UARTs
Date: Fri,  5 Mar 2021 17:15:05 +0000
Message-Id: <20210305171515.1038-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

We create an OR gate to wire together the overflow IRQs for all the
UARTs on the board; this has to have twice the number of inputs as
there are UARTs, since each UART feeds it a TX overflow and an RX
overflow interrupt line.  Replace the hardcoded '10' with a
calculation based on the size of the uart[] array in the
MPS2TZMachineState.  (We rely on OR gate inputs that are never wired
up or asserted being treated as always-zero.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-15-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 53886d66b61..1c1fc34dd53 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -516,13 +516,18 @@ static void mps2tz_common_init(MachineState *machine)
      */
     memory_region_add_subregion(system_memory, 0x80000000, machine->ram);
 
-    /* The overflow IRQs for all UARTs are ORed together.
+    /*
+     * The overflow IRQs for all UARTs are ORed together.
      * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
-     * Create the OR gate for this.
+     * Create the OR gate for this: it has one input for the TX overflow
+     * and one for the RX overflow for each UART we might have.
+     * (If the board has fewer than the maximum possible number of UARTs
+     * those inputs are never wired up and are treated as always-zero.)
      */
     object_initialize_child(OBJECT(mms), "uart-irq-orgate",
                             &mms->uart_irq_orgate, TYPE_OR_IRQ);
-    object_property_set_int(OBJECT(&mms->uart_irq_orgate), "num-lines", 10,
+    object_property_set_int(OBJECT(&mms->uart_irq_orgate), "num-lines",
+                            2 * ARRAY_SIZE(mms->uart),
                             &error_fatal);
     qdev_realize(DEVICE(&mms->uart_irq_orgate), NULL, &error_fatal);
     qdev_connect_gpio_out(DEVICE(&mms->uart_irq_orgate), 0,
-- 
2.20.1


