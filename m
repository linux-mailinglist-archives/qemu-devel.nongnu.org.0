Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399096980BE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:20:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKUa-0000nf-Ke; Wed, 15 Feb 2023 11:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTr-0008Pe-Nx
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTp-0008RW-N5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id r18so13714007wmq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N56SCywPfrFBIywCm7hp89GbcF0PG+s+C1TwdwIEIvI=;
 b=ZWfBMaGKpRyCT6OmPutkN7J+5/NIURI+kkldQUfJqa62WBAP9dVOuAwbsT1tPASD+z
 7c4pExa5OzJLWoV94ysr0SBoaTT1qDp/RRzPxJ5s9zph80iybfYnTRFfkVVE9Gz9REIa
 HjHyVhWD8ezjAZI81Kl3tIKNxz1LkpkOxw4PiSi7Ezt2nZuOnRqXnxwBqnBHQPgY3+kI
 +dXRTUkEAFoMPYZoRSbM9PvSyX0/Q7eHcQkLeqBuL7mKNcF2LiED4PAQILsODOR5i96y
 +1oozRHjmbe52wxR6RyROXwiCiYPUdq3y176vetRRNKBpuSTtd+gPiXhZcwBZo9tZW/1
 3LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N56SCywPfrFBIywCm7hp89GbcF0PG+s+C1TwdwIEIvI=;
 b=d7XEB8ef+9C9uiyyLUCF5D/C8JetOhnQGguueRZjS0cq7/gjrIRiFSaHYE3kZIEE0+
 uACt05UR1Valy90zDKvC46rZ3ml2ZAnS75X3RaxiXLq6UsSrv3FAc9o42/eCkPgREQT4
 i5F2grM4ZHysOknpaLzJFQ5Ado1ubGQHud9HjputQjfMIy/NjL2rS1ry/7zWbqYjh4N7
 0cD2KzZgj2gYBvwjUhgMBAL81KHvyAVtHtQ8GvF/m/Lnr2z9VBkdyBvKn5iVdjikJgTt
 WoaK8tddRoIyY6feMmAHBF6lH9XCtHi2UlcyeSkZIQmlOYZkYcO1fYTgqTOtTpt0xhhh
 WEnA==
X-Gm-Message-State: AO0yUKWAG7gVESV3REN2RvYhD79kWFOcygHDzIdQMPJjvFgdjCqXBpmS
 avVp3b+UtfGS0q6vveAphJi97q2rTK2ptilj
X-Google-Smtp-Source: AK7set9p+R7r2vJmJb+oDpMcdMXO7EznNLOmOW6nCUt3Y4Hc88VgZah7u4DP7EjvYU8v9/4HgovwAA==
X-Received: by 2002:a05:600c:1819:b0:3e0:10d:f1c with SMTP id
 n25-20020a05600c181900b003e0010d0f1cmr2392096wmp.37.1676477879933; 
 Wed, 15 Feb 2023 08:17:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1c770e000000b003dfdeb57027sm2379319wmi.38.2023.02.15.08.17.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 14/18] hw/ide/piix: Use generic ide_bus_init_ioport()
Date: Wed, 15 Feb 2023 17:16:37 +0100
Message-Id: <20230215161641.32663-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

TYPE_PIIX3_IDE is a PCI function inheriting from QOM
TYPE_PCI_DEVICE. To be able to call the ISA specific
ide_init_ioport_isa(), we call this function passing
a NULL ISADevice argument. Remove this hack by calling
the recently added generic ide_init_ioport(), which
doesn't expect any ISADevice.

Inspired-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 9b886fc0d2..74e2f4288d 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -138,7 +138,6 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
         {0x1f0, 0x3f6},
         {0x170, 0x376},
     };
-    int ret;
 
     if (!d->irq[i]) {
         error_setg(errp, "output IDE IRQ %u not connected", i);
@@ -146,13 +145,9 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
     }
 
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-    ret = ide_bus_init_ioport_isa(&d->bus[i], NULL,
-                                  port_info[i].iobase, port_info[i].iobase2);
-    if (ret) {
-        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
-                         object_get_typename(OBJECT(d)), i);
-        return false;
-    }
+    ide_bus_init_ioport(&d->bus[i], OBJECT(d),
+                        pci_address_space_io(PCI_DEVICE(d)),
+                        port_info[i].iobase, port_info[i].iobase2);
     ide_bus_init_output_irq(&d->bus[i], d->irq[i]);
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
-- 
2.38.1


