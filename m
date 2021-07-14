Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939AD3C8917
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:54:48 +0200 (CEST)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3i9n-00017E-Ll
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8X-0007LT-4Q; Wed, 14 Jul 2021 12:53:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27744
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8V-0000yp-CA; Wed, 14 Jul 2021 12:53:28 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGZcMZ039202; Wed, 14 Jul 2021 12:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=2dNIkwmWrR6tFTXvbg7IzMekx3fUe5+94uNVLFu7Gk4=;
 b=XpGZvCjOzrZMCHav2yyM8XpoyTHpzYvhdXYRFJvODm+yjWnvyICqFCcidd2O4loRldXd
 q1GU/UJz2s/NpFUKzSt9cQRb6qjsJeNH5WBLcip4Gd/raMJjPRsGNfy4RQyPU0uxES+K
 MIe1oP65s6InBTd5erUX8eP+im3sIbTOkVJHiy/p7/SqVKrq1WcYKLviuxQUOAxHsay7
 gawMrn0U/B0AOh6ChdET4eLO+FX5P8wxqMNUcXpenn5FSXJ0x+H5zCrrVvb3E/JD2gAB
 utxcFJpTUkeDDUHrFaiV6eHYuGoLFilKuWI2eb2dJzv1FZVGDdPFINgkdhHIh6LyqlyB dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39seya2n24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:24 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGZh8U039626;
 Wed, 14 Jul 2021 12:53:24 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39seya2n1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:24 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGr0l1029040;
 Wed, 14 Jul 2021 16:53:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39q2th9vne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16EGp9ir35127556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:51:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A045A4060;
 Wed, 14 Jul 2021 16:53:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07576A405F;
 Wed, 14 Jul 2021 16:53:19 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:18 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp parsing
Date: Wed, 14 Jul 2021 18:53:09 +0200
Message-Id: <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AlVuIyWdJO75MESBpOX16x7Zhmj6POKh
X-Proofpoint-ORIG-GUID: I9DqY6iFwCUlTfCIMtVd682AqV6fG19R
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drawers and Books are levels 4 and 3 of the S390 CPU
topology.
We allow the user to define these levels and we will
store the values inside the S390CcwMachineState.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c         | 22 +++++++++++++++-------
 include/hw/s390x/s390-virtio-ccw.h |  2 ++
 qapi/machine.json                  |  2 ++
 softmmu/vl.c                       |  6 ++++++
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 899d3a4137..42d9be7333 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -591,12 +591,17 @@ static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
     unsigned cpus    = qemu_opt_get_number(opts, "cpus", 1);
     unsigned sockets = qemu_opt_get_number(opts, "sockets", 1);
     unsigned cores   = qemu_opt_get_number(opts, "cores", 1);
+    unsigned drawers = qemu_opt_get_number(opts, "drawers", 1);
+    unsigned books   = qemu_opt_get_number(opts, "books", 1);
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
 
     if (opts) {
-        if (cpus == 0 || sockets == 0 || cores == 0) {
+        if (cpus == 0 || drawers == 0 || books == 0 || sockets == 0 ||
+            cores == 0) {
             error_report("cpu topology: "
-                         "sockets (%u), cores (%u) or number of CPU(%u) "
-                         "can not be zero", sockets, cores, cpus);
+                         "drawers (%u) books (%u) sockets (%u), cores (%u) "
+                         "or number of CPU(%u) can not be zero", drawers,
+                         books, sockets, cores, cpus);
             exit(1);
         }
     }
@@ -608,12 +613,13 @@ static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
     }
 
     if (!qemu_opt_find(opts, "cores")) {
-        cores = ms->smp.max_cpus / sockets;
+        cores = ms->smp.max_cpus / (drawers * books * sockets);
     }
 
-    if (sockets * cores != ms->smp.max_cpus) {
-        error_report("Invalid CPU topology: sockets (%u) * cores (%u) "
-                     "!= maxcpus (%u)", sockets, cores, ms->smp.max_cpus);
+    if (drawers * books * sockets * cores != ms->smp.max_cpus) {
+        error_report("Invalid CPU topology: drawers (%u) books (%u) "
+                     "sockets (%u) * cores (%u) != maxcpus (%u)",
+                     drawers, books, sockets, cores, ms->smp.max_cpus);
         exit(1);
     }
 
@@ -621,6 +627,8 @@ static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
     ms->smp.cpus = cpus;
     ms->smp.cores = cores;
     ms->smp.sockets = sockets;
+    s390ms->drawers = drawers;
+    s390ms->books = books;
 }
 
 static void ccw_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 3331990e02..fb3c3a50ce 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -28,6 +28,8 @@ struct S390CcwMachineState {
     bool dea_key_wrap;
     bool pv;
     uint8_t loadparm[8];
+    int drawers;
+    int books;
 };
 
 struct S390CcwMachineClass {
diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb..98aff804c6 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -883,6 +883,8 @@
   'data': { '*node-id': 'int',
             '*socket-id': 'int',
             '*die-id': 'int',
+            '*drawer-id': 'int',
+            '*book-id': 'int',
             '*core-id': 'int',
             '*thread-id': 'int'
   }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4df1496101..fc73107b91 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -699,6 +699,12 @@ static QemuOptsList qemu_smp_opts = {
         }, {
             .name = "dies",
             .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "books",
+            .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "drawers",
+            .type = QEMU_OPT_NUMBER,
         }, {
             .name = "cores",
             .type = QEMU_OPT_NUMBER,
-- 
2.25.1


