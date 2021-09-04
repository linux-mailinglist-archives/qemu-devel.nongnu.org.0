Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D5400D2A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:44:26 +0200 (CEST)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdSb-0008Bv-W0
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLL-0005dz-PO
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLG-0001Ci-Gm
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uDcGv5RC4jtHvohYZqBjP0QWBU1keDM9ihWG0zP6OU=;
 b=U81S3EygexBM14PhVL8HRKkMuY5GYZF0DWsv2M636PQKB/l4evUVSgpK5X9EptiQyUmcRq
 /4oRRJHVltyMRlw/HIYB1qk/GytI8DSpQf5tBKtNpgjmG/TE4CxeAhjtz8F+BJ4x5JTpaa
 vcuIv46I4CRCzhqWUf8TH+RphqJ6NK0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-YUCyoR_ZNfiWPcroFZc1hw-1; Sat, 04 Sep 2021 17:36:48 -0400
X-MC-Unique: YUCyoR_ZNfiWPcroFZc1hw-1
Received: by mail-ed1-f69.google.com with SMTP id
 i17-20020aa7c711000000b003c57b06a2caso1347547edq.20
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6uDcGv5RC4jtHvohYZqBjP0QWBU1keDM9ihWG0zP6OU=;
 b=MQEKTydPQpVpNMUNvhXx4i7RYDSNGIbTYPsxOjrI1aYh/IXN0oGsrD0xEFJMOhYI4n
 8BuAvf162opFYhCJ1vi04Ff41Y74m6X4qPB2fou6LAYYaXyLUqQAXmtLNCEd2f0AEebY
 NfElklqYNkLNJq51I88gOQHKRPB1ZyBZBEZxHmwKOIyhdrXEeEY+r99JvZ9dqI0WmDsb
 +wYTFtY5cUJJVJekgA7kGdO0vgbtO5panVxNbm64Bc8pcZj4zfGpOcUs3ZGDq4x5Qcpn
 kmMqk97VAhDnkcvfLeVGqX6UU9qgifZRgmQOMeyTgUwZCqrStyw+zrbJhKu9NbC2Kb+5
 tYQA==
X-Gm-Message-State: AOAM533Uih7JwSl9heafmAlXW07te39FGvRrru66FO2DG2pUlNuunVyx
 9Eim4qcf13eYPJzlx/b3LuB9Frt9CGSOy9EdRKB/foND3WFuEWuAubSRKi2p/oniBTwLE9HVRaI
 npOh5u0eNvAO3NcisQTPcUVmnErEXgzk2pVDX6Jdqp9fAzVKZT1yADSzOGFSJ
X-Received: by 2002:a17:906:3e16:: with SMTP id
 k22mr5932777eji.280.1630791406951; 
 Sat, 04 Sep 2021 14:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxlu/hpeGnhobt1I/GH0xGwV4K6DVPrSsuvft2laTgm2nr1Usj8MPVdUHkRD0EQwJ4lenToQ==
X-Received: by 2002:a17:906:3e16:: with SMTP id
 k22mr5932755eji.280.1630791406715; 
 Sat, 04 Sep 2021 14:36:46 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id x15sm1526049ejv.95.2021.09.04.14.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:46 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/35] hw/i386/acpi-build: Get NUMA information from struct
 NumaState
Message-ID: <20210904213506.486886-17-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jingqi Liu <jingqi.liu@intel.com>

Since commits aa57020774b ("numa: move numa global variable
nb_numa_nodes into MachineState") and 7e721e7b10e ("numa: move
numa global variable numa_info into MachineState"), we can get
NUMA information completely from MachineState::numa_state.

Remove PCMachineState::numa_nodes and PCMachineState::node_mem,
since they are just copied from MachineState::numa_state.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
Message-Id: <20210823011254.28506-1-jingqi.liu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h |  4 ----
 hw/i386/acpi-build.c | 12 +++++++-----
 hw/i386/pc.c         |  9 ---------
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 97b4ab79b5..4d2e35a152 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -47,10 +47,6 @@ typedef struct PCMachineState {
     bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
-    /* NUMA information: */
-    uint64_t numa_nodes;
-    uint64_t *node_mem;
-
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
 } PCMachineState;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9a9572cadb..d1f5fa3b5a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1914,6 +1914,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     X86MachineState *x86ms = X86_MACHINE(machine);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
     PCMachineState *pcms = PC_MACHINE(machine);
+    int nb_numa_nodes = machine->numa_state->num_nodes;
+    NodeInfo *numa_info = machine->numa_state->nodes;
     ram_addr_t hotplugabble_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
@@ -1957,9 +1959,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     next_base = 0;
     numa_start = table_data->len;
 
-    for (i = 1; i < pcms->numa_nodes + 1; ++i) {
+    for (i = 1; i < nb_numa_nodes + 1; ++i) {
         mem_base = next_base;
-        mem_len = pcms->node_mem[i - 1];
+        mem_len = numa_info[i - 1].node_mem;
         next_base = mem_base + mem_len;
 
         /* Cut out the 640K hole */
@@ -2007,7 +2009,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     }
 
     slots = (table_data->len - numa_start) / sizeof *numamem;
-    for (; slots < pcms->numa_nodes + 2; slots++) {
+    for (; slots < nb_numa_nodes + 2; slots++) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
     }
@@ -2023,7 +2025,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     if (hotplugabble_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
+                          hotplugabble_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
@@ -2525,7 +2527,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         }
     }
 #endif
-    if (pcms->numa_nodes) {
+    if (machine->numa_state->num_nodes) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, machine);
         if (machine->numa_state->have_numa_distance) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 22aa598d50..7e523b913c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -802,18 +802,9 @@ void pc_machine_done(Notifier *notifier, void *data)
 
 void pc_guest_info_init(PCMachineState *pcms)
 {
-    int i;
-    MachineState *ms = MACHINE(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
 
     x86ms->apic_xrupt_override = true;
-    pcms->numa_nodes = ms->numa_state->num_nodes;
-    pcms->node_mem = g_malloc0(pcms->numa_nodes *
-                                    sizeof *pcms->node_mem);
-    for (i = 0; i < ms->numa_state->num_nodes; i++) {
-        pcms->node_mem[i] = ms->numa_state->nodes[i].node_mem;
-    }
-
     pcms->machine_done.notify = pc_machine_done;
     qemu_add_machine_init_done_notifier(&pcms->machine_done);
 }
-- 
MST


