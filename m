Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6ED310F47
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:00:22 +0100 (CET)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85P3-00067G-P3
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84U2-0007GE-PJ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:26 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TZ-00044S-M6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id c4so8409761wru.9
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Pkc1ViGT7MqLH1WJfEkEx25IDm75/A8GGd4uuqI01Qc=;
 b=o7QQMVG1wzL8HDe6bM09YFdykZH+bsdJmIUbou0erH8kkvtY4khkPS/+LvmAr0H1/7
 GdmBK5IK54Ay7swHinKNAaJK39bCL2ohY9bwbca3vBHKJ255sjZJSDx3/tR07/ONacyl
 e2yIai33vxDMXJ6h6lfM9+/z09ys0pFJRHQxcluSFo8PzeZuShj8+FFhxj8MpKi8XTmw
 RBB3VdJ2uIM7eMF/2aDDdm5KbCyWrOAB2jRVfDB7a8BLxPeJhVSh2VNozL7Th8L3hEyL
 cP+t1QmFMZ933Ip8vrqnW9Fpv3lYpV8B0ZaIUTNc09hiTj4UTP24Fw7CsfbvIzBcgoQH
 WjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pkc1ViGT7MqLH1WJfEkEx25IDm75/A8GGd4uuqI01Qc=;
 b=QX7GgFnf+XIdpxz2x/OgsFk2XNhDeE7afotZkVKc8cTg5MI1plqvR/cHD6ntubN7jT
 SmfZryPCbN0xRpN9QGU795S9cy2gqifkRo87ODlToPWTY+GT4pVFTAW+ogk6+jwk3fAv
 LMyP3zfci5dT7dQELnfwR0l2dvIM9hePQ3K+iGmN18ICO7YfYnRtAfBtQUe6g7/qDvyr
 cIGye67AOvlwQH891+nKxuKm3zJg+Xd+AwLItaATfwRNGwIc1Re7IQJdrSWFmHtZw77m
 u2Od2YktC//UpkT5RYjFuvdRzPLWGqeEvFNsPgyFYwIdAwxIhn8PLIpw5T5jZjiHiEaB
 PsZg==
X-Gm-Message-State: AOAM531H62fdFGeSh0pEaOH401QD9Igg3VACLQ4+tJYTt9U5JV08C+xN
 4eox05Yo9eKBrO0+ryhBM2Dsyg==
X-Google-Smtp-Source: ABdhPJxGACVZ+rk54LEjmLHN42RIa+ExSZ3Jw3pj/oy9NPJyimmdHmLrTEHve1ASyooH/uEHpY9OjQ==
X-Received: by 2002:adf:e411:: with SMTP id g17mr6177695wrm.296.1612544433205; 
 Fri, 05 Feb 2021 09:00:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/24] hw/arm/mps2-tz: Size the uart-irq-orgate based on the
 number of UARTs
Date: Fri,  5 Feb 2021 17:00:09 +0000
Message-Id: <20210205170019.25319-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/arm/mps2-tz.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 07694413005..87993516816 100644
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


