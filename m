Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B8609A62
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:17:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhM4-000735-Er
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5M-0007G8-Ts; Sat, 22 Oct 2022 11:06:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5L-0002Ex-Ei; Sat, 22 Oct 2022 11:06:52 -0400
Received: by mail-ed1-x535.google.com with SMTP id l22so16106983edj.5;
 Sat, 22 Oct 2022 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Git7/sip742NQi6zIX98XKP/b6U0B+VRnQH1rBmU1Sc=;
 b=VwUQBgJv9vZF+dlIBRHtpjIBtMsL0dm0LqGjStX9Th/j4ecMRPtA7zPZi36M71+yev
 BRMjxZw5YNwtwjxlhYvfWrs443EURElBkHZ+Cf5sBPGL4/qgQLaf7RWLMKtNpJlMxsFg
 1C7KMZVR0ZZGk710UuVygKTugx3vJt+m7R+vyB395ygU31TTB8eltWC23Gy8oUJETHTf
 evcL7wSahJoX76sYvr/8CWrO+MhAfIS7GoribWQdZboSsNSdpRKpVbRA+98mkruCYjzw
 mNNFaqacVLHpbflCWMB0E1dhdf2n72x6gnY8AhMivSN5MksuuSjL/zXGsiXz3bextZ1V
 uBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Git7/sip742NQi6zIX98XKP/b6U0B+VRnQH1rBmU1Sc=;
 b=RWE+GjdcbZhC/pW+0x+wu/5JVQ9dV4ay/O0NCAwWiEAsf9aSNgWsp/mHrjgH2qc97T
 M5qbeqo9ozU1PZVI8Qvj3+yVH45dEAwqHl1k1yzg6EVErIWV9zpDQfArT7CI65qzUEzY
 fyyFYFx3ULa3jB1wnE/7TbJyb+WjodcP2LaypWJjF0ki0+jUPuIDS864XUJiiXCC7Lnb
 mNCnQWuaoj183+aBEWOQQdZ3aTzZC+MmgkyE9DE/Uu2j2EKZvGIOPIpspNmPT4VNMv9k
 UYDjAKyDYv8CzRHq8n2H97ygq9VsrTFu6MbKFJFpHL5BHX4TuxTFqpt2d6LSsuAJRUT+
 2Z5g==
X-Gm-Message-State: ACrzQf1jEc3NS+PfoORwd4VIQAY7x83ffG258M/twVJbEuAQt9ffsPYx
 lN6JMhexooIM++4uis44A8u67myZE6/mhw==
X-Google-Smtp-Source: AMsMyM6ui+Ghxwp2GLiJZTTK0okDk45iW5KRNMxXhNaLMdXyxEYdJv/x6rC+Ipj+wSVoIz3tx1i/rw==
X-Received: by 2002:a05:6402:b0e:b0:461:7f1d:258d with SMTP id
 bm14-20020a0564020b0e00b004617f1d258dmr2669689edb.68.1666451210174; 
 Sat, 22 Oct 2022 08:06:50 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:49 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 23/43] hw/isa/piix3: Prefix pci_slot_get_pirq() with
 "piix3_"
Date: Sat, 22 Oct 2022 17:04:48 +0200
Message-Id: <20221022150508.26830-24-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The additional prefix aligns the function name with both other
piix3-internal functions as well as QEMU conventions. Furthermore, it
will help to distinguish the function from its PIIX4 counterpart once
merged.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 5214a75891..8878d71465 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -85,7 +85,7 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
  * Return the global irq number corresponding to a given device irq
  * pin. We could also use the bus number to have a more precise mapping.
  */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+static int piix3_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 {
     int slot_addend;
     slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
@@ -441,7 +441,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
+    pci_bus_irqs(pci_bus, piix3_set_irq, piix3_pci_slot_get_pirq,
                  piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
-- 
2.38.1


