Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3301241AFA6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:07:52 +0200 (CEST)
Received: from localhost ([::1]:35266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCpr-0001Eo-8R
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaI-0006eU-7O
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:46 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaG-0001Vt-Ep
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:45 -0400
Received: by mail-ed1-x536.google.com with SMTP id g7so23334099edv.1
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=50+7DLLvMJpLvY9tsDPgl4TU2uB7R8yc3w14Pg81CxY=;
 b=PZYJruypVpVZdUGjp/fn/9x42kajT9xf9+TlI+dnI3WX1sVKetHXn5OQbqLwNjtz++
 iypr+i4QT5Z9LbYVO0KVQ6afPosvRRhErg5xXrhyklCTYT61MDmAkGrCFEQkpkKiJVnp
 WZ+8tkmYYE//Z0R5JS9R1e6G65c23XOC7fp7CARp/RopFe22fvN2d7iYVlmX3uEoVjra
 zdQsRLvm+/r50Hqec8KO9X2JtqD9YwnRmPjyV86afPOSZNWuRvrPXTK5NxprujojTskr
 ZCPCOT5eZfF7jP50PbAHpdoyIPkUaWypNI0RZgptjWOtd/5mK/ThIq7Pd0r6VlRM2ld1
 TUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=50+7DLLvMJpLvY9tsDPgl4TU2uB7R8yc3w14Pg81CxY=;
 b=kidbNJMoCGsJA2L+EMA1T3vVCbfzBwrInY0Zinp9WvHq/DCLAXQXqRq0iPziaVKLay
 FDTUfabcZVZ6NukElaVocwhXeLCUdHfl6IlmNWhHVFsgaKkqfWqbrEnbeszvTN43i1ir
 Fwcg2IM2W1aYlfMGkmdvDmx6gfw7sKaBNnvvK1nKCcMjOhirEPeuA1qscvy+Suut8bvr
 p0BlTBidxSI4dgBBTH8CSfavqs0YUyWbcXigL5TyNCRtS9VFXJ5eRS1nohOECaxYhwdw
 H4Nodl8CSS2ZwvvPDNkFkFefIQPUvIB3LThuKEPk79nImRyQPm17mLaoyB3eFoihjDzL
 SHkg==
X-Gm-Message-State: AOAM530jWkcA8T63WMioI+BCxJgD/VvrY2Tjv2KgINtHL1d453BbNhdB
 njjr0X3oQcSVDYlLWuxwoJFBioR/6nw=
X-Google-Smtp-Source: ABdhPJx7fezH9l2n1b8/uoSQt/K3DUR6A7ne56ebjJsujE6LZoaih8gpiF6NTM4gI4EeCr17Gy/Ruw==
X-Received: by 2002:a05:6402:694:: with SMTP id
 f20mr7432734edy.100.1632833497024; 
 Tue, 28 Sep 2021 05:51:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] sgx-epc: Add the fill_device_info() callback support
Date: Tue, 28 Sep 2021 14:51:06 +0200
Message-Id: <20210928125116.183620-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
Message-Id: <20210719112136.57018-33-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-epc.c  | 11 ++++++++++-
 monitor/hmp-cmds.c | 10 ++++++++++
 qapi/machine.json  | 39 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 6677dc74b5..55e2217eae 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -133,7 +133,16 @@ static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
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
index b5e71d9e6f..bcaa41350e 100644
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
index 26c539fe2c..e2f01e9c15 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1194,13 +1194,36 @@
           }
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
+# Since: 6.2
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
 # @MemoryDeviceInfoKind:
 #
 # Since: 2.1
 ##
 { 'enum': 'MemoryDeviceInfoKind',
-  'data': [ 'dimm', 'nvdimm', 'virtio-pmem', 'virtio-mem' ] }
+  'data': [ 'dimm', 'nvdimm', 'virtio-pmem', 'virtio-mem', 'sgx-epc' ] }
 
 ##
 # @PCDIMMDeviceInfoWrapper:
@@ -1225,13 +1248,22 @@
 ##
 { 'struct': 'VirtioMEMDeviceInfoWrapper',
   'data': { 'data': 'VirtioMEMDeviceInfo' } }
+
+##
+# @SgxEPCDeviceInfoWrapper:
+#
+# Since: 6.2
+##
+{ 'struct': 'SgxEPCDeviceInfoWrapper',
+  'data': { 'data': 'SgxEPCDeviceInfo' } }
+
 ##
 # @MemoryDeviceInfo:
 #
 # Union containing information about a memory device
 #
 # nvdimm is included since 2.12. virtio-pmem is included since 4.1.
-# virtio-mem is included since 5.1.
+# virtio-mem is included since 5.1. sgx-epc is included since 6.2.
 #
 # Since: 2.1
 ##
@@ -1241,7 +1273,8 @@
   'data': { 'dimm': 'PCDIMMDeviceInfoWrapper',
             'nvdimm': 'PCDIMMDeviceInfoWrapper',
             'virtio-pmem': 'VirtioPMEMDeviceInfoWrapper',
-            'virtio-mem': 'VirtioMEMDeviceInfoWrapper'
+            'virtio-mem': 'VirtioMEMDeviceInfoWrapper',
+            'sgx-epc': 'SgxEPCDeviceInfoWrapper'
           }
 }
 
-- 
2.31.1



