Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D86D4DC8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:30:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjN3z-0000RN-Px; Mon, 03 Apr 2023 12:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pjN3v-0000MQ-Jb; Mon, 03 Apr 2023 12:29:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pjN3t-0007kL-Rr; Mon, 03 Apr 2023 12:29:43 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 333FlVDf016238; Mon, 3 Apr 2023 16:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cjnFCoK4Ys7ZTKU379eM4Hjavm0QJScLyzDgJTPqjuQ=;
 b=jvV1DKPfBJ4bS8cViQ1wYy7Rd5UloWO59r4sSHXMQwZ8vFXNBPDM3B0e5dsijLtyKofn
 3m+JV1XoaZ3bfxhqAuWBs0ANwq664FdpxWa1TKPEymLTBdjMc/07UAiN0YaKp8lnNluH
 eUc1Mv1yGBYe59WwtZdR14Qf3+nRG1foZaANzz9QMNthmxz4GxaxJZvZRBSJPNzCc80V
 H8MtmlpzFQTWMgA51dIpVx0OR3RfiQJUP50DAAXVy1sk3zRcgDxiOYifyG0+gUMCdoFg
 PpWQYSfuOjQ/6S2V+YKZpa7ynlqHRFrkKBiWkBrIa+Udtf+AlLMqZxo+dAaXiK+NWLiZ rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pqv57cm61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 16:29:37 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 333GELRN014923;
 Mon, 3 Apr 2023 16:29:36 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pqv57cm5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 16:29:36 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3330p6hY018733;
 Mon, 3 Apr 2023 16:29:34 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ppc86sd50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 16:29:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 333GTUdY25690628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Apr 2023 16:29:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5444F20040;
 Mon,  3 Apr 2023 16:29:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C67C20043;
 Mon,  3 Apr 2023 16:29:29 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.179.22.128]) by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  3 Apr 2023 16:29:29 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v19 11/21] qapi/s390x/cpu topology: CPU_POLARIZATION_CHANGE
 qapi event
Date: Mon,  3 Apr 2023 18:28:55 +0200
Message-Id: <20230403162905.17703-12-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230403162905.17703-1-pmorel@linux.ibm.com>
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sE_bWUKdmUGS7v_pRZaNMtBW1VH1ku4S
X-Proofpoint-GUID: 4g7ZaFzBcBfp6590V926fNvk8lgkOHz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_13,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030118
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

When the guest asks to change the polarization this change
is forwarded to the upper layer using QAPI.
The upper layer is supposed to take according decisions concerning
CPU provisioning.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 qapi/machine-target.json | 33 +++++++++++++++++++++++++++++++++
 hw/s390x/cpu-topology.c  |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 3b7a0b77f4..ffde2e9cbd 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -391,3 +391,36 @@
   'features': [ 'unstable' ],
   'if': { 'all': [ 'TARGET_S390X' , 'CONFIG_KVM' ] }
 }
+
+##
+# @CPU_POLARIZATION_CHANGE:
+#
+# Emitted when the guest asks to change the polarization.
+#
+# @polarization: polarization specified by the guest
+#
+# Features:
+# @unstable: This command may still be modified.
+#
+# The guest can tell the host (via the PTF instruction) whether the
+# CPUs should be provisioned using horizontal or vertical polarization.
+#
+# On horizontal polarization the host is expected to provision all vCPUs
+# equally.
+# On vertical polarization the host can provision each vCPU differently.
+# The guest will get information on the details of the provisioning
+# the next time it uses the STSI(15) instruction.
+#
+# Since: 8.1
+#
+# Example:
+#
+# <- { "event": "CPU_POLARIZATION_CHANGE",
+#      "data": { "polarization": 0 },
+#      "timestamp": { "seconds": 1401385907, "microseconds": 422329 } }
+##
+{ 'event': 'CPU_POLARIZATION_CHANGE',
+  'data': { 'polarization': 'CpuS390Polarization' },
+  'features': [ 'unstable' ],
+  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
+}
diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
index 3c7e4e07e6..97706a1daf 100644
--- a/hw/s390x/cpu-topology.c
+++ b/hw/s390x/cpu-topology.c
@@ -19,6 +19,7 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/cpu-topology.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "qapi/qapi-events-machine-target.h"
 
 /*
  * s390_topology is used to keep the topology information.
@@ -127,6 +128,7 @@ void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
         } else {
             s390ms->vertical_polarization = !!fc;
             s390_cpu_topology_set_changed(true);
+            qapi_event_send_cpu_polarization_change(fc);
             setcc(cpu, 0);
         }
         break;
-- 
2.31.1


