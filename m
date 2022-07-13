Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED7573700
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:13:46 +0200 (CEST)
Received: from localhost ([::1]:56506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBcBV-0002jD-Cq
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc53-0008DD-8B; Wed, 13 Jul 2022 09:07:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc51-0006Ad-9x; Wed, 13 Jul 2022 09:07:04 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DCub3M012435;
 Wed, 13 Jul 2022 13:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bRSizNwj21RJ45qspkeLArsVCzY+x8yxZvqhfUCk89w=;
 b=GagPUFJculZVUJ+owHi0r/hKgdaUYSTh4oxI7NTBtNyEN95pj0EKk+5URHJFANkuyJwr
 /rbvZZrhuMfE+nrH+NFlIU8lFcnpKJdpUOTAJYTe79SIExtKD8QG23A692FHJ+We0t67
 4tKJHuFnfhL56QErEpKlpwNEcddk1XoiZFbp56dZg3s4nvDnLrKJ512Y+1DMXG/qybgX
 bckEns35Cmw91Dbfat5bhTOZd2osuXAU/qK09uUzd4OaDTKe4XwRgpukDAA9/spjzQXs
 l/NIpsAXBXlC/3cyBhRGr64VYidbTtf1NvJAz3RbLVozWWc98UYvDzAiIAxlVlS/Lqfe XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9w6aanj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:07:00 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DChn1k002456;
 Wed, 13 Jul 2022 13:07:00 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9w6aangs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:07:00 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DCoJ4v020020;
 Wed, 13 Jul 2022 13:06:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3h99s793qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26DD5NYj22544862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 13:05:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8790BAE053;
 Wed, 13 Jul 2022 13:06:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 797FAAE045;
 Wed, 13 Jul 2022 13:06:53 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 13:06:53 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH v2 07/11] linux header sync
Date: Wed, 13 Jul 2022 13:03:18 +0000
Message-Id: <20220713130322.25517-8-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713130322.25517-1-frankja@linux.ibm.com>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FETLNgqwLpeCM-YjRSqNfLGPPdarTBX-
X-Proofpoint-ORIG-GUID: CAtJ_AnHlvs10qUGqM1Pg4jkuEchChCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_01,2022-07-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207130053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 linux-headers/linux/kvm.h | 55 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 0d05d02ee4..ae5db2e44c 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1150,6 +1150,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_DISABLE_QUIRKS2 213
 /* #define KVM_CAP_VM_TSC_CONTROL 214 */
 #define KVM_CAP_SYSTEM_EVENT_DATA 215
+#define KVM_CAP_S390_PROTECTED_DUMP 217
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1651,6 +1652,55 @@ struct kvm_s390_pv_unp {
 	__u64 tweak;
 };
 
+enum pv_cmd_info_id {
+	KVM_PV_INFO_VM,
+	KVM_PV_INFO_DUMP,
+};
+
+struct kvm_s390_pv_info_dump {
+	__u64 dump_cpu_buffer_len;
+	__u64 dump_config_mem_buffer_per_1m;
+	__u64 dump_config_finalize_len;
+};
+
+struct kvm_s390_pv_info_vm {
+	__u64 inst_calls_list[4];
+	__u64 max_cpus;
+	__u64 max_guests;
+	__u64 max_guest_addr;
+	__u64 feature_indication;
+};
+
+struct kvm_s390_pv_info_header {
+	__u32 id;
+	__u32 len_max;
+	__u32 len_written;
+	__u32 reserved;
+};
+
+struct kvm_s390_pv_info {
+	struct kvm_s390_pv_info_header header;
+	union {
+		struct kvm_s390_pv_info_dump dump;
+		struct kvm_s390_pv_info_vm vm;
+	};
+};
+
+enum pv_cmd_dmp_id {
+        KVM_PV_DUMP_INIT,
+        KVM_PV_DUMP_CONFIG_STATE,
+        KVM_PV_DUMP_COMPLETE,
+        KVM_PV_DUMP_CPU,
+};
+
+struct kvm_s390_pv_dmp {
+        __u64 subcmd;
+        __u64 buff_addr;
+        __u64 buff_len;
+        __u64 gaddr;
+        __u64 reserved[4];
+};
+
 enum pv_cmd_id {
 	KVM_PV_ENABLE,
 	KVM_PV_DISABLE,
@@ -1659,6 +1709,8 @@ enum pv_cmd_id {
 	KVM_PV_VERIFY,
 	KVM_PV_PREP_RESET,
 	KVM_PV_UNSHARE_ALL,
+        KVM_PV_INFO,
+        KVM_PV_DUMP,
 };
 
 struct kvm_pv_cmd {
@@ -1733,6 +1785,7 @@ struct kvm_xen_vcpu_attr {
 #define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_DATA	0x4
 #define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST	0x5
 
+
 /* Secure Encrypted Virtualization command */
 enum sev_cmd_id {
 	/* Guest initialization commands */
@@ -2066,4 +2119,6 @@ struct kvm_stats_desc {
 /* Available with KVM_CAP_XSAVE2 */
 #define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
 
+#define KVM_S390_PV_CPU_COMMAND _IOWR(KVMIO, 0xd0, struct kvm_pv_cmd)
+
 #endif /* __LINUX_KVM_H */
-- 
2.34.1


