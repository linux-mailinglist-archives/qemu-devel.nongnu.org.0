Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A88494424
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 01:18:36 +0100 (CET)
Received: from localhost ([::1]:38784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAL9v-0001HX-N0
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 19:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL4T-0005ni-Jc
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:58 -0500
Received: from [2a00:1450:4864:20::335] (port=39777
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL4R-0004eX-Ur
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:12:57 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso3564873wmh.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 16:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gEGYgTjbnr/i5w2mvdp+uG1/Mmv2kSr/Q4Dwa+03rII=;
 b=KZ/K9x1/YSFLYw+6mgLOE45htFg6sPlXemD24R+CnXoMA1KI9sOeqgx0FHy0OmSoTD
 uv8kmaeu/SLOsJsBMPXu2cofvR9f0Rt1zeLNHRUlBsY/teMpJXQcw9XUa2hDre+V/ysg
 uafUxqVbD90PN9iEMNikpCSpHtWA1T0nXWbCN0qYtJu6gcRu2E/GG45C2BB0S4m80Uuq
 Ih4HgX3fF025NZ/HsYU5E0TlacvGgBorC3W8kANmAUl6i8/kUOC+hnj4RFia4CEt11+l
 kjsABrekDzKi6b2TlL4Uedi796QoQQC33TBkamevqY4i6M/KgdX4qLTQNnS5KMzSK3rp
 D8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gEGYgTjbnr/i5w2mvdp+uG1/Mmv2kSr/Q4Dwa+03rII=;
 b=XOS6PpQtAs/MJ37mVfrtmndJCh3ZY+WBWI0/2duUW+Z7a4hJ5gn+dvDPe1AAKIlivi
 kgaUJnWMR/HGMt5Mukn5vySoIBlHoND/fDkEXlZblMwnqcTrjw3ele0v0rznAJ9zKMWh
 /Tc5YTCXPNAi0QkP4JR+ORhZHI4meyBQmMQHuSL5LV+ANEe+FsIAYKlSdcitZioZlsqp
 B/K83+87OJ9ZQptkJp9ltEsGIRdYin8DBQWtLfPS3x4OZC/k/ZD5bWYqO1VIBVQxIRlt
 WhAkHKCoHgm2wlEKGkoq1yZABHm1LHFonKmgtxPJffHBHuLZFPesLourT9sKjdL7brQC
 D9Vg==
X-Gm-Message-State: AOAM533P7f+swQZRlXBGhdE8pVW15Ri3KBHAu5dRVZ8/BJLAoYxFihTr
 ap3ADprVO76zGPZPROK2vIpAbeMVXB8=
X-Google-Smtp-Source: ABdhPJxhFY1GPaVywsmTrmLnPkPLA6uPhQ8jjneYJda1w5VFwXYy2AZglcUV9IT/hlWGtRQldY1bUQ==
X-Received: by 2002:a5d:6d45:: with SMTP id k5mr29425232wri.397.1642637574410; 
 Wed, 19 Jan 2022 16:12:54 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 p2sm838879wmc.33.2022.01.19.16.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:12:53 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 2/2] hw/vfio/common: Silence ram device offset alignment
 error traces
Date: Thu, 20 Jan 2022 01:12:42 +0100
Message-Id: <20220120001242.230082-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120001242.230082-1-f4bug@amsat.org>
References: <20220120001242.230082-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Failing to DMA MAP a ram_device should not cause an error message.
This is currently happening with the TPM CRB command region and
this is causing confusion.

We may want to keep the trace for debug purpose though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/vfio/common.c     | 15 ++++++++++++++-
 hw/vfio/trace-events |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 080046e3f51..9caa560b078 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -884,7 +884,20 @@ static void vfio_listener_region_add(MemoryListener *listener,
     if (unlikely((section->offset_within_address_space &
                   ~qemu_real_host_page_mask) !=
                  (section->offset_within_region & ~qemu_real_host_page_mask))) {
-        error_report("%s received unaligned region", __func__);
+        if (memory_region_is_ram_device(section->mr)) { /* just debug purpose */
+            trace_vfio_listener_region_add_bad_offset_alignment(
+                memory_region_name(section->mr),
+                section->offset_within_address_space,
+                section->offset_within_region, qemu_real_host_page_size);
+        } else { /* error case we don't want to be fatal */
+            error_report("%s received unaligned region %s iova=0x%"PRIx64
+                         " offset_within_region=0x%"PRIx64
+                         " qemu_real_host_page_mask=0x%"PRIx64,
+                         __func__, memory_region_name(section->mr),
+                         section->offset_within_address_space,
+                         section->offset_within_region,
+                         qemu_real_host_page_mask);
+        }
         return;
     }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 0ef1b5f4a65..ccd9d7610d6 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
+vfio_listener_region_add_bad_offset_alignment(const char *name, uint64_t iova, uint64_t offset_within_region, uint64_t page_size) "Region \"%s\" @0x%"PRIx64", offset_within_region=0x%"PRIx64", qemu_real_host_page_mask=0x%"PRIx64 " cannot be mapped for DMA"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
-- 
2.34.1


