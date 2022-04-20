Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA65087A9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 14:06:03 +0200 (CEST)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh95u-0005TT-4u
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 08:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nh8v1-00070b-FN; Wed, 20 Apr 2022 07:54:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13654
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nh8uz-0003Pf-G4; Wed, 20 Apr 2022 07:54:47 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KBkdAA017128; 
 Wed, 20 Apr 2022 11:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3R2SkwVYuAx37IyjubP80dsK6NGgHKH3SNnyQYbOdzw=;
 b=W3omiEnppv6Si4Yy9y3IBjjWd3DwLl4o2Jyng6SEN3y916k298z2NQNruPb93M0GDw4n
 Ii9oEfbmuXJ8eiw2drcAfO0kQdkstaV2+5LDP20QyIWj88wqn+7lAaVkmDp0qoX2Ppgg
 D6oT7/i6ONoUaBsJDerJbs/ukL3Pc4/m1AJjufRzoTRpvVDqhAIfmkEbe6jbCZEHBeLv
 6LoaVgLN+KVe5y9gKc3lHW3FJXQcKApyCMofsXJaBOet8E5yN+a0Z9IY2rLPnBIC4lAy
 SJ/qUFzje/U55KEmU57q0bvFa8oFc0pEf3YIO3Zd95jOgNO7LBbxCoWbKDzG705TWHQg eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fhsx95nuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 11:54:43 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23KBp4Kx032542;
 Wed, 20 Apr 2022 11:54:43 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fhsx95nu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 11:54:43 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23KBrB03021340;
 Wed, 20 Apr 2022 11:54:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3ffne8vx4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 11:54:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23KBfoYb53936390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 11:41:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22D20AE059;
 Wed, 20 Apr 2022 11:54:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A2A7AE045;
 Wed, 20 Apr 2022 11:54:37 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.58.217])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Apr 2022 11:54:37 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v7 09/13] s390x: topology: implementing numa for the s390x
 topology
Date: Wed, 20 Apr 2022 13:57:41 +0200
Message-Id: <20220420115745.13696-10-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220420115745.13696-1-pmorel@linux.ibm.com>
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2T9JX2Q5DguUQYtMboUEr4pszlXYxCLN
X-Proofpoint-ORIG-GUID: hXMMHF8IYjMoWqQNwKHL5zJLfTD09_V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_02,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 ehabkost@redhat.com, kvm@vger.kernel.org, david@redhat.com, eblake@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 armbru@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, mst@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

S390x CPU Topology allows a non uniform repartition of the CPU
inside the topology containers, sockets, books and drawers.

We use numa to place the CPU inside the right topology container
and report the non uniform topology to the guest.

Note that s390x needs CPU0 to belong to the topology and consequently
all topology must include CPU0.

We accept a partial QEMU numa definition, in that case undefined CPUs
are added to free slots in the topology starting with slot 0 and going
up.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/core/machine.c          | 18 ++++++++++
 hw/s390x/s390-virtio-ccw.c | 68 ++++++++++++++++++++++++++++++++++----
 2 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b67f213654..e9847693f0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -689,6 +689,16 @@ void machine_set_cpu_numa_node(MachineState *machine,
             return;
         }
 
