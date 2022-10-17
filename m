Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CA5600972
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:56:07 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLuo-0004RM-Vu
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf0-0007u0-EF; Mon, 17 Oct 2022 04:39:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51798
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLeu-0003fh-R7; Mon, 17 Oct 2022 04:39:45 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H6ZM4m012953;
 Mon, 17 Oct 2022 08:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CFZWawMqHeQzH6iy33ST0YVbijsFegmiORIVkzEzTU0=;
 b=jj6O5le83VE87ct7Rz/wT0CB7dfJ4FWcHQyTWefNI8Kwr3gEW74yDNTgGNnYCRR9VjV7
 g5DvSZ8jaQasabOcGXXRCahdtteUi6qpwCYD0ZGVd6AnIjQ63GIESn/VGRTuLLhp4s5z
 PE+5uyohvzvrM3ehhLfI9MvhRFeIdtwkAl8HuBmSWyuCaKbIgrkK/B/9HuAZWBI9O4tz
 /RiW636TtmleH0wvlMuXrkosdpNNOroArovuo/sIIcfBMtVAfTboonouqBWge+BDTOim
 34vZMMFdVIuEqqRbDx50nrwnax/C9rFCbmYML11Bsp5lMfvx9rcOlhVFbiPKXKs9evKP RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86g5sfa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:39 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H6iiM8021727;
 Mon, 17 Oct 2022 08:39:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86g5sf9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8csKv030276;
 Mon, 17 Oct 2022 08:39:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3k7m4jjnce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29H8dXkm32309980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:39:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FE16A4051;
 Mon, 17 Oct 2022 08:39:33 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D9DFA404D;
 Mon, 17 Oct 2022 08:39:32 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:32 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 06/10] s390x: Add protected dump cap
Date: Mon, 17 Oct 2022 08:38:18 +0000
Message-Id: <20221017083822.43118-7-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q8Oa_0dlpRxg-jM6vlBPhwUqlcwwKnvc
X-Proofpoint-ORIG-GUID: 5cGXWaiDzsH2Fwo1EdCdI_81odL_E3am
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=958 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Add a protected dump capability for later feature checking.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 target/s390x/kvm/kvm.c       | 7 +++++++
 target/s390x/kvm/kvm_s390x.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6a8dbadf7e..2ca0d46453 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -158,6 +158,7 @@ static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
 static int cap_zpci_op;
+static int cap_protected_dump;
 
 static bool mem_op_storage_key_support;
 
@@ -364,6 +365,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
     cap_zpci_op = kvm_check_extension(s, KVM_CAP_S390_ZPCI_OP);
+    cap_protected_dump = kvm_check_extension(s, KVM_CAP_S390_PROTECTED_DUMP);
 
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
@@ -2045,6 +2047,11 @@ int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
     return kvm_vm_ioctl(kvm_state, KVM_IOEVENTFD, &kick);
 }
 
+int kvm_s390_get_protected_dump(void)
+{
+    return cap_protected_dump;
+}
+
 int kvm_s390_get_ri(void)
 {
     return cap_ri;
diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index aaae8570de..f9785564d0 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -26,6 +26,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state);
 void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
 int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
 int kvm_s390_get_hpage_1m(void);
+int kvm_s390_get_protected_dump(void);
 int kvm_s390_get_ri(void);
 int kvm_s390_get_zpci_op(void);
 int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_clock);
-- 
2.34.1


