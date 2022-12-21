Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91875653506
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:24:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Sb-0002m1-C1; Wed, 21 Dec 2022 12:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SY-0002kI-0Z; Wed, 21 Dec 2022 12:00:50 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SW-0008BK-9h; Wed, 21 Dec 2022 12:00:49 -0500
Received: by mail-ed1-x531.google.com with SMTP id m21so12385924edc.3;
 Wed, 21 Dec 2022 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Gf+reKwkE6jXOJI2HiIZEfL9A4187k5o28S5UxntFc=;
 b=cNh5ertudq5dHHYNuKa90a+otKuGqxQvRZdIGbMMDuux2NJuvxgmiAQYy9pKpnyQ/i
 nIyArduzbPNwtE4hu6CZm1bUVDh6PZRcYkvIECo05R/lSooF8eXjI7e0a20niMsOkbsj
 y6i0CCF4t1MJ4NG78pvwUxfcnqt7DRE7sPn4fIbCBS/XuEMP4E7hRTyIGLjm2awQBaO6
 2LN/4xr+/yfHSc4H2669d75V/GPp3BBKRym5DrzP3F0+fE7t/8jkdplSOxGcskdjt1LQ
 qwo8EOV/qQUQzsvowsloEu3dyziNEgUTsiC2lAQA7Gzuhy+bfk2QdwkIFjnpI54bO0im
 Zu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Gf+reKwkE6jXOJI2HiIZEfL9A4187k5o28S5UxntFc=;
 b=Y8b3/jN07xrlU258l0fZM7v8ItGLOw3smT1qW0Kg4CXGalXACUQmmjLvFPPzOctqup
 auusibOY4Skjjk/IvKhr7KGy1Y6tCa0mv+yvp5bAWgJkr6YXIk17dloEYT5ioemNL4Xo
 XbIK2ZFhYJVfrMiP/kSPA9zWjYKuxZ2n2gA7oPtsqUZ7KFluNHXQkJm6xY2WuRwLS9zc
 8vNrawtvcNRinXKQeK2IK5AN517BxBMS+2mWEBRR8L0FTbFTUAv82N28+hg6aBXaWC/K
 Qayo5BRJJjZjZ+wHm/0yz6BX9Rby/vcIgcF473nnw2KYnSIbk6m+vqy/oemfoPAGqRuP
 jQGQ==
X-Gm-Message-State: AFqh2koUGnW9OQ95qyfYprEetbp5zWGB4CRtDH/X1zE4zDI7dYOD+5wu
 eYsHBA+4FICb7Gpt6THsBcejUG68Y1s=
X-Google-Smtp-Source: AMrXdXuC3t08QVBhoy4hBgQHebq5RdHmvXg4Kk4UTlZnkNGylk01Ty26QcmfgBh+sRuTDpK/GIXBLA==
X-Received: by 2002:a05:6402:1819:b0:463:c960:7589 with SMTP id
 g25-20020a056402181900b00463c9607589mr1823761edy.40.1671642046319; 
 Wed, 21 Dec 2022 09:00:46 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 01/30] hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
Date: Wed, 21 Dec 2022 17:59:34 +0100
Message-Id: <20221221170003.2929-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The PIIX4 PCI-ISA bridge function is always located at 10:0.
Since we want to re-use its address, add the PIIX4_PCI_DEVFN
definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221027204720.33611-2-philmd@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e435f80973..2e175741ff 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -72,6 +72,8 @@
 
 #define FLASH_SIZE          0x400000
 
+#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
+
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
@@ -1427,7 +1429,7 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
                                             TYPE_PIIX4_PCI_DEVICE);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
-- 
2.39.0


