Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9758FC1C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:23:43 +0200 (CEST)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7Dy-0007bg-HQ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73A-00040F-Qb; Thu, 11 Aug 2022 08:12:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM737-0008St-E8; Thu, 11 Aug 2022 08:12:32 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC8aPi000855;
 Thu, 11 Aug 2022 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BCKxo5hnXlHgHs8RuTNPsMcXA2toIdRtPsp7HWvCtHE=;
 b=lnf2UoQOEBEPm0ECUX9v/qq+6DAkzz8yTcRVI/j68GKzEHCX1xXHVzbwHFfj4FIUVSDR
 PG28fTcY6aLT4enyzy9Uud/q++NHht31o9JvtJRCzmmXNJgRFr2ASbK8HyK265BJZ7ek
 Qm/XMcDucDlMSJcrdOC8olfnOe0x5RCkH1aqeHPHgnZ8/oHvuK8/SSSbKOzu1Kx96tQg
 N234t6f0ZvliCTJWoo9XjZAu8dc3rgvrNQ3/5zohvpB6FXgNtfrQJXuLZmGqItGafG7X
 KZOMOLaXu2aHpmOUZWmOSr3LHhRUnrnWCvyfgyEK0n7GmHM8mGsugTens9ap7Sp2S9e6 aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw17sgn3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:25 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC9Z2O011035;
 Thu, 11 Aug 2022 12:12:24 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw17sgmyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC7JbR016607;
 Thu, 11 Aug 2022 12:12:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3huwvfsgmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCCHVG26149282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 627C4AE045;
 Thu, 11 Aug 2022 12:12:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FFDCAE053;
 Thu, 11 Aug 2022 12:12:16 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:16 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 14/18] DRAFT: linux header sync
Date: Thu, 11 Aug 2022 12:11:07 +0000
Message-Id: <20220811121111.9878-15-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: K97hY81D795x08Iqqx2Gu7rL_eFfLRK_
X-Proofpoint-GUID: YYBr4okK4ZUAwcSrLK8eJQRAdgk1m6_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110037
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

Add the uapi data for KVM_CAP_S390_PROTECTED_DUMP which I expect to be
added with 5.20.

Also add the missing NT_S390_RI_CB and the new NT_S390_PV_CPU_DATA elf
note types.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 include/elf.h             |  2 ++
 linux-headers/linux/kvm.h | 54 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 3a4bcb646a..94fdcfd8dc 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1649,6 +1649,8 @@ typedef struct elf64_shdr {
 #define NT_TASKSTRUCT	4
 #define NT_AUXV		6
 #define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */
+#define NT_S390_PV_CPU_DATA	0x30e	/* s390 protvirt cpu dump data */
+#define NT_S390_RI_CB	0x30d		/* s390 runtime instrumentation */
 #define NT_S390_GS_CB   0x30b           /* s390 guarded storage registers */
 #define NT_S390_VXRS_HIGH 0x30a         /* s390 vector registers 16-31 */
 #define NT_S390_VXRS_LOW  0x309         /* s390 vector registers 0-15 (lower half) */
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index f089349149..46133ef36c 100644
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
@@ -2067,4 +2119,6 @@ struct kvm_stats_desc {
 /* Available with KVM_CAP_XSAVE2 */
 #define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
 
+#define KVM_S390_PV_CPU_COMMAND _IOWR(KVMIO, 0xd0, struct kvm_pv_cmd)
+
 #endif /* __LINUX_KVM_H */
-- 
2.34.1


