Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21806AFAB4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh2S-0001LX-5M; Tue, 07 Mar 2023 18:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2Q-0001Hn-JD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:10 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh2O-0002kH-PS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:10 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v16so13844939wrn.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wq29WJt1laPzE2bHEihgtyn5T2vm3Jo6XB+Kog9d3Iw=;
 b=w1Gy5vsUEfSqRnLfEPGbFFWtL86IBn3FwT3iBIF8AvZjsrofTQHbaJrHAsobCOZc5X
 K2NEt59of3uLkdmJhP+QUuk4phOovugZzHj7ygBhCbU7y6KFQR0zrONAB5MkmnvdRM27
 CB3j17FdRcoXSwSZlWHTBUssb8pjyzFZZ/0KA+ucUpgN2cry3i39PSsYSKwU6UhmnA5W
 dlyl1r2Qk8x+d/PcbAiuNVMTDSesEnKfXmsMfOeUeZDxqicVgGlxlVbHi5EvgiTAFEgp
 eLS8TTG2o/uNk98vy99gZXVS1aQ3AriLV+dhNAqZCDQV02HenfzeddN0ZAzP8aYrRqgo
 mJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wq29WJt1laPzE2bHEihgtyn5T2vm3Jo6XB+Kog9d3Iw=;
 b=N7smRDV0GWk9zcYl/GhgbC5xKess6QaDZtv0mrpFNV0vL5hTBJepgyyUntNhJ4zv6n
 Pb7gxyVUo591+hy85CzYncf5VdqVQAECmcM1UPuwS9o0J6SWTpgPWbtsIX4EGesd9DjK
 aoTgG/Mvp+IAWD36/Kpgi0WO5n2QsxbbSsoNcgmswfSd2Ze5fwkLZGBMDjxijy7l4tVI
 CmaQ/A4UgkG9s/prqA/VE5KFCtRxty1lKGrIU/NiQ3mn9Duj3vu5hDI7Q4T9NOU1PFpu
 wdCJheSlqDdo0zYEY5MUHossl8iRndof2OkxTa6C14XDm86LGpB4akMVMjM8x2igRR4D
 lDuQ==
X-Gm-Message-State: AO0yUKXUaEBcmCF8NjtDSR+HdDQo0AQriv2pwjRrPY1vdLfnxBu0XWnA
 6vQseEmnNQF6qY5dRSPx4cMQzm29l76roTQzxNs=
X-Google-Smtp-Source: AK7set96lqYGxmJMa1ktJzF0cfxhkzACLk/7Qb/McBsMDNSoPmyA+xUwHqsSmWXjdiMk3hYhbrMu6A==
X-Received: by 2002:a5d:664e:0:b0:2cd:defe:cfd3 with SMTP id
 f14-20020a5d664e000000b002cddefecfd3mr11249576wrw.30.1678232886458; 
 Tue, 07 Mar 2023 15:48:06 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b002c569acab1esm13729260wrm.73.2023.03.07.15.48.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PULL 09/20] Revert "hw/isa/i82378: Remove intermediate IRQ forwarder"
Date: Wed,  8 Mar 2023 00:47:00 +0100
Message-Id: <20230307234711.55375-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

To be 'usable', QDev objects (which are QOM objects) must be
1/ initialized (at this point their properties can be modified), then
2/ realized (properties are consumed).
Some devices (objects) might depend on other devices. When creating
the 'QOM composition tree', parent objects can't be 'realized' until
all their children are. We might also have circular dependencies.
A common circular dependency occurs with IRQs. Device (A) has an
output IRQ wired to device (B), and device (B) has one to device (A).
When (A) is realized and connects its IRQ to an unrealized (B), the
IRQ handler on (B) is not yet created. QEMU pass IRQ between objects
as pointer. When (A) poll (B)'s IRQ, it is NULL. Later (B) is realized
and its IRQ pointers are populated, but (A) keeps a reference to a
NULL pointer.
A common pattern to bypass this circular limitation is to use 'proxy'
objects. Proxy (P) is created (and realized) before (A) and (B). Then
(A) and (B) can be created in different order, it doesn't matter: (P)
pointers are already populated.

Commit cef2e7148e ("hw/isa/i82378: Remove intermediate IRQ forwarder")
neglected the QOM/QDev circular dependency issue, and removed the
'proxy' between the southbridge, its PCI functions and the interrupt
controller, resulting in PCI functions wiring output IRQs to
'NULL', leading to guest failures (IRQ never delivered) [1] [2].

Since we are entering feature freeze, it is safer to revert the
offending patch until we figure a way to strengthen our APIs.

[1] https://lore.kernel.org/qemu-devel/928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com/
[2] https://lore.kernel.org/qemu-devel/cover.1677628524.git.balaton@eik.bme.hu/

This reverts commit cef2e7148e32d61338de0220619d308bf42af770.

Reported-by: Thomas Huth <thuth@redhat.com>
Inspired-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/i82378.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 233059c6dc..5432ab5065 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -47,6 +47,12 @@ static const VMStateDescription vmstate_i82378 = {
     },
 };
 
+static void i82378_request_out0_irq(void *opaque, int irq, int level)
+{
+    I82378State *s = opaque;
+    qemu_set_irq(s->cpu_intr, level);
+}
+
 static void i82378_request_pic_irq(void *opaque, int irq, int level)
 {
     DeviceState *dev = opaque;
@@ -88,7 +94,9 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
      */
 
     /* 2 82C59 (irq) */
-    s->isa_irqs_in = i8259_init(isabus, s->cpu_intr);
+    s->isa_irqs_in = i8259_init(isabus,
+                                qemu_allocate_irq(i82378_request_out0_irq,
+                                                  s, 0));
     isa_bus_register_input_irqs(isabus, s->isa_irqs_in);
 
     /* 1 82C54 (pit) */
-- 
2.38.1


