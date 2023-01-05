Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DE65EEF2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJK-0002sr-Qg; Thu, 05 Jan 2023 09:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002ky-Gm; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ3-0006wx-Cc; Thu, 05 Jan 2023 09:33:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so27445969wro.9;
 Thu, 05 Jan 2023 06:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zrvIg/iEsO75MxAmfzXaQMRN/YVp9nhgg1eJp3yyhE=;
 b=ADmmfowVZ6uA7SmNRRHrj+KZZcJF04ACFYDCIhqUWquvx++rkvrZqauRFD3v59Bk7Z
 qYjy+AQ0jJFRm0QfadUdsNOp0ZDuUDrdv0Q2ZRNZ+AN3Z6qAQQW7maugdFaYwspW6HU/
 sd2qEYfNsnViiGrayUrxHRT+ZEDaZyIgz15ZDD6e3Ya52VjtcxhTyNxaqNYvvdTxA3bN
 dAWoulCXqEIrMHSaYlHmw/XoKE1HRKlfaz/7rbleqJ9YmHoPLy3h1Ie+Fzoc/6NFpKwm
 pZ9Dv2afjce5fKqqSzyw4rafgVEuE4/UwIcVx0rwZjH5gjqOavqcrOngkbP4yxH7C2BG
 BFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zrvIg/iEsO75MxAmfzXaQMRN/YVp9nhgg1eJp3yyhE=;
 b=VmToFLVfSPB2zmfa4Jzcp5ZN5+apfGtyd7pOM7I9qHGrq2LqmBUjNN0jgW1NxyY728
 17YYbUKAdC20sEbbjnzYq7gWKVlJsi8L0jR0L7PJl8rh5ueYspY0CxMjOjvl/j8sV6Dx
 I+XF/VfTdyMbk8IyeQ9uOeCXpv10+SeALMglt723ntA2RI/7NS/YG4FQ0nB3rpo6CnDC
 Vj0nDJZ7kB8y1QBx7ujWH5yPYJ2gRyfau4Z6bvftG7SHwgIW9jGIiegfrKA6yfaqImsD
 VgV3LqygCUipfDxl+N8H8UBfymaNZ7C33/bkX3MPZ0cIsPDJLDhsgbjwe6G1lpRwL5hU
 Vvig==
X-Gm-Message-State: AFqh2kqyNGuRl94S0H8pl34hJc+2dwvHwUE+753rCJYHem+oRQe6pMIH
 YSz12fnRTZGNTQ7H1R2GDR6Mm++fjT//1Q==
X-Google-Smtp-Source: AMrXdXujI9aPxADq0ljd1u6asGsjDV3eqLM636OO9sbD4MKeyGtVf/SnjWSFmSSzJsN7PZZsB+eRrQ==
X-Received: by 2002:a5d:5a95:0:b0:29f:7c87:74a7 with SMTP id
 bp21-20020a5d5a95000000b0029f7c8774a7mr6077045wrb.45.1672929199390; 
 Thu, 05 Jan 2023 06:33:19 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:19 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 12/31] hw/intc/i8259: Make using the isa_pic singleton more
 type-safe
Date: Thu,  5 Jan 2023 15:32:09 +0100
Message-Id: <20230105143228.244965-13-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This even spares some casts in hot code paths along the way.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>

---
Note: The next patch will introduce a class "isa-pic", which is
shall not be confused with the isa_pic singleton.
---
 include/hw/intc/i8259.h |  6 +++---
 include/qemu/typedefs.h |  1 +
 hw/intc/i8259.c         | 11 ++++-------
 3 files changed, 8 insertions(+), 10 deletions(-)

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
index 688408e048..3d5944d2a4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -98,6 +98,7 @@ typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
 typedef struct PCIHostState PCIHostState;
+typedef struct PICCommonState PICCommonState;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
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
-- 
2.39.0


