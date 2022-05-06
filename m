Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6CD51DC74
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 17:44:19 +0200 (CEST)
Received: from localhost ([::1]:55832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn07u-0003Pz-J7
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 11:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nn03v-0004v9-2h; Fri, 06 May 2022 11:40:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49358
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nn03s-0007Ci-S5; Fri, 06 May 2022 11:40:10 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246FNTTN009583;
 Fri, 6 May 2022 15:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m9Ah/bzAj8wykCs6xyTp8mvOfKQEWcnja6xl0wqpAtA=;
 b=aeeYfUvv4ljV8kUWVo/bxAH6yuYKBTA0r2//irQlQKrlOaNDYSMq8HQlLcGDn3Zx8cR1
 fzMBgfz2WyxsYzL3CzKV9nux3walNoST/ZYTN4KJ6+L8Iqstxra7+pbniQZFUc9r7MwH
 1d4rZ5mNAGovIeDg1XVQylqp8Blltw4yPxWNrk99CJuVxwXnJbG7pR7jqeJg8xAL7XjZ
 w41h7UkT/bd5xs+8q9WIgJH//OAuZQfdTK5xjlTSRD6amM1mVi3TLT2F1YdslgdWGzWI
 L74WN7BAIAxfmy2oypnie3r5rFIYXpEeJkVDtQrZzTu1y8wgTFzn5k/wwTxfFOYYnXI0 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw699rab1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:05 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246FO6rX010634;
 Fri, 6 May 2022 15:40:04 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw699raab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:04 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246FJ3ah022779;
 Fri, 6 May 2022 15:40:02 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3frvr8y3gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 246FdxCD27394316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 15:39:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99AFF11C050;
 Fri,  6 May 2022 15:39:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 498A611C052;
 Fri,  6 May 2022 15:39:59 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 15:39:59 +0000 (GMT)
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>
Cc: Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
Date: Fri,  6 May 2022 17:39:56 +0200
Message-Id: <20220506153956.2217601-3-scgl@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506153956.2217601-1-scgl@linux.ibm.com>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _eYwNGQovATFKN8JmnSKbDYFY-To6xKV
X-Proofpoint-ORIG-GUID: RKp957ov9LUpnXb2yW-rXaSlaHnDK9B7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Storage key controlled protection is currently not honored when
emulating instructions.
If available, enable key protection for the MEM_OP ioctl, thereby
enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
As a result, the emulation of the following instructions honors storage
keys:

* CLP
  	The Synch I/O CLP command would need special handling in order
  	to support storage keys, but is currently not supported.
* CHSC
	Performing commands asynchronously would require special
	handling, but commands are currently always synchronous.
* STSI
* TSCH
	Must (and does) not change channel if terminated due to
	protection.
* MSCH
	Suppressed on protection, works because fetching instruction.
* SSCH
	Suppressed on protection, works because fetching instruction.
* STSCH
* STCRW
	Suppressed on protection, this works because no partial store is
	possible, because the operand cannot span multiple pages.
* PCISTB
* MPCIFC
* STPCIFC

Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 target/s390x/kvm/kvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 53098bf541..7bd8db0e7b 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 static int cap_sync_regs;
 static int cap_async_pf;
 static int cap_mem_op;
+static int cap_mem_op_extension;
 static int cap_s390_irq;
 static int cap_ri;
 static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
 
+static bool mem_op_storage_key_support;
+
 static int active_cmma;
 
 static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
@@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
     cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
     cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
+    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
+    mem_op_storage_key_support = cap_mem_op_extension > 0;
     cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
@@ -842,6 +847,7 @@ int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
                        : KVM_S390_MEMOP_LOGICAL_READ,
         .buf = (uint64_t)hostbuf,
         .ar = ar,
+        .key = (cpu->env.psw.mask & PSW_MASK_KEY) >> PSW_SHIFT_KEY,
     };
     int ret;
 
@@ -851,6 +857,9 @@ int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
     if (!hostbuf) {
         mem_op.flags |= KVM_S390_MEMOP_F_CHECK_ONLY;
     }
+    if (mem_op_storage_key_support) {
+        mem_op.flags |= KVM_S390_MEMOP_F_SKEY_PROTECTION;
+    }
 
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_S390_MEM_OP, &mem_op);
     if (ret < 0) {
-- 
2.32.0


