Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB458CF9E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:26:09 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLAGF-0004ED-Jj
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z8-0008G5-JE
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z6-0006Kx-O8
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j15so12230194wrr.2
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0ajOPxy/v/tTsJ/HZ3G4BXDWf2I29Kqy4qHffsnPMhs=;
 b=KqSVU6AK6ulgYPeBs31yngVlU2Ee9aa/rzGfsjILtNR8FqtWpA0dwzUZZ7/etxclxr
 8WuNH+vABTf80sM1zLCdhfz+AQzco9TpRL6YrrGnlBoHit566hNJDvXPA6HgY4bkbv+k
 OaiiTvuG8c0M93RYeCzhye1Cx1Wds010vQiUwRBpOOQZ236PGWxn6N6BM3OoQMuwTMH7
 EM/D9uhjquvXaTf4u3J+Hq7qIKn/IiB2bwpvA9j7/4wWX+ckBgJHvY5eAN+aFHJN1BCq
 Nv69EyF0Ukj8K95n8yhE4hK2uSe5Rh0wf5XL9UjgD869mWeMSPpn6TqDZpWgQOLlr7ZU
 PYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0ajOPxy/v/tTsJ/HZ3G4BXDWf2I29Kqy4qHffsnPMhs=;
 b=WuwkN0NCH8R2kZHWcPrUp9OStjwmMRhVVsqJg3Ygr3bbTcsSQMdoUeUDHBi9+/VhPd
 aNHmY3rHgIw4cLyznNP38yMOy863NCiJ6VvHW6KvfN1wYyzInbJi6kdhcTIcRKlBIQIC
 Y1wP+hgQbFc2R4pv85ItL6vQ/AQpDmP4leAZuIflzkQRcBt04HcS4RzYyVXkgb1Km5P1
 nXJCxfQfsUr++eZYr2DKaa0rZfthJ1t/JyuVy98o/QPC3eQ4lWd8S6052a7ygBrHm6Nj
 94fGzj/orLNHudPoXBlSwimjuHeFkeP76vnGtQ9Ivp1IAf9WTi8zt+uQ6fCjl3I87KNR
 JVqg==
X-Gm-Message-State: ACgBeo24vU8qGhVz9NktUalzMxHpSitt8uC3Rk/agIf/dCzKxWf8028y
 PdORWVCK/0UPNe648R3VJYN9sg==
X-Google-Smtp-Source: AA6agR6LlfEnOfEbh1WK7NgwLMeQG/O7QUNUT88MyPL54Pg5NAkbxDOKuQugCAT9FIpECNXnBS2EsA==
X-Received: by 2002:a05:6000:812:b0:220:5a66:ebd0 with SMTP id
 bt18-20020a056000081200b002205a66ebd0mr12753638wrb.519.1659992903425; 
 Mon, 08 Aug 2022 14:08:23 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:08:22 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
Date: Mon,  8 Aug 2022 22:06:43 +0100
Message-Id: <20220808210643.2192602-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Conor Dooley <conor.dooley@microchip.com>

The subnodes of the syscon have been added to the incorrect paths.
Rather than add them as subnodes, they were originally added to "/foo"
and a later patch moved them to "/soc/foo". Both are incorrect & they
should have been added as "/soc/test@###/foo" as "/soc/test" is the
syscon node. Fix both the reboot and poweroff subnodes to avoid errors
such as:

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT nodes")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8b2978076e..a98b054545 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -896,7 +896,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
-    name = g_strdup_printf("/soc/reboot");
+    name = g_strdup_printf("/soc/test@%lx/reboot",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
@@ -904,7 +905,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
-    name = g_strdup_printf("/soc/poweroff");
+    name = g_strdup_printf("/soc/test@%lx/poweroff",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-- 
2.37.1


