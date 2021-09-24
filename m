Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A4417162
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:58:16 +0200 (CEST)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjqJ-00044B-6S
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKh-00088i-Tu
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:36 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKd-0000dX-7t
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:35 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ee50so34837265edb.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSiZg0OyaQnhxkqFy1IPCwZxvMMrttkHp5blEbDPMg8=;
 b=a2KVEZywe0uFf4eTkLnVVHh6vNXXq6CuRNYfWHpB88FwJR3xyn5SWMchCfAO6W9cn6
 uEgc7Rgv9zMwEtkN3ohbi6hE9vKYWV0El9QB+l61IXA5duGwPN4VTg81mpjTNIXidVmm
 lFNxD4G43lh2AxJ4A9BBaqQ2Jyuwa7jNqNCwxM4i+6KAfeB1tZJr/Qh9wZQUy/tXyAVX
 Z313ulGgaTRyW/rAo4D9zhhOmHw/C8aAWDrJoYaJWjnWzLZwRurrHUUQsdP34bG/jVdK
 Ehu7nd/b+Qh0GCPLpmTocK3xW+0xfa49YSm8t0aCmdU/CbE3gYb41LvW8byiEanAKrdC
 EVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zSiZg0OyaQnhxkqFy1IPCwZxvMMrttkHp5blEbDPMg8=;
 b=6mvU3Uql9bL3ZDGA1PzBtW76mQyD59/QcGOwePrzbte641bKajd+5qKt6Q/rdTPb+T
 F8bQVHpiosoOcnDnkkqe3/hWgogH2EfdfTeOtrewrFURGyGIqWIchTkAgIEwXMlInf7O
 Gwq/SmUvbTUZMGjmCKXgW0nnFqbkYnOfya2kSq2zlCs5Ge+V8L7rtm2PuuH7UT7OAIdp
 FS+k53NUaAmlvP3D4nnpZs/dTY4/tpORYvr0UDQCo9fbe0IVfh0v+MkoeNxB1Bj/LpCK
 1LRhBbXgprDS0RWpbjRpOHg/hptcHqEs17W8asVmNsdBkiNcygG2nEm1VtccvQJfLB+y
 Eynw==
X-Gm-Message-State: AOAM531FbKFjSySnniyxhE4eFI6QmC3lwtpBXEDMv8Ikb7rufvQLopBi
 tgYxZ4bR/C+B2NT9GY3C68DLt9HJjs0=
X-Google-Smtp-Source: ABdhPJwegWzNOuduLhBSj5096DJUHy7kThswqHGAUTyweGIifj51wQooR0yEHPLMrhPFseWoMR7xJw==
X-Received: by 2002:a17:906:5045:: with SMTP id
 e5mr11032207ejk.239.1632482729312; 
 Fri, 24 Sep 2021 04:25:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/26] sgx-epc: Add the fill_device_info() callback support
Date: Fri, 24 Sep 2021 13:25:06 +0200
Message-Id: <20210924112509.25061-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com
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
 qapi/machine.json  | 26 +++++++++++++++++++++++++-
 3 files changed, 45 insertions(+), 2 deletions(-)

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
index 5132abf152..2d637abfc7 100644
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



