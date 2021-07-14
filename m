Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CA43C8923
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:57:11 +0200 (CEST)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iC5-0005wj-UQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8a-0007Qk-4R; Wed, 14 Jul 2021 12:53:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8X-000117-OA; Wed, 14 Jul 2021 12:53:31 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGZ0XS163970; Wed, 14 Jul 2021 12:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=qChPy9hFLHKj0Tt6VjVVxIgtbBqNrJGyDp00U2NXtio=;
 b=J8doIQnXIynLZJwu1TUu7fuviK+Qc3BbffJYzjc7B0VIHJkLoqpPEDX/n/q5tI16Kdzt
 ugrj+EPzj/C50j4ENBQi4+bdLdb1tu1MTv9MeuuWmYjYeSkIxpRjzv/vqsK3BhamgQEH
 4aJ4rU2sZp8gSIbg0O5YBl1KAkJI0xbw17VYAFMGp7iBkbeNt1vnP1dOeA9LFFFMgnl5
 jb91qBvufhZU/ts6lKXmmqxokVJPy8KN1kJp6JYoqByj6zPaiWCsCfNpUmTqqRLJSUyy
 RmZz23SbIJfE5z2/Q1PpMhn11XJF295xsk5aYrba/oe+x9A9n/NAKX/x8kD3xO+aq3lv RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39t07275c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:27 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGZAAF164438;
 Wed, 14 Jul 2021 12:53:27 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39t07275b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:27 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGrBYb029047;
 Wed, 14 Jul 2021 16:53:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 39q2th9vnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EGrLEJ29884880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:53:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA021A4066;
 Wed, 14 Jul 2021 16:53:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EAECA405C;
 Wed, 14 Jul 2021 16:53:21 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:21 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 5/9] s390x: topology: implementating Store Topology System
 Information
Date: Wed, 14 Jul 2021 18:53:12 +0200
Message-Id: <1626281596-31061-6-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 93DnLrj35aOHePTHC3Et6vMhxIRiVYbA
X-Proofpoint-GUID: 4xUnjBV8HbhuNTkEXhzv14Q3GOh-NvMD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140099
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

The handling of STSI is enhenced with the interception of the
function code 15 for storing CPU topology.

Using the objects built during the pluging of CPU, we build the
SYSIB 15_1_x structures.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 target/s390x/kvm/kvm.c | 222 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..d78261c089 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -52,6 +52,7 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/s390-virtio-hcall.h"
 #include "hw/s390x/pv.h"
+#include "hw/s390x/cpu-topology.h"
 
 #ifndef DEBUG_KVM
 #define DEBUG_KVM  0
@@ -1893,6 +1894,223 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
     }
 }
 
