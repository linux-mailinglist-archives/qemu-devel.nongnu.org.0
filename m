Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882B25292EC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:34:32 +0200 (CEST)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiMJ-000348-L2
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhy-0006pr-9l
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhw-0006YR-Mj
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZopsPpcgukJyCzYerQLzG0FpbYI+ukciaJmZd8n96bI=;
 b=iGw3mfCJZu3YOWg/WJXuXnR+OQoNtgJ5mqfP2aKO1O7k6dH6yEveEvDDLgxDmSozxEzmef
 U1Nk/wTe6xK8CR9rRrGNUvZHHTXPUwzZ+gjwnwEgop9eLA8pkeuRLPvqPqhCVwBhOBRTCc
 i1pkH44+y2v9xF6ClCrH20lbcvBsjQ8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-PZaWhItLNieWR2mPS2wsNg-1; Mon, 16 May 2022 16:52:47 -0400
X-MC-Unique: PZaWhItLNieWR2mPS2wsNg-1
Received: by mail-ed1-f70.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so10491321edb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZopsPpcgukJyCzYerQLzG0FpbYI+ukciaJmZd8n96bI=;
 b=D/FTQdT1LD836xdekM175wxGWcfJzQAjxo0vNowoqORaqFagVr8+t1eRBK1EK+3cmL
 wGa5tnIoCiAGP+TZdLRlSegeKmpYaZWwhjhEkCD5Q9WPLyldzJ4jHRQTTt8BNclIT15a
 0zVO87Sfl+2gitDi4Lrbg71XBNUJTpUYLZuUtHoYlnNFBT7BpctJ6X9LsZSe54I0s+qk
 ZZcbMWaTdD43YKnNesIjLOYyelgH8cRG/hhP2mQLIdj2MMyR2sW4odlMmbkCxzPD6spi
 3HB6tuZwKP/A5slLyvgm4/PWD1mAxZ8wr7smbzSeJrBl+3oYL+WIy/NA/FaPae+ZuWdF
 r2TQ==
X-Gm-Message-State: AOAM533EmDPbXUD63YxdK/0SxUyoydlARHmZwNLZ5NbIC7X6ahkZtnH7
 dusw62WJfHtf+/mx/y72bgVvESON78Wu5+NSCBfOBgfgkm8EEzV0wbZk8O/5aWIgzz0oI5sfKkf
 1B4ZQ8W4QyIkstMHc9B19976OGL6KbQKMkt5suRFvKvrU6FXgdbmm1XdaHy1s
X-Received: by 2002:a17:906:ed1:b0:6f4:ebc2:da8a with SMTP id
 u17-20020a1709060ed100b006f4ebc2da8amr16668092eji.126.1652734365602; 
 Mon, 16 May 2022 13:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9K6KN5Q0PP4cAZz+QkvJYiIgNF3n4KdW3tYuAdoXKStn49fDELRd1p5kIc1d3RP8RgykmFw==
X-Received: by 2002:a17:906:ed1:b0:6f4:ebc2:da8a with SMTP id
 u17-20020a1709060ed100b006f4ebc2da8amr16668073eji.126.1652734365372; 
 Mon, 16 May 2022 13:52:45 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 u20-20020aa7d554000000b0042ac2705444sm389199edr.58.2022.05.16.13.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:44 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 37/86] i386/pc: Enable CXL fixed memory windows
Message-ID: <20220516204913.542894-38-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Add the CFMWs memory regions to the memorymap and adjust the
PCI window to avoid hitting the same memory.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Message-Id: <20220429144110.25167-36-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 03d14f6564..312eb9e400 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -817,7 +817,7 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    hwaddr cxl_base;
+    hwaddr cxl_base, cxl_resv_end = 0;
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -925,6 +925,24 @@ void pc_memory_init(PCMachineState *pcms,
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
+        cxl_resv_end = cxl_base + cxl_size;
+        if (machine->cxl_devices_state->fixed_windows) {
+            hwaddr cxl_fmw_base;
+            GList *it;
+
+            cxl_fmw_base = ROUND_UP(cxl_base + cxl_size, 256 * MiB);
+            for (it = machine->cxl_devices_state->fixed_windows; it; it = it->next) {
+                CXLFixedWindow *fw = it->data;
+
+                fw->base = cxl_fmw_base;
+                memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
+                                      "cxl-fixed-memory-region", fw->size);
+                memory_region_add_subregion(system_memory, fw->base, &fw->mr);
+                e820_add_entry(fw->base, fw->size, E820_RESERVED);
+                cxl_fmw_base += fw->size;
+                cxl_resv_end = cxl_fmw_base;
+            }
+        }
     }
 
     /* Initialize PC system firmware */
@@ -954,6 +972,10 @@ void pc_memory_init(PCMachineState *pcms,
         if (!pcmc->broken_reserved_end) {
             res_mem_end += memory_region_size(&machine->device_memory->mr);
         }
+
+        if (machine->cxl_devices_state->is_enabled) {
+            res_mem_end = cxl_resv_end;
+        }
         *val = cpu_to_le64(ROUND_UP(res_mem_end, 1 * GiB));
         fw_cfg_add_file(fw_cfg, "etc/reserved-memory-end", val, sizeof(*val));
     }
@@ -990,6 +1012,13 @@ uint64_t pc_pci_hole64_start(void)
     if (ms->cxl_devices_state->host_mr.addr) {
         hole64_start = ms->cxl_devices_state->host_mr.addr +
             memory_region_size(&ms->cxl_devices_state->host_mr);
+        if (ms->cxl_devices_state->fixed_windows) {
+            GList *it;
+            for (it = ms->cxl_devices_state->fixed_windows; it; it = it->next) {
+                CXLFixedWindow *fw = it->data;
+                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
+            }
+        }
     } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
-- 
MST


