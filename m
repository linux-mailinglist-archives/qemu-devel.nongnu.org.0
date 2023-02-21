Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750269DC6D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOPc-000585-BQ; Tue, 21 Feb 2023 03:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUOPW-00057Y-Ra
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUOPV-0003y4-9q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676969644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xr5+tqz/VRLGBJ9WLwFbA6SVF7nTObTe8XkY7VTqOC4=;
 b=R/B+F3jMQyh+wqBS3VxQMb/ihwykqlYfYlDCkEI0gpzp6TpMiUa8xOhbSmHNNk7/ennwbz
 puBChncl04QYvbr9zA+x5KIV6iIEq0+0AIrvLSKg92B/QhDXWUt1L3rexOS8HqoGfinh2E
 CzbwPd1kSxqWexH6KxGSMdRx6BZhhco=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-kC0b_l9RNd-mWz86QrMDFQ-1; Tue, 21 Feb 2023 03:54:00 -0500
X-MC-Unique: kC0b_l9RNd-mWz86QrMDFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25B1285CCE3;
 Tue, 21 Feb 2023 08:54:00 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-62.bne.redhat.com [10.64.54.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1434E40BC781;
 Tue, 21 Feb 2023 08:53:57 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, yihyu@redhat.com,
 shan.gavin@gmail.com
Subject: [PATCH] hw/arm/virt: Prevent CPUs in one socket to span mutiple NUMA
 nodes
Date: Tue, 21 Feb 2023 16:53:52 +0800
Message-Id: <20230221085352.212938-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Linux kernel guest reports warning when two CPUs in one socket have
been associated with different NUMA nodes, using the following command
lines.

  -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
  -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
  -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
  -numa node,nodeid=2,cpus=4-5,memdev=ram2                \

  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
  pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : build_sched_domains+0x284/0x910
  lr : build_sched_domains+0x184/0x910
  sp : ffff80000804bd50
  x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
  x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
  x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
  x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
  x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
  x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
  x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
  x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
  x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
  x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
  Call trace:
   build_sched_domains+0x284/0x910
   sched_init_domains+0xac/0xe0
   sched_init_smp+0x48/0xc8
   kernel_init_freeable+0x140/0x1ac
   kernel_init+0x28/0x140
   ret_from_fork+0x10/0x20

Fix it by preventing mutiple CPUs in one socket to be associated with
different NUMA nodes.

Reported-by: Yihuang Yu <yihyu@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..e0af267c77 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -230,6 +230,39 @@ static bool cpu_type_valid(const char *cpu)
     return false;
 }
 
+static bool numa_state_valid(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    NumaState *state = ms->numa_state;
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+    const CPUArchId *cpus = possible_cpus->cpus;
+    int len = possible_cpus->len, i, j;
+
+    if (!state || state->num_nodes <= 1 || len <= 1) {
+        return true;
+    }
+
+    for (i = 0; i < len; i++) {
+        for (j = i + 1; j < len; j++) {
+            if (cpus[i].props.has_socket_id &&
+                cpus[i].props.has_node_id &&
+                cpus[j].props.has_socket_id &&
+                cpus[j].props.has_node_id &&
+                cpus[i].props.socket_id == cpus[j].props.socket_id &&
+                cpus[i].props.node_id != cpus[j].props.node_id) {
+                error_report("CPU-%d and CPU-%d in socket-%ld have been "
+                             "associated with node-%ld and node-%ld",
+                             i, j, cpus[i].props.socket_id,
+                             cpus[i].props.node_id,
+                             cpus[j].props.node_id);
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
+
 static void create_randomness(MachineState *ms, const char *node)
 {
     struct {
@@ -2040,6 +2073,10 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (!numa_state_valid(machine)) {
+        exit(1);
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
-- 
2.23.0


