Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A7698294
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:45:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLpI-0000fT-Ks; Wed, 15 Feb 2023 12:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLpH-0000fA-1Y
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLpF-0008Dy-HD
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id by3so18659946wrb.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vz35UX4luoMUaqbzTcDDIbvcjgeBkxbh135cUjhEHMo=;
 b=yowuVGL7oMXH61gQZvS6cQqkgZm8BocUdDiMLffKX5wVEPHygVvBzk8k0YGLyjZ0NI
 bQlOVBLDdtlQRPbUP5QQAT6ldo1lLIHrMbFA3uT5qVxOGCeLADLn/cxXLDqql2CVYdmJ
 FqVGuQLxjAbAKvb4wAKxWcTCv31Ivp+ASPsR3Z0HZTzUuF+OjeJbg66Gy79h8HSaYVKx
 wfQd/3YIxgXU6DMsp08+5QEJt5IWOgJLjS8+dFXzRMLwidPwif6Ax+A3QSC+6r8ejNxP
 RpoklAoNBnE4Lq3buUfJgPxJ9K4fB9XUfaEY9jqjb3lAo06ZFQ9gtaOvd3Qk/ryDqYdw
 5Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vz35UX4luoMUaqbzTcDDIbvcjgeBkxbh135cUjhEHMo=;
 b=qD00VXZCp3wbdiwN3u6o5cMl56baFH/YkYloxUVHNWQmj1+qyo04wSYDamt7Z/DahD
 YFa8MUFY6Yd5osAKP5oursQx30pmapJoKwaK0s9kzY1XA+/zvmXDPbhf2k51eXiAyTm5
 hk1TlYpOHkSe6mfRo81RjSxbKcWUedntCfLmwnmS7TOXjFc5GyrHqJrSq92ZuJKNS8q3
 S5L2XQi1oBtLLCGNv5E1Pm1nGma9dh0/KR5eBmOerCMtRAY/1ATIiCst8I1LXQgatbu+
 nvc5rt7Np8FGgHLqLfknbsLbmth2QpC16isPLs7/Ilpkg9hsVc976tw4CDEfwBzm242o
 wqaQ==
X-Gm-Message-State: AO0yUKXcBSjZhm0xwWfoYE4LTGi95maNNuklaguXMVdU8WArcurTgf44
 trPZtZ/3CPsgbIdauzbeg7mW/bMfsPLl7zNG
X-Google-Smtp-Source: AK7set/xn5Ccsu5wveg0hA8LklsQ+9ymklxMsebESI86/qV1Z+xqiOKNeIuLLMvRjwl0dPZDKqPv8Q==
X-Received: by 2002:a5d:4b06:0:b0:2c5:4b93:ee44 with SMTP id
 v6-20020a5d4b06000000b002c54b93ee44mr2256030wrq.60.1676483052008; 
 Wed, 15 Feb 2023 09:44:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4ec9000000b002c567881dbcsm4363915wrv.48.2023.02.15.09.44.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 09:44:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/i386/pc: Un-inline i8254_pit_init()
Date: Wed, 15 Feb 2023 18:43:51 +0100
Message-Id: <20230215174353.37097-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215174353.37097-1-philmd@linaro.org>
References: <20230215174353.37097-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

pc_basic_device_init() is the single caller of i8254_pit_init()
with a non-NULL 'alt_irq' argument. Open-code i8254_pit_init()
by direclty calling i8254_pit_create().

To confirm all other callers pass a NULL 'alt_irq', add an
assertion in i8254_pit_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c             | 10 +++++-----
 include/hw/timer/i8254.h |  5 ++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 79297a6ecd..fe95f6e9f2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1258,8 +1258,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
 {
     int i;
     DeviceState *hpet = NULL;
-    int pit_isa_irq = 0;
-    qemu_irq pit_alt_irq = NULL;
+    qemu_irq pit_irq;
     qemu_irq rtc_irq = NULL;
     ISADevice *pit = NULL;
     MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
@@ -1301,9 +1300,10 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         for (i = 0; i < GSI_NUM_PINS; i++) {
             sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
         }
-        pit_isa_irq = -1;
-        pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
+        pit_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
         rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
+    } else {
+        pit_irq = isa_bus_get_irq(isa_bus, 0);
     }
     *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
 
@@ -1314,7 +1314,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         if (kvm_pit_in_kernel()) {
             pit = kvm_pit_init(isa_bus, 0x40);
         } else {
-            pit = i8254_pit_init(isa_bus, 0x40, pit_isa_irq, pit_alt_irq);
+            pit = i8254_pit_create(isa_bus, 0x40, pit_irq);
         }
         if (hpet) {
             /* connect PIT to output control line of the HPET */
diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index a0843cae07..0d837f3f41 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -59,9 +59,8 @@ ISADevice *i8254_pit_create(ISABus *bus, int iobase, qemu_irq irq_in);
 static inline ISADevice *i8254_pit_init(ISABus *bus, int base, int isa_irq,
                                         qemu_irq alt_irq)
 {
-    return i8254_pit_create(bus, base, isa_irq >= 0
-                                       ? isa_bus_get_irq(bus, isa_irq)
-                                       : alt_irq);
+    assert(isa_irq == 0 && alt_irq == NULL);
+    return i8254_pit_create(bus, base, isa_bus_get_irq(bus, 0));
 }
 
 static inline ISADevice *kvm_pit_init(ISABus *bus, int base)
-- 
2.38.1


