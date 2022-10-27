Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDD610344
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:49:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9nH-0003a1-HP; Thu, 27 Oct 2022 16:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9n1-0003Hc-PR
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9mn-0007R6-Vy
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so4505401wms.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74DDUYUGfeWypaCG02ItfjGfd6cxkR71vlmSf2VE7U4=;
 b=RdoIvhfZgRp3UAcV+aox7MMhJbRRupi7JKOxd7ft8hIQ6BtZ09acHmEQros/q8Xofm
 orpACplii7yxdXSqO5mZWa/9yR/JtyuRKMDYl/kkfzGcPi+JU2BlNmejT9lGt26xPi6k
 WDyEN8ZY2MxkyoTq2IXp5glTbyRCJ6ikVu1gpquyl1PgzP2COKbPQyE3HAVbwi9WPFkJ
 LPSfFtS8vtM7+ItyaYB8fpGKsNqXzYDSjEXZBApzypWq+kl+Al9Z7dL2Fgd6DO2fhn3t
 dBXVPsS4wll04aE+tMmZPZEPmeudYM4fkE6ZUlTjDyHMGQjgwwdYgupeINE9oCatuDOo
 sJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74DDUYUGfeWypaCG02ItfjGfd6cxkR71vlmSf2VE7U4=;
 b=OJGXLdM6nYEn5+gDX8+QNTy+9xo6T/cqx74S9BXxh1JMyqnkG7hFfgPiIjOjHPtPZc
 WgeWqWOBJISan+zfijLDS60BWoL/VoluenqIiau1w0owtk7/DQ60cGw9/Ed32H0wLV7r
 pveam/L6j5uHVnsinZ7JHMf9x15JZyYMFN5QgD5j5aLZt7th01BQ/cUTqb96tQCKC3Zn
 Xzl+iqeR6reorHQJOmYPKZbSso10o/s4p0CHdul28kCtPGzYZewks2MkWdRloWnbnQs9
 vHrX23FArnb0u9kCJAbmbtMO16cjp6Lcx0RoBSDmXY1PBSsbx7sDCAUZJVLIW1fEzyRV
 SJGg==
X-Gm-Message-State: ACrzQf03+rNL0mcNbuXpqJ4tmimfKpLofxebqUIWbEPD4gEs7AfAz3+n
 2bHFu2TidL6YRwSWKXXDmKjcTGQ+UOGVT7xW
X-Google-Smtp-Source: AMsMyM6/w9IhZvT1ijUD7smoe6vGcjFUMAryiyncfJbA5YjnjGYrwpsuiUCKafLXr/b27SduWhjXnw==
X-Received: by 2002:a7b:c048:0:b0:3b4:fb26:f0f3 with SMTP id
 u8-20020a7bc048000000b003b4fb26f0f3mr7482015wmc.115.1666903652295; 
 Thu, 27 Oct 2022 13:47:32 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c458900b003b4ac05a8a4sm7361417wmo.27.2022.10.27.13.47.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Oct 2022 13:47:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v2 1/3] hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
Date: Thu, 27 Oct 2022 22:47:18 +0200
Message-Id: <20221027204720.33611-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027204720.33611-1-philmd@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The PIIX4 PCI-ISA bridge function is always located at 10:0.
Since we want to re-use its address, add the PIIX4_PCI_DEVFN
definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 272d93eea7..df0f448b67 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -72,6 +72,8 @@
 
 #define MAX_IDE_BUS         2
 
+#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
+
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
@@ -1377,7 +1379,7 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
                                             TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-- 
2.37.3


