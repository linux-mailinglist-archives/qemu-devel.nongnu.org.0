Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA62409931
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:31:13 +0200 (CEST)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPorQ-0005Am-LJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYz-0001EH-K0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYw-0008IH-34
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id d6so15535314wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bw7COqvNSGbBSupnPfzjqa5dbyyy8rYOvFDBxednX+Y=;
 b=Ya8XIwim4NTvdPBa0WO5OWAWRiOWa7W2rDIhTIYfPfl6j5dEc3pjy+l9idbhtmVLH9
 AoV4CupILeYFqezOGl5FG3ZkV4dtEtpN2iirZedq1DgJ8QdF2LnlePcnzjynwwel35zW
 sW09gbgEErCYiXKR6A+JurFuU/tH67bimmvDcYiFM4kj5J+QznxrOPLf9f52GX7a1KwV
 Rt5H/+NfLPwWvXilgwKqnTYwa7P00Z6Hq+x3ZImtgL5HovvjxQNizdQUN0U3mX+TtdzH
 Yl7xymOFk+R4PiwZI1Sghe7p+twg7wSi4Biy57XGCcpU3DT5F9oHPCz9ddeLY2QOdbxy
 QGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bw7COqvNSGbBSupnPfzjqa5dbyyy8rYOvFDBxednX+Y=;
 b=klWlvyig1psw037IiUv3UVRTQ0TAGonpH1/ZF+Aa8czq3plG75/RjCTu3b0wCge3Gz
 +N+X05vG5a247Vyi88QuN/Jzj3knDAVfb3ehamrFUlsYUvN05siClxpjWNMmEwdEx+GX
 KdrRNW97gSlmKC0+57mEh+22GOWYbeRN2fqijD2MOmvbjX9b+v4y+2bCL8DCWmMTe90A
 48l8lP6M22BE/IXOFUS2EzYQWGOyGNIrDm64NNYLUNICDrswPgoAbW2wlOwwoPghfhjZ
 Yo/Ts7MCaszCb5HbqRf0ZHGYg2CJ99QkkuFJuBNlSYuOGRsYL7YP/c75FpTSffZUh7AF
 K49Q==
X-Gm-Message-State: AOAM531BY0XngLu32lMm+5gEiu4eJQpU1qGjPYTh0G7EVq07RCSzY6pX
 DNvPNdbSCmr4cdUSbZURMNCUetmSLCXFmw==
X-Google-Smtp-Source: ABdhPJzldh+/sRGKXp/M6PrkO+2sXL5RUQJhEGA5G5knSOaN7H4C4gKYlVrcoQdOQJk1j0WgnY/o6w==
X-Received: by 2002:adf:e643:: with SMTP id b3mr13838460wrn.67.1631549524858; 
 Mon, 13 Sep 2021 09:12:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.12.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:12:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] hw/arm/mps2.c: Mark internal-only I2C buses as 'full'
Date: Mon, 13 Sep 2021 17:11:44 +0100
Message-Id: <20210913161144.12347-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

The various MPS2 boards implemented in mps2.c have multiple I2C
buses: a bus dedicated to the audio configuration, one for the LCD
touchscreen controller, and two which are connected to the external
Shield expansion connector.  Mark the buses which are used only for
board-internal devices as 'full' so that if the user creates i2c
devices on the commandline without specifying a bus name then they
will be connected to the I2C controller used for the Shield
connector, where guest software will expect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210903151435.22379-5-peter.maydell@linaro.org
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


