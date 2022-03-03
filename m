Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C24CB563
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:21:57 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPc2L-0002K4-1l
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtG-0007Us-5t
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtC-0003e2-4P
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646277145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L83Yt3EYQS48tkinW/PCOkmtE089EAs2S2lFeAasuZA=;
 b=Q2i74tAMQxzUYOWxGHfy6ZXC7VONKcy/75ewpAbWs7HM8EdmKI4qGvnfgiTo3UF3UR7fhw
 RWkEkGWtU79tSQNYCnBM2NqH8sWVkqkZiYH5ouFhUZDB5/tBIJ+PHLTk9CVqH6RfEzTuxA
 OhEfDTb9hhW6BFbXkk3GLMuBnOYIUNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-cODvVe9-NN-47vSVGZY6cQ-1; Wed, 02 Mar 2022 22:12:22 -0500
X-MC-Unique: cODvVe9-NN-47vSVGZY6cQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D55801DDC;
 Thu,  3 Mar 2022 03:12:21 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564131006854;
 Thu,  3 Mar 2022 03:12:17 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/3] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Thu,  3 Mar 2022 11:11:50 +0800
Message-Id: <20220303031152.145960-2-gshan@redhat.com>
In-Reply-To: <20220303031152.145960-1-gshan@redhat.com>
References: <20220303031152.145960-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
when it isn't provided explicitly. However, the CPU topology isn't fully
considered in the default association and it causes CPU topology broken
warnings on booting Linux guest.

For example, the following warning messages are observed when the Linux guest
is booted with the following command lines.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host                                               \
  -smp 6,sockets=2,cores=3,threads=1                      \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=128M            \
  -object memory-backend-ram,id=mem1,size=128M            \
  -object memory-backend-ram,id=mem2,size=128M            \
  -object memory-backend-ram,id=mem3,size=128M            \
  -object memory-backend-ram,id=mem4,size=128M            \
  -object memory-backend-ram,id=mem4,size=384M            \
  -numa node,nodeid=0,memdev=mem0                         \
  -numa node,nodeid=1,memdev=mem1                         \
  -numa node,nodeid=2,memdev=mem2                         \
  -numa node,nodeid=3,memdev=mem3                         \
  -numa node,nodeid=4,memdev=mem4                         \
  -numa node,nodeid=5,memdev=mem5
         :
  alternatives: patching kernel code
  BUG: arch topology borken
  the CLS domain not a subset of the MC domain
  <the above error log repeats>
  BUG: arch topology borken
  the DIE domain not a subset of the NODE domain

With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
are associated with NODE#0 to NODE#5 separately. That's incorrect because
CPU#0/1/2 should be associated with same NUMA node because they're seated
in same socket.

This fixes the issue by populating the CPU topology in virt_possible_cpu_arch_ids()
and considering the socket index when default CPU-to-NUMA association is given
in virt_possible_cpu_arch_ids(). With this applied, no more CPU topology broken
warnings are seen from the Linux guest. The 6 CPUs are associated with NODE#0/1,
but there are no CPUs associated with NODE#2/3/4/5.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..dee02b60fc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2488,7 +2488,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 
 static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
-    return idx % ms->numa_state->num_nodes;
+    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
+
+    return socket_id % ms->numa_state->num_nodes;
 }
 
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
@@ -2496,6 +2498,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
 
     if (ms->possible_cpus) {
         assert(ms->possible_cpus->len == max_cpus);
@@ -2509,6 +2512,18 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
+
+        ms->possible_cpus->cpus[n].props.has_socket_id = true;
+        ms->possible_cpus->cpus[n].props.socket_id =
+            n / (ms->smp.dies * ms->smp.clusters *
+                ms->smp.cores * ms->smp.threads);
+        if (mc->smp_props.dies_supported) {
+            ms->possible_cpus->cpus[n].props.has_die_id = true;
+            ms->possible_cpus->cpus[n].props.die_id =
+                n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
+        }
+        ms->possible_cpus->cpus[n].props.has_core_id = true;
+        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
         ms->possible_cpus->cpus[n].props.thread_id = n;
     }
-- 
2.23.0


