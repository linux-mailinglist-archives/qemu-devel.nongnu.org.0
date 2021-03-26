Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53201349DDB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:31:38 +0100 (CET)
Received: from localhost ([::1]:59686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaO1-0004iB-Ba
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKP-0002Pp-KK; Thu, 25 Mar 2021 20:27:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKE-00042Z-TJ; Thu, 25 Mar 2021 20:27:45 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso4025506wmi.3; 
 Thu, 25 Mar 2021 17:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=saTn6NarVlEELQgHGdwR/wrWO06QjsMUeOIlGAoNQ9M=;
 b=hqQ6yMllaA4CLNt9rLG19D+p6ABbiimsAVYZ6gof5/26P4m3A+TrjSLrjhb8E5CpaD
 k1bjspKsRk4KD+NAw6s2oR1SS849pXkypeM6PRHYeNai8tvs4RdA6nbYVHx3FnhoaWka
 TnEktTPPI2LDuHuK2WPh+fta7zi84IFZ42Sf7JDhDKXLZxYiDc8BdIEVuqNKBQVcCYwJ
 2/IIB6cji/VJHYEabwdj6KE6oZVEEhJ473jpjNzIs5k1/UOxrXyZUXEjd0SYCv1bBGnG
 OPmAN+++431XhIx16jo99xp2O/rVdQiDHxgsXObnKA9Y4iMar5rXbBoOqRKG9MCPgAPm
 w3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=saTn6NarVlEELQgHGdwR/wrWO06QjsMUeOIlGAoNQ9M=;
 b=Wz9U+kldQS96O0w28xF0TynTxCk3yny81KWxM8VaYS9UND+oZWdzJSgF6KWOaWRw2e
 EIMkwl+vw0LCaFnO6Wly1A/ZSJHt3kxsWG0mLsNyWe4Qguh3Ekix7hmazXRUB5x2Dnle
 DOsRDVB/GwfYVNQ5/BrpGedz3+dFvDTiPiiTpXddfYxgaa9yInOQrPBnfT6ueVurIpOI
 AdHtlmwW4EEOOMdBBURFFj0QnHlKkaEc7j3ngFbrGXA+QnIPUnyw7LwoQ2s4q6W5umST
 7dXHHg0/pJsu7fXMS+oauhPkun8KF5AitmSntRi1B7gtXRpD3Va/3A2KHW4OkiuSc+hH
 xyrQ==
X-Gm-Message-State: AOAM532p/F8eJjBeXpfq0BG3VrBA476pl6U4AJu12BTWdaX4n3pCG9Fl
 3KFAMThM91hokEVHsqYULJ0287Fpm6LNEg==
X-Google-Smtp-Source: ABdhPJxdvBd4hUR6euoVap15xJPgJm/JSU6i+IUtGx9IiifYu3ssymwlxnQzlB8aMbmzOqublIVEng==
X-Received: by 2002:a1c:bc82:: with SMTP id
 m124mr10383440wmf.118.1616718456724; 
 Thu, 25 Mar 2021 17:27:36 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q207sm8402159wme.36.2021.03.25.17.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:27:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 01/10] hw/misc: Add device to help managing
 aliased memory regions
Date: Fri, 26 Mar 2021 01:27:19 +0100
Message-Id: <20210326002728.1069834-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

// TODO explain here how buses work? when some address lines are
// not bound we get memory aliasing, high addresses are masked.
// etc...

Add a helper to manage this use case easily.

For example a having @span_size = @region_size / 4 we get such mapping:

          ^-----------^
          |           |
          |           |
          | +-------+ |                 +---------+          <--+
          |           |                 +---------+             |
          |           |                 |         |             |
          |           |   +-----------> | alias#3 |             |
          |           |   |             |         |             |
          |           |   |             +---------+             |
          |           |   |             +---------+             |
          |           |   |             |         |             |
          |           |   |   +-------> | alias#2 |             |
          |           |   |   |         |         |             |region
          | container |   |   |         +---------+             | size
          |           |   |   |         +---------+             |
          |           |   |   |         |         |             |
          |           |   |   |  +----> | alias#1 |             |
          |           |   |   |  |      |         |             |
          |           |   |   |  |      +---------+  <--+       |
          |           | +-+---+--+--+   +---------+     |       |
          |           | |           |   |         |     |span   |
          |           | | subregion +-> | alias#0 |     |size   |
   offset |           | |           |   |         |     |       |
   +----> | +-------+ | +-----------+   +---------+  <--+    <--+
   |      |           |
   |      |           |
   |      |           |
   |      |           |
   |      |           |
   |      ^-----------^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/aliased_region.h |  87 ++++++++++++++++++++
 hw/misc/aliased_region.c         | 133 +++++++++++++++++++++++++++++++
 MAINTAINERS                      |   6 ++
 hw/misc/Kconfig                  |   3 +
 hw/misc/meson.build              |   1 +
 5 files changed, 230 insertions(+)
 create mode 100644 include/hw/misc/aliased_region.h
 create mode 100644 hw/misc/aliased_region.c

