Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8B4366AD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:44:01 +0200 (CEST)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaEa-0000Fh-EP
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx0-0008QR-9B
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:50 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZww-0002FD-PE
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so800025pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nBGj2XYtx0Tec+cPzA7IoclmH9d3Yk5987FTDu6jQCk=;
 b=msFIIW2NWUspCgD4WY8HpGWte9b4kzPAo9Lr2lJ+nk7axzEH9Sj66Y8A4vDH85RkgT
 a28zce0TVWviV971NxpYHGBYrgsBfejs6mmD/IdwKfjMh9AmLhtUh4ceJjaorlxU8/Yj
 MMAN4FlE8a/+exoc1bLSRc2mujwxxsBV57jC50vrXxHYcme7Utza266ZrsrY46FRzKPs
 ZUWzG8VHWPCbZGaBDRTtdOTC5/fL/DAUUxLDdHI/qL1hMzv9o1Fd2QGMG3k+dNyh1UnT
 YCN06/1TPsH+NzmKJn2VQEuv4klwCzsbYWphAOmhEG94y8gSRR1IJ7CLlOCMFCdsQ0fZ
 DTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nBGj2XYtx0Tec+cPzA7IoclmH9d3Yk5987FTDu6jQCk=;
 b=ZOhsD2HrXxA0vvJO2+EY70y5lINYkthHkTR/uOYhEEe3aUOYehY8ZCPpkuHytPIMqb
 IDGpujpKs3nQdqJtGKDkL+/nNIODsqz9XGb7Va/tXe6nlQbVWksjOMAbpqOXZN4cPR5Q
 a/wUnywIfAgFEX8cMDB7IwfULYbV2skxy3AbGZvUcXzOrzOZG7phDObgeZsMPMkDyolV
 LXPB73bDzPitDvrxeEumeY2x/knL+v6jbUbKZqvUW+hNGEp+dvzCqHpHKikioVTX/ajE
 qT/CPRUl/dHhkhn6deKJCKU/uYCjKUq70N88jidpxdCbHm9/nhx0Kw9fPUdxEKASM184
 KpUg==
X-Gm-Message-State: AOAM532wwZOXAg/pkNTaLzRjNAxiPlKr8h83wsQ879E9FXdbMDasmVvc
 NynaRlNSaxv1XBQiG5N6y3d4nJqHvjtZSg==
X-Google-Smtp-Source: ABdhPJxgskBuYOh/KK5SyJvpN2W9k2i2qePckkxs/0dk/76cuOiHfI0TUQLtqS2rxhRJxI9oMssa0A==
X-Received: by 2002:a17:90a:4595:: with SMTP id
 v21mr7305301pjg.43.1634829945343; 
 Thu, 21 Oct 2021 08:25:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Date: Thu, 21 Oct 2021 08:25:26 -0700
Message-Id: <20211021152541.781175-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gavin Shan <gshan@redhat.com>

The empty NUMA node, where no memory resides, are allowed. For
example, the following command line specifies two empty NUMA nodes.
With this, QEMU fails to boot because of the conflicting device-tree
node names, as the following error message indicates.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host -smp 4,sockets=2,cores=2,threads=1            \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=512M            \
  -object memory-backend-ram,id=mem1,size=512M            \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
  -numa node,nodeid=2                                     \
  -numa node,nodeid=3
    :
  qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS

As specified by linux device-tree binding document, the device-tree
nodes for these empty NUMA nodes shouldn't be generated. However,
the corresponding NUMA node IDs should be included in the distance
map. The memory hotplug through device-tree on ARM64 isn't existing
so far and it's not necessary to require the user to provide a distance
map. Furthermore, the default distance map Linux generates may even be
sufficient. So this simply skips populating the device-tree nodes for
these empty NUMA nodes to avoid the error, so that QEMU can be started
successfully.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20211015124246.23073-1-gshan@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/boot.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee4..74ad397b1f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -599,10 +599,23 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
     g_strfreev(node_path);
 
+    /*
+     * We drop all the memory nodes which correspond to empty NUMA nodes
+     * from the device tree, because the Linux NUMA binding document
+     * states they should not be generated. Linux will get the NUMA node
+     * IDs of the empty NUMA nodes from the distance map if they are needed.
+     * This means QEMU users may be obliged to provide command lines which
+     * configure distance maps when the empty NUMA node IDs are needed and
+     * Linux's default distance map isn't sufficient.
+     */
     if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
         mem_base = binfo->loader_start;
         for (i = 0; i < ms->numa_state->num_nodes; i++) {
             mem_len = ms->numa_state->nodes[i].node_mem;
+            if (!mem_len) {
+                continue;
+            }
+
             rc = fdt_add_memory_node(fdt, acells, mem_base,
                                      scells, mem_len, i);
             if (rc < 0) {
-- 
2.25.1


