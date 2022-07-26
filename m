Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A612581B01
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:25:06 +0200 (CEST)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGR73-0004zm-3m
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ9-0006JF-TZ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ6-00051U-0M
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=APQb4qnExfzNsssSKVQTxFsOb7acJVHhdlS++yMpUB8=;
 b=GDU/nex8NFJT+cfB4P4nNQsAdN4HnMSjgFQ4ipSt92HDUSxPWW/VVx/fP8p6iYSONGGYV/
 bMo6p1egOZRoCmQIzgBwBwl992G28ngpaj2oIoQJlP2I4A8uBKO2S4Y8ZliaTEbt1Hg8NI
 yDa0KG4VUZ64wLmnVQ/dwTeUPcfYCEw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-bouA34sMPhySwM1ZJI-jVQ-1; Tue, 26 Jul 2022 15:40:40 -0400
X-MC-Unique: bouA34sMPhySwM1ZJI-jVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 q19-20020a7bce93000000b003a3264f3de9so5690867wmj.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=APQb4qnExfzNsssSKVQTxFsOb7acJVHhdlS++yMpUB8=;
 b=cb/QtYFQhZ3IguOCge8tuJAzGZsYF6cI0DEJb/nQougwknS3cH7F7Vbfbr8E5jUb0E
 Jth3HWWkbCsqYCDcZP2rnK1OYvyUTqrVyD1N2oz4DNrHi0DWj7AwDIOa0sthlEKIzYhE
 SiWoLclzd4WodfhNLB4ZZjkQ3LTYn9PVsDSXXkkyzWRi/X3izOW2NYAreTCtv8MqFKFC
 xkeyZj67W7tkl0DNuOh2aMBl628atQXfNEFEAhw5yqWxQxt0VOYSc/podkynyXYIbf3n
 n6Y6F5iU9imSRVE18zUiNFBsstxtTcT2fkIx/bmjHbJ+f9cJuugy7L5YiQt+CyFGKUPQ
 kMxg==
X-Gm-Message-State: AJIora/C1b8SJMiTfXH9P3PLMr8DUB3kVBhg2rjOZy5VOYCHj28Smxuc
 J+nrXguwkE1dsm3jxBIHAoqmYHEITFeZTivXgpfRQV4khPd0xzQcJhaqj92qRr98TtT5mWFxMQz
 +v+D7fJz0gYqJF2fLN/HswP0Pird7X7FwRQdCtoVWVL/VZvpjZwZ/Mr2vMuSD
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id
 n125-20020a1c2783000000b003a2fd82bf46mr492018wmn.29.1658864438549; 
 Tue, 26 Jul 2022 12:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUb3y0ZNfoD3pE0q/a2pT3dsBljtxinrBmorGMKy31vCvHDLe2ncS90PVQFP0h6tEwL/EZzg==
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id
 n125-20020a1c2783000000b003a2fd82bf46mr491988wmn.29.1658864438158; 
 Tue, 26 Jul 2022 12:40:38 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adf9c8d000000b0021e4c3b2967sm15999722wre.65.2022.07.26.12.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:37 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 05/16] hw/i386: add 4g boundary start to X86MachineState
Message-ID: <20220726193858.177462-6-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Joao Martins <joao.m.martins@oracle.com>

Rather than hardcoding the 4G boundary everywhere, introduce a
X86MachineState field @above_4g_mem_start and use it
accordingly.

This is in preparation for relocating ram-above-4g to be
dynamically start at 1T on AMD platforms.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-2-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/x86.h |  3 +++
 hw/i386/acpi-build.c  |  2 +-
 hw/i386/pc.c          | 11 ++++++-----
 hw/i386/sgx.c         |  2 +-
 hw/i386/x86.c         |  1 +
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 6bdf1f6ab2..62fa5774f8 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -56,6 +56,9 @@ struct X86MachineState {
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
 
+    /* Start address of the initial RAM above 4G */
+    uint64_t above_4g_mem_start;
+
     /* CPU and apic information: */
     bool apic_xrupt_override;
     unsigned pci_irq_mask;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index cad6f5ac41..0355bd3dda 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2024,7 +2024,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                 build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
-            mem_base = 1ULL << 32;
+            mem_base = x86ms->above_4g_mem_start;
             mem_len = next_base - x86ms->below_4g_mem_size;
             next_base = mem_base + mem_len;
         }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 46ab1dcb47..13b68307be 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -850,9 +850,10 @@ void pc_memory_init(PCMachineState *pcms,
                                  machine->ram,
                                  x86ms->below_4g_mem_size,
                                  x86ms->above_4g_mem_size);
-        memory_region_add_subregion(system_memory, 0x100000000ULL,
+        memory_region_add_subregion(system_memory, x86ms->above_4g_mem_start,
                                     ram_above_4g);
-        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
+        e820_add_entry(x86ms->above_4g_mem_start, x86ms->above_4g_mem_size,
+                       E820_RAM);
     }
 
     if (pcms->sgx_epc.size != 0) {
@@ -893,7 +894,7 @@ void pc_memory_init(PCMachineState *pcms,
             machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
             machine->device_memory->base =
-                0x100000000ULL + x86ms->above_4g_mem_size;
+                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }
 
         machine->device_memory->base =
@@ -927,7 +928,7 @@ void pc_memory_init(PCMachineState *pcms,
         } else if (pcms->sgx_epc.size != 0) {
             cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
-            cxl_base = 0x100000000ULL + x86ms->above_4g_mem_size;
+            cxl_base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }
 
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
@@ -1035,7 +1036,7 @@ uint64_t pc_pci_hole64_start(void)
     } else if (pcms->sgx_epc.size != 0) {
             hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
+        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
     }
 
     return ROUND_UP(hole64_start, 1 * GiB);
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a44d66ba2a..09d9c7c73d 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -295,7 +295,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         return;
     }
 
-    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
+    sgx_epc->base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 
     memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
     memory_region_add_subregion(get_system_memory(), sgx_epc->base,
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ecea25d249..050eedc0c8 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1391,6 +1391,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->above_4g_mem_start = 4 * GiB;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
-- 
MST


