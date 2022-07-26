Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E5581AA9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:07:03 +0200 (CEST)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQpa-0002Ui-9T
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQS-0006xZ-Ip
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQQ-00055c-SF
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eSDxuMr2yO/y9xlkkw2ZnyqCh3O55Tzi7ePwLA2HERQ=;
 b=f/6QqvFDwdnk34AOfDb7iCoAmyZoBgbf/edi3CfiQn2qpkydfhechuBCe7JGYOk0krFGZv
 KKW+uSs4NBVXHEGDSJow5y+jKShWdIl2pzKq1zFH1BVQfvsiXc1lumGCmDYkE3y5kVxE0K
 nb2sC2QOk/O2+VMyPtt2tg9xcFC0+TM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-TgILRSu-MPuoaf8EX5Jt9Q-1; Tue, 26 Jul 2022 15:40:55 -0400
X-MC-Unique: TgILRSu-MPuoaf8EX5Jt9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 v24-20020a7bcb58000000b003a37681b861so620271wmj.9
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=eSDxuMr2yO/y9xlkkw2ZnyqCh3O55Tzi7ePwLA2HERQ=;
 b=cLAFY9M5JgFCtLw5UkmmLNgfwQOgMJxLJ3YkQTyhl9roLi7PteXJ7BfOjiRFn4xQYb
 4bGQoSSz8r4j3nMIkXc3H3ePEr+H6yEdqAPXHqXh0sQ+yiK+hUQkabZrNMJp1K3acPwO
 xaFRUQ6vGuf6vGZR79dy2P2yHZCzXGcHPshUweiFNl0txKUG9rCfbIqatcHBi4UoNgXf
 WzhUkwOMjwcLrHuivBY2dD3xev9DANcRGE9jILas4U2dSQ69/8W1b8+p+ibsiVC+AS4x
 dZ2tS2NeZAKx2KypPqgVVe3LJD4yV+sZY+LdGPVMtqG+CahsPeBJ6jcIXvRMjaX/Gub1
 sBXA==
X-Gm-Message-State: AJIora+NxiaKIAPS3PKsomnVi5W/jNHH1Od6gp+icaYyH743s2OS5ExH
 mVjdONU6MzeSm4sLYVkjO4IoJHqve69t/nmtCkW+6FUmNggvQgyBAkwktq3INK0o0MbvHk4Dtyo
 gflUlGO491+PmvPdRKMV/3oOiblNeNFHQpFtY9tCh0qkvibG8UBpOyzVVqwVn
X-Received: by 2002:adf:d84e:0:b0:21e:bdc0:2847 with SMTP id
 k14-20020adfd84e000000b0021ebdc02847mr1148072wrl.582.1658864454276; 
 Tue, 26 Jul 2022 12:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfYtUfV+HduJUBm1twTmFb9wm50p57L+ZKtrR1VmhetLjCFmB5fpyrXHEpfN6pb+5MYIfr4A==
X-Received: by 2002:adf:d84e:0:b0:21e:bdc0:2847 with SMTP id
 k14-20020adfd84e000000b0021ebdc02847mr1148057wrl.582.1658864453957; 
 Tue, 26 Jul 2022 12:40:53 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b003a327b98c0asm18252299wml.22.2022.07.26.12.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:53 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 12/16] i386/pc: factor out device_memory base/size to helper
Message-ID: <20220726193858.177462-13-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Joao Martins <joao.m.martins@oracle.com>

Move obtaining hole64_start from device_memory memory region base/size
into an helper alongside correspondent getters in pc_memory_init() when
the hotplug range is unitialized. While doing that remove the memory
region based logic from this newly added helper.

This is the final step that allows pc_pci_hole64_start() to be callable
at the beginning of pc_memory_init() before any memory regions are
initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-9-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 48 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 611eb197da..ebc27e4cb7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,15 +825,36 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
-static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+static void pc_get_device_memory_range(PCMachineState *pcms,
+                                       hwaddr *base,
+                                       ram_addr_t *device_mem_size)
 {
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *machine = MACHINE(pcms);
-    hwaddr cxl_base;
+    ram_addr_t size;
+    hwaddr addr;
 
-    if (pcmc->has_reserved_memory && machine->device_memory->base) {
-        cxl_base = machine->device_memory->base
-            + memory_region_size(&machine->device_memory->mr);
+    size = machine->maxram_size - machine->ram_size;
+    addr = ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
+
+    if (pcmc->enforce_aligned_dimm) {
+        /* size device region assuming 1G page max alignment per slot */
+        size += (1 * GiB) * machine->ram_slots;
+    }
+
+    *base = addr;
+    *device_mem_size = size;
+}
+
+static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    hwaddr cxl_base;
+    ram_addr_t size;
+
+    if (pcmc->has_reserved_memory) {
+        pc_get_device_memory_range(pcms, &cxl_base, &size);
+        cxl_base += size;
     } else {
         cxl_base = pc_above_4g_end(pcms);
     }
@@ -920,7 +941,7 @@ void pc_memory_init(PCMachineState *pcms,
     /* initialize device memory address space */
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
-        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        ram_addr_t device_mem_size;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -935,13 +956,7 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
-        machine->device_memory->base =
-            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
-
-        if (pcmc->enforce_aligned_dimm) {
-            /* size device region assuming 1G page max alignment per slot */
-            device_mem_size += (1 * GiB) * machine->ram_slots;
-        }
+        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
 
         if ((machine->device_memory->base + device_mem_size) <
             device_mem_size) {
@@ -1046,13 +1061,14 @@ uint64_t pc_pci_hole64_start(void)
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
     uint64_t hole64_start = 0;
+    ram_addr_t size = 0;
 
     if (pcms->cxl_devices_state.is_enabled) {
         hole64_start = pc_get_cxl_range_end(pcms);
-    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
-        hole64_start = ms->device_memory->base;
+    } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
+        pc_get_device_memory_range(pcms, &hole64_start, &size);
         if (!pcmc->broken_reserved_end) {
-            hole64_start += memory_region_size(&ms->device_memory->mr);
+            hole64_start += size;
         }
     } else {
         hole64_start = pc_above_4g_end(pcms);
-- 
MST


