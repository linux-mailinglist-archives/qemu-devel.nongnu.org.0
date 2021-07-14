Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0EA3C8916
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:54:46 +0200 (CEST)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3i9l-00013i-0p
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8X-0007LS-3q; Wed, 14 Jul 2021 12:53:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8V-0000yb-Bx; Wed, 14 Jul 2021 12:53:28 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGZCOt107412; Wed, 14 Jul 2021 12:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=BMequsSXU+AqHRMxMaBPES/+Mnb8mcPFmwAp4vdNUMc=;
 b=rgwElulbfQMOZ5qb5xoxBA91DPjMmqbceGWXdVhFSlne1WpjQSN5Dno4j8ox+tvpzxym
 OSUJFXfh39c4gSP9wXbFFdY7UZQtQ5m3aqrvgliPaL/mIlaVGhjMZk45Z16nDZNl6Vtm
 /eCihZtSVghoUZ3Ta6RT3N8MiogrUD3nwWkxmc8zN2xCQPC5Fxx4tEa/fH3+xfw1OPvi
 /8Hn4DOYfkNyhuCymxzdEXpxASG11Nb1NTv7knTo5DUYEa7MvNSsTFzcJMOD3EsZ4YAR
 r4LdVo7imY9onde3V46NTiIJXNeZNhGT+H2ISpJJjj653zXLOfaR1p0/yoTP6fhuaDHJ TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc2y8acm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:24 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGbH9V112070;
 Wed, 14 Jul 2021 12:53:24 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sc2y8abw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:23 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGhd1x010568;
 Wed, 14 Jul 2021 16:53:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 39s3p78duv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16EGp8Kt36045150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:51:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9A39A405B;
 Wed, 14 Jul 2021 16:53:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E419A4066;
 Wed, 14 Jul 2021 16:53:18 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:18 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
Date: Wed, 14 Jul 2021 18:53:08 +0200
Message-Id: <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bmOC6xWgmr0QVOFRU5jsGyCvTp8SEFoc
X-Proofpoint-ORIG-GUID: Z93zpg5RPaf3VNWBw7wMNOiRRgDR1Hsc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107140099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

We need a s390x dedicated SMP parsing to handle s390x specificities.

In this patch we only handle threads, cores and sockets for
s390x:
- do not support threads, we always have 1 single thread per core
- the sockets are filled one after the other with the cores

Both these handlings are different from the standard smp_parse
functionement and reflect the CPU topology in the simple case
where all CPU belong to the same book.

Topology levels above sockets, i.e. books, drawers, are not
considered at this stage and will be introduced in a later patch.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e4b18aef49..899d3a4137 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -582,6 +582,47 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
     return newsz;
 }
 
+/*
+ * In S390CCW machine we do not support threads for now,
+ * only sockets and cores.
+ */
+static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
+{
+    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 1);
+    unsigned sockets = qemu_opt_get_number(opts, "sockets", 1);
+    unsigned cores   = qemu_opt_get_number(opts, "cores", 1);
+
+    if (opts) {
+        if (cpus == 0 || sockets == 0 || cores == 0) {
+            error_report("cpu topology: "
+                         "sockets (%u), cores (%u) or number of CPU(%u) "
+                         "can not be zero", sockets, cores, cpus);
+            exit(1);
+        }
+    }
+
+    ms->smp.max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+    if (ms->smp.max_cpus < cpus) {
+        error_report("maxcpus must be equal to or greater than smp");
+        exit(1);
+    }
+
+    if (!qemu_opt_find(opts, "cores")) {
+        cores = ms->smp.max_cpus / sockets;
+    }
+
+    if (sockets * cores != ms->smp.max_cpus) {
+        error_report("Invalid CPU topology: sockets (%u) * cores (%u) "
+                     "!= maxcpus (%u)", sockets, cores, ms->smp.max_cpus);
+        exit(1);
+    }
+
+    ms->smp.threads = 1;
+    ms->smp.cpus = cpus;
+    ms->smp.cores = cores;
+    ms->smp.sockets = sockets;
+}
+
 static void ccw_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -612,6 +653,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = s390_machine_device_unplug_request;
     nc->nmi_monitor_handler = s390_nmi;
     mc->default_ram_id = "s390.ram";
+    mc->smp_parse = s390_smp_parse;
 }
 
 static inline bool machine_get_aes_key_wrap(Object *obj, Error **errp)
-- 
2.25.1


