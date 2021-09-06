Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DB401C68
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:37:32 +0200 (CEST)
Received: from localhost ([::1]:36200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEoV-0004B5-8o
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPj-0001kE-5A
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPh-0007xm-Ec
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id z4so9781369wrr.6
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sAWCVmhntjt3N2I3a0MmSk7QA9BliYQ2Nc92h12oy2c=;
 b=aUfHxbaLmK0NddcEfpYIatbtZy/+LvAnOrFxLc5IRaUEJBB/OIIANxOJpMnrHW+4VU
 xKtCo1x7BembYeh2rgAUD60XSb50jP/Ah2Ca1lYzwnldqqcqAfc7vvea4LfiG9iqA91Q
 CUNcd2ueHuGhT8FSoCjTtiCEyxEZegFslP2MFzwyip81xG/pz+hPCCywZoNDT5Yk/vxK
 kBgqCeO1mu4y1RRcKBsialYD0ijf1IJcNvj0FLXECI+Pl+SiepVuzYAAmRRp4DqMXArT
 tOeJBXcPqj+fsNMTeGa61f++F5MT/myp4nZ5bjeyGT8+OHcL+QfxYeH0REbzl5Z/zShv
 Wwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sAWCVmhntjt3N2I3a0MmSk7QA9BliYQ2Nc92h12oy2c=;
 b=YAWt4FnROJOVGC9zSzte/L8EierQCrYMnnpb95HznBAauftvGrKBzc6bnXEiBArb/Y
 OFAmT7dYy/BnXLDWaFY+nKJMZ1DrBWWdOzgD2/3RVeIGzb+/FVGOWeciSmvLp0AQwU+n
 xCb3bqRLIHGEidg26AlbYqn2k7kf14/Jp3YSg1euZzl5zKxbYJDSfLLzHSG7m2Uqd7ul
 kanoq0S+fyql1sT/StaYpASQep+0fvzhNV6byRkUy7r3YmgrCzFw2VB0Kq8eRJO1oEIJ
 R9J9qoi61n0PPvTWceN4Z3dmqvVBBIFJAOLOBa7rb9x2P7u3QrMZ3VhwEPlF2a1cbFTc
 uhCA==
X-Gm-Message-State: AOAM530Ravj3D61pqZAoUz7tzXFfW7LPCGR6+U8s36/+KGvrnwWjEAmm
 IQjinDf0Wt/tAHsqfjbVhqORnBFtuLk=
X-Google-Smtp-Source: ABdhPJxr8XqlK4IojaGoikoEks3lfzyo3jGyexLI6aYRbkJgnRgIclzhk679Sn4qyySFHraQZyVtkw==
X-Received: by 2002:a5d:69c6:: with SMTP id s6mr13201598wrw.157.1630933912189; 
 Mon, 06 Sep 2021 06:11:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/36] sgx-epc: Add the reset interface for sgx-epc virt device
Date: Mon,  6 Sep 2021 15:10:54 +0200
Message-Id: <20210906131059.55234-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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

If the VM is reset, we need make sure sgx virt epc in clean status.
Once the VM is reset, and sgx epc virt device will be reseted by
reset callback registered by qemu_register_reset(). Since this epc
virt device depend on backend, this reset will call backend reset
interface to re-mmap epc to guest.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-24-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-epc.c | 94 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 13 deletions(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 924dea22f0..9880d832d5 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -18,6 +18,9 @@
 #include "qapi/visitor.h"
 #include "target/i386/cpu.h"
 #include "exec/address-spaces.h"
+#include "sysemu/reset.h"
+
+uint32_t epc_num;
 
 static Property sgx_epc_properties[] = {
     DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
@@ -47,12 +50,84 @@ static void sgx_epc_init(Object *obj)
                         NULL, NULL, NULL);
 }
 
+static void sgx_epc_del_subregion(DeviceState *dev)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    SGXEPCDevice *epc = SGX_EPC(dev);
+
+    /* del subregion and related operations */
+    memory_region_del_subregion(&sgx_epc->mr,
+                                host_memory_backend_get_memory(epc->hostmem));
+    host_memory_backend_set_mapped(epc->hostmem, false);
+    g_free(sgx_epc->sections);
+    sgx_epc->sections = NULL;
+
+    /* multiple epc devices, only zero the first time */
+    if (epc_num == sgx_epc->nr_sections) {
+        sgx_epc->size = 0;
+        sgx_epc->nr_sections = 0;
+    }
+}
+
+static void sgx_epc_initialization(DeviceState *dev)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
+    MemoryDeviceState *md = MEMORY_DEVICE(dev);
+    SGXEPCDevice *epc = SGX_EPC(dev);
+    Error *errp = NULL;
+
+    if (!epc->hostmem) {
+        error_setg(&errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
+        return;
+    }
+
+    epc->addr = sgx_epc->base + sgx_epc->size;
+
+    memory_region_add_subregion(&sgx_epc->mr, epc->addr - sgx_epc->base,
+                                host_memory_backend_get_memory(epc->hostmem));
+
+    host_memory_backend_set_mapped(epc->hostmem, true);
+
+    sgx_epc->sections = g_renew(SGXEPCDevice *, sgx_epc->sections,
+                                sgx_epc->nr_sections + 1);
+    sgx_epc->sections[sgx_epc->nr_sections++] = epc;
+
+    sgx_epc->size += memory_device_get_region_size(md, &errp);
+}
+
+static void sgx_epc_reset(void *opaque)
+{
+    DeviceState *dev = opaque;
+    SGXEPCDevice *epc = SGX_EPC(dev);
+    Error *errp = NULL;
+    int fd;
+
+    if (!epc->hostmem) {
+        error_setg(&errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
+        return;
+    }
+
+    /* delete subregion and related operations */
+    sgx_epc_del_subregion(dev);
+
+    /* reset sgx backend */
+    fd = memory_region_get_fd(host_memory_backend_get_memory(epc->hostmem));
+    sgx_memory_backend_reset(epc->hostmem, fd, &errp);
+    if (errp) {
+        error_setg(&errp, "failed to call sgx_memory_backend_reset");
+        return;
+    }
+
+    /* re-add subregion and related operations */
+    sgx_epc_initialization(dev);
+}
+
 static void sgx_epc_realize(DeviceState *dev, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    MemoryDeviceState *md = MEMORY_DEVICE(dev);
-    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     SGXEPCDevice *epc = SGX_EPC(dev);
     const char *path;
 
@@ -71,18 +146,11 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    epc->addr = sgx_epc->base + sgx_epc->size;
+    sgx_epc_initialization(dev);
+    epc_num++;
 
-    memory_region_add_subregion(&sgx_epc->mr, epc->addr - sgx_epc->base,
-                                host_memory_backend_get_memory(epc->hostmem));
-
-    host_memory_backend_set_mapped(epc->hostmem, true);
-
-    sgx_epc->sections = g_renew(SGXEPCDevice *, sgx_epc->sections,
-                                sgx_epc->nr_sections + 1);
-    sgx_epc->sections[sgx_epc->nr_sections++] = epc;
-
-    sgx_epc->size += memory_device_get_region_size(md, errp);
+    /* register the reset callback for sgx reset */
+    qemu_register_reset(sgx_epc_reset, dev);
 }
 
 static void sgx_epc_unrealize(DeviceState *dev)
-- 
2.31.1



