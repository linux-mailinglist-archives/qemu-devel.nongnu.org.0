Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BD103909
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 12:47:05 +0100 (CET)
Received: from localhost ([::1]:56816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXORs-0005HO-GK
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 06:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1iXOP2-0003L1-Q7
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1iXOP1-0003ZE-LS
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:44:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7274)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1iXOP1-0003XE-Dj
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 06:44:07 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKBfmAB048337
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 06:44:06 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wadmy9s5f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 06:44:06 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 20 Nov 2019 11:44:03 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 20 Nov 2019 11:44:00 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAKBhxGs31850708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 11:43:59 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3FF4C052;
 Wed, 20 Nov 2019 11:43:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC7AF4C04E;
 Wed, 20 Nov 2019 11:43:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.152.224.205])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Nov 2019 11:43:57 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/15] s390x: protvirt: SCLP interpretation
Date: Wed, 20 Nov 2019 06:43:28 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120114334.2287-1-frankja@linux.ibm.com>
References: <20191120114334.2287-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112011-0020-0000-0000-0000038C55B1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112011-0021-0000-0000-000021E288E2
Message-Id: <20191120114334.2287-10-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_03:2019-11-15,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=667 impostorscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=1 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911200107
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SCLP for a protected guest is done over the SIDAD, so we need to use
the s390_cpu_virt_mem_* functions to access the SIDAD instead of guest
memory when reading/writing SCBs.

To not confuse the sclp emulation, we set 0x42000 as the address, but
ignore it for reading/writing the SCCB.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/sclp.c         | 16 ++++++++++++++++
 include/hw/s390x/sclp.h |  2 ++
 target/s390x/kvm.c      |  8 +++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index f57ce7b739..00d08adc7f 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -193,6 +193,22 @@ static void sclp_execute(SCLPDevice *sclp, SCCB *sccb, uint32_t code)
     }
 }
 
+int sclp_service_call_protected(CPUS390XState *env, uint64_t sccb,
+                                uint32_t code)
+{
+    SCLPDevice *sclp = get_sclp_device();
+    SCLPDeviceClass *sclp_c = SCLP_GET_CLASS(sclp);
+    SCCB work_sccb;
+    hwaddr sccb_len = sizeof(SCCB);
+
+    s390_cpu_virt_mem_read(env_archcpu(env), 0, 0, &work_sccb, sccb_len);
+    sclp_c->execute(sclp, &work_sccb, code);
+    s390_cpu_virt_mem_write(env_archcpu(env), 0, 0, &work_sccb,
+                            be16_to_cpu(work_sccb.h.length));
+    sclp_c->service_interrupt(sclp, sccb);
+    return 0;
+}
+
 int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t code)
 {
     SCLPDevice *sclp = get_sclp_device();
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index c54413b78c..c0a3faa37d 100644
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
index 58251c0229..0f2458b553 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1172,7 +1172,13 @@ static int kvm_sclp_service_call(S390CPU *cpu, struct kvm_run *run,
     sccb = env->regs[ipbh0 & 0xf];
     code = env->regs[(ipbh0 & 0xf0) >> 4];
 
-    r = sclp_service_call(env, sccb, code);
+    if (run->s390_sieic.icptcode == ICPT_PV_INSTR ||
+        run->s390_sieic.icptcode == ICPT_PV_INSTR_NOT) {
+        r = sclp_service_call_protected(env, 0x42000, code);
+    } else {
+        r = sclp_service_call(env, sccb, code);
+    }
+
     if (r < 0) {
         kvm_s390_program_interrupt(cpu, -r);
     } else {
-- 
2.20.1


