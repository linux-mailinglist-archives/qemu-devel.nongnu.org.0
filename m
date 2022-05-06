Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455551DC5A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 17:42:28 +0200 (CEST)
Received: from localhost ([::1]:49570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn067-0007eR-5S
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nn03u-0004uO-GI; Fri, 06 May 2022 11:40:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2938
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nn03s-0007C8-G7; Fri, 06 May 2022 11:40:10 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Fbb1X018421;
 Fri, 6 May 2022 15:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JBzCP4vGvPVNwM8P24dI3YmlEF7nT7M7QhyM4nD2tuo=;
 b=cq3yqRxpP1lan0TgmszCFXyTWqQZf06iL7naQqMWEfsUcsDAlJpExGBRqu7e5fv4v3m/
 b+UuxViBcMRJuYGJp5LjsGcp/rRVDPwtD7m/NcWFtGgdmjXE/02rm6jM6CtYVSvbno+h
 rTlVAJ/RIdNSbiDah8mStCUee92XK/A+mOtjKrkZd2jjS3i75Rka4IX6JqyAMNbrNPeo
 yhCAhyG+Yg1B98dkof3A0dRbYleVCvjPOf4p6pbehG8vSBB3LTfLehKTiAt9nbY1w01K
 WJHUIl6tmdEx/uWtXoELj4YDKeDrbd8JYDKbMgGrKBZEh9JI6KsKVacVqpD32b3lRY3T jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw5hssdm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:04 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246FdEmb027704;
 Fri, 6 May 2022 15:40:04 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw5hssdkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:04 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246FIHiI019229;
 Fri, 6 May 2022 15:40:02 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3fttcj4d87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 15:40:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 246FdxAG27394314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 15:39:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 354CD11C050;
 Fri,  6 May 2022 15:39:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D966311C054;
 Fri,  6 May 2022 15:39:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 15:39:58 +0000 (GMT)
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>
Cc: Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH 1/2] Pull in MEMOP changes in linux-headers
Date: Fri,  6 May 2022 17:39:55 +0200
Message-Id: <20220506153956.2217601-2-scgl@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506153956.2217601-1-scgl@linux.ibm.com>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: waXZC9DmtJpHhhfeboSCVvCYLCZ5xC-5
X-Proofpoint-ORIG-GUID: Tw2Zf-1eZLVhuQn5n7HzSquV4Mnm8N3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Since a full update of the linux headers pulls in changes in vfio.h that
break compilation, pull in only the required changes for storage key
support.

Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 linux-headers/linux/kvm.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index d232feaae9..3948ffaad9 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -562,9 +562,12 @@ struct kvm_s390_mem_op {
 	__u32 op;		/* type of operation */
 	__u64 buf;		/* buffer in userspace */
 	union {
-		__u8 ar;	/* the access register number */
+		struct {
+			__u8 ar;	/* the access register number */
+			__u8 key;	/* access key, ignored if flag unset */
+		};
 		__u32 sida_offset; /* offset into the sida */
-		__u8 reserved[32]; /* should be set to 0 */
+		__u8 reserved[32]; /* ignored */
 	};
 };
 /* types for kvm_s390_mem_op->op */
@@ -572,9 +575,12 @@ struct kvm_s390_mem_op {
 #define KVM_S390_MEMOP_LOGICAL_WRITE	1
 #define KVM_S390_MEMOP_SIDA_READ	2
 #define KVM_S390_MEMOP_SIDA_WRITE	3
+#define KVM_S390_MEMOP_ABSOLUTE_READ	4
+#define KVM_S390_MEMOP_ABSOLUTE_WRITE	5
 /* flags for kvm_s390_mem_op->flags */
 #define KVM_S390_MEMOP_F_CHECK_ONLY		(1ULL << 0)
 #define KVM_S390_MEMOP_F_INJECT_EXCEPTION	(1ULL << 1)
+#define KVM_S390_MEMOP_F_SKEY_PROTECTION	(1ULL << 2)
 
 /* for KVM_INTERRUPT */
 struct kvm_interrupt {
@@ -1134,6 +1140,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
 #define KVM_CAP_SYS_ATTRIBUTES 209
+#define KVM_CAP_S390_MEM_OP_EXTENSION 211
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.32.0


