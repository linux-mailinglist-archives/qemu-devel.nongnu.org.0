Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD76D4D006A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:48:30 +0100 (CET)
Received: from localhost ([::1]:47082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDiv-0007Nx-JT
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfA-0004lG-IB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:36 -0500
Received: from [2607:f8b0:4864:20::102c] (port=39523
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDf9-0006uy-4x
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so11329063pjb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vQfnGNW4YGHzEz5RbgJRcPJf9BCYtMfRnHfC+25hVw=;
 b=jPexmIsA5eXovZOcMASGUA+LQa0Ix2syaDnoTJhwTwtBlnjV+qYZ2Mw+3ppM2Gv23G
 TWhwyapoLyb/yhNmG+68xjqzZaJhF+qiDLkbxEumSVaIywdbSQPBx+JUMUOhv+fY7jNk
 orGvc71Xp/CBtT1tpaYXrlwdlUJOpPNEF1l5KQz1v+P6dTMJHD7By6+7brmnmKU5EjQQ
 TeHsGrJJOR3qzcdb3a9BllTAKcNPrdhA68mu9LKk5h64SYErmwysVfqBRUmSqbleBIx4
 BgEHXQx48z82Q+LZlGl/GvCv6kvZsf/J6vcClMZaC2q2c3Z0Mtrs7y5Vnt+KwNzukSQX
 QxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vQfnGNW4YGHzEz5RbgJRcPJf9BCYtMfRnHfC+25hVw=;
 b=JLi5v6yuEltcdfhNzvedYRFs46czYCYZw5mxg02UWyNRVhTkz5ZXPr1lRFXuPx+KcE
 /9ZmqCSXg/vjPxbSQVkhW1onsNijGApnQ/c9oW8A2nvxKWafOHvSqY50sWtDx7/9iFTg
 uSeUmakYoMBbdZe8gJMPbRkShJ3poF8KTRbFVcTs8UV52CZnEJIOy8mVLHbdmclGalxY
 PThdtoOjciFIUjwLiTsphEZ7CnqoEvBYkYlpFz0EijXdiC1yePkMEAiNXaFJVM+iVCt/
 f+BXYzgQV9r0G+klKJIHIJoiWk2WU84FoIIaLYn8jIRYiEZ5dpwxhfyDZWrHSqBPITJZ
 pAIg==
X-Gm-Message-State: AOAM5330TomN57VdVV49NyPJMYBiTL6f0fIIJfeSLjk9ZLhddutifa86
 oA2zjDb7ifNuhVvpvKp90Yg=
X-Google-Smtp-Source: ABdhPJxOUYptUsf6H6DBEwIE7rONc2LDE96BlGZZ2nd5b63Rl/AhIx4Q6Q8jXVIFyBzaIlMxgQUhbg==
X-Received: by 2002:a17:90a:2c0b:b0:1be:da5a:b294 with SMTP id
 m11-20020a17090a2c0b00b001beda5ab294mr13059379pjd.9.1646660673832; 
 Mon, 07 Mar 2022 05:44:33 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 124-20020a621682000000b004f6a2e59a4dsm13257888pfw.121.2022.03.07.05.44.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:44:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 04/13] hw/isa/piix4: Pass PIIX4State as opaque parameter for
 piix4_set_irq()
Date: Mon,  7 Mar 2022 14:43:44 +0100
Message-Id: <20220307134353.1950-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Passing PIIX4State rather than just the qemu_irq allows for resolving
the global piix4_dev variable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220217101924.15347-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.34.1


