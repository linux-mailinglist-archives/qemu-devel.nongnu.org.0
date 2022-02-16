Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE654B9406
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 23:51:34 +0100 (CET)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKT92-0006hF-A7
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 17:51:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3g-0007aJ-V3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:01 -0500
Received: from [2a00:1450:4864:20::52a] (port=36451
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKT3f-0003Rr-0Q
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 17:46:00 -0500
Received: by mail-ed1-x52a.google.com with SMTP id t21so6441491edd.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 14:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y629EjZYx2MpzBQL6ITTZb0sditZh+KDcoZphc9Zzko=;
 b=mpUn2rl3hJHZ4nq+KhJFN1j8qyXq0/HQ8EfpikcPzvJULZnCYfimR1W8Ur5vbiBomg
 RulyWQEW7ZexpsBHnxEr/ROrpuBgzRBE9kffABzln+AdHv81wai93s0dW/xYS69vTTdV
 0LijC3cTcCH6s29q0aZFdpkSwX82XZXlIrh0s3iNCJOEApZEFkI43ys9k6u8XHhkyPmc
 d5KtczTAlXpSGWXVW0lO4cwEnyAQ+wKYiYZ3k2w+LKAfaxGHqQTdjYaJCdi/QYQDbC+w
 tnd+ikH89KaqnWvMSBZkqm+fzDSB51IHaRW7e581mtriFWKQAJcGt5Q41TtehA89gbAe
 tHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y629EjZYx2MpzBQL6ITTZb0sditZh+KDcoZphc9Zzko=;
 b=AaJ/pKJUTczDpt4H6O2SrP9YihTAvKkRpaygfJWCr1ZdPNTvBnoZf3lRUNYQwilDar
 u3muj7OUpyqTaceofQvrTNpxdIC3p6OCnEG+IXmlca+aDr5QV3o9mkXDydIqxIsfqpQI
 hFyJ+IztXtv4u/3C2W3p1c7ywE+eGGTeflZ/bkd6MtuNRRMleXXYlfrgXgMvtlf060nw
 aXeIIKucMkWTx/q4YkEZh+b02BmBXgJtCpuwSuzLDz+3S3wcvtYitiIVeTaz32fXt2Zh
 KiVwcs2VXcfwI6XoIfEs4RbDqBWCKjEc0uIp0tQ+pUE8zSHpEJ857B+09aEbxZM8MfBE
 4PbQ==
X-Gm-Message-State: AOAM531HY8bHNlj3/lA7qtb6pDK38poEezuZc7P34MJC7wadd29dcuxS
 SNjQWBh2HcdXhu6rC9uiZXVdocpc55I=
X-Google-Smtp-Source: ABdhPJy22eMugA9eedH0jCmkFXLA1Ub5G2zfigWZkLseYnXCVzj0IC+eg+F0NaFTlAHuYTw5q0/qOA==
X-Received: by 2002:a50:da47:0:b0:410:a39a:c43b with SMTP id
 a7-20020a50da47000000b00410a39ac43bmr5495283edk.33.1645051557677; 
 Wed, 16 Feb 2022 14:45:57 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-075-152.78.54.pool.telefonica.de. [78.54.75.152])
 by smtp.gmail.com with ESMTPSA id t26sm1475820edv.50.2022.02.16.14.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:45:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] hw/isa/piix4: Resolve redundant i8259[] attribute
Date: Wed, 16 Feb 2022 23:45:15 +0100
Message-Id: <20220216224519.157233-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216224519.157233-1-shentey@gmail.com>
References: <20220216224519.157233-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx_pci to piix4" where i8259[] was moved from MaltaState to
PIIX4State to make the code movement more obvious. However, i8259[]
seems redundant to *isa, so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 196b56e69c..179968b18e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,7 +45,6 @@ struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
-    qemu_irq i8259[ISA_NUM_IRQS];
 
     RTCState rtc;
     /* Reset Control Register */
@@ -320,11 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
-
-    for (int i = 0; i < ISA_NUM_IRQS; i++) {
-        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
-    }
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
 
     return dev;
 }
-- 
2.35.1


