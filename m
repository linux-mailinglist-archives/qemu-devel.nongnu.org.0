Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C318B6A8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 14:28:49 +0100 (CET)
Received: from localhost ([::1]:38006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEvE8-00085w-Qv
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 09:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jEv5V-0002AP-Gz
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 09:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jEv5U-0001bN-3p
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 09:19:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jEv5T-0001aE-Rn
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 09:19:52 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JD3qlb086030
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 09:19:48 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yua3w80m0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 09:19:48 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 19 Mar 2020 13:19:46 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Mar 2020 13:19:44 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02JDJhfd56819870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 13:19:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1050AA405C;
 Thu, 19 Mar 2020 13:19:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C494DA4066;
 Thu, 19 Mar 2020 13:19:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.146.136])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 13:19:41 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 09/16] s390x: protvirt: SCLP interpretation
Date: Thu, 19 Mar 2020 09:19:14 -0400
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319131921.2367-1-frankja@linux.ibm.com>
References: <20200319131921.2367-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031913-4275-0000-0000-000003AF1999
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031913-4276-0000-0000-000038C44815
Message-Id: <20200319131921.2367-10-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_04:2020-03-19,
 2020-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190058
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SCLP for a protected guest is done over the SIDAD, so we need to use
the s390_cpu_pv_mem_* functions to access the SIDAD instead of guest
memory when reading/writing SCBs.

To not confuse the sclp emulation, we set 0x4000 as the SCCB address,
since the function that injects the sclp external interrupt would
reject a zero sccb address.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/sclp.c         | 56 +++++++++++++++++++++++++++++++++--------
 include/hw/s390x/sclp.h |  2 ++
 target/s390x/kvm.c      | 25 ++++++++++++++----
 3 files changed, 67 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index af0bfbc2eca74767..d8ae207731f1060a 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -33,6 +33,22 @@ static inline SCLPDevice *get_sclp_device(void)
     return sclp;
 }
 
+static inline bool sclp_command_code_valid(uint32_t code)
+{
+    switch (code & SCLP_CMD_CODE_MASK) {
+    case SCLP_CMDW_READ_SCP_INFO:
+    case SCLP_CMDW_READ_SCP_INFO_FORCED:
+    case SCLP_CMDW_READ_CPU_INFO:
+    case SCLP_CMDW_CONFIGURE_IOA:
+    case SCLP_CMDW_DECONFIGURE_IOA:
+    case SCLP_CMD_READ_EVENT_DATA:
+    case SCLP_CMD_WRITE_EVENT_DATA:
+    case SCLP_CMD_WRITE_EVENT_MASK:
+        return true;
+    }
+    return false;
+}
+
 static void prepare_cpu_entries(SCLPDevice *sclp, CPUEntry *entry, int *count)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -193,6 +209,34 @@ static void sclp_execute(SCLPDevice *sclp, SCCB *sccb, uint32_t code)
     }
 }
 
+/*
+ * We only need the address to have something valid for the
+ * service_interrupt call.
+ */
+#define SCLP_PV_DUMMY_ADDR 0x4000
+int sclp_service_call_protected(CPUS390XState *env, uint64_t sccb,
+                                uint32_t code)
+{
+    SCLPDevice *sclp = get_sclp_device();
+    SCLPDeviceClass *sclp_c = SCLP_GET_CLASS(sclp);
+    SCCB work_sccb;
+    hwaddr sccb_len = sizeof(SCCB);
+
+    s390_cpu_pv_mem_read(env_archcpu(env), 0, &work_sccb, sccb_len);
+
+    if (!sclp_command_code_valid(code)) {
+        work_sccb.h.response_code = cpu_to_be16(SCLP_RC_INVALID_SCLP_COMMAND);
+        goto out_write;
+    }
+
+    sclp_c->execute(sclp, &work_sccb, code);
+out_write:
+    s390_cpu_pv_mem_write(env_archcpu(env), 0, &work_sccb,
+                          be16_to_cpu(work_sccb.h.length));
+    sclp_c->service_interrupt(sclp, SCLP_PV_DUMMY_ADDR);
+    return 0;
+}
+
 int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t code)
 {
     SCLPDevice *sclp = get_sclp_device();
@@ -225,17 +269,7 @@ int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t code)
         return -PGM_SPECIFICATION;
     }
 
-    switch (code & SCLP_CMD_CODE_MASK) {
-    case SCLP_CMDW_READ_SCP_INFO:
-    case SCLP_CMDW_READ_SCP_INFO_FORCED:
-    case SCLP_CMDW_READ_CPU_INFO:
-    case SCLP_CMDW_CONFIGURE_IOA:
-    case SCLP_CMDW_DECONFIGURE_IOA:
-    case SCLP_CMD_READ_EVENT_DATA:
-    case SCLP_CMD_WRITE_EVENT_DATA:
-    case SCLP_CMD_WRITE_EVENT_MASK:
-        break;
-    default:
+    if (!sclp_command_code_valid(code)) {
         work_sccb.h.response_code = cpu_to_be16(SCLP_RC_INVALID_SCLP_COMMAND);
         goto out_write;
     }
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index cd7b24359f28deb4..822eff4396ff5dde 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -217,5 +217,7 @@ void s390_sclp_init(void);
 void sclp_service_interrupt(uint32_t sccb);
 void raise_irq_cpu_hotplug(void);
 int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t code);
+int sclp_service_call_protected(CPUS390XState *env, uint64_t sccb,
+                                uint32_t code);
 
 #endif
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 462a1d70ee78104c..6b7819d2c51a111c 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1233,12 +1233,27 @@ static void kvm_sclp_service_call(S390CPU *cpu, struct kvm_run *run,
     sccb = env->regs[ipbh0 & 0xf];
     code = env->regs[(ipbh0 & 0xf0) >> 4];
 
-    r = sclp_service_call(env, sccb, code);
-    if (r < 0) {
-        kvm_s390_program_interrupt(cpu, -r);
-        return;
+    switch (run->s390_sieic.icptcode) {
+    case ICPT_PV_INSTR_NOTIFICATION:
+        g_assert(s390_is_pv());
+        /* The notification intercepts are currently handled by KVM */
+        error_report("unexpected SCLP PV notification");
+        exit(1);
+        break;
+    case ICPT_PV_INSTR:
+        g_assert(s390_is_pv());
+        sclp_service_call_protected(env, sccb, code);
+        /* Setting the CC is done by the Ultravisor. */
+        break;
+    case ICPT_INSTRUCTION:
+        g_assert(!s390_is_pv());
+        r = sclp_service_call(env, sccb, code);
+        if (r < 0) {
+            kvm_s390_program_interrupt(cpu, -r);
+            return;
+        }
+        setcc(cpu, r);
     }
-    setcc(cpu, r);
 }
 
 static int handle_b2(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
-- 
2.25.1


