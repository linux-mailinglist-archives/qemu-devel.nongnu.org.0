Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393ED3C8933
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:59:28 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iEJ-0002Uw-9Y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8c-0007Zp-PF; Wed, 14 Jul 2021 12:53:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8a-00013s-UQ; Wed, 14 Jul 2021 12:53:34 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGY0JD092692; Wed, 14 Jul 2021 12:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=p237IXSNq5MmPJ7hErlDwR7UDrXesCekuLRXxTpCS9U=;
 b=HQd8oQ0X/CGkKMKAP1ZLZZdsmQhUCWf2JVHwkbAFDnDAb5Ye+QKJTeTeaYc7X+QknEkS
 5v7n8kb5M1bpjqJAwEdsCUu0sHP311nTAKmtVElzuXrwEJOfU9X3TEf/x5ll1Q5gTGgx
 FuMtIQqMwgkp0gcW/ztSGOBESNKKJqXd7sG9jcJ97Z7b3V2XzlYBBFFdiJB35Scad1JA
 6vyZEe0hTi/G+zm5F6BA+oXvUiQoGA2Jomgsu1T24ocpFErA0vqfbAdBmosVB94iZmz4
 gcS2xQ6j0wzxIiS0rGS4Y9IsXibWiObM862rqBAGsrHfhN8TJnBW2P3F05FTyQO1rnO+ 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sufyfvt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:30 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGY1bv093404;
 Wed, 14 Jul 2021 12:53:30 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sufyfvse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:30 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGrRu6016057;
 Wed, 14 Jul 2021 16:53:27 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 39q368900q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EGrOC833161646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:53:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86FC5A405B;
 Wed, 14 Jul 2021 16:53:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA056A4054;
 Wed, 14 Jul 2021 16:53:23 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:23 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 9/9] s390x: numa: implement NUMA for S390x
Date: Wed, 14 Jul 2021 18:53:16 +0200
Message-Id: <1626281596-31061-10-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mRKx2CtRPN8QYtxeTuI0Qm19-8gTg1RN
X-Proofpoint-ORIG-GUID: 6xShHy2mw0fbccIQ8ZL1AsZvRuaoc2ee
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_08:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140096
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We add the possibility to define the CPU topology to QEMU S390x.

This allows the user chose which CPU in the topology is active.

A NUMA node is considered to be a socket and chosing the NUMA node
leads to chose the specific socket in a book inside a drawer.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c | 53 +++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 3708ad3c46..0fd938fe3f 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -84,14 +84,37 @@ out:
 static void s390_init_cpus(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    int i;
+    const CPUArchId *slot;
+    int i, n = 1;
 
     /* initialize possible_cpus */
     mc->possible_cpu_arch_ids(machine);
 
     s390_topology_setup(machine);
-    for (i = 0; i < machine->smp.cpus; i++) {
+
+    /* Create CPU0 */
+    s390x_new_cpu(machine->cpu_type, 0, &error_fatal);
+
+    /* For NUMA configuration create defined nodes */
+    if (machine->numa_state->num_nodes) {
+        for (i = 1; i < machine->smp.max_cpus; i++) {
+            slot = &machine->possible_cpus->cpus[i];
+            if (slot->props.node_id) {
+                s390x_new_cpu(machine->cpu_type, i, &error_fatal);
+                n++;
+            }
+        }
+    }
+
+    /* create all remaining CPUs */
+    for (i = 1; n < machine->smp.cpus && i < machine->smp.max_cpus; i++) {
+        slot = &machine->possible_cpus->cpus[i];
+        /* For NUMA configuration skip defined nodes */
+        if (machine->numa_state->num_nodes && slot->props.node_id) {
+            continue;
+        }
         s390x_new_cpu(machine->cpu_type, i, &error_fatal);
+        n++;
     }
 }
 
@@ -530,6 +553,7 @@ static const CPUArchIdList *s390_possible_cpu_arch_ids(MachineState *ms)
 {
     int i;
     unsigned int max_cpus = ms->smp.max_cpus;
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
 
     if (ms->possible_cpus) {
         g_assert(ms->possible_cpus && ms->possible_cpus->len == max_cpus);
@@ -540,11 +564,20 @@ static const CPUArchIdList *s390_possible_cpu_arch_ids(MachineState *ms)
                                   sizeof(CPUArchId) * max_cpus);
     ms->possible_cpus->len = max_cpus;
     for (i = 0; i < ms->possible_cpus->len; i++) {
-        ms->possible_cpus->cpus[i].type = ms->cpu_type;
-        ms->possible_cpus->cpus[i].vcpus_count = 1;
-        ms->possible_cpus->cpus[i].arch_id = i;
-        ms->possible_cpus->cpus[i].props.has_core_id = true;
-        ms->possible_cpus->cpus[i].props.core_id = i;
+        CPUArchId *slot = &ms->possible_cpus->cpus[i];
+
+        slot->type = ms->cpu_type;
+        slot->vcpus_count = 1;
+        slot->arch_id = i;
+
+        slot->props.core_id = i;
+        slot->props.has_core_id = true;
+        slot->props.socket_id = i / ms->smp.cores;
+        slot->props.has_socket_id = true;
+        slot->props.book_id = slot->props.socket_id / ms->smp.sockets;
+        slot->props.has_book_id = true;
+        slot->props.drawer_id = slot->props.book_id / s390ms->books;
+        slot->props.has_drawer_id = true;
     }
 
     return ms->possible_cpus;
@@ -635,6 +668,11 @@ static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
     s390ms->books = books;
 }
 
+static int64_t s390x_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+    return idx / ms->smp.cores;
+}
+
 static void ccw_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -666,6 +704,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     nc->nmi_monitor_handler = s390_nmi;
     mc->default_ram_id = "s390.ram";
     mc->smp_parse = s390_smp_parse;
+    mc->get_default_cpu_node_id = s390x_get_default_cpu_node_id;
 }
 
 static inline bool machine_get_aes_key_wrap(Object *obj, Error **errp)
-- 
2.25.1


