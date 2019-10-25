Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C1E46D5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 11:14:49 +0200 (CEST)
Received: from localhost ([::1]:57952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNvgG-00061T-Bi
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 05:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <christophe.lyon@linaro.org>) id 1iNvag-0003Ip-VT
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <christophe.lyon@linaro.org>) id 1iNvaf-0004g3-61
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:09:02 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <christophe.lyon@linaro.org>)
 id 1iNvae-0004fL-Sw
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:09:01 -0400
Received: by mail-wm1-x344.google.com with SMTP id n7so1234409wmc.3
 for <qemu-devel@nongnu.org>; Fri, 25 Oct 2019 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=T2Z4YHKvtz2RFJb2xofyZipBdt3nobxmh7q3mnQybHk=;
 b=nVj66Ax4XUPAPAohSfDgRY+kwJQF3vveiM6/fEN4sWHAdKoa6GuU86h7sX6HCpaDbd
 0t9DJ53T/LAQlC2i5jnIu5ZdLXWltqWSqvo4GiaxrRtAV4qU1o6xDiv+rGlSAjveHv/Z
 IoPPhVvC8vN8Q3vQX7QBXtFlkmIBItBhC0F9IyBjEUyoIBfgKq8S808A8pROfHbe8j8d
 KkIbkFeIFcX33W05+dZ4W8umB9WdFm9bFfRbDQWMZu4LiYRhz4tUfQDhZmhdj693Cj70
 y36sMosei9k4HXdPioKbTXuBhCcIYS+CmfzgRujSUYYro3xhBLtsLp6wQG9NnA8IcHMo
 b1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T2Z4YHKvtz2RFJb2xofyZipBdt3nobxmh7q3mnQybHk=;
 b=K1GQ1R0HiIiaCChzBSBKL/NIq4ldPCgyXE69ZyhNt/bSuFcRXVvDKNCRy2pCLqXT+s
 vkDeRSfDQtnrZVPgqw+pXuRG7ZGyjO1siExpGuts/Qp/9yjLspHrG6ivz8sYbgu+JlOr
 Fg4iAmK9JP/5ikw3m53IpC5ZfiFXXoFjovWLckkGVG0j8b+626TmWuAFk5B71C6Kkdo3
 AGGbj7rZuR1f/lO19g2dlKsPJQr4SWHoRsLvAD9btWWcx/EjdcqIRwhzal+2d6iekIKI
 zZHGKneKkIMxsijGV4BPZehpDF7HTli8ezi+1mVLsW6wY76XLCCMHQovJBnoSYa2PvH7
 xD/w==
X-Gm-Message-State: APjAAAWXRwjCN7p9ba2P3+FkedJzSMCTNL9528yrziCgwP3LwQRozBF3
 i3AqqICqZYgIYSYvcxNffyaPAgZ2Ge4=
X-Google-Smtp-Source: APXvYqyr5n2pVdi/mD4jdEV7Oa5OtfXm41nutlhU0Vs4jw3Q5HKxulLSuoB6Ho4IvyYgUgJ5olOYvQ==
X-Received: by 2002:a05:600c:143:: with SMTP id
 w3mr2316378wmm.132.1571994538815; 
 Fri, 25 Oct 2019 02:08:58 -0700 (PDT)
Received: from babel.clyon.hd.free.fr ([2a01:e0a:283:3130:606f:6dc3:545e:fa5c])
 by smtp.gmail.com with ESMTPSA id b186sm1286199wmb.21.2019.10.25.02.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:08:58 -0700 (PDT)
From: Christophe Lyon <christophe.lyon@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] target/arm: Add support for cortex-m7 CPU
Date: Fri, 25 Oct 2019 11:08:41 +0200
Message-Id: <20191025090841.10299-1-christophe.lyon@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: peter.maydell@linaro.org, Christophe Lyon <christophe.lyon@linaro.org>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is derived from cortex-m4 description, adding DP support and FPv5
instructions with the corresponding flags in isar and mvfr2.

Checked that it could successfully execute
vrinta.f32 s15, s15
while cortex-m4 emulation rejects it with "illegal instruction".

Signed-off-by: Christophe Lyon <christophe.lyon@linaro.org>
---
 target/arm/cpu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 13813fb..ccae849 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1954,6 +1954,37 @@ static void cortex_m4_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x00000000;
 }
 
+static void cortex_m7_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    set_feature(&cpu->env, ARM_FEATURE_VFP4);
+    cpu->midr = 0x411fc272; /* r1p2 */
+    cpu->pmsav7_dregion = 8;
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x12000011;
+    cpu->isar.mvfr2 = 0x00000040;
+    cpu->id_pfr0 = 0x00000030;
+    cpu->id_pfr1 = 0x00000200;
+    cpu->id_dfr0 = 0x00100000;
+    cpu->id_afr0 = 0x00000000;
+    cpu->id_mmfr0 = 0x00100030;
+    cpu->id_mmfr1 = 0x00000000;
+    cpu->id_mmfr2 = 0x01000000;
+    cpu->id_mmfr3 = 0x00000000;
+    cpu->isar.id_isar0 = 0x01101110;
+    cpu->isar.id_isar1 = 0x02112000;
+    cpu->isar.id_isar2 = 0x20232231;
+    cpu->isar.id_isar3 = 0x01111131;
+    cpu->isar.id_isar4 = 0x01310132;
+    cpu->isar.id_isar5 = 0x00000000;
+    cpu->isar.id_isar6 = 0x00000000;
+}
+
 static void cortex_m33_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -2538,6 +2569,8 @@ static const ARMCPUInfo arm_cpus[] = {
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
                              .class_init = arm_v7m_class_init },
+    { .name = "cortex-m7",   .initfn = cortex_m7_initfn,
+                             .class_init = arm_v7m_class_init },
     { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
-- 
2.7.4


