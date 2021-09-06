Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF8B401C8B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:42:36 +0200 (CEST)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEtP-0002bo-90
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPq-0002E2-LU
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:12:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPo-00085o-Re
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:12:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id u16so9797591wrn.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmGIbQ3pyoWC76VZj4ie9GYX4qqPuNvX4g9NmbF5xHw=;
 b=qCUj0ycFD2xET8U57B4hBl2sTqPHE5KYiVGtw3pf00oI4IojvKx6m0dOmD/jV8gHVd
 vBF1VB6qU0hBSGx/klOrMFkwwGr1RLwztDjvibbxR3Ozr+6FsCEiVKwnnalS79a6SLUM
 B76L592wU5pkLaQObdQ0+OkxOOwvJr8Gx4HIrFkbZ2XttofEsZLI4LkF3awHAP/JTmOV
 Y2i0RFkmMME9gP0szAKqZftE0AOT9MEl/mbj90NL0s5MZ9Y6bXBi1M9IzZiQ7SJHkTSg
 6xWclOLu7k2wg8tcOn0hqq/hzvx+x2nRuG/zZGgNPilaw0LUOBUp7WeiuJazdlcxg16h
 VX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lmGIbQ3pyoWC76VZj4ie9GYX4qqPuNvX4g9NmbF5xHw=;
 b=I178VX9e9Qi8xCS4GHAxta2C7HiqZgxb71NJHUUtQlqDL5jFFeczdPI4/B6OxnWgN7
 EgtiNCCi4ODuHepNL95JV0vGvDrRefBh59qk5VF61Hpz2wpIis7TRmi6Yr3w8s0MDLEs
 rvAOt4ma56VUvQ56zEBjSVptNpmB8bPVIa/HpN0uyzURTZXUcDkKJUlrYTD8COehC6Nx
 lQTC7xjbX1JACQiiJCKAHL0STC2FMB5gcp2VpaYq5npgS9tl1sZWBoMG4yXs2PDXD5Xq
 BzrvoEN5QeYAW3ywEgkWYGk4tM4uXdxPZUpNHJDrCMGlLnHytSSgYuY8Y83BVDoxh5hM
 lHQg==
X-Gm-Message-State: AOAM532C5pnSNL1PPrz6h1h7fKvCHEbnfdw+Qq8wVXjf7ibWRb1DI9Qu
 RbjROlu2lBId6CkCsOkmyaQ8zQi/46Q=
X-Google-Smtp-Source: ABdhPJyCONBnmu8mtyLj7SystsuySnboSXHeBXzLx4LiN5x/3npUilmOFVrEpDIkT301B0LHpXaK6g==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr13186067wri.91.1630933919586; 
 Mon, 06 Sep 2021 06:11:59 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/36] sgx-epc: Add the fill_device_info() callback support
Date: Mon,  6 Sep 2021 15:10:58 +0200
Message-Id: <20210906131059.55234-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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



