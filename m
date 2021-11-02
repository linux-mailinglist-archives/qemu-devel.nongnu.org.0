Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA30443067
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:28:19 +0100 (CET)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhulu-0000NB-0D
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6w-0005R7-Sa
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:58 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6t-0006Tr-KS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:58 -0400
Received: by mail-wr1-x435.google.com with SMTP id d24so2827656wra.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3GPMsZfnn4ZfssdGOMr+SGtI/4dHR+YaPHIAKWs/umE=;
 b=LDyxw8yH/CG3bJ5Viu8sk/v7TzrgApxn7X4WhbnbCFPNpK79B3BX8MiH6NiiIhCWv0
 9AHUAsCViY9uqS2nW2CIslqKPAbxGE/npYK94mbXzKTsioXxwS0US7/2HLzYkfz747Xt
 YaPIYKSEiE6pRJHQd9VkPxr3HyNg2qlMoovgZHv1Lg/dbYxL/6G0I9XzHQGoahkKdZ4X
 x8RvJmdPIgrMYukY6TnLl9DNi3FA4DHvhxAOasoTrOG0QGoP95Zc2TdD6/AfL/1iL/zi
 4WdNWkPlW25rlQ2ymKnKw8DWvQyi+LlvPOaTXgyoQrjyc2ufYjQR6W3Je3Qm/SfacQ+G
 oFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3GPMsZfnn4ZfssdGOMr+SGtI/4dHR+YaPHIAKWs/umE=;
 b=vuLwnTBIlLA2AZlmLwSxwr0OsBHUva3hU8bGWc13fnMSZHdkcbkiXR8Jn+FeDUQ8gz
 wcUXlzVAqL1U6F2g07zoVD69PGRId61S/FYIRTDTv+2CJjol7eUVAdPztwfm6ZvWN59r
 R29lKiNWOJuhuOhm8MHKsHwkjYatEPV7/vhkx7uoCa7pOs7ihcdYvJ2jngyDmQh5X0St
 uHTxOFsGQvN/MhtM2uLpWWBUuEhoQApM8SB1YOLjoEw0nwtXxT5UI3pu57q35tVluKCL
 dQjJwXzCR5GgMLbMIcc86OJANY0k+U8fsEcqFNOnCcAtV8ONqghoQUVwmsimNbory+Ks
 MWeQ==
X-Gm-Message-State: AOAM532PcR+uUJ9kT+J7LNRsHfsPRFHC65UsJDqi/cI6zc+xtpzitz87
 8Kb0WAG8cH/swH2L1z3RIO/iCxeAuaI=
X-Google-Smtp-Source: ABdhPJwEoRphZm/JsjD5xLIu2zrH1++egeiXxJuRGXvFM5CnC4ixGBrK/3RdQd1VaVsdnxSP5mfg8g==
X-Received: by 2002:a05:6000:2ca:: with SMTP id
 o10mr46156758wry.383.1635860754088; 
 Tue, 02 Nov 2021 06:45:54 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 p18sm2628776wmq.4.2021.11.02.06.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/41] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Date: Tue,  2 Nov 2021 14:42:39 +0100
Message-Id: <20211102134240.3036524-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This device is part of a superio/ISA bridge chip and IRQs from it are
routed to an ISA interrupt set by the Interrupt Line PCI config
register. Implement this in a vt82c686-uhci-pci specific irq handler
Using via_isa_set_irq().

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <8d7ed385e33a847d8ddc669163a68b5ca57f82ce.1635161629.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/vt82c686-uhci-pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
index ea262e6d709..0bf2b72ff08 100644
--- a/hw/usb/vt82c686-uhci-pci.c
+++ b/hw/usb/vt82c686-uhci-pci.c
@@ -1,6 +1,17 @@
 #include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/isa/vt82c686.h"
 #include "hcd-uhci.h"
 
+static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
+{
+    UHCIState *s = opaque;
+    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
+    if (irq > 0 && irq < 15) {
+        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
+    }
+}
+
 static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
 {
     UHCIState *s = UHCI(dev);
@@ -14,6 +25,8 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
     pci_set_long(pci_conf + 0xc0, 0x00002000);
 
     usb_uhci_common_realize(dev, errp);
+    object_unref(s->irq);
+    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
 }
 
 static UHCIInfo uhci_info[] = {
-- 
2.31.1


