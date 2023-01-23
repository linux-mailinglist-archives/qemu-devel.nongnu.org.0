Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0B677CC5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:42:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzx-00068P-Tb; Mon, 23 Jan 2023 08:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzY-0005wc-Iv
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzV-0002NO-O9
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso8572656wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ea17f0Na5Eii5BWvhP8T/nWUNUn1BNxyDUvea71J5gg=;
 b=UH97Ge+kSAC8kqEZz8J7zaVm2reLtqedHpb+WaWoOaJUxQFTJydv8hrvUrTQ9+FVPd
 zdYtKJwv+PmavrRAxiSd/8cnBn4OuBlMCtznkj1P1tgnE1k3tqzk6p1qqkadGZqh0w4p
 0jAVqfQgKZxCBcyU0M/gQFjmOtTNEIRWV3ZxvKmTkJ7gOS+FTavoGHaPO+dMpCzVszUY
 lbWfP+DlHlkTOWTZAfYYxN+zkELeEQl6bZHIIF61O6x4TNByicVcjKhHUsudIjhvop83
 m4n1Bs41dIJhDqR5XAP15vFS8AtyNx6COV2k8Z0jUIr0Go+NMxFkNTzyUL3ERqP3v7nB
 h/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ea17f0Na5Eii5BWvhP8T/nWUNUn1BNxyDUvea71J5gg=;
 b=GC7iqewe6CbImkvOEjQVYMxECk+K6rWRIMOHW6KBzRg9/s21CcO06CCQuifCnNIuPM
 DLtTGRsNBV9+RP7RkKEQtTHxkDStJsVpxWhEyp2uuVpa7LZUOwRsefH7zt3x5xxtE3Rw
 jBxhilqSvKV36qQqmDgWRfa/KkwJViqVJHoVKJpG2TApYijPfraZ1cCDRZ+O2l33XCUn
 +DWhp59UwL6MRBU/rdKxBtRRzrph/kfyDMCg0jtWmRVeo75MWJTwAY/MEMaiJZNm1MkL
 COsK8scA2Zjcaw1m5dSWkCqTBPUek6uDsE28gGHtTYls3sRCkp9VbCusnIJURMIp4PyY
 XMYg==
X-Gm-Message-State: AFqh2krzpw90XABAqNmGrbe4htux8eGqAN6jIigiMaAh3wvxcCAjk+n0
 uBIKF1ZU2VhVaMIPBGj5f6m2ZGldxUNfcu9b
X-Google-Smtp-Source: AMrXdXuxt8auB3STZf3mptCtVxCY704tEyjJBGZhzJxct5mkriJZ9+vGxjp8WIHAk6b02Er+m0AXTA==
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr24158285wmb.0.1674480964017; 
 Mon, 23 Jan 2023 05:36:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/26] hw/i2c/versatile_i2c: Replace VersatileI2CState ->
 ArmSbconI2CState
Date: Mon, 23 Jan 2023 13:35:36 +0000
Message-Id: <20230123133553.2171158-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In order to rename TYPE_VERSATILE_I2C as TYPE_ARM_SBCON_I2C
(the formal ARM naming), start renaming its state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230110082508.24038-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/i2c/arm_sbcon_i2c.h |  3 +--
 hw/i2c/versatile_i2c.c         | 10 +++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index f54d1e54135..0101422d9dc 100644
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
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 52a650f45ee..ee095762e57 100644
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
 
-- 
2.34.1


