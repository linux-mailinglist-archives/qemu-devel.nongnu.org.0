Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6395C69237F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:39:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWQC-0001b7-Um; Fri, 10 Feb 2023 11:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPu-0001NY-BP
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPr-0000Ht-Um
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:29 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6677017wmb.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWcvQknD/lsP28cONSk1Clq7qvez3jPkPtVzdhOOOJk=;
 b=vGwwtV6DzmFLbxsdZpxIprsKJuG70CrTDeMlBGFU0q7ib+Z32rZwKKLfWj2eJIwqYv
 DW44mgYTi28C37FsseZ/uo+GL28c0uQ+qDk0xqxEAvE6B7wMRVRoVUBcnCL0+LgNIPvi
 5sZMpunm+yyRerIwLWSBUETFwtctiPF1hFue0mKM06zHTcdM+OyPbTakgGosG8VhiNm1
 ZPDTKzduKqyodQdVR7lo3fSEs/SKqzfeOTGiXxRB8fMKGuqsDntUAdQLQErtqD+xR5WD
 h585u8zU8OxGZK70D3KWQV9Fr4yitJadRSwY8A0knR1mU58XYo0tTnvfJ5wJ0lQjlcoB
 5CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWcvQknD/lsP28cONSk1Clq7qvez3jPkPtVzdhOOOJk=;
 b=nnyXmcKeZdcqFrDNymZnEnGMVgQ22Apc1h4fV7BmEbf2z3XxkO/xevwRafSiHiC5Zb
 6AWZYAaAWTMerrNjZ/2Fc/abbMxkWhJCqxuVCVinplDIRtDcTVxoEWB9/LARuwrz0r0N
 qV06lsC9R1cTkUfIXUcXTNqgn+LqxiTgglhkAxEsA2EpSR3VfnD4yQ4Bq3r8l39FLFVv
 JROsWcxeEhbDiJw4iHH/ng7IoUE8sGrSJ5EF8fNyf98n9VFxK2l34zyoV35EawEE5GPE
 GK+CH9x15sAzKOLnRTgD94wMOSlbCw0/GyUUMEhWJiuOsR82b7ieKgGtH7SK11i/7wzR
 XWBA==
X-Gm-Message-State: AO0yUKVWxACSmAV69oBd+IL5c37OrSK+eh2wSFcLLB6ILgKz/DzADC1D
 IQx6P1lK9f4ETWI2jSugi1MiYmmzre6YNO7u
X-Google-Smtp-Source: AK7set8bEIk+G9FXusJh3KkT3NlP+iUreFW5UQVgVVYuN2ayP4v7VLl3A8ly7H55uQRG7JD1Q8Z92Q==
X-Received: by 2002:a05:600c:a295:b0:3dc:40a0:3853 with SMTP id
 hu21-20020a05600ca29500b003dc40a03853mr2540528wmb.11.1676047106331; 
 Fri, 10 Feb 2023 08:38:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1c4c06000000b003d1d5a83b2esm8273180wmf.35.2023.02.10.08.38.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/11] hw/isa: Un-inline isa_bus_from_device()
Date: Fri, 10 Feb 2023 17:37:41 +0100
Message-Id: <20230210163744.32182-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

No point in inlining isa_bus_from_device() which is only
used at device realization time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c     | 5 +++++
 include/hw/isa/isa.h | 6 +-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 4fe61d6dfe..5bd99379e9 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -162,6 +162,11 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
     return qdev_realize_and_unref(&dev->parent_obj, &bus->parent_obj, errp);
 }
 
+ISABus *isa_bus_from_device(ISADevice *dev)
+{
+    return ISA_BUS(qdev_get_parent_bus(DEVICE(dev)));
+}
+
 ISADevice *isa_vga_init(ISABus *bus)
 {
     vga_interface_created = true;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index e81cd33e3c..1691364011 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -87,6 +87,7 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
+ISABus *isa_bus_from_device(ISADevice *dev);
 
 /**
  * isa_register_ioport: Install an I/O port region on the ISA bus.
@@ -124,9 +125,4 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *portio,
                              void *opaque, const char *name);
 
-static inline ISABus *isa_bus_from_device(ISADevice *d)
-{
-    return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
-}
-
 #endif
-- 
2.38.1


