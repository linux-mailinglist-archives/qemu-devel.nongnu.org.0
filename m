Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C2A4037F7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:37:25 +0200 (CEST)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuxI-0006ti-QB
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS2-0006ud-ID
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS0-0003DA-CD
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:05 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z4so2397089wrr.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmGIbQ3pyoWC76VZj4ie9GYX4qqPuNvX4g9NmbF5xHw=;
 b=TBnwrRoLDCwbM2Ma97y4qkv0Cou36rN3jg6N9mqstt8QRJmw7Fy38eD/8GEUoHI/0E
 /RzXPjdorWu+gE0BH8bK9v8ZbirJBp5bfDH5aAYClPz/oHRXxA8EIj93qjAdECtHmaXl
 P01gTBPNFxNBzKMFHxk2cCpbkniRuEf2o2R3E5tNozxS07/aolCm4nABTh2RQHhuqGL5
 k7pEuX85ABZ/cmIpXX60W6awNt++lGy0vU/btdJtFrASNWGziaYYnqlkIbR/dz2GIMiq
 1Lv4qoso7nx1jbsA2DHPW+vrucS3uwLzLt4/t0nUTNQjoNIsU9+ME/Oe5+cNor+1nvwL
 5kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lmGIbQ3pyoWC76VZj4ie9GYX4qqPuNvX4g9NmbF5xHw=;
 b=DQW++MOqwpsa48PoWI2o+cX18WcBx1w7EqPp+RAxh6FtfdUctNJA+dLlLTWiOFhEgS
 mEs1Vhq+HaVnSwZ0wMPkT3eooGS3d0p+rGkCh2MUsYfKl2EXX3TG0CVW82NLjtrmwacL
 IhJpREygn+otiN2uzaMa/uzZ85NX7pDQKi0wLEDRWxCypgc55tb6t+3bc1PheS09w+/G
 gYNdkD9/XK56+8vspEmPvx7zcJLVaMB+9LxXjgRTtS5l4BFFX0LtEVTOm/ocXuIZm2Ks
 QTw5y2qB8WcW7VAlx5cW+A9kHDhWAJ6wzyPs24Nnf1R0Y3AcHcmrYjSINDn2VZN70D/c
 iYKw==
X-Gm-Message-State: AOAM530ekYrFuxYLyrAyZ898WuQ6myAZkgrYrr60KVPxuFhyYlSRtyff
 Xi6KSbLX6gZc5YOU5An1rL2yZJsmESw=
X-Google-Smtp-Source: ABdhPJysFQBEMflepTLrfNo0kFjI0JI1hvQjhZCm+PT5EouBgwrbKiBzoEGkd+dkncacLUE1KaI3bg==
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr3049383wrx.276.1631095502041; 
 Wed, 08 Sep 2021 03:05:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 36/43] sgx-epc: Add the fill_device_info() callback support
Date: Wed,  8 Sep 2021 12:04:19 +0200
Message-Id: <20210908100426.264356-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Since there is no fill_device_info() callback support, and when we
execute "info memory-devices" command in the monitor, the segfault
will be found.

This patch will add this callback support and "info memory-devices"
will show sgx epc memory exposed to guest. The result as below:

qemu) info memory-devices
Memory device [sgx-epc]: ""
  memaddr: 0x180000000
  size: 29360128
  memdev: /objects/mem1
Memory device [sgx-epc]: ""
  memaddr: 0x181c00000
  size: 10485760
  memdev: /objects/mem2

Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v3-->v4:
    - Removed the epc device 'id' from compound property(Paolo).

v1-->v2:
    - "Since: 5.1" to "Since: 6.1"(Eric Blake).
Message-Id: <20210719112136.57018-33-yang.zhong@intel.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-epc.c  | 11 ++++++++++-
 monitor/hmp-cmds.c | 10 ++++++++++
 qapi/machine.json  | 26 +++++++++++++++++++++++++-
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 70075db37c..7fc3dd81b9 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -214,7 +214,16 @@ static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
 static void sgx_epc_md_fill_device_info(const MemoryDeviceState *md,
                                         MemoryDeviceInfo *info)
 {
-    /* TODO */
+    SgxEPCDeviceInfo *se = g_new0(SgxEPCDeviceInfo, 1);
+    SGXEPCDevice *epc = SGX_EPC(md);
+
+    se->memaddr = epc->addr;
+    se->size = object_property_get_uint(OBJECT(epc), SGX_EPC_SIZE_PROP,
+                                        NULL);
+    se->memdev = object_get_canonical_path(OBJECT(epc->hostmem));
+
+    info->u.sgx_epc.data = se;
+    info->type = MEMORY_DEVICE_INFO_KIND_SGX_EPC;
 }
 
 static void sgx_epc_class_init(ObjectClass *oc, void *data)
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f7ee..0d414d60c7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1823,6 +1823,7 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
     VirtioMEMDeviceInfo *vmi;
     MemoryDeviceInfo *value;
     PCDIMMDeviceInfo *di;
+    SgxEPCDeviceInfo *se;
 
     for (info = info_list; info; info = info->next) {
         value = info->value;
@@ -1870,6 +1871,15 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
                                vmi->block_size);
                 monitor_printf(mon, "  memdev: %s\n", vmi->memdev);
                 break;
+            case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
+                se = value->u.sgx_epc.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               se->id ? se->id : "");
+                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", se->memaddr);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", se->size);
+                monitor_printf(mon, "  memdev: %s\n", se->memdev);
+                break;
             default:
                 g_assert_not_reached();
             }
diff --git a/qapi/machine.json b/qapi/machine.json
index 10d36da83f..61514c6d9f 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1220,6 +1220,29 @@
   'data': { 'sgx-epc': ['SgxEPC'] }
 }
 
+##
+# @SgxEPCDeviceInfo:
+#
+# Sgx EPC state information
+#
+# @id: device's ID
+#
+# @memaddr: physical address in memory, where device is mapped
+#
+# @size: size of memory that the device provides
+#
+# @memdev: memory backend linked with device
+#
+# Since: 6.1
+##
+{ 'struct': 'SgxEPCDeviceInfo',
+  'data': { '*id': 'str',
+            'memaddr': 'size',
+            'size': 'size',
+            'memdev': 'str'
+          }
+}
+
 ##
 # @MemoryDeviceInfo:
 #
@@ -1234,7 +1257,8 @@
   'data': { 'dimm': 'PCDIMMDeviceInfo',
             'nvdimm': 'PCDIMMDeviceInfo',
             'virtio-pmem': 'VirtioPMEMDeviceInfo',
-            'virtio-mem': 'VirtioMEMDeviceInfo'
+            'virtio-mem': 'VirtioMEMDeviceInfo',
+            'sgx-epc': 'SgxEPCDeviceInfo'
           }
 }
 
-- 
2.31.1



