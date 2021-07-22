Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD83D2B5B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:45:28 +0200 (CEST)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6clD-000069-VX
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6ciu-0005iC-FA; Thu, 22 Jul 2021 13:43:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6cis-00044L-Ra; Thu, 22 Jul 2021 13:43:04 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MHY8eZ106691; Thu, 22 Jul 2021 13:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=8hby5qxI2usIQFXXlvQR++2lknzHdDOtJgwfuPHuPe4=;
 b=RAoeWseghVLX8EN3p4N/V3qh3myju/WtcgAeZo5T/ouTBHQ3Axml4zdtRkyKbGgGMb8u
 epAmIqyQEx66m1ApkTVIt6klDbXmTvoDn3iBIoOgowuM13iVSLscEg04Y1BuBUpYDbs/
 Od+5lKrLLnWb4TtIGsTfCzRYG7vcNrtINFIDrieP6KOmvlamcO8eqyWYmEBHsrjARwiL
 uv28Dn8PP6Q54t6dbqKQwZ2jVi0gCzdDp3wGu1SwFjYPtQbjvMr4QPsBPrHuARdNMMZ3
 Tal4JSbRNZg5FOVrJl97Q+KMoD7Sb1WlPL1udr5lgMcOl8vReh8IuDh95V7a2OHEab/O ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yca9tp7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:43:01 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MHY8MF106734;
 Thu, 22 Jul 2021 13:43:01 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yca9tp6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:43:01 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MHXkkX017497;
 Thu, 22 Jul 2021 17:42:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 39upu8am1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 17:42:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16MHgus734799892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 17:42:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1753511C058;
 Thu, 22 Jul 2021 17:42:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B37BE11C04C;
 Thu, 22 Jul 2021 17:42:55 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.18.177])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 17:42:55 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v2 5/5] s390x: topology: implementating Store Topology System
 Information
Date: Thu, 22 Jul 2021 19:42:44 +0200
Message-Id: <1626975764-22131-6-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BVPrBEUPCHsDDB2CJWzLuiPK_eL2ELzR
X-Proofpoint-ORIG-GUID: AfKpuIQ0wMGNJAkIk06sr1TH3MaijCFU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_12:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The handling of STSI is enhenced with the interception of the
function code 15 for storing CPU topology.

Using the objects built during the pluging of CPU, we build the
SYSIB 15_1_x structures.

With this patch the maximum MNEST level is 2, this is also
the only level allowed and only SYSIB 15_1_2 will be built.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 target/s390x/kvm/kvm.c | 101 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 9a0c13d4ac..0194756e6a 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -52,6 +52,7 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/s390-virtio-hcall.h"
 #include "hw/s390x/pv.h"
+#include "hw/s390x/cpu-topology.h"
 
 #ifndef DEBUG_KVM
 #define DEBUG_KVM  0
@@ -1907,6 +1908,102 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
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
+                      S390TopologySocket *socket)
+{
+    BusChild *kid;
+    int l, len = 0;
+
+    len += stsi_15_container(p, 1, socket->socket_id);
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
+static void insert_stsi_15_1_2(const MachineState *ms, void *p)
+{
+    S390TopologyBook *book;
+    SysIB_151x *sysib;
+    BusChild *kid;
+    int level = 2;
+    int len, l;
+
+    sysib = (SysIB_151x *)p;
+    sysib->mnest = level;
+    sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
+    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores;
+
+    book = s390_get_topology();
+    len = sizeof(SysIB_151x);
+    p += len;
+
+    QTAILQ_FOREACH_REVERSE(kid, &book->bus->children, sibling) {
+        l = set_socket(ms, p, S390_TOPOLOGY_SOCKET(kid->child));
+        p += l;
+        len += l;
+    }
+
+    sysib->length = len;
+}
+
+static void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
+{
+    const MachineState *machine = MACHINE(qdev_get_machine());
+    void *p;
+    int ret, cc;
+
+    /*
+     * Until the SCLP STSI Facility reporting the MNEST value is used,
+     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
+     */
+    if (sel2 != 2) {
+        setcc(cpu, 3);
+        return;
+    }
+
+    p = g_malloc0(4096);
+
+   insert_stsi_15_1_2(machine, p);
+
+    if (s390_is_pv()) {
+        ret = s390_cpu_pv_mem_write(cpu, 0, p, 4096);
+    } else {
+        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, 4096);
+    }
+    cc = ret ? 3 : 0;
+    setcc(cpu, cc);
+    g_free(p);
+}
+
 static int handle_stsi(S390CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -1920,6 +2017,10 @@ static int handle_stsi(S390CPU *cpu)
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


