Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B85FC974
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:48:15 +0200 (CEST)
Received: from localhost ([::1]:53340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiety-0006aX-Rp
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieUF-0003yr-Fd; Wed, 12 Oct 2022 12:21:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieUA-0008BL-Nn; Wed, 12 Oct 2022 12:21:39 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CEuoaB008900;
 Wed, 12 Oct 2022 16:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Kkc6nDSPUBhshNNT1XRC20L7C4LTKsbmjfcv8SwdAwI=;
 b=ABMTZ28B/FSBbsZsujjJ8ypRIAyVC+g27dh2hhQHaLk7UwNUKB/olCfQW5W8NKykRDJ4
 wCZrs0WcEL+jGut4KO20uDuLfxBuJPhp1FBc3BDyTwXZZnv25T9/ZN7iC9puUeDxec3p
 bwOmX2r9TbUzTxp21+jI2qnZh1hDvK3XESatz70T75P4EXqo3//W9TVpUExcN8jG3fuj
 I+TqBQ2H6NBa+3SUAM54TSi0DlpAgWjI/gK5wTwPmN8tSInLNTnCIF54UbxcPsWD0SaJ
 R6cfmveJZ44zQgpKxcfkmUP4yoCh0Entc+QzGHCwvt4ZAQ64m/ku/LJ05Ln3ICIhwEjk rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5ysv2s8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:25 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CGC9PL030617;
 Wed, 12 Oct 2022 16:21:25 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5ysv2s77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CGKrri015209;
 Wed, 12 Oct 2022 16:21:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3k30u9696s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29CGLJjv41353712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 16:21:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA490A405B;
 Wed, 12 Oct 2022 16:21:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D54DDA4054;
 Wed, 12 Oct 2022 16:21:18 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.34.168])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Oct 2022 16:21:18 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Subject: [PATCH v10 7/9] s390x/cpu topology: add max_threads machine class
 attribute
Date: Wed, 12 Oct 2022 18:21:05 +0200
Message-Id: <20221012162107.91734-8-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221012162107.91734-1-pmorel@linux.ibm.com>
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HwDAp3vTJQfrDxlDXzWNu-_hiWqbJQjS
X-Proofpoint-GUID: QT7IPJl-sFnUw0k_VdgEFtSuiwR-1x_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120106
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The S390 CPU topology accepts the smp.threads argument while
in reality it does not effectively allow multthreading.

Let's keep this behavior for machines older than 7.3 and
refuse to use threads in newer machines until multithreading
is really proposed to the guest by the machine.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 include/hw/s390x/s390-virtio-ccw.h |  1 +
 hw/s390x/s390-virtio-ccw.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 6c4b4645fc..319dfac1bb 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -48,6 +48,7 @@ struct S390CcwMachineClass {
     bool css_migration_enabled;
     bool hpage_1m_allowed;
     bool topology_allowed;
+    int max_threads;
 };
 
 /* runtime-instrumentation allowed by the machine */
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 3a13fad4df..d6ce31d168 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -85,8 +85,15 @@ out:
 static void s390_init_cpus(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
     int i;
 
+    if (machine->smp.threads > s390mc->max_threads) {
+        error_report("S390 does not support more than %d threads.",
+                     s390mc->max_threads);
+        exit(1);
+    }
+
     /* initialize possible_cpus */
     mc->possible_cpu_arch_ids(machine);
 
@@ -617,6 +624,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     s390mc->css_migration_enabled = true;
     s390mc->hpage_1m_allowed = true;
     s390mc->topology_allowed = true;
+    s390mc->max_threads = 1;
     mc->init = ccw_init;
     mc->reset = s390_machine_reset;
     mc->block_default_type = IF_VIRTIO;
@@ -887,12 +895,14 @@ static void ccw_machine_7_2_class_options(MachineClass *mc)
     S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
     static GlobalProperty compat[] = {
         { TYPE_S390_CPU_TOPOLOGY, "topology-allowed", "off", },
+        { TYPE_S390_CPU_TOPOLOGY, "max_threads", "off", },
     };
 
     ccw_machine_7_3_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
     compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
     s390mc->topology_allowed = false;
+    s390mc->max_threads = S390_MAX_CPUS;
 }
 DEFINE_CCW_MACHINE(7_2, "7.2", false);
 
-- 
2.31.1


