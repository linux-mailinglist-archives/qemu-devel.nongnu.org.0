Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B4528347
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:31:44 +0200 (CEST)
Received: from localhost ([::1]:59900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYwx-0004Uo-5h
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6s-0007RR-OG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6q-0005Pk-OP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZopsPpcgukJyCzYerQLzG0FpbYI+ukciaJmZd8n96bI=;
 b=Ht2yq2iKVuk7/XqinXfxZy9zvI+JOlu+7h7xLpdsXQ3FUBwV5+KD5298LvwdP+ZVD3vLvw
 NrhyW6x9ulZm1uzKe2IiXCwy7m4NM6s8IE+FwTgb6jTEiZCXffRhZL05IhtsBjnxCLR4Rb
 hWgiFHBvRUf5+L+lND1SMk12kBSLNfs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-eGFHh-k4ODum2CF40G9BYg-1; Mon, 16 May 2022 06:37:50 -0400
X-MC-Unique: eGFHh-k4ODum2CF40G9BYg-1
Received: by mail-wr1-f70.google.com with SMTP id
 e11-20020adffc4b000000b0020d059c2347so412950wrs.18
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZopsPpcgukJyCzYerQLzG0FpbYI+ukciaJmZd8n96bI=;
 b=t+Fmmn9Nw2mxMRFb22nhI7wQ3HVlPlIkFEJuANXigJ/znsncHBD2a/udkM+I4V1JAg
 bKZVnT9u69EYhctpcP2xXvTsCNCHdWtxa2d3PG3j1xameXZldCbxYU78pbfYEbcM0v6f
 uCLD0RFMMkYCL+vO74I+yk6+BgTp/8/ZN8fROzveT0UUquz/1BmPf9bls1rhWI/19WM+
 L2URY/tfX8nYgdk1SMmaazkj2emN3MF6IMVEN+9RA2kShbGgS6jZC8lGwpD0TuQeHVNN
 CW0tOIW0s7ULiRWliQDtVuzf9PjYCZ5P/QA7Ak9Jwv+Dj3g2u86RPA2WM2HEKnkoZUXe
 3Q9w==
X-Gm-Message-State: AOAM5309YksbGDXtHgsycLBYqhpIltF81i/uoAoiDd5VOrTPzvOx+tPm
 Gg6HJhcABuRJpaNd+aEQ6AyxinCRPpGFuOwHhMf0tmc2eic+tHivlXc4dLwKYKLeed9pLpMT7aN
 Y5B+VXib9Wuy48vaTCOO5lPABc/BTMgk3VTrEI6H7DbsgH98a74MN6YiF540Q
X-Received: by 2002:a1c:cc12:0:b0:397:128a:c562 with SMTP id
 h18-20020a1ccc12000000b00397128ac562mr213967wmb.9.1652697469544; 
 Mon, 16 May 2022 03:37:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuhJIyT2A8oszLnGNAmSNPM50nNw6kH5pX4FLou+abgf0kt6UGNqC/GId9RGcOgkhVtP0WNQ==
X-Received: by 2002:a1c:cc12:0:b0:397:128a:c562 with SMTP id
 h18-20020a1ccc12000000b00397128ac562mr213940wmb.9.1652697469276; 
 Mon, 16 May 2022 03:37:49 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 u21-20020adfa195000000b0020c5253d915sm9349259wru.97.2022.05.16.03.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:48 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 37/91] i386/pc: Enable CXL fixed memory windows
Message-ID: <20220516095448.507876-38-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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