+        if (props->has_book_id && !slot->props.has_book_id) {
+            error_setg(errp, "book-id is not supported");
+            return;
+        }
+
+        if (props->has_drawer_id && !slot->props.has_drawer_id) {
+            error_setg(errp, "drawer-id is not supported");
+            return;
+        }
+
         /* skip slots with explicit mismatch */
         if (props->has_thread_id && props->thread_id != slot->props.thread_id) {
                 continue;
@@ -706,6 +716,14 @@ void machine_set_cpu_numa_node(MachineState *machine,
                 continue;
         }
 
+        if (props->has_book_id && props->book_id != slot->props.book_id) {
+                continue;
+        }
+
+        if (props->has_drawer_id && props->drawer_id != slot->props.drawer_id) {
+                continue;
+        }
+
         /* reject assignment if slot is already assigned, for compatibility
          * of legacy cpu_index mapping with SPAPR core based mapping do not
          * error out if cpu thread and matched core have the same node-id */
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2839c24833..93d1a43583 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -84,14 +84,34 @@ out:
 static void s390_init_cpus(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    int i;
+    CPUArchId *slot;
+    int i, n = 0;
 
     /* initialize possible_cpus */
     mc->possible_cpu_arch_ids(machine);
 
     s390_topology_setup(machine);
-    for (i = 0; i < machine->smp.cpus; i++) {
+
+    /* For NUMA configuration create defined nodes */
+    if (machine->numa_state->num_nodes) {
+        for (i = 0; i < machine->smp.max_cpus; i++) {
+            slot = &machine->possible_cpus->cpus[i];
+            if (slot->arch_id != -1 && n < machine->smp.cpus) {
+                s390x_new_cpu(machine->cpu_type, i, &error_fatal);
+                n++;
+            }
+        }
+    }
+
+    /* create all remaining CPUs */
+    for (i = 0; n < machine->smp.cpus && i < machine->smp.max_cpus; i++) {
+        slot = &machine->possible_cpus->cpus[i];
+        /* For NUMA configuration skip defined nodes */
+        if (machine->numa_state->num_nodes && slot->arch_id != -1) {
+            continue;
+        }
         s390x_new_cpu(machine->cpu_type, i, &error_fatal);
+        n++;
     }
 }
 
@@ -274,6 +294,11 @@ static void ccw_init(MachineState *machine)
     /* register hypercalls */
     virtio_ccw_register_hcalls();
 
+    /* CPU0 must exist on S390x */
+    if (!s390_cpu_addr2state(0)) {
+        error_printf("Core_id 0 must be defined in the CPU configuration\n");
+        exit(1);
+    }
     s390_enable_css_support(s390_cpu_addr2state(0));
 
     ret = css_create_css_image(VIRTUAL_CSSID, true);
@@ -306,6 +331,7 @@ static void s390_cpu_plug(HotplugHandler *hotplug_dev,
 
     g_assert(!ms->possible_cpus->cpus[cpu->env.core_id].cpu);
     ms->possible_cpus->cpus[cpu->env.core_id].cpu = OBJECT(dev);
+    ms->possible_cpus->cpus[cpu->env.core_id].arch_id = cpu->env.core_id;
 
     s390_topology_new_cpu(cpu->env.core_id);
 
@@ -529,7 +555,9 @@ static CpuInstanceProperties s390_cpu_index_to_props(MachineState *ms,
 static const CPUArchIdList *s390_possible_cpu_arch_ids(MachineState *ms)
 {
     int i;
+    int drawer_id, book_id, socket_id;
     unsigned int max_cpus = ms->smp.max_cpus;
+    CPUArchId *slot;
 
     if (ms->possible_cpus) {
         g_assert(ms->possible_cpus && ms->possible_cpus->len == max_cpus);
@@ -540,11 +568,25 @@ static const CPUArchIdList *s390_possible_cpu_arch_ids(MachineState *ms)
                                   sizeof(CPUArchId) * max_cpus);
     ms->possible_cpus->len = max_cpus;
     for (i = 0; i < ms->possible_cpus->len; i++) {
-        ms->possible_cpus->cpus[i].type = ms->cpu_type;
-        ms->possible_cpus->cpus[i].vcpus_count = 1;
-        ms->possible_cpus->cpus[i].arch_id = i;
-        ms->possible_cpus->cpus[i].props.has_core_id = true;
-        ms->possible_cpus->cpus[i].props.core_id = i;
+        slot = &ms->possible_cpus->cpus[i];
+
+        slot->type = ms->cpu_type;
+        slot->vcpus_count = 1;
+        slot->arch_id = i;
+        slot->props.has_core_id = true;
+        slot->props.core_id = i;
+
+        socket_id = i / ms->smp.cores;
+        slot->props.socket_id = socket_id;
+        slot->props.has_socket_id = true;
+
+        book_id = socket_id / ms->smp.sockets;
+        slot->props.book_id = book_id;
+        slot->props.has_book_id = true;
+
+        drawer_id = book_id / ms->smp.books;
+        slot->props.drawer_id = drawer_id;
+        slot->props.has_drawer_id = true;
     }
 
     return ms->possible_cpus;
@@ -586,6 +628,17 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
     return newsz;
 }
 
+/*
+ * S390 defines CPU topology level 2 as the level for which a change in topology
+ * is worth being taking care of.
+ * Let use level 2, socket, as the numa node.
+ */
+static int64_t s390_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    ms->possible_cpus->cpus[idx].arch_id = -1;
+    return idx / ms->smp.cores;
+}
+
 static void ccw_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -618,6 +671,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "s390.ram";
     mc->smp_props.books_supported = true;
     mc->smp_props.drawers_supported = true;
+    mc->get_default_cpu_node_id = s390_get_default_cpu_node_id;
 }
 
 static inline bool machine_get_aes_key_wrap(Object *obj, Error **errp)
-- 
2.27.0


