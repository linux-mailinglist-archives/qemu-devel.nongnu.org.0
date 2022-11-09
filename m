Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8C623103
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:04:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoR8-0003o8-Rb; Wed, 09 Nov 2022 12:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osoQx-0003n1-Oh
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osoQw-00019g-5r
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:00:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v1so26663395wrt.11
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 09:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/HzFUMC1BdHvhejcPUHEkS5z3kNmrAEn9w+43U063E=;
 b=o660eO91eDH2HCLaNH3uS51pqdcjZRLQ+mSItNPLq37N3hh4tRvnO/j/IB4tvv/7r7
 SfIroELONdnArVxIpYjG5rngiq07iVqcJodz3vVGoNxoZ0opxid46zKTfOudlCoYQrO4
 E841CGYu+NQ4uPVhmOwSva4fntPpBAW+PaEjPnV0Qe2f13tb64Ooc4O8vfMvLc1Gx9fX
 LDoA3QzoLvx58Wsn28WbITsXwnIBOHF0KC47H1UcZoGgvF1jS2Qnif/uIxixr19JRXxR
 njXLEmH0MBG0JYVszW9kgM7pkcNmfqnwq3KbGnBT1BMIhm0Ai5AvyixUzgWw7kdiwHPv
 3dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/HzFUMC1BdHvhejcPUHEkS5z3kNmrAEn9w+43U063E=;
 b=3hCLBJV8JjHWaCmbcvShemjgmZH+5DoX85VVa1SN2SuRZBkq/ilobC04HSBIetVlKI
 F73/ChKDKI6DMjZ0yy5aJtqi/EElOKIYAQPDwCWy5v3iZ5QGvqpopOqVxPWTl2+68ImA
 yeqTBnZxBfzd5f6bUaqT6pTMXN5GrrDRSTNSCCapGuoFEM7sWN1qFEH0fp4Hfm3T4ZYl
 v55QZKB1H6AX7hjttAetJ8FGDBC9nn2PTw2fMSx5GX7DSYCd0eO8QdPGCf/ySW11QZLY
 8InYt013RB0ODe75WqunBNHk36PZx0XEBz0iBT8w7iwySQqONwPcTf2777gygGFmZO44
 KZug==
X-Gm-Message-State: ACrzQf3HW2ABjEWfH0A3hrKKbm7RYqNJupf0b0NDytWgxcZQuofUOBw0
 W0EOowjFjJcHJIMNAOrbKjKDxJg43VomSQ==
X-Google-Smtp-Source: AMsMyM4JPXS45LztCubN674Rtl4Yxdh86s27/GA/WnLJ7Sab7kr4U55gImUQ6kj0bbIh/I8NsN8Zug==
X-Received: by 2002:adf:f741:0:b0:236:5aa8:a07e with SMTP id
 z1-20020adff741000000b002365aa8a07emr933201wrp.437.1668013212555; 
 Wed, 09 Nov 2022 09:00:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003c6b9749505sm2514932wmq.30.2022.11.09.09.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 09:00:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH for-8.0 1/2] hw/input/ps2: Convert TYPE_PS2_DEVICE to 3-phase
 reset
Date: Wed,  9 Nov 2022 17:00:08 +0000
Message-Id: <20221109170009.3498451-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109170009.3498451-1-peter.maydell@linaro.org>
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Convert the parent class TYPE_PS2_DEVICE to 3-phase reset.  Note that
we need an 'exit' phase function as well as the usual 'hold' phase
function, because changing outbound IRQ line state is only permitted
in 'exit'.  (Strictly speaking it's not supposed to be done in a
legacy reset handler either, but you can often get away with it.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/ps2.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 05cf7111e31..47a5d68e300 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1001,12 +1001,18 @@ void ps2_write_mouse(PS2MouseState *s, int val)
     }
 }
 
-static void ps2_reset(DeviceState *dev)
+static void ps2_reset_hold(Object *obj)
 {
-    PS2State *s = PS2_DEVICE(dev);
+    PS2State *s = PS2_DEVICE(obj);
 
     s->write_cmd = -1;
     ps2_reset_queue(s);
+}
+
+static void ps2_reset_exit(Object *obj)
+{
+    PS2State *s = PS2_DEVICE(obj);
+
     ps2_lower_irq(s);
 }
 
@@ -1281,8 +1287,10 @@ static void ps2_init(Object *obj)
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
-    dc->reset = ps2_reset;
+    rc->phases.hold = ps2_reset_hold;
+    rc->phases.exit = ps2_reset_exit;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-- 
2.25.1


