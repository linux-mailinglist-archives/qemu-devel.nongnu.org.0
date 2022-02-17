Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446D4B9D48
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:36:20 +0100 (CET)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKe95-0003tj-9M
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdti-0006dp-Es
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:26 -0500
Received: from [2a00:1450:4864:20::633] (port=37665
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtg-0002vH-2Z
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:26 -0500
Received: by mail-ej1-x633.google.com with SMTP id bg10so6050514ejb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fv04+POlH5pIZx0q4PgvkVhFNcEbQGNzNkVBRpZhCes=;
 b=AMKECsLBLaWMLDAVvx8OFqMHE4hT+vQbX/DJva8abJHK8jymbdIpueKbbX34Y6xgj4
 atU908bH7PKp6hC5GwwsmnPoNqteKSg7G1rXmKhtmtpNSrQCDLZZA0BCXqsU8aegXhVy
 y8/Gq6iQdaOop18sc+C6O1zXLNDFlTzVyVjmVVf/P4Ze8eDpeFZMnyAMuvSJWo6QeOyt
 cvNIeLR3u4a1d8LU9U5N6D1Rv1YzIpfHefLHVKA6uy3JLyBxzkTZ69B8m7VlLRoaVeHz
 6a6LBxhNkOc3zTyy77pe9Bpst0xGxWeKzyE5XuBKYWUawx7DHRmWLfWeV8Sd9OC2AaFk
 hlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fv04+POlH5pIZx0q4PgvkVhFNcEbQGNzNkVBRpZhCes=;
 b=uwlsCktRzR7aS8U1SrNRC1/u10sYMccvY2xbzO0xL7gUr8kLiHuZEbTyEGPMgWuDte
 Rw/UsEe2jze4XeTp2mhudLDBYwm78xLN2eMZXjnV0f+5DBDqPARnv6JUnZq98RNZrCVc
 uDH8iBppMdbyrdG0vi4om8av+HTa1/yENV85o5umnkZFd0RiuuhUt2LLTg4Qx9S1IuUN
 Xa+GTBUU41lRwD8N1i1A5EcE4mvsDtmGvtz2zEnyHBvabzKLtEWZF3FdYJspqBsTNFlR
 /RPAQ4IC2AIwjMNFolNKaiPHSJLimSp98H0k/YjWIC/uHQzTTM1ltZEMO1sYVYcZj6Wr
 ejIw==
X-Gm-Message-State: AOAM533V0v8pn0EoDmtD45VQ37f3HnjbJXvpG+a9+zYblhGo3RGevP7L
 p66W5stpQz0bKCuoqhtvB19/r+cOdnk=
X-Google-Smtp-Source: ABdhPJyro3cxSabVTKFUECMmsJQKligVF9AYMfLgzlnFcLxQaG4ItGVXC9rLqqBzKDIedjpfm7ziNg==
X-Received: by 2002:a17:906:7852:b0:6ce:88f5:4dc9 with SMTP id
 p18-20020a170906785200b006ce88f54dc9mr1793719ejm.491.1645093222600; 
 Thu, 17 Feb 2022 02:20:22 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id u26sm986753ejg.196.2022.02.17.02.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:20:22 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] hw/isa/piix4: Pass PIIX4State as opaque parameter for
 piix4_set_irq()
Date: Thu, 17 Feb 2022 11:19:21 +0100
Message-Id: <20220217101924.15347-5-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Passing PIIX4State rather than just the qemu_irq allows for resolving
the global piix4_dev variable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 179968b18e..caa2002e2c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -57,7 +57,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
-    qemu_irq *pic = opaque;
+    PIIX4State *s = opaque;
     PCIBus *bus = pci_get_bus(piix4_dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
@@ -71,7 +71,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(pic[pic_irq], pic_level);
+        qemu_set_irq(s->isa[pic_irq], pic_level);
     }
 }
 
@@ -319,7 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
 
     return dev;
 }
-- 
2.35.1


