Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA24001E8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:20:15 +0200 (CEST)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAzG-0004RS-0F
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtz-0004iw-0I
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtv-0007Rc-SM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:14:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t15so8711491wrg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mxdg4WBcVbUdsRcZMoLQ96Hj5pGJaTJATreG10LOYTE=;
 b=HWaGAy+ODu+VetBKHsWRZ8RzjD91FDOkTsBg2bYVP/KIDBIUG2e05pHCyaE2tyxFzV
 OIBjmt4TxquIeRdWDw+dSthE0O+iGynN2XD+6AVFdXCWb2FB7Ngx8SscIOr94bVQCFiP
 iyOLwUapHA86iCe989KP53u+eE3AYPxGcSFKbMqii1HnAf7ae2rP+KiE53d32mx+xA/D
 Grbtza//f5WV39WfpVgZ+aU0KQj1ZBpJLvc4tWwVk7pZ9Um32g7osSPOHc3TuX5kn2SB
 KEZmdTIqTvL8t7aOZMH6GJ+b4rfhMcx75tnuVUKTXJ8Ns2cd20hv0q9S7VSocuahqLLW
 oLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mxdg4WBcVbUdsRcZMoLQ96Hj5pGJaTJATreG10LOYTE=;
 b=JIJOWXOYvimlcqYPUsjBfshbkE1y1BJ+0qOhz7zs+eBVotIAzG7H3SrpwMMkSVPqbR
 am8B0eO/ABbSxo85WtHJiiD075N0pZNT3s+4z5X3WTQ7ormHqMeCaguq2bvTz79clZpV
 Lsl3C/kcsclXXlR2q6+ptG8DPXPLxYqhzEVsKSFWsV5KOyofJuuaHJgCt0u6Mi3uxCZe
 iG8SJbOhDtlPe+Ph93APP/FixK5mJtJ2z1249GR/EjwZs0O8y59R8XKVEkUJbHPdXGX+
 ipDOc7PlTgq9DW3O9m9a9/kz3KIieL4/ZYyteduD/0dG0KNnZhEX3TuPS33CXB1pgGs8
 0LTw==
X-Gm-Message-State: AOAM533IL48QqJMYdjRNivXKdjOB4o/rEU8xPS+YiJcFU2wjuOENPmzU
 ZAlmfQh/9Xhs976ohLdwZgZK/MNSADzyCA==
X-Google-Smtp-Source: ABdhPJwEy9ffu5603o1YH/W2hKjy/xunf78BBuDcHLX/Feun334FL53q0dF9AVepvyxblXvEefhMkw==
X-Received: by 2002:a5d:4285:: with SMTP id k5mr4829659wrq.131.1630682082344; 
 Fri, 03 Sep 2021 08:14:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y21sm4737780wmc.11.2021.09.03.08.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:14:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/arm/mps2.c: Mark internal-only I2C buses as 'full'
Date: Fri,  3 Sep 2021 16:14:35 +0100
Message-Id: <20210903151435.22379-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903151435.22379-1-peter.maydell@linaro.org>
References: <20210903151435.22379-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The various MPS2 boards implemented in mps2.c have multiple I2C
buses: a bus dedicated to the audio configuration, one for the LCD
touchscreen controller, and two which are connected to the external
Shield expansion connector.  Mark the buses which are used only for
board-internal devices as 'full' so that if the user creates i2c
devices on the commandline without specifying a bus name then they
will be connected to the I2C controller used for the Shield
connector, where guest software will expect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 4634aa1a1ca..bb76fa68890 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -428,7 +428,17 @@ static void mps2_common_init(MachineState *machine)
                                          0x40023000,    /* Audio */
                                          0x40029000,    /* Shield0 */
                                          0x4002a000};   /* Shield1 */
-        sysbus_create_simple(TYPE_ARM_SBCON_I2C, i2cbase[i], NULL);
+        DeviceState *dev;
+
+        dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, i2cbase[i], NULL);
+        if (i < 2) {
+            /*
+             * internal-only bus: mark it full to avoid user-created
+             * i2c devices being plugged into it.
+             */
+            BusState *qbus = qdev_get_child_bus(dev, "i2c");
+            qbus_mark_full(qbus);
+        }
     }
     create_unimplemented_device("i2s", 0x40024000, 0x400);
 
-- 
2.20.1