+static int stsi_15_container(void *p, int nl, int id)
+{
+    SysIBTl_container *tle = (SysIBTl_container *)p;
+
+    tle->nl = nl;
+    tle->id = id;
+
+    return sizeof(*tle);
+}
+
+static int stsi_15_cpus(void *p, S390TopologyCores *cd)
+{
+    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
+
+    tle->nl = 0;
+    tle->dedicated = cd->dedicated;
+    tle->polarity = cd->polarity;
+    tle->type = cd->cputype;
+    tle->origin = cd->origin;
+    tle->mask = cd->mask;
+
+    return sizeof(*tle);
+}
+
+static int set_socket(const MachineState *ms, void *p,
+                      S390TopologySocket *socket, int level, int off)
+{
+    BusChild *kid;
+    int l, len = 0;
+
+    len += stsi_15_container(p, 1, off * ms->smp.sockets + socket->socket_id);
+    p += len;
+
+    QTAILQ_FOREACH_REVERSE(kid, &socket->bus->children, sibling) {
+        l = stsi_15_cpus(p, S390_TOPOLOGY_CORES(kid->child));
+        p += l;
+        len += l;
+    }
+    return len;
+}
+
+static int set_book(const MachineState *ms, void *p,
+                    S390TopologyBook *book, int level, int off)
+{
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+    BusChild *kid;
+    int l, len = 0;
+    int offset = 0;
+
+    if (level >= 3) {
+        len += stsi_15_container(p, 2, off * s390ms->books + book->book_id);
+        p += len;
+    } else {
+        offset = off * s390ms->books + book->book_id;
+    }
+
+    QTAILQ_FOREACH_REVERSE(kid, &book->bus->children, sibling) {
+        l = set_socket(ms, p, S390_TOPOLOGY_SOCKET(kid->child), level,
+                       offset);
+        p += l;
+        len += l;
+    }
+
+    return len;
+}
+
+static int set_drawer(const MachineState *ms, void *p,
+                      S390TopologyDrawer *drawer, int level)
+{
+    BusChild *kid;
+    int l, len = 0;
+    int offset = 0;
+
+    if (level >= 4) {
+        len += stsi_15_container(p, 3, drawer->drawer_id);
+        p += len;
+    } else {
+        offset = drawer->drawer_id;
+    }
+
+    QTAILQ_FOREACH_REVERSE(kid, &drawer->bus->children, sibling) {
+        l = set_book(ms, p, S390_TOPOLOGY_BOOK(kid->child), level, offset);
+        p += l;
+        len += l;
+    }
+
+    return len;
+}
+
+static void insert_stsi_15_1_2(const MachineState *ms, void *p)
+{
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+    S390TopologyDrawer *drawer;
+    S390TopologyNode *node;
+    SysIB_151x *sysib;
+    BusChild *kid;
+    int level = 2;
+    int len, l, nb_sockets;
+
+    sysib = (SysIB_151x *)p;
+    sysib->mnest = level;
+    nb_sockets = ms->smp.sockets * s390ms->books * s390ms->drawers;
+    sysib->mag[TOPOLOGY_NR_MAG2] = nb_sockets;
+    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores;
+
+    node = s390_get_topology();
+    len = sizeof(SysIB_151x);
+    p += len;
+
+    QTAILQ_FOREACH_REVERSE(kid, &node->bus->children, sibling) {
+        drawer = S390_TOPOLOGY_DRAWER(kid->child);
+        l = set_drawer(ms, p, drawer, level);
+        p += l;
+        len += l;
+    }
+
+    sysib->length = len;
+}
+
+static void insert_stsi_15_1_3(const MachineState *ms, void *p)
+{
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+    S390TopologyDrawer *drawer;
+    S390TopologyNode *node;
+    SysIB_151x *sysib;
+    BusChild *kid;
+    int level = 3;
+    int len, l;
+
+    sysib = (SysIB_151x *)p;
+    sysib->mnest = level;
+    sysib->mag[TOPOLOGY_NR_MAG3] = s390ms->books * s390ms->drawers;
+    sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
+    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores;
+
+    node = s390_get_topology();
+    len = sizeof(SysIB_151x);
+    p += len;
+
+    QTAILQ_FOREACH_REVERSE(kid, &node->bus->children, sibling) {
+        drawer = S390_TOPOLOGY_DRAWER(kid->child);
+        l = set_drawer(ms, p, drawer, level);
+        p += l;
+        len += l;
+    }
+
+    sysib->length = len;
+}
+
+static void insert_stsi_15_1_4(const MachineState *ms, void *p)
+{
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+    S390TopologyDrawer *drawer;
+    S390TopologyNode *node;
+    SysIB_151x *sysib;
+    BusChild *kid;
+    int level = 4;
+    int len, l;
+
+    sysib = (SysIB_151x *)p;
+    sysib->mnest = level;
+    sysib->mag[TOPOLOGY_NR_MAG4] = s390ms->drawers;
+    sysib->mag[TOPOLOGY_NR_MAG3] = s390ms->books;
+    sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
+    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores;
+
+    node = s390_get_topology();
+    len = sizeof(SysIB_151x);
+    p += len;
+
+    QTAILQ_FOREACH_REVERSE(kid, &node->bus->children, sibling) {
+        drawer = S390_TOPOLOGY_DRAWER(kid->child);
+        l = set_drawer(ms, p, drawer, level);
+        p += l;
+        len += l;
+    }
+
+    sysib->length = len;
+}
+
+#define SCLP_READ_SCP_INFO_MNEST 2
+static void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
+{
+    const MachineState *machine = MACHINE(qdev_get_machine());
+    void *p;
+
+    if (sel2 > SCLP_READ_SCP_INFO_MNEST) {
+        setcc(cpu, 3);
+        return;
+    }
+
+    p = g_malloc0(4096);
+
+    switch (sel2) {
+    case 2:
+        insert_stsi_15_1_2(machine, p);
+        break;
+    case 3:
+        insert_stsi_15_1_3(machine, p);
+        break;
+    case 4:
+        insert_stsi_15_1_4(machine, p);
+        break;
+    default:
+        setcc(cpu, 3);
+        return;
+    }
+
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_write(cpu, 0, p, 4096);
+    } else {
+        s390_cpu_virt_mem_write(cpu, addr, ar, p, 4096);
+    }
+    setcc(cpu, 0);
+    g_free(p);
+}
+
 static int handle_stsi(S390CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -1906,6 +2124,10 @@ static int handle_stsi(S390CPU *cpu)
         /* Only sysib 3.2.2 needs post-handling for now. */
         insert_stsi_3_2_2(cpu, run->s390_stsi.addr, run->s390_stsi.ar);
         return 0;
+    case 15:
+        insert_stsi_15_1_x(cpu, run->s390_stsi.sel2, run->s390_stsi.addr,
+                           run->s390_stsi.ar);
+        return 0;
     default:
         return 0;
     }
-- 
2.25.1


