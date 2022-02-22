Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE624C0076
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:51:25 +0100 (CET)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZJs-0007Ej-BA
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7X-0003cP-EM; Tue, 22 Feb 2022 12:38:39 -0500
Received: from [2a00:1450:4864:20::635] (port=40835
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7S-0002lq-MX; Tue, 22 Feb 2022 12:38:39 -0500
Received: by mail-ej1-x635.google.com with SMTP id p15so45047307ejc.7;
 Tue, 22 Feb 2022 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDgj4joug7f4HE4WKfuyWjX5As+7XR/H8T7Cnx16Sm4=;
 b=bUfdlDP8hXNh4Frsh9RMNmjvxfgsJQR8rYMn1yjj+cHREzLSa7+suZj1C49mpTHyyv
 IQNv8fFfShaeHYS9+Wdpv9F5MkXt7aBbceRhLlnm08yGK1KI7Xk4GXoWMoeHNCRgatVG
 0+iPQcVOLolSFUUhO11tpapllX3D0kuMu4u1qKWpsteB4Xzb/9yvebDgRd6vaO92UuoF
 KhVictBTVRAirtUmb51gkOm5ziF13gHBR9MyMcRKMmGbhliK5lBcnZoeLOOJdVhcl7lQ
 KByb91b+gyJ6ygaC+dUC7kdReKxIyQxQgGEHZ8GxLJ3WcTXt8WOYCezQWLs+20gqbaBT
 SdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDgj4joug7f4HE4WKfuyWjX5As+7XR/H8T7Cnx16Sm4=;
 b=HqT8pIplfhzMawkrXyDfFgEL2kyMnHRQR27+rmLb7d9KYNBU1ddKMlDMy53tSU5XUg
 wm1mowBLILdrgeehr0i+VPC/X7e1HdH3Q1LFwvLl5lFkzt1bsQ8U+IsOSHvy/cfTsqQP
 TFPiaej5P1v07HEJ2C/ln6jnFGDaUawmaudmSNkW33vxmm98Z65VzC/UQeU8eB/QHxm6
 NgV+Ep96nzLxDj3YNegVqNUC3IgaGRh/P/Wlz55ttGxhoK4XbAegsyGgmnanBI3vdWiA
 nJprbm75nonuAX0EprUy7Y7Rb+dieolNfUMXQL9yuuZ3jaVywKSY4MfUDsE87tRvrXH/
 wp9A==
X-Gm-Message-State: AOAM532+J/ZH1g/cubo6zjZUmV1aVz97bwRiFCwY47U7gHSBKFdD8GiV
 3DjqCzxNTQJ5L9ahuyqsb95xBngvdhU=
X-Google-Smtp-Source: ABdhPJy0OvCN3QIBerNe2137UH+jtukWAt/ymRUr9SxiLgQs7TFySubnTlzC6Dm2RVnNiSuPDNlTGg==
X-Received: by 2002:a17:906:7a58:b0:6cd:a6bf:127 with SMTP id
 i24-20020a1709067a5800b006cda6bf0127mr19937649ejo.29.1645551512828; 
 Tue, 22 Feb 2022 09:38:32 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/22] hw/ppc/pnv: Determine ns16550's IRQ number from QOM
 property
Date: Tue, 22 Feb 2022 18:38:02 +0100
Message-Id: <20220222173819.76568-6-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: "open list:PowerNV Non-Virt..." <qemu-ppc@nongnu.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the IRQ number in the same way as for isa-ipmi-bt. This resolves
the last usage of ISADevice::isairq[] which allows it to be removed.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/pnv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 837146a2fb..1e9f6b0690 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -380,9 +380,12 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
         cpu_to_be32(io_base),
         cpu_to_be32(8)
     };
+    uint32_t irq;
     char *name;
     int node;
 
+    irq = object_property_get_int(OBJECT(d), "irq", &error_fatal);
+
     name = g_strdup_printf("%s@i%x", qdev_fw_name(DEVICE(d)), io_base);
     node = fdt_add_subnode(fdt, lpc_off, name);
     _FDT(node);
@@ -394,7 +397,7 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
 
     _FDT((fdt_setprop_cell(fdt, node, "clock-frequency", 1843200)));
     _FDT((fdt_setprop_cell(fdt, node, "current-speed", 115200)));
-    _FDT((fdt_setprop_cell(fdt, node, "interrupts", d->isairq[0])));
+    _FDT((fdt_setprop_cell(fdt, node, "interrupts", irq)));
     _FDT((fdt_setprop_cell(fdt, node, "interrupt-parent",
                            fdt_get_phandle(fdt, lpc_off))));
 
-- 
2.35.1


