Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97594B34CE
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 12:51:03 +0100 (CET)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIqvd-00084Z-QU
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 06:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgw-0006mv-3R
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:50 -0500
Received: from [2a00:1450:4864:20::535] (port=38547
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgu-0005bf-6z
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:49 -0500
Received: by mail-ed1-x535.google.com with SMTP id g7so4049188edb.5
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUEyRK4eoDUyKvcHgyF0Ay8n1k4tSI89hyDh6Del7NQ=;
 b=PZEO0WEdcvbjyueGhbcr1noBfo9z5jMfh7wliV0vISwdlSvOKpx1sQA/n7oETTbJOs
 dWI/t9uujoeSkL06OywLJHUxZ8c61b/BAeRptpC9tCk0BDgzHVI2cFckqciYcYyiwGua
 UJylrWpfsuqm8cYOafaBdj23dzFQM6GcoknxSjq+PZ8y1C5GJdolEbKRm9aMSDKunang
 Z9XATqqvte4GpB6PcuUQEFwkLwyjU10eXIO6rGXAWB+lnrkPZYUe3c2NJ3mWct7GUx6e
 GNkT+xE24IUrPlomAagQ9nszJizAdVxi3zsULb/qkU3CJE+vCWbczFikvPOxaoEQANhV
 WheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUEyRK4eoDUyKvcHgyF0Ay8n1k4tSI89hyDh6Del7NQ=;
 b=1CIWACpvqfCXiJEPd7trnaNqQ6O2vzqTU7vg0VzLnGulTcuy29pBWET/gs871cko7d
 T1ZhndJmjwp9KU9PJbk6DbYrUzWcG/KiFAThX7qWbbu9yUKKF0/VV4eHJXEyHpT4Ta7C
 F6aJxgmjouuSV74M+lDIJIlfZ59X2BqOePwTrW7TMdZuXI9+3llIklk2Bf/NlaFjw/gq
 5o1D0+0/EeLRX661St8wlglBuASOLb6Eo8oAHAM+3LQNbHK3b5halDTGVcjlM4k2vBqW
 rH7hRPO5lS26OjGMDkEqY2rBrQWa33NWOr5HZtnuf45FATI2+2IMpKOKiiKUO1PDHhCs
 RLRg==
X-Gm-Message-State: AOAM533TKx1joFOBUaggZPBZIXco/6rlFMoNKjB2W3NNsLbq0s+bBADB
 UTpgS6cuEP7N3sPsGr5tg434EtI7kbKtdO5+r4w=
X-Google-Smtp-Source: ABdhPJyuz1kKXaF1sAYDmbeHXobDp8+Ehd/KIhPRj+tnu4qLYu1nnjv8O+mICbQ9MQBynnhjC3LwFA==
X-Received: by 2002:a05:6402:42cd:: with SMTP id
 i13mr6304422edc.121.1644665746870; 
 Sat, 12 Feb 2022 03:35:46 -0800 (PST)
Received: from osoxes.fritz.box (i577BC145.versanet.de. [87.123.193.69])
 by smtp.gmail.com with ESMTPSA id z14sm889288edc.62.2022.02.12.03.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:35:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] isa/piix4: Resolve redundant i8259[] attribute
Date: Sat, 12 Feb 2022 12:35:19 +0100
Message-Id: <20220212113519.69527-6-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220212113519.69527-1-shentey@gmail.com>
References: <20220212113519.69527-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx to piix4" where i8259[] was moved from MaltaState to PIIX4State
to make the code movement more obvious. However, i8259[] seems redundant
to *isa, so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a9322851db..692fa8d1f9 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -43,7 +43,6 @@ struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
-    qemu_irq i8259[ISA_NUM_IRQS];
 
     int32_t pci_irq_levels[PIIX_NUM_PIRQS];
 
@@ -73,7 +72,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= s->pci_irq_levels[i];
             }
         }
-        qemu_set_irq(s->i8259[pic_irq], pic_level);
+        qemu_set_irq(s->isa[pic_irq], pic_level);
     }
 }
 
@@ -323,9 +322,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 
-    for (int i = 0; i < ISA_NUM_IRQS; i++) {
-        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
-    }
-
     return dev;
 }
-- 
2.35.1


