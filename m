Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C412692380
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:40:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWPm-00010E-32; Fri, 10 Feb 2023 11:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPj-0000k8-Bc
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:19 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPh-0000B9-Ot
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:19 -0500
Received: by mail-wm1-x32f.google.com with SMTP id u10so4231028wmj.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEO0iz2+8eqHQfeG9sdi6MqymoLkqqNq3DUXOt6Jl6Y=;
 b=j1qSxQ+kCoZA57myLtiQ65H3pOAdWI9GlycxEiDAF+nhOm/SYM0ZRGe3/UQp+I/O7w
 vXDxg/eJ+zoyjiSZibgc8Yi2pDhjZL35gyU5Qfl53udVtiqDweOTRStbbq+YxMfj3Hhi
 KHipVrLA+H2LxsjLGHXtqnpIikYOMs3U8kRjuuQShMZk9W+Td2fE5crNiNSojjSuCGqy
 OPadiwder4UxG+E1mhI/0mmvnJjISQgSi13LIqzWHSELQJf7RVE65WfXUhlTQoMWhCLl
 +nNWzVTUOgAe6y5Za8aKuUgIxRLHn5w/BX6xXLbgo8rtnTBVf2D0QObvPI6y49wkL8K7
 kMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEO0iz2+8eqHQfeG9sdi6MqymoLkqqNq3DUXOt6Jl6Y=;
 b=w6UscxnDvBVaYuUhjahmQ0zNAVb4+IhKf2S3GIIe69ncTNJAyPpeJG2+5EPm418irv
 R0GEOljfuZDdIKk3KsZc+2a55af8n29M1a/CYYQjPsT/7GKxBYATuL2HzjYi7Hawjw4Y
 LUNaqEsWmBzddFashbcjlBlrTRT7cBbBvEfkGdVf4a3dktAuDFmJqosi243IPMsTbe/e
 Il9F3hjFxt0OqACmck+Ufh+reFPHAr7yzqVUPQETfo+B1Qkdajqz04WJsj8lOlqQHewj
 YAa23eryqSe3Vb2SJqg4Cp3Mxlb5DVVgwiXtIfqRW/JcGsEWdF8S1laNX/udspTtWC4G
 UyJQ==
X-Gm-Message-State: AO0yUKXP5KYwECu04VhAjlkA0gFIYS6mxjHrCYBr5fpJshY4HLe1GAWM
 olQuNfOc8hD++IKHV/x4bZd/9Vs6/XAEp2z/
X-Google-Smtp-Source: AK7set9VLlIRig0HWeJjLFKonGbxTegs8CIEeDb3sgpGVQDrQB/Hxq8YSQ2bH15Ks3auiSEkWHq05A==
X-Received: by 2002:a05:600c:4496:b0:3dc:de85:5007 with SMTP id
 e22-20020a05600c449600b003dcde855007mr13279149wmo.21.1676047096878; 
 Fri, 10 Feb 2023 08:38:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c080700b003daf672a616sm5110843wmp.22.2023.02.10.08.38.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 06/11] hw/sparc64/sun4u: Keep reference to ISA input IRQs in
 EbusState
Date: Fri, 10 Feb 2023 17:37:39 +0100
Message-Id: <20230210163744.32182-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Keep reference to ISA input IRQs in EbusState.

To emphasize input/output distinction, rename arrays
as isa_irqs_in / isa_irqs_out.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sparc64/sun4u.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 387181ff77..8fe47e2c22 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -84,7 +84,8 @@ struct EbusState {
     PCIDevice parent_obj;
 
     ISABus *isa_bus;
-    qemu_irq isa_bus_irqs[ISA_NUM_IRQS];
+    qemu_irq *isa_irqs_in;
+    qemu_irq isa_irqs_out[ISA_NUM_IRQS];
     uint64_t console_serial_base;
     MemoryRegion bar0;
     MemoryRegion bar1;
@@ -287,7 +288,7 @@ static const TypeInfo power_info = {
 static void ebus_isa_irq_handler(void *opaque, int n, int level)
 {
     EbusState *s = EBUS(opaque);
-    qemu_irq irq = s->isa_bus_irqs[n];
+    qemu_irq irq = s->isa_irqs_out[n];
 
     /* Pass ISA bus IRQs onto their gpio equivalent */
     trace_ebus_isa_irq_handler(n, level);
@@ -303,7 +304,6 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     ISADevice *isa_dev;
     SysBusDevice *sbd;
     DeviceState *dev;
-    qemu_irq *isa_irq;
     DriveInfo *fd[MAX_FD];
     int i;
 
@@ -315,9 +315,9 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     /* ISA bus */
-    isa_irq = qemu_allocate_irqs(ebus_isa_irq_handler, s, ISA_NUM_IRQS);
-    isa_bus_irqs(s->isa_bus, isa_irq);
-    qdev_init_gpio_out_named(DEVICE(s), s->isa_bus_irqs, "isa-irq",
+    s->isa_irqs_in = qemu_allocate_irqs(ebus_isa_irq_handler, s, ISA_NUM_IRQS);
+    isa_bus_irqs(s->isa_bus, s->isa_irqs_in);
+    qdev_init_gpio_out_named(DEVICE(s), s->isa_irqs_out, "isa-irq",
                              ISA_NUM_IRQS);
 
     /* Serial ports */
-- 
2.38.1


