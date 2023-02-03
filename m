Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53068A148
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:11:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0WW-0003Bt-0O; Fri, 03 Feb 2023 13:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WU-00033W-5e
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WR-0008VF-Dx
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6605768wma.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/uz1xCSDOP+6dyc1BIJtE4kgUr4oayD/9Q5I8vW7Pg=;
 b=rs57IDWy4ex+nQZQeb0ZdIEk31Xy11/nJRW20rReogKUl4KeTcl3cc8D8LgRDr/zB+
 u1xu9JIMluXipYjm6yV9E/vCM1QV81BfzX0tAdIVcQnw3SCt52ft5tbmv43LCl6DvtTH
 +QXN/gSlICEsSY7Anmepv49+d8lBSk9UIxVr0gIISD9X1Ok3aWpRr7HtqqsuJSk7XLTn
 fVD6/NnMCZOT/f2RbzUvvj+eDfPcB+/4tofTKLsSRibABiwE6rlqpTGNK5Eo76e31gJO
 dbSu47RseekPIV/lwoCjG8G/2gpwb7R4RXsh7j//TXCxI5TY2cP0XC26agoEOcURnJlX
 nvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/uz1xCSDOP+6dyc1BIJtE4kgUr4oayD/9Q5I8vW7Pg=;
 b=VZ37ATrOMwUfu8SDCLASDRUvt9C/LPuKHGaqP9E6i96u+e1E2kc3S0e9NDP21sPno7
 5J+IxzeIVWfY4bYsuJeKB9BTJTas9HnP3NYby0gmN0ecQpTJ2ZA1EfyzJPH0RjCu8b8T
 tMu6nvKcVB7FFU4Jv7Lc2gH+R8vVIYKRJC8M2EsyYi8FeK0EcvwmcJpFkhD17QVxBioo
 FoaQqllPJSra+E+7423j2DHoeeJujKTuEAm7gsSElPn7Kp/9kIicvu83vS2YdzoZbzjp
 KNPNmP4KT7XsSU3BXAeWMZyPg9IijTnZ1iy4G6a0rqBFb19KRlDuLaXD4CfmElXtV42Y
 YsxQ==
X-Gm-Message-State: AO0yUKVPuQhTrkqIP7SdkYmCMVtmAxSWVs67Mao+244PVsbbPO6WUfob
 eLi6MCQPA7Bdrx1Oovw3O6/hxChLODqG0uY8
X-Google-Smtp-Source: AK7set/UQPHJbaivQObW3mjose4JOUwmr7paKMilq0UeHRneB+SQcpqKao3IOC5rr9sj8rTstH09aA==
X-Received: by 2002:a05:600c:5543:b0:3df:5eb:828c with SMTP id
 iz3-20020a05600c554300b003df05eb828cmr4955707wmb.32.1675447850564; 
 Fri, 03 Feb 2023 10:10:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a05600c43d500b003dc0cb5e3f1sm3231511wmn.46.2023.02.03.10.10.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 18/19] hw/rx: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:13 +0100
Message-Id: <20230203180914.49112-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rx/rx-gdbsim.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 47c17026c7..5d50f36877 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
+#include "hw/qdev-properties.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
 #include "sysemu/qtest.h"
@@ -99,12 +100,10 @@ static void rx_gdbsim_init(MachineState *machine)
 
     /* Initialize MCU */
     object_initialize_child(OBJECT(machine), "mcu", &s->mcu, rxc->mcu_name);
-    object_property_set_link(OBJECT(&s->mcu), "main-bus", OBJECT(sysmem),
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->mcu), "xtal-frequency-hz",
-                             rxc->xtal_freq_hz, &error_abort);
-    object_property_set_bool(OBJECT(&s->mcu), "load-kernel",
-                             kernel_filename != NULL, &error_abort);
+    qdev_prop_set_link(DEVICE(&s->mcu), "main-bus", OBJECT(sysmem));
+    qdev_prop_set_uint32(DEVICE(&s->mcu), "xtal-frequency-hz",
+                         rxc->xtal_freq_hz);
+    qdev_prop_set_bit(DEVICE(&s->mcu), "load-kernel", kernel_filename != NULL);
 
     if (!kernel_filename) {
         if (machine->firmware) {
-- 
2.38.1


