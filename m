Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E74C0244
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:47:39 +0100 (CET)
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb8M-0001MU-F7
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:47:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMaw8-0003K5-Ud; Tue, 22 Feb 2022 14:35:01 -0500
Received: from [2a00:1450:4864:20::52b] (port=37674
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMaw7-0006qK-58; Tue, 22 Feb 2022 14:35:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id q17so39658277edd.4;
 Tue, 22 Feb 2022 11:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDgj4joug7f4HE4WKfuyWjX5As+7XR/H8T7Cnx16Sm4=;
 b=Uk4Dx+ry0+Xt/6Yw8JQEp4so2xBU5HPWqCMjAs7948QQxJyFOzmz0oEE8F0lIkWTRK
 VNdbjYNOxKtqYyow7Vz5VBXc7w81o+rBuusMgyI93PM23BWZSvCa4VJmQVH5luHklHnG
 JO+JvW4ag9jHoTCIOIuiL1cLrqPNruAnIpBxVk3sab+VFhVUHAVicg0N8/bueZvD+UqX
 TmG6m0g/ndEI5Nbb3VCfyHFqgSxAio0zJa9LQsN0KG8gt0rv+UUZ/B0I6qrS6hiKfVx8
 hJjLNWY5luy39gEIlziu4G/3c9FabkW8oBxpRenNhO96otLXW2mObRJCaPvSx9uNmoZp
 92yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDgj4joug7f4HE4WKfuyWjX5As+7XR/H8T7Cnx16Sm4=;
 b=J1Q+2WA+hpnZTaVmL0UOXklt6n1pHyxgOYR2bfaTURJxijObjLA8t5PxE+PHTrirgc
 MmWcgOMTVkgsx2FbuXudOBOyYqYUD4JuEvtdzW3QqdMejTohKxf6HQBukgrC7rURBMBh
 djlsHpmcDR0nbyYQv0wCK2SoBg+1HEwNzQPilS6V/CUrmHFcQs7mgGTVWAXOsLSQEivg
 EAHcfYlQpJGgRtxc3CW1kdXSyIavVRwHNuC0+G5+oMCFO23eGx91/MpsA3SOGSUq5ypY
 WZuFKGGrnlevXJRFxYSuKfyVgSpSbKkVIqkuH7flzoP4YfUgGIYE3z3ClgUJQfzMjuxh
 YSmg==
X-Gm-Message-State: AOAM532m7+ZATqCvgQwMb/MNNcWkEghhmyiXIPgZQLCmaTySFpZjXnMP
 YoXtURwFx6JnSR/O2lM4aY1ZqU0To7M=
X-Google-Smtp-Source: ABdhPJwgJ4+i5A45xPbmsguqQCfYNyXPOYF4ScwElZCoAG7tjB9I3zs9hfcZySGKO4vgKgNj3g2OCA==
X-Received: by 2002:a05:6402:2748:b0:408:c807:8db7 with SMTP id
 z8-20020a056402274800b00408c8078db7mr27926572edd.4.1645558497479; 
 Tue, 22 Feb 2022 11:34:57 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:56 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/22] hw/ppc/pnv: Determine ns16550's IRQ number from QOM
 property
Date: Tue, 22 Feb 2022 20:34:29 +0100
Message-Id: <20220222193446.156717-6-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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


