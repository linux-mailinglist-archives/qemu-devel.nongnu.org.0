Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B8662149
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:19:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoII-0000xM-Cd; Mon, 09 Jan 2023 04:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoID-0000vA-9P
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:10 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIA-0002kG-Qg
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id r2so7459647wrv.7
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIe7Y6R4ZGYTW1AgsVF/JtMshtc/HMe6xazQxLy6+Ac=;
 b=xSR5saynuC3VTXQ4y7L+weOHfsYJEuC1wJ91CRxG0aTNTheGzmqlgeXoy+gxc0p7RK
 DfxtB+1pccm1mmYYecT9I3dbI6kCLC5KxoHPC+uBsv8W35+ZxkgQl73dHoRnlwoVGhQ4
 FH+Wn8Zsl7mvrK+Jq440iVNlRHYLw3MwpA10AWt2qic3Zs+Hk95FQaASpEQVkgsKc+nf
 Rd7rsTAbRW0K0jQa4dBdpK0vCIT3LKOvu3Rzf7ZXtjrcq60ogFtnUfIMvTlNiqbM1m51
 vsMZs1pTtl9SyDIUYL/Uugteh+iQn9tkzWLrm/8lXrDeCTiCtJ+3wHeTs9dwqF5Y9V51
 XSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIe7Y6R4ZGYTW1AgsVF/JtMshtc/HMe6xazQxLy6+Ac=;
 b=GcPsZTXaFkqmM2JeZra8kaJg0J5MZcjLA1dtPP8zpawtsnUyOqxYdvTMLrqCr+3zls
 yKqSd+Uec6gdSsFFo/S7cLzY1qopBF54egagoXtjx5swgBAvKw3M+6C0vuzBT8TZvmvL
 fNp3sR9vqWvhNIhwHHEsFQi0oWxbL6RDZz2pBFbIIWIhaIaCuUwkMGZJkwp/XOZZ7gav
 bKWk0PNxCG7RvcEcRnDzM1G4YeHDggA7Dn1Z3G00GJlyvUVB3ltWW8e3oXuMp7+UEBk5
 KLFrZXKmzFzSIbqM6HMaRgyROhc9H7eQhjqV5eBfHlU6ADHf+bHvbdQ0gSxSZLy21GG0
 GtXg==
X-Gm-Message-State: AFqh2kpkB4tlb7O6pVUTY3GKpKVzkfE9I7khJKyyPOtTbFf0m50RkxVI
 I6TraeAXJm+AdugZoMmM2dC2eOhE2zvMBVEH
X-Google-Smtp-Source: AMrXdXtJRG6W6GiUiWwgnLlqRrWpTeQK7T/BCWxPbhMAmQiIffVtwR1SvDpdj22MWvBamdv02Cb4dg==
X-Received: by 2002:adf:cf11:0:b0:242:6777:de38 with SMTP id
 o17-20020adfcf11000000b002426777de38mr39891631wrj.10.1673255885267; 
 Mon, 09 Jan 2023 01:18:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm8124614wre.3.2023.01.09.01.18.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/i2c/versatile_i2c: Replace VersatileI2CState ->
 ArmSbconI2CState
Date: Mon,  9 Jan 2023 10:17:51 +0100
Message-Id: <20230109091754.79499-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In order to rename TYPE_VERSATILE_I2C as TYPE_ARM_SBCON_I2C
(the formal ARM naming), start renaming its state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/versatile_i2c.c         | 10 +++++-----
 include/hw/i2c/arm_sbcon_i2c.h |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 52a650f45e..ee095762e5 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -30,7 +30,7 @@
 #include "qom/object.h"
 
 typedef ArmSbconI2CState VersatileI2CState;
-DECLARE_INSTANCE_CHECKER(VersatileI2CState, VERSATILE_I2C,
+DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, VERSATILE_I2C,
                          TYPE_VERSATILE_I2C)
 
 
@@ -45,7 +45,7 @@ REG32(CONTROL_CLR, 4)
 static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    VersatileI2CState *s = opaque;
+    ArmSbconI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
@@ -60,7 +60,7 @@ static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
 static void versatile_i2c_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    VersatileI2CState *s = opaque;
+    ArmSbconI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
@@ -86,7 +86,7 @@ static const MemoryRegionOps versatile_i2c_ops = {
 static void versatile_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    VersatileI2CState *s = VERSATILE_I2C(obj);
+    ArmSbconI2CState *s = VERSATILE_I2C(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
@@ -100,7 +100,7 @@ static void versatile_i2c_init(Object *obj)
 static const TypeInfo versatile_i2c_info = {
     .name          = TYPE_VERSATILE_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(VersatileI2CState),
+    .instance_size = sizeof(ArmSbconI2CState),
     .instance_init = versatile_i2c_init,
 };
 
diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index f54d1e5413..0101422d9d 100644
--- a/include/hw/i2c/arm_sbcon_i2c.h
+++ b/include/hw/i2c/arm_sbcon_i2c.h
@@ -21,8 +21,7 @@
 #define TYPE_ARM_SBCON_I2C TYPE_VERSATILE_I2C
 
 typedef struct ArmSbconI2CState ArmSbconI2CState;
-DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C,
-                         TYPE_ARM_SBCON_I2C)
+DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C, TYPE_ARM_SBCON_I2C)
 
 struct ArmSbconI2CState {
     /*< private >*/
-- 
2.38.1


