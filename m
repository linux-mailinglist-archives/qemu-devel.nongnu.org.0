Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AEC6A4482
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe9W-0006zs-9Z; Mon, 27 Feb 2023 09:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9Q-0006sl-8I
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:48 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9O-0000D1-IP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:47 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so7261471wms.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kei66XFAQeNAInQ8LiWStrDU7P2WNcF9VLRH7Ag0OZQ=;
 b=czKZFykfWWwDIElRiKIqXCd2i44ejpQ52ibcHcPKMphz6f1WWugrHyW1gr2iDssf5+
 HJW7axmlJusMfgyIZgF0eeouey+uF5WJ2KyiGDMdsF2i4oRbTekJpdzWurOufpOuhqr8
 3qoMfUSnQ496zIhLnXV19umGOcqsK84P+kRSn0P8JwxesL0DyqGtRsgXyvNFVhTM3XgL
 auWP3ejbiQW5IiIIqFP7d7dO32C66G6AFYPsGMtxO1QhXJMn7lPR8RjhTLRENbnORRNZ
 XJa7Fs+TQqxk3bZgpqji5grvOHijgzLxFeuSHCaey0Dv8parXbgU9pelVzGnJiwJlUep
 IZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kei66XFAQeNAInQ8LiWStrDU7P2WNcF9VLRH7Ag0OZQ=;
 b=kwwkBCZpNKsjSNZthHfUCG7nXo3uX8bQH+Oy/bQqmvwVg0j6bCDslpDoCg7F5IML4f
 hUS3ZiKHMBhAVdQlxwi0jk1fyYkFfytuqWr8rVzl7uTeBH7h1pwA+8RPV+2jbC16I/eM
 u5V9LaUWfwoNKwxJ1ZyDVnSX/AWNESBi9SjWgCEmZVzUvry0zQUWRBKq4/bZGvb2r/Ko
 OXXlzR2Uh8kwgM3bMcYbsoLKH8vhfIUCY6OV5QHoiyJti6PX6LUNl50UhBPhgE8zqW9a
 3FnBI1WvKJCGiTQf9UEQLrcd4bndOsafNXqpOtb2LPYKkhqWgPm6lo5tf2MEraYMAiT7
 gWnA==
X-Gm-Message-State: AO0yUKXivbJdv5+PEcyKhVek4IqIKLR634MLXD1gKIkGsst3cvrzrpTX
 MAm9j3FrsqCzpbvzsBL6sfDLhA0UHh18gAjG
X-Google-Smtp-Source: AK7set8SjYkOnKDEtoOSxKgPE/axsGLLALmoTB8kzWjLwZfW5Be7NeiU7DFWxkLjypBDmpq+4brE0g==
X-Received: by 2002:a05:600c:251:b0:3ea:f73e:9d8a with SMTP id
 17-20020a05600c025100b003eaf73e9d8amr11397617wmj.30.1677506805020; 
 Mon, 27 Feb 2023 06:06:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d464e000000b002c558869934sm7288427wrs.81.2023.02.27.06.06.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 059/126] hw/isa: Reorder to separate ISABus* vs ISADevice*
 functions
Date: Mon, 27 Feb 2023 15:01:06 +0100
Message-Id: <20230227140213.35084-50-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Separate functions taking an ISABus* argument versus
functions taking a ISADevice* one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210163744.32182-8-philmd@linaro.org>
---
 include/hw/isa/isa.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 7195bfb96c..34fa8977e9 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -70,12 +70,8 @@ struct ISADevice {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
-qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
-void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
-MemoryRegion *isa_address_space(ISADevice *dev);
-MemoryRegion *isa_address_space_io(ISADevice *dev);
 ISADevice *isa_new(const char *name);
 ISADevice *isa_try_new(const char *name);
 bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
@@ -83,6 +79,11 @@ ISADevice *isa_create_simple(ISABus *bus, const char *name);
 
 ISADevice *isa_vga_init(ISABus *bus);
 
+qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
+void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
+MemoryRegion *isa_address_space(ISADevice *dev);
+MemoryRegion *isa_address_space_io(ISADevice *dev);
+
 /**
  * isa_register_ioport: Install an I/O port region on the ISA bus.
  *
-- 
2.38.1


