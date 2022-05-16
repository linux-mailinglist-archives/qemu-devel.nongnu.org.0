Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3B529200
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:57:52 +0200 (CEST)
Received: from localhost ([::1]:43988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhml-0006rO-Io
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgF-0004WL-KU
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgD-0006H0-Hx
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfCW3nhFWGiKDdrFS6KcMLbjRvhVTdngWAjxQhHu0b8=;
 b=N5Lebx7MH1rFhwFuxJPJVthtOso4i9oWMUdrLvzTO7mrHwd1J49UtGvJ4h/0WK3xIFSdCH
 OMxK17GjsTHfWrptYGrDSkrcCkw5+ikl0/A+Yp/PL8G+tCC2t8GMGbcEPfBViK06+BQTUK
 3Dg51PU4jY29JTLppU1S045l4KWNTuM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-rb_-HUnnMG-MHp45MPh8QQ-1; Mon, 16 May 2022 16:51:00 -0400
X-MC-Unique: rb_-HUnnMG-MHp45MPh8QQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 n9-20020aa7d049000000b0042aab725949so3388836edo.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dfCW3nhFWGiKDdrFS6KcMLbjRvhVTdngWAjxQhHu0b8=;
 b=r4Kr5S0SWK/geackzNlZwzrfzfiW3/ggIPSF82VOpFkqi0olIKEvrGDIg4F0z2Kufh
 Lnxj0SBwhlx/jAaQhNWNN91IH2XlUD28VwYrYj2FE/kxSSviUo8pJ2/lkog2pLsj+mx7
 gsmKtUi8ZX4R2e4Z2g3WodcoTPvnOQSG2gUhwNUH2X+Dqj4kUZnLKg9kiDBUtcmTFZxy
 y8sRTjRXcYv0ZO4P7NEeCJ37BIW0luKh+JP7uvJyN0lSv1VT9VwGlwJj+4AmntEz0kwU
 G7rWnLUhm8/T7+wYUXrODOuErEhW+BnnR1qq/w6mwB4ZN2n4Wk+ZwmSvkUSr4rz2qv4d
 Fvfw==
X-Gm-Message-State: AOAM533KJvgXegCMzlwpwHmQAHgvLwuxBPGKXmUP6cHrlbR3/nCC6y9r
 /N8QOwgvKQMf7loDKukQw2J953QKTjFYT6+8Ik6DP5jZOX2XU0zz/tRQKQwspoxBqjiMTIP8BAQ
 TzpXfKbcUb9vI9FgeT2bUr/37ftowo8dAGaOOLYxd+oAmX4lV9p6IS4XwgOZI
X-Received: by 2002:a17:907:7dab:b0:6f4:6650:395d with SMTP id
 oz43-20020a1709077dab00b006f46650395dmr16650911ejc.82.1652734258469; 
 Mon, 16 May 2022 13:50:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkwHm24Th852A4lnJR+rXi17Gx3WC80lXTsZORAGZUbwmkDjB60hM17RnwE3M6MOdA+bbTPg==
X-Received: by 2002:a17:907:7dab:b0:6f4:6650:395d with SMTP id
 oz43-20020a1709077dab00b006f46650395dmr16650885ejc.82.1652734258196; 
 Mon, 16 May 2022 13:50:58 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214df6sm167662ejc.92.2022.05.16.13.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:57 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v2 15/86] cxl: Machine level control on whether CXL support is
 enabled
Message-ID: <20220516204913.542894-16-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

There are going to be some potential overheads to CXL enablement,
for example the host bridge region reserved in memory maps.
Add a machine level control so that CXL is disabled by default.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-14-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h  |  2 ++
 include/hw/cxl/cxl.h |  4 ++++
 hw/core/machine.c    | 28 ++++++++++++++++++++++++++++
 hw/i386/pc.c         |  1 +
 4 files changed, 35 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 7b416c9787..fa57bac4fb 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -269,6 +269,7 @@ struct MachineClass {
     bool ignore_boot_device_suffixes;
     bool smbus_no_migration_support;
     bool nvdimm_supported;
+    bool cxl_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
     SMPCompatProps smp_props;
@@ -359,6 +360,7 @@ struct MachineState {
     CPUArchIdList *possible_cpus;
     CpuTopology smp;
     struct NVDIMMState *nvdimms_state;
+    struct CXLState *cxl_devices_state;
     struct NumaState *numa_state;
 };
 
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 554ad93b6b..31af92fd5e 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -17,4 +17,8 @@
 #define CXL_COMPONENT_REG_BAR_IDX 0
 #define CXL_DEVICE_REG_BAR_IDX 2
 
+typedef struct CXLState {
+    bool is_enabled;
+} CXLState;
+
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3264c1e11d..b03d9192ba 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -33,6 +33,7 @@
 #include "sysemu/qtest.h"
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/cxl/cxl.h"
 #include "migration/global_state.h"
 #include "migration/vmstate.h"
 #include "exec/confidential-guest-support.h"
@@ -625,6 +626,20 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
     nvdimms_state->persistence_string = g_strdup(value);
 }
 
+static bool machine_get_cxl(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->cxl_devices_state->is_enabled;
+}
+
+static void machine_set_cxl(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->cxl_devices_state->is_enabled = value;
+}
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 {
     QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
@@ -911,6 +926,8 @@ static void machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 128 * MiB;
     mc->rom_file_has_mr = true;
 
+    /* Few machines support CXL, so default to off */
+    mc->cxl_supported = false;
     /* numa node memory size aligned on 8MB by default.
      * On Linux, each node's border has to be 8MB aligned
      */
@@ -1071,6 +1088,16 @@ static void machine_initfn(Object *obj)
                                         "Valid values are cpu, mem-ctrl");
     }
 
+    if (mc->cxl_supported) {
+        Object *obj = OBJECT(ms);
+
+        ms->cxl_devices_state = g_new0(CXLState, 1);
+        object_property_add_bool(obj, "cxl", machine_get_cxl, machine_set_cxl);
+        object_property_set_description(obj, "cxl",
+                                        "Set on/off to enable/disable "
+                                        "CXL instantiation");
+    }
+
     if (mc->cpu_index_to_instance_props && mc->get_default_cpu_node_id) {
         ms->numa_state = g_new0(NumaState, 1);
         object_property_add_bool(obj, "hmat",
@@ -1108,6 +1135,7 @@ static void machine_finalize(Object *obj)
     g_free(ms->device_memory);
     g_free(ms->nvdimms_state);
     g_free(ms->numa_state);
+    g_free(ms->cxl_devices_state);
 }
 
 bool machine_usb(MachineState *machine)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 305d2c0820..45e2d6092f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1761,6 +1761,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
+    mc->cxl_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
-- 
MST


