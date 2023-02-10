Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32369236F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWQ7-0001NZ-Bp; Fri, 10 Feb 2023 11:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPr-0001Js-Rp
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:27 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPn-0000Hb-1J
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id n13so4224617wmr.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=789ooQfaoGTNLsCSsIVAXNSCAD6XOwXp+1Wop0X/7+8=;
 b=EjVc1K69YB+Oewq2eNrpQ5H6wBU8amXtPamYOi2/QR98uEAvjtQ9VX8g9r+8Ejtjtm
 /E7qIl/6RRNQIHJsF3JJzTvJ7JbcVFQ4MWibXApbbVWfuzTn7OoHVp6TSldbJAiLkdG8
 E3bSiH8sJI7ZywcZRmlIZvzFRKE/45o9Oa+/mMXoCuHj108HmGPTtcQspidbPkxT4+Uf
 AqoYXzGkuH6UDZYvWOCHjRkpAbfJ6RxXsMTZ4/0ytqAPQEeNe7LcJctmp6Qe8ZXwSXBT
 EbT7sChduQK3DvF3e5KDYgYMopBpnWZOIk+xJk8VNuFsUFdXtaneNGFxKQ+5OevpZtQt
 iNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=789ooQfaoGTNLsCSsIVAXNSCAD6XOwXp+1Wop0X/7+8=;
 b=4EVqnUEXlUGZWdHeKABv9O8poLpPqTQJogE0oqcqDN+4gssaF3zN8ns+YuFDcM/d+m
 jFYPZ1giIEN/9HipzigB8OqfWUSGjssnZGfvXnadbzSOd4jlQM+Hc6hfxgCvXR+Dgc4A
 4XInWgrk+6IhUrJ6GYsHLivTbjWtSTFM0Umfiidcz7HT1pmuRuDCohy4xxISrPhjZCWo
 Nk+jeOZtl8Mnp8gpt/guX/x2fQJ2ena1WYUGQ2HNCVgox2s3faVjuGw4cH/6eEtIF+KL
 pJL2A+ivl+orKkKcwi+S2Fi/reTtEyhLqyELTuRz1uX+vkP9ZUAuP4V2132ERrl8FZUu
 io/Q==
X-Gm-Message-State: AO0yUKWM4VXVfXJCM1kYIn9ev8PaJzdjTMHFwf1ng97Ynkk/G7jv5xEA
 WWGtAz3LWGX6uD6p4klssF2s0GZp1qO48zL1
X-Google-Smtp-Source: AK7set9Iw7IJcEA0wE5x7Irty4XsEVvAlu+UST+v3aqQ7uuppbNmUZO2ku/6sLlBQILvKZa0IcFkog==
X-Received: by 2002:a05:600c:2e89:b0:3e1:bfc:d16e with SMTP id
 p9-20020a05600c2e8900b003e10bfcd16emr10833011wmn.39.1676047101615; 
 Fri, 10 Feb 2023 08:38:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b003e0238d9101sm6544038wms.31.2023.02.10.08.38.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/11] hw/isa: Reorder to separate ISABus* vs ISADevice*
 functions
Date: Fri, 10 Feb 2023 17:37:40 +0100
Message-Id: <20230210163744.32182-8-philmd@linaro.org>
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

Separate functions taking an ISABus* argument versus
functions taking a ISADevice* one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/isa/isa.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 25acd5c34c..e81cd33e3c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -74,12 +74,8 @@ struct ISADevice {
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
@@ -87,6 +83,11 @@ ISADevice *isa_create_simple(ISABus *bus, const char *name);
 
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


