Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AF96521CA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3X-0004CF-Ca; Tue, 20 Dec 2022 08:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3P-00048h-8Y; Tue, 20 Dec 2022 08:53:11 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3N-000115-Ft; Tue, 20 Dec 2022 08:53:11 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so15416034fac.8; 
 Tue, 20 Dec 2022 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VvlOM0ugm9Fr/4dQpsfYlJvQEM3Fz2babkbnBncbxQ=;
 b=T4N8ldIIS0QGxR6/WATrUp8TVmXONg/XOjmaXbJ5Y6pkdy+jnZOCmi24pzxwQ0JWDr
 ZNWMySnf2uCPHt8ErO9vYfJsw+1keZgFeE43MnFG8K9CYj+itLpbEYrewKw4+fJhaJrT
 ADYLvEWQleIxMREGihIqkTWRd0UeVb2nsu38799fFdh6ywii8DxrSj+NZqqQvGZyI57h
 AwQIh28LLwmRl/KdRzOghPPz8YNUkhhXxlWCJIlQZU85XnSUINxVuVWS/n4aDZ5la26P
 0SNLtFbXqNfQVn2h/qRCzq+/2PWsELvxLAu3VL9GJU7bvZWjI9yTqo7r07z/ejAV/Uif
 U3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1VvlOM0ugm9Fr/4dQpsfYlJvQEM3Fz2babkbnBncbxQ=;
 b=HUGMBadLOGWgwOBdv3CYks/z974jboLYsLjI33hShi7wt49YVLWgFK3LDm8XiuCfYi
 v4OkMN0XgW/n0ZdACguzQPnw+1GQlYWgh0NUUT+gmri5oX9Lgn0D7GeT1+Adl3dI9Lxz
 w5Acp8lCeusVa+qRJBQZCT7q//pcM6Y0elJ2q35Yz7FvvgjkVLpH6kKJLS4vK5vZ4e+h
 XlOhMejucxvF4iDuDxioZoJkLEXQgVJc+j+PHfjy64rhvEL/lw1GSDX3B28F/nC03xfJ
 wzvDqBhnOC4M1CLObSxLA4fgeVoue1TtqWkB7t4OD+SwUXhkQqgV7vpPtMJT5DyIxaIr
 ZwQg==
X-Gm-Message-State: ANoB5pkse4Jxni4uc765KCWxUKJPf+fAySVk3tHtjxCHtri96zGbCJzP
 fPSaDrvmcUiMlcNWT3PPb/Gx0fWJ2I0=
X-Google-Smtp-Source: AA0mqf652R1b55IKEcWRsRWSFt0dCMamRtLCQEZIMf4sKBuBpnwDz6hYI1ljOXOgczVrdI3/oEzvpA==
X-Received: by 2002:a05:6870:c0cc:b0:144:8fee:3c4f with SMTP id
 e12-20020a056870c0cc00b001448fee3c4fmr24148415oad.36.1671544387992; 
 Tue, 20 Dec 2022 05:53:07 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:07 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 03/15] hw/sd/sdhci: Support big endian SD host controller
 interfaces
Date: Tue, 20 Dec 2022 10:52:39 -0300
Message-Id: <20221220135251.155176-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Some SDHCI IP can be synthetized in various endianness:
https://github.com/u-boot/u-boot/blob/v2021.04/doc/README.fsl-esdhc

 - CONFIG_SYS_FSL_ESDHC_BE

   ESDHC IP is in big-endian mode. Accessing ESDHC registers can be
   determined by ESDHC IP's endian mode or processor's endian mode.

Our current implementation is little-endian. In order to support
big endianness:

- Rename current MemoryRegionOps as sdhci_mmio_le_ops ('le')
- Add an 'endianness' property to SDHCIState (default little endian)
- Set the 'io_ops' field in realize() after checking the property
- Add the sdhci_mmio_be_ops (big-endian) MemoryRegionOps.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221101222934.52444-3-philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/sd/sdhci-internal.h |  1 +
 hw/sd/sdhci.c          | 32 +++++++++++++++++++++++++++++---
 include/hw/sd/sdhci.h  |  1 +
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 964570f8e8..5f3765f12d 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -308,6 +308,7 @@ extern const VMStateDescription sdhci_vmstate;
 #define SDHC_CAPAB_REG_DEFAULT 0x057834b4
 
 #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
+    DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_ENDIAN), \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
     DEFINE_PROP_UINT8("vendor", _state, vendor, SDHCI_VENDOR_NONE), \
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 22c758ad91..289baa879e 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1329,7 +1329,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
                        value >> shift, value >> shift);
 }
 
-static const MemoryRegionOps sdhci_mmio_ops = {
+static const MemoryRegionOps sdhci_mmio_le_ops = {
     .read = sdhci_read,
     .write = sdhci_write,
     .impl = {
@@ -1344,6 +1344,21 @@ static const MemoryRegionOps sdhci_mmio_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static const MemoryRegionOps sdhci_mmio_be_ops = {
+    .read = sdhci_read,
+    .write = sdhci_write,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false
+    },
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
 {
     ERRP_GUARD();
@@ -1371,8 +1386,6 @@ void sdhci_initfn(SDHCIState *s)
 
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
-
-    s->io_ops = &sdhci_mmio_ops;
 }
 
 void sdhci_uninitfn(SDHCIState *s)
@@ -1388,10 +1401,23 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
     ERRP_GUARD();
 
+    switch (s->endianness) {
+    case DEVICE_LITTLE_ENDIAN:
+        s->io_ops = &sdhci_mmio_le_ops;
+        break;
+    case DEVICE_BIG_ENDIAN:
+        s->io_ops = &sdhci_mmio_be_ops;
+        break;
+    default:
+        error_setg(errp, "Incorrect endianness");
+        return;
+    }
+
     sdhci_init_readonly_registers(s, errp);
     if (*errp) {
         return;
     }
+
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 01a64c5442..a989fca3b2 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -96,6 +96,7 @@ struct SDHCIState {
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint32_t quirks;
+    uint8_t endianness;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
-- 
2.38.1


