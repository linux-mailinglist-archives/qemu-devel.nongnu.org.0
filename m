Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C331231B89B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:03:50 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcbV-00053j-Pr
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQi-00087p-P1
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQh-000467-8u
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id n10so9072834wmq.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tA+5uc5Diq05XqZ8Xpisz6igJKvX27QKXQ3Zpt1aydo=;
 b=zkVbAipdtWQpfRIaeIRnDAQirG99XLbu53KEPIqb8+Yv+iZELfMPizTiopv1mtFR/c
 semmmsEhWi8YNs8m7/6luUNl0vrKRNsXqKjlaPE2Tkiw1GCGFEeGk18/vLKEPkhsRiDv
 3ulgYKAYfeuqs/a/DPl6HVvunykNcPD2PLVn5GCZRrdy/+wFmnkkTykBy+IYSvf++3Hb
 vk4Mqf4joii03R2lmg8cFm/QVWoquAAHvYNM84iACib77Obb3RzuB3IjwGiVgSrWQJWS
 Xey7KYUvHsksyu6WiWy1gdLM4lG3iEnhthvh3mT9cKG5UyuqLWBXxK9sbWoukOIgmlqc
 fYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tA+5uc5Diq05XqZ8Xpisz6igJKvX27QKXQ3Zpt1aydo=;
 b=MaeXGBEvKDnOW1ESmZgloo8eI1mZUbK5KDdWvN8og/mA9v/lDtnGuMIbo01OiMlTOj
 MqenOxGWvEyzjf/Cg2Qs+lkRj6g323XKed+zxNiIOiQF9cQSu+Y2U9XN26Yvo8bQuTsW
 QNmjGAFrdPk0YHH+hZheTlFKaahvlENrnw4OC0Nz+uwQJht5xYYRIhNjCb53hMNSteh/
 5KohlLDng9s29c7Jg0WI9M3c8m+h7TjN9XzVpZDPUCRwWNOglvxQ9TBdDHKbkHEcEGim
 QJJD3y/MsiAW6P6DmYhiia+YiV3LYIUgH2Qfk9siDl2+ajB57hASb7aF8Wx38kJUM6my
 fU0g==
X-Gm-Message-State: AOAM530Yccyd+tud3GbjhNy2y0NoQdE8n7G6mShhnnK79Hm4JMnnOZM9
 4tMH5RmzHGda7zMSpbv3bfRHSg==
X-Google-Smtp-Source: ABdhPJwe7rC7R9KL+Cda+d72yinzHMSXVm+6MkCXpRh1EVByFXdzYVqkD5N/X7ePkssOr4kWOKX7uQ==
X-Received: by 2002:a1c:9d81:: with SMTP id
 g123mr14288028wme.139.1613389958114; 
 Mon, 15 Feb 2021 03:52:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/24] hw/arm/mps2-tz: Size the uart-irq-orgate based on
 the number of UARTs
Date: Mon, 15 Feb 2021 11:51:28 +0000
Message-Id: <20210215115138.20465-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
---
 hw/arm/mps2-tz.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 014ba775783..f1a9c5f65a5 100644
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


