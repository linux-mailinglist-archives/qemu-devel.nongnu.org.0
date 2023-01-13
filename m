Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE61669D1D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMIo-0003BM-Lb; Fri, 13 Jan 2023 10:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMI8-0002wY-MX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMI5-0006Zl-1G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:27 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso13310289wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e5EF39XPzrJs41yZ+ui/UtGx91WtVsmBYUeR//O1mUQ=;
 b=nFVmWjUZX6a6Hz/ufIYxAGI6TkrkPCoB/yXabLdqg4p0/of8r+p6ixWvnA2yDuqwRf
 e7HGDYt9uHS42kRweQtqAJ+4cHL9r+XyGyTyD3oOB8N0wVzxQ8kdKZYgjigqXusMFC+S
 2Kuh4fUwr+TTeT4nBG3QyjEh5aq+GvsB/8XGmps44nVDZ5JAxZlGpqiz0yjWqi9u4Tyc
 zXJ9haG7eA8hpdwGgbdgg/Yn2JwfyP0A+CHAESPZtnfy8yJfEHTcEIk+t5Q/46YUBrdf
 Zrs7XUT5KglLcvDoes6XvWP7VVyqgSercMZobZZaU0VekDwl+IHwA+SJPQ5ISXWV8VUS
 lezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e5EF39XPzrJs41yZ+ui/UtGx91WtVsmBYUeR//O1mUQ=;
 b=ICnewVo9wnZjHPPagnrUqeLlehkZEV55rDvWLNGFLPmJup9b+9K5LPkI8h2xrGJe+L
 40GhV9TaKyVboR4bjK9lcQbc6jAQIpxAgvoFKhBQYVEICQodnbEAxSwk6Z74d2eKCFAI
 7qrqGuDO4e3igMfFyY6Sunxs1ahUifLNUQ5NTxgxr4bGYlS3eO9gKXhkMRd1dU3peAnO
 rEetNgooVRHgCA3bGwihQV6g/gQGnQ+VGu2+CFTrjgb8tyoiA0kwyjPL3hxpTX3BbEdw
 /DJhDA4H2vci/u0hR/uM6jlRKu7fQr1gEof2r0OR0cUqPDHSyQ9TnBGkZBHeJERdDkfy
 z5rg==
X-Gm-Message-State: AFqh2kqUPhyRSHf1xrronhAQjquRkQxkgvFVfOwmx0+cJpMzE/T0eNeN
 muaf8qxDP3soCai8GcqZEMtdmDjPEB5cNWjY
X-Google-Smtp-Source: AMrXdXtN9YcrhcSbcRZVWo/rVodnphSq4rWRcGMD+szcdOeHEHhb1esrtYevl9OngGUGhhWfbXVgHQ==
X-Received: by 2002:a05:600c:2e44:b0:3d3:4406:8a3c with SMTP id
 q4-20020a05600c2e4400b003d344068a3cmr58317617wmf.32.1673624903455; 
 Fri, 13 Jan 2023 07:48:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm31241749wmc.13.2023.01.13.07.48.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 35/46] hw/intc/i8259: Make using the isa_pic singleton more
 type-safe
Date: Fri, 13 Jan 2023 16:45:21 +0100
Message-Id: <20230113154532.49979-36-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
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

From: Bernhard Beschow <shentey@gmail.com>

This even spares some casts in hot code paths along the way.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230109172347.1830-10-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/i8259.c         | 11 ++++-------
 include/hw/intc/i8259.h |  6 +++---
 include/qemu/typedefs.h |  1 +
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index cc4e21ffec..0261f087b2 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -55,7 +55,7 @@ struct PICClass {
 #ifdef DEBUG_IRQ_LATENCY
 static int64_t irq_time[16];
 #endif
-DeviceState *isa_pic;
+PICCommonState *isa_pic;
 static PICCommonState *slave_pic;
 
 /* return the highest priority found in mask (highest = smallest
@@ -173,9 +173,8 @@ static void pic_intack(PICCommonState *s, int irq)
     pic_update_irq(s);
 }
 
-int pic_read_irq(DeviceState *d)
+int pic_read_irq(PICCommonState *s)
 {
-    PICCommonState *s = PIC_COMMON(d);
     int irq, intno;
 
     irq = pic_get_irq(s);
@@ -354,10 +353,8 @@ static uint64_t pic_ioport_read(void *opaque, hwaddr addr,
     return ret;
 }
 
-int pic_get_output(DeviceState *d)
+int pic_get_output(PICCommonState *s)
 {
-    PICCommonState *s = PIC_COMMON(d);
-
     return (pic_get_irq(s) >= 0);
 }
 
@@ -426,7 +423,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
         irq_set[i] = qdev_get_gpio_in(dev, i);
     }
 
-    isa_pic = dev;
+    isa_pic = PIC_COMMON(dev);
 
     isadev = i8259_init_chip(TYPE_I8259, bus, false);
     dev = DEVICE(isadev);
diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
index e2b1e8c59a..a0e34dd990 100644
--- a/include/hw/intc/i8259.h
+++ b/include/hw/intc/i8259.h
@@ -3,10 +3,10 @@
 
 /* i8259.c */
 
-extern DeviceState *isa_pic;
+extern PICCommonState *isa_pic;
 qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq);
 qemu_irq *kvm_i8259_init(ISABus *bus);
-int pic_get_output(DeviceState *d);
-int pic_read_irq(DeviceState *d);
+int pic_get_output(PICCommonState *s);
+int pic_read_irq(PICCommonState *s);
 
 #endif
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 073abab998..fba04875c2 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -99,6 +99,7 @@ typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
 typedef struct PCIHostState PCIHostState;
+typedef struct PICCommonState PICCommonState;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
-- 
2.38.1


