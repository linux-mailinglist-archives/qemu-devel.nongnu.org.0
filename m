Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E352EF52C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:53:50 +0100 (CET)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu5F-0005mL-Fl
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtop-00052H-U9
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:53 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxton-0002xz-9C
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r3so9442112wrt.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RIEXcwEpP45gL5u8u6zJ6MrAGVSM1NG0JUiUEWfKY+Y=;
 b=RIURHrBIziZX04Y0FApYfTu1/klV8QuKPR6IVgJ04d440r+vSdQetPOPl6dMyFIlzm
 dvUtcjpFjHobSgziG28N5XpvyCUKtxv/WDnYkBTrvF5/DyyZLogAwPq6zCM8NYkiioHp
 ffrpbnomfZpeZ6Z5IdU7hwB6IkSLggJ0fRQnrKsKm3iy29PiG8ytZ+RBUaHZCDFhgUBv
 UAAvqP6KNY32ojuFkv5lK9yhJJME+8AS3hfCrk+z3nmMzVnmfsGJSYlYcGszFWJfW2lT
 v74s8mw95MQBaivuu18LB+P2KryfPw1PxHlg6tEoMjuX8a24kEkG5GAhfmo2CZlmycMx
 5LUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RIEXcwEpP45gL5u8u6zJ6MrAGVSM1NG0JUiUEWfKY+Y=;
 b=F+z3g6haUKByuHX6ZNAN2xXssph9xA1WEeZq9wHV6iTUYokXRbdiyfIhraYkWQzK7n
 AkD0ggSD3koT0pt68nAvlKOs4jO2Q5hG9dM/RYmcwF7v8pN0naTSxyRYPiIKbnu008Pu
 ekuXDw3HiC0Ek2fo8oevLci9/JssyJcKjLcbPzRXOOC6YzOPmhEsLJBO1qzXXhQ3wdrw
 QmRtggBYAex1+hbR4poCCCh419M+j2JG+WtnShcc/Dz5d/VMsYZZKHdd+HeXc8ZeIHjB
 M7w5T0UP8lLX72r4MQN2J5PFfRmzc12RY5qSVet+M1MHNRIO2ThwHf2Gz1HbaO7m9cUG
 CNtg==
X-Gm-Message-State: AOAM530l9c7xrXRPjRibS82JsKlQ5K09ZO/9nq9axDlBym5gcFmX9EcU
 A3LePPGNAK21c7x8WcDsPzVPoOUxFv/jZQ==
X-Google-Smtp-Source: ABdhPJwXkX4oeRdmBryl4bcXbgC/D6P1N6CX9EfXiCeu1Q2SYsTPltYgeimXa5KH8PFr2a04L8TYcw==
X-Received: by 2002:a5d:4882:: with SMTP id g2mr4143008wrq.273.1610120207270; 
 Fri, 08 Jan 2021 07:36:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] musicpal: Use ptimer_free() in the finalize function to
 avoid memleaks
Date: Fri,  8 Jan 2021 15:36:16 +0000
Message-Id: <20210108153621.3868-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Gan Qixin <ganqixin@huawei.com>

When running device-introspect-test, a memory leak occurred in the
mv88w8618_pit_init function, so use ptimer_free() in the finalize function to
avoid it.

ASAN shows memory leak stack:

Indirect leak of 192 byte(s) in 4 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf555db84 in timer_new_full /qemu/include/qemu/timer.h:523
    #3 0xaaabf555db84 in timer_new /qemu/include/qemu/timer.h:544
    #4 0xaaabf555db84 in timer_new_ns /qemu/include/qemu/timer.h:562
    #5 0xaaabf555db84 in ptimer_init /qemu/hw/core/ptimer.c:433
    #6 0xaaabf5bb2290 in mv88w8618_timer_init /qemu/hw/arm/musicpal.c:862
    #7 0xaaabf5bb2290 in mv88w8618_pit_init /qemu/hw/arm/musicpal.c:954
    #8 0xaaabf6339f6c in object_initialize_with_type /qemu/qom/object.c:515
    #9 0xaaabf633a1e0 in object_new_with_type /qemu/qom/object.c:729
    #10 0xaaabf6375e40 in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:153
    #11 0xaaabf5a95540 in qdev_device_help /qemu/softmmu/qdev-monitor.c:283
    #12 0xaaabf5a96940 in qmp_device_add /qemu/softmmu/qdev-monitor.c:801

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 458b1cbeb76..6aec84aeed8 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -959,6 +959,17 @@ static void mv88w8618_pit_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void mv88w8618_pit_finalize(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    mv88w8618_pit_state *s = MV88W8618_PIT(dev);
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        ptimer_free(s->timer[i].ptimer);
+    }
+}
+
 static const VMStateDescription mv88w8618_timer_vmsd = {
     .name = "timer",
     .version_id = 1,
@@ -994,6 +1005,7 @@ static const TypeInfo mv88w8618_pit_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(mv88w8618_pit_state),
     .instance_init = mv88w8618_pit_init,
+    .instance_finalize = mv88w8618_pit_finalize,
     .class_init    = mv88w8618_pit_class_init,
 };
 
-- 
2.20.1


