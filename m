Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C6F4366C6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:52:00 +0200 (CEST)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaMJ-0004ye-6x
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx6-0000L5-Tl
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:56 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx4-0002eJ-Ex
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:56 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e65so638132pgc.5
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PUts9d+IaMxABVZC1wteSIPc85en1c9gLB8uoNMgezU=;
 b=HCmZMmvObhS0mAsWD6yvoV4gtKzpsso6VhbOEWYdqFXWlfmdY6/AOTidgvX9KNcu/Q
 YjEgOngdv4vO364zFcK7G+5hSSS54BLaX5cSJz7GLAFTXKtD52b/PCUEzR2ISfCnLAc2
 3d1HeoBr/k2tnCu5WcPfiwvJDmsFcrYJwZvgdVZJQWb4Ncf4/xuCLV+yVWizFhdsVn7o
 I3oFQ+Fal7Pklxmy78Ea9chsNWz6EeVofD2UscMHY/hjTZ/W3RzvsIC5p4Lw4S1P1WpR
 g5/4bPCKQ0o+QTxQajrIXVXngOA4wAvr42u3l0DrbdmdayU8GJowccOfQFPEDSDIbtkS
 ZdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PUts9d+IaMxABVZC1wteSIPc85en1c9gLB8uoNMgezU=;
 b=GB+uoMc5UvUUb4edgTZ7of8meNPPa9jshfZCa/6ta7rZraUdSC24HKt+OUkx30uJAi
 QNLva45uYKjG1b8JOyGg7CYVT6d2I6hFP2v8l9j83u/nhMcllaguSIvRb2gMTgodFk7m
 eqotRwI3NS4KrfGtscb3mq5iy/S82ydDqMgtRzwIot7phh8SsDSkn1nSO1m4XHZveiD8
 0as+D12dZo/vqjTKS0Mtax4WqW/ZvkKBB8H5JRRiBk2vpKWAekUKW39k32rXUmdXOHyR
 F7s5jbcL09P4SkJ0kvDGdjke49kp7Gn4eLZCWVWfQMVXjSWz3y3LJGQ9F0x6bHSYl+U5
 7xqg==
X-Gm-Message-State: AOAM530N1MJ1Jx+NYbs0dD5tChQWRSkAjanD5AbEPG9zJxnodbg5F1mq
 5EhYE8/n93mSkDRWZGUt5j2891RS2wxqow==
X-Google-Smtp-Source: ABdhPJzYdTD71nfPBAeS7L85nZhBm7Of1AlKyP9+kYjwPYtCVWp0U9zFCim09eh9aH3NH3IBulByLA==
X-Received: by 2002:a63:ef57:: with SMTP id c23mr4919295pgk.60.1634829952879; 
 Thu, 21 Oct 2021 08:25:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/19] hw/arm/virt: Add cpu-map to device tree
Date: Thu, 21 Oct 2021 08:25:36 -0700
Message-Id: <20211021152541.781175-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Support device tree CPU topology descriptions.

In accordance with the Devicetree Specification, the Linux Doc
"arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
present. And we have already met the requirement by generating
/cpus/cpu@* nodes for members within ms->smp.cpus. Accordingly,
we should also create subnodes in cpu-map for the present cpus,
each of which relates to an unique cpu node.

The Linux Doc "cpu/cpu-topology.txt" states that the hierarchy
of CPUs in a SMP system is defined through four entities and
they are socket/cluster/core/thread. It is also required that
a socket node's child nodes must be one or more cluster nodes.
Given that currently we are only provided with information of
socket/core/thread, we assume there is one cluster child node
in each socket node when creating cpu-map.

Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211020142125.7516-4-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 70 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15e8d8cf4a..ca433adb5b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -351,20 +351,21 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
+    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     int smp_cpus = ms->smp.cpus;
 
     /*
-     * From Documentation/devicetree/bindings/arm/cpus.txt
-     *  On ARM v8 64-bit systems value should be set to 2,
-     *  that corresponds to the MPIDR_EL1 register size.
-     *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
-     *  in the system, #address-cells can be set to 1, since
-     *  MPIDR_EL1[63:32] bits are not used for CPUs
-     *  identification.
+     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
+     * On ARM v8 64-bit systems value should be set to 2,
+     * that corresponds to the MPIDR_EL1 register size.
+     * If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
+     * in the system, #address-cells can be set to 1, since
+     * MPIDR_EL1[63:32] bits are not used for CPUs
+     * identification.
      *
-     *  Here we actually don't know whether our system is 32- or 64-bit one.
-     *  The simplest way to go is to examine affinity IDs of all our CPUs. If
-     *  at least one of them has Aff3 populated, we set #address-cells to 2.
+     * Here we actually don't know whether our system is 32- or 64-bit one.
+     * The simplest way to go is to examine affinity IDs of all our CPUs. If
+     * at least one of them has Aff3 populated, we set #address-cells to 2.
      */
     for (cpu = 0; cpu < smp_cpus; cpu++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
@@ -407,8 +408,57 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        if (!vmc->no_cpu_topology) {
+            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
+                                  qemu_fdt_alloc_phandle(ms->fdt));
+        }
+
         g_free(nodename);
     }
+
+    if (!vmc->no_cpu_topology) {
+        /*
+         * Add vCPU topology description through fdt node cpu-map.
+         *
+         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
+         * In a SMP system, the hierarchy of CPUs can be defined through
+         * four entities that are used to describe the layout of CPUs in
+         * the system: socket/cluster/core/thread.
+         *
+         * A socket node represents the boundary of system physical package
+         * and its child nodes must be one or more cluster nodes. A system
+         * can contain several layers of clustering within a single physical
+         * package and cluster nodes can be contained in parent cluster nodes.
+         *
+         * Given that cluster is not yet supported in the vCPU topology,
+         * we currently generate one cluster node within each socket node
+         * by default.
+         */
+        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
+
+        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
+            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
+            char *map_path;
+
+            if (ms->smp.threads > 1) {
+                map_path = g_strdup_printf(
+                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
+                    cpu / (ms->smp.cores * ms->smp.threads),
+                    (cpu / ms->smp.threads) % ms->smp.cores,
+                    cpu % ms->smp.threads);
+            } else {
+                map_path = g_strdup_printf(
+                    "/cpus/cpu-map/socket%d/cluster0/core%d",
+                    cpu / ms->smp.cores,
+                    cpu % ms->smp.cores);
+            }
+            qemu_fdt_add_path(ms->fdt, map_path);
+            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
+
+            g_free(map_path);
+            g_free(cpu_path);
+        }
+    }
 }
 
 static void fdt_add_its_gic_node(VirtMachineState *vms)
-- 
2.25.1


