Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1B4037E3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:32:42 +0200 (CEST)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNusj-0004hm-Ka
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRy-0006sd-9l
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRw-0003AH-HX
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id t18so2485895wrb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sAWCVmhntjt3N2I3a0MmSk7QA9BliYQ2Nc92h12oy2c=;
 b=c1BUFXQhkWxtGSSTdub43rVTPyNFoF7PvYKCeNbLBmzZR2dRNHwUVKFl2qsV6acjZB
 9z4VBGs76EOfcboDO+Uoz4Z7VJfP2T13wM+Rcgl+VZwQZXtwoMCoSRy4F+rWrdoXANzJ
 FXWHFdcIjGWlwZ2JgG/VB6hRz3KJSyUWRjKuKgrpptV3pmykdian4gv//AUEBMzxzF/f
 3Eubc5o0qZfRnVC+uPw8WyMT463udns7IXxzbeGhWAAeZMYjZrNUzEzBjw3a7sT9YmBw
 EIV0iwxEsu7C8y/W+PFdQnob7od9kMnwCOb/Clg+/cdXPSstO8FOXGxE5OGlgSxhCkS9
 6nUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sAWCVmhntjt3N2I3a0MmSk7QA9BliYQ2Nc92h12oy2c=;
 b=Oq5d/3dCQii3NUaw70a3GRMdiH89doSMZnqm6PhJTOHW3PrWL7hmxdQKDEh4Tu94C8
 FM7ihpybfMF9Jt1RuskPkSwJCOBSq1ViYtLJ8RV8KfKiB3vu70B9CPYvgUSaTfKs0GKq
 TsnrGSP9lF8AsV4LyGTOAnJPL0m0uR/8vVLndtB+61pZ0gXGH7ieZcllv6v8CyyOUQ07
 QqjblC5vJTU+o8wNzWlSrE3ecz1HP+25hjKByEnnFvUCk0DmnTkQeksfK4+yIxOtLshz
 1GycGV213thRwlP9CzEDCjXodNe4IKxlRsYXQnpuZlJv1YF2GbG6MviqX4aEeu2Bsm7W
 Gbmg==
X-Gm-Message-State: AOAM533TQiL86w5couvSbraDU63rwbAaXjlLs1kGR48idSK+Qs5lHk5U
 MiHRclItCDJWPsz+1Db9RzJ4hDmV4/0=
X-Google-Smtp-Source: ABdhPJyu2eu93ed6VUQxNcijweCkTWL0g87Jio8ysWM35h8vVYTMagw7lPW2QPlZfFlzP6cQ68IoNg==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr2385696wrq.359.1631095499184; 
 Wed, 08 Sep 2021 03:04:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 32/43] sgx-epc: Add the reset interface for sgx-epc virt
 device
Date: Wed,  8 Sep 2021 12:04:15 +0200
Message-Id: <20210908100426.264356-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
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