diff --git a/include/hw/misc/aliased_region.h b/include/hw/misc/aliased_region.h
new file mode 100644
index 00000000000..0ce0d5d1cef
--- /dev/null
+++ b/include/hw/misc/aliased_region.h
@@ -0,0 +1,87 @@
+/*
+ * Aliased memory regions
+ *
+ * Copyright (c) 2018  Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_MISC_ALIASED_REGION_H
+#define HW_MISC_ALIASED_REGION_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+
+#define TYPE_ALIASED_REGION "aliased-memory-region"
+OBJECT_DECLARE_SIMPLE_TYPE(AliasedRegionState, ALIASED_REGION)
+
+struct AliasedRegionState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion container;
+    uint64_t region_size;
+    uint64_t span_size;
+    MemoryRegion *mr;
+
+    struct {
+        size_t count;
+        MemoryRegion *alias;
+    } mem;
+};
+
+/**
+ * memory_region_add_subregion_aliased:
+ * @container: the #MemoryRegion to contain the aliased subregions.
+ * @offset: the offset relative to @container where the aliased subregion
+ *          are added.
+ * @region_size: size of the region containing the aliased subregions.
+ * @subregion: the subregion to be aliased.
+ * @span_size: size between each aliased subregion
+ *
+ * This utility function creates and maps an instance of aliased-memory-region,
+ * which is a dummy device of a single region which simply contains multiple
+ * aliases of the provided @subregion, spanned over the @region_size every
+ * @span_size. The device is mapped at @offset within @container.
+ *
+ * For example a having @span_size = @region_size / 4 we get such mapping:
+ *
+ *               +-----------+
+ *               |           |
+ *               |           |
+ *               | +-------+ |                 +---------+          <--+
+ *               |           |                 +---------+             |
+ *               |           |                 |         |             |
+ *               |           |   +-----------> | alias#3 |             |
+ *               |           |   |             |         |             |
+ *               |           |   |             +---------+             |
+ *               |           |   |             +---------+             |
+ *               |           |   |             |         |             |
+ *               |           |   |   +-------> | alias#2 |             |
+ *               |           |   |   |         |         |             |region
+ *               | container |   |   |         +---------+             | size
+ *               |           |   |   |         +---------+             |
+ *               |           |   |   |         |         |             |
+ *               |           |   |   |  +----> | alias#1 |             |
+ *               |           |   |   |  |      |         |             |
+ *               |           |   |   |  |      +---------+  <--+       |
+ *               |           | +-+---+--+--+   +---------+     |       |
+ *               |           | |           |   |         |     |span   |
+ *               |           | | subregion +-> | alias#0 |     |size   |
+ *        offset |           | |           |   |         |     |       |
+ *        +----> | +-------+ | +-----------+   +---------+  <--+    <--+
+ *        |      |           |
+ *        |      |           |
+ *        |      |           |
+ *        |      |           |
+ *        |      |           |
+ *        +      +-----------+
+ */
+void memory_region_add_subregion_aliased(MemoryRegion *container,
+                                         hwaddr offset,
+                                         uint64_t region_size,
+                                         MemoryRegion *subregion,
+                                         uint64_t span_size);
+
+#endif
diff --git a/hw/misc/aliased_region.c b/hw/misc/aliased_region.c
new file mode 100644
index 00000000000..8fcc63f2648
--- /dev/null
+++ b/hw/misc/aliased_region.c
@@ -0,0 +1,133 @@
+/*
+ * Aliased memory regions
+ *
+ * Copyright (c) 2018  Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "hw/hw.h"
+#include "hw/sysbus.h"
+#include "hw/misc/aliased_region.h"
+#include "hw/qdev-properties.h"
+
+static void aliased_mem_realize(AliasedRegionState *s, const char *mr_name)
+{
+    uint64_t subregion_size;
+    int subregion_bits;
+
+    memory_region_init(&s->container, OBJECT(s), mr_name, s->region_size);
+
+    subregion_bits = 64 - clz64(s->span_size - 1);
+    s->mem.count = s->region_size >> subregion_bits;
+    assert(s->mem.count > 1);
+    subregion_size = 1ULL << subregion_bits;
+
+    s->mem.alias = g_new(MemoryRegion, s->mem.count);
+    for (size_t i = 0; i < s->mem.count; i++) {
+        g_autofree char *name = g_strdup_printf("%s [#%zu/%zu]",
+                                                memory_region_name(s->mr),
+                                                i, s->mem.count);
+        memory_region_init_alias(&s->mem.alias[i], OBJECT(s), name,
+                                 s->mr, 0, s->span_size);
+        memory_region_add_subregion(&s->container, i * subregion_size,
+                                    &s->mem.alias[i]);
+    }
+}
+
+static void aliased_mr_realize(DeviceState *dev, Error **errp)
+{
+    AliasedRegionState *s = ALIASED_REGION(dev);
+    g_autofree char *name = NULL, *span = NULL;
+
+    if (s->region_size == 0) {
+        error_setg(errp, "property 'region-size' not specified or zero");
+        return;
+    }
+
+    if (s->mr == NULL) {
+        error_setg(errp, "property 'iomem' not specified");
+        return;
+    }
+
+    if (!s->span_size) {
+        s->span_size = pow2ceil(memory_region_size(s->mr));
+    } else if (!is_power_of_2(s->span_size)) {
+        error_setg(errp, "property 'span-size' must be a power of 2");
+        return;
+    }
+
+    span = size_to_str(s->span_size);
+    name = g_strdup_printf("masked %s [span of %s]",
+                           memory_region_name(s->mr), span);
+    aliased_mem_realize(s, name);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
+}
+
+static void aliased_mr_unrealize(DeviceState *dev)
+{
+    AliasedRegionState *s = ALIASED_REGION(dev);
+
+    g_free(s->mem.alias);
+}
+
+static Property aliased_mr_properties[] = {
+    DEFINE_PROP_UINT64("region-size", AliasedRegionState, region_size, 0),
+    DEFINE_PROP_UINT64("span-size", AliasedRegionState, span_size, 0),
+    DEFINE_PROP_LINK("iomem", AliasedRegionState, mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aliased_mr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aliased_mr_realize;
+    dc->unrealize = aliased_mr_unrealize;
+    /* Reason: needs to be wired up to work */
+    dc->user_creatable = false;
+    device_class_set_props(dc, aliased_mr_properties);
+}
+
+static const TypeInfo aliased_mr_info = {
+    .name = TYPE_ALIASED_REGION,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AliasedRegionState),
+    .class_init = aliased_mr_class_init,
+};
+
+static void aliased_mr_register_types(void)
+{
+    type_register_static(&aliased_mr_info);
+}
+
+type_init(aliased_mr_register_types)
+
+void memory_region_add_subregion_aliased(MemoryRegion *container,
+                                         hwaddr offset,
+                                         uint64_t region_size,
+                                         MemoryRegion *subregion,
+                                         uint64_t span_size)
+{
+    DeviceState *dev;
+
+    if (!region_size) {
+        region_size = pow2ceil(memory_region_size(container));
+    } else {
+        assert(region_size <= memory_region_size(container));
+    }
+
+    dev = qdev_new(TYPE_ALIASED_REGION);
+    qdev_prop_set_uint64(dev, "region-size", region_size);
+    qdev_prop_set_uint64(dev, "span-size", span_size);
+    object_property_set_link(OBJECT(dev), "iomem", OBJECT(subregion),
+                             &error_abort);
+    sysbus_realize(SYS_BUS_DEVICE(dev), &error_abort);
+
+    memory_region_add_subregion(container, offset,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 554be84b321..f82ffd50a91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2097,6 +2097,12 @@ S: Maintained
 F: include/hw/misc/empty_slot.h
 F: hw/misc/empty_slot.c
 
+Aliased memory region
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Maintained
+F: include/hw/misc/aliased_region.h
+F: hw/misc/aliased_region.c
+
 Standard VGA
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index c71ed258204..ca51b99989e 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -151,6 +151,9 @@ config AUX
 config UNIMP
     bool
 
+config ALIASED_REGION
+    bool
+
 config LED
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 21034dc60a8..e65541b835f 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -12,6 +12,7 @@
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
+softmmu_ss.add(when: 'CONFIG_ALIASED_REGION', if_true: files('aliased_region.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
 
-- 
2.26.2


