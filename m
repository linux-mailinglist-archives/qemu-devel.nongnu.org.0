Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A27557CC1A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:39:40 +0200 (CEST)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWOx-0006oS-7D
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9e-0000hb-29; Thu, 21 Jul 2022 09:23:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9b-0006Y7-B2; Thu, 21 Jul 2022 09:23:49 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDDwWg001874;
 Thu, 21 Jul 2022 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SqTIiLskAeTp2bbvvZ3fF6LV6/XsU4Wr70mioW9Qfns=;
 b=hJt+8kQgNbUHfYqfqg6jHoAWZbANvxEbKmTAYBsvApbhE3jq/tH7ynJDZEoGd5PatcWt
 T51uscGANqai0itIbauSiJ37lF1Meyr4sOJjN2blySS3rOrMpX3b9WtgKOa0xRd1Y1Sl
 sehw0mcyxB4rr03zUdzhxGNihIORbOnB1IcZ8/Mbv8ABKuheZZIH5yO8ulHXBs0H+pAp
 8BZNNjr8Qwmra6nusQ3yWQ2CC00Ko5Yn2dKD0YoVyyFwEOAOaQqubGuLp8stblHW0g7S
 GE84/XzfMcfNIMDg0orR1uFYhhOjdMgEc9jk7cDgrSa1fGzie1RomFewNbjSn+pgVh60 Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf74q9b18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:45 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LDELAw004496;
 Thu, 21 Jul 2022 13:23:45 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf74q9b0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LDNbvG029788;
 Thu, 21 Jul 2022 13:23:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3hbmkj70kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LDNet417433010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 13:23:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8278D4C044;
 Thu, 21 Jul 2022 13:23:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74D3D4C040;
 Thu, 21 Jul 2022 13:23:39 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 13:23:39 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Subject: [PATCH v3 11/14] s390x: Add protected dump cap
Date: Thu, 21 Jul 2022 13:22:53 +0000
Message-Id: <20220721132256.2171-12-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721132256.2171-1-frankja@linux.ibm.com>
References: <20220721132256.2171-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yJVXf_M5lIlClmImDvVmKww5zMLZLJFT
X-Proofpoint-ORIG-GUID: kOYyg82g20k2fPr62AdHmhOwxo_ICeQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_16,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=909 adultscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210053
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Add a protected dump capability for later feature checking.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/kvm/kvm.c       | 7 +++++++
 target/s390x/kvm/kvm_s390x.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 7bd8db0e7b..cbd8c91424 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -157,6 +157,7 @@ static int cap_ri;
 static int cap_hpage_1m;
 static int cap_vcpu_resets;
 static int cap_protected;
+static int cap_protected_dump;
 
 static bool mem_op_storage_key_support;
 
@@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_s390_irq = kvm_check_extension(s, KVM_CAP_S390_INJECT_IRQ);
     cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
     cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
+    cap_protected_dump = kvm_check_extension(s, KVM_CAP_S390_PROTECTED_DUMP);
 
     kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
     kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
@@ -2043,6 +2045,11 @@ int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
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
index 05a5e1e6f4..31a69f9ce2 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -26,6 +26,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state);
 void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
 int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
 int kvm_s390_get_hpage_1m(void);
+int kvm_s390_get_protected_dump(void);
 int kvm_s390_get_ri(void);
 int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_clock);
 int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_clock);
-- 
2.34.1


