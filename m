Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7C732ABD1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:51:08 +0100 (CET)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHBz1-00036y-5w
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwa-0001Mr-M4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5850
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwY-00084s-QU
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:36 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122Kiva0019704; Tue, 2 Mar 2021 15:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1FijDBwr/EkYnd5r4iVjvrLE8UHpNR8E6i0Rhewa7Rs=;
 b=nPEV3BLITGntiKJtJIBeLkJBpU2tE/iafk/E6MyGpCdI7/ZEFZOkqO0go1nU7GqhUt6I
 81bl1F/MW47NfaiV2y2IU4d0SvsSnq/a6f0eWkWfofnZmQ6bjh+Xcz2XtLxbYXUkPvqj
 KqURtmjeVM5s51Ar1GXfbXqzRKgWXvSyifYqWAW9Q88hRjk7bMfOYYJaIxiWZrDsSEIg
 fzHvbn9kA3E+3dKJYOa+NjQ5YQusGF9EGxpRJN+ZOCUv2x0pRwoFI00OZzH8HBaKM4GJ
 CSXa1pviayw39AjvvIsbdUhMq124RZmSK/Vdc6OOukag6uK44rqtnFH+GMVXRSIHFZ+i 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vnsr4mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:30 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122Kj3aU020951;
 Tue, 2 Mar 2021 15:48:30 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vnsr4mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:30 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KmRQP008408;
 Tue, 2 Mar 2021 20:48:29 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 36ydq988jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:29 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmSdw25755970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:28 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D4D128064;
 Tue,  2 Mar 2021 20:48:28 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CC6428059;
 Tue,  2 Mar 2021 20:48:28 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:28 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/26] linux-headers: Add definitions of KVM page
 encryption bitmap ioctls
Date: Tue,  2 Mar 2021 15:47:57 -0500
Message-Id: <20210302204822.81901-2-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Jon Grimm <jon.grimm@amd.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for two ioctls KVM_GET_PAGE_ENC_BITMAP and
KVM_SET_PAGE_ENC_BITMAP used to record the encryption state of each
guest page.

This patch will be replaced by a new implementation based on shared
regions list, or by user-space handling of the regions list.  However,
these changes do not affect the use of the page encryption indication in
confidential guest migration flow.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 linux-headers/linux/kvm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619..836c3776c0 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -532,6 +532,16 @@ struct kvm_dirty_log {
 	};
 };
 
+/* for KVM_GET_PAGE_ENC_BITMAP */
+struct kvm_page_enc_bitmap {
+	__u64 start_gfn;
+	__u64 num_pages;
+	union {
+		void *enc_bitmap; /* one bit per page */
+		__u64 padding2;
+	};
+};
+
 /* for KVM_CLEAR_DIRTY_LOG */
 struct kvm_clear_dirty_log {
 	__u32 slot;
@@ -1557,6 +1567,9 @@ struct kvm_pv_cmd {
 /* Available with KVM_CAP_S390_PROTECTED */
 #define KVM_S390_PV_COMMAND		_IOWR(KVMIO, 0xc5, struct kvm_pv_cmd)
 
+#define KVM_GET_PAGE_ENC_BITMAP	_IOW(KVMIO, 0xc6, struct kvm_page_enc_bitmap)
+#define KVM_SET_PAGE_ENC_BITMAP	_IOW(KVMIO, 0xc7, struct kvm_page_enc_bitmap)
+
 /* Available with KVM_CAP_X86_MSR_FILTER */
 #define KVM_X86_SET_MSR_FILTER	_IOW(KVMIO,  0xc6, struct kvm_msr_filter)
 
-- 
2.20.1


