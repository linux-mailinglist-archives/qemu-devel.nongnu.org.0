Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E45363F15
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:46:33 +0200 (CEST)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQUC-0003y9-Bb
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRS-0001zU-3X; Mon, 19 Apr 2021 05:43:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRP-0002xm-I7; Mon, 19 Apr 2021 05:43:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m9so20514800wrx.3;
 Mon, 19 Apr 2021 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v9JqXmP/0u1BAwybxwxkBZqBwyDXMM6e3M5Yn/b7xSA=;
 b=tiU7DScooeFxI5pUWFEOOFDcE7lNi68rNl1qL6p1mjNoz3b9msRXmmzMia1XHr2P3j
 uFUXfjgDeD+8d1nFuHDA9j6966ij0OjnzrLUEDzihBMTCFCgBRdB/zvhxThQIPxFbnZx
 oAfrZzH3Qpx8P15zHD680GjjMfctYL3sreuuJAbMKpJo5Jb0ehJJqlBpdF2DIZPLed9A
 TaO5QpJ8z5pIcLj984Wf5KA3nzsYNdCOPZi5Y2cRtEyhRKZlzHPjvh9CR8Cnyx12FnhX
 ZIKwzdOjgi8N2ZhbcTIQCwaTgARtNs4lYhDHj2zkkEAyMA0oxdgUwfeaQfBJStpItTyi
 CipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v9JqXmP/0u1BAwybxwxkBZqBwyDXMM6e3M5Yn/b7xSA=;
 b=n8oS+PtvSeBwvC9hGSGxDFzTq/kltfGNoFaXTxyPtjNANCQ76UxgxfGvoXh+THDKEm
 QE3SMVzp0Mvw1FLVnah9vLGoMrBCugGLfYo/3b8lb6LCWmtKvrn8IHYwOY7D4CPaw3qG
 ikOVhHKzHI5IdgtIKVbuzRdH5RBg/PbqC4xa027RFesXIsewOV8FOHTmhGsuUqaR9wg+
 h4TRMdeAkKnls6DZPAEDMQX0KV6woBnDzIWeNYOCv8vimzxhpgPSqhz06z+js4kHl7fa
 6BwA6A/PCFrMkQ893TAlqe5k9q845bf4AWc5++gD+ItNZH3U9PQJ46wbQfe5ZwGyR0OU
 8PUg==
X-Gm-Message-State: AOAM5302V/mwY85p9DPbrQYdPAE7GvatxVyYOl/Z90T4HCmn4FPuCNnP
 KvJoKYt10CU9pYA6TDpo4lp6Yrkal2Khiw==
X-Google-Smtp-Source: ABdhPJzmQhnoSCxDLRaokvedCgZ2VBGZ/MhU0WZkJXngvnmHp9i13mOz0oqJr8oCssNQ21GoI4hrzQ==
X-Received: by 2002:adf:f504:: with SMTP id q4mr13538435wro.304.1618825416767; 
 Mon, 19 Apr 2021 02:43:36 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v185sm19836235wmb.25.2021.04.19.02.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:43:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/7] hw/misc: Add device to help managing aliased
 memory regions
Date: Mon, 19 Apr 2021 11:43:23 +0200
Message-Id: <20210419094329.1402767-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
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
Not really RFC, simply that I'v to add the technical description,
but I'd like to know if there could be a possibility to not accept
this device (because I missed something) before keeping working on
it. So far it is only used in hobbyist boards.

Cc: Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/misc/aliased_region.h |  87 ++++++++++++++++++++
 hw/misc/aliased_region.c         | 132 +++++++++++++++++++++++++++++++
 MAINTAINERS                      |   6 ++
 hw/misc/Kconfig                  |   3 +
 hw/misc/meson.build              |   1 +
 5 files changed, 229 insertions(+)
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
index 00000000000..3132276af29
--- /dev/null
+++ b/hw/misc/aliased_region.c
@@ -0,0 +1,132 @@
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
index 36055f14c59..151c342e338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2095,6 +2095,12 @@ S: Maintained
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
2.26.3


