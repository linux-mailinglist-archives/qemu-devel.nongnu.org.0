Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDC42D4C2F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:49:33 +0100 (CET)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6Ox-0008Ig-Sn
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Aq-00009x-A3; Wed, 09 Dec 2020 15:34:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kn6Ah-0005mz-J7; Wed, 09 Dec 2020 15:34:56 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9KWw1a064185; Wed, 9 Dec 2020 15:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=+VOenNa/Ew2Ovbc52GSfSSssDjm1R7I105Vvzh13QSg=;
 b=SaC3LYR7A8xneIJZmHNdRFsJp/x0ELRIzUJOqjOIE/hkmbBSsxIX0VJMyPDBG1a7J23H
 K0HUjcbeD7CehS3w9NyfBv6mnrVOONS+IgcL3MK4EYj/uaj7aiK/0szAULRCfhx3448Y
 a+w5GW897BcZPXZgFTxebMC0H53mtoIVlPBZDTqrwvb3CaeypuGbaKr/7uNiSJRHDOKX
 67wiouQUNiXU3PHGkCrzSIAth/2WjaefWCB8Vj6qVEreKevIRUTu7hxdjcns6dDsNgO1
 xmAoTsTrYTAyxoG43AOvuk4xjZx0xvAVturan4qWgIB1UYQlzH1jReqgfhJ47fJd2eJZ Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b3gdkne7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:37 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9KYass073204;
 Wed, 9 Dec 2020 15:34:36 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35b3gdkndn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 15:34:36 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9KVqfl003371;
 Wed, 9 Dec 2020 20:34:35 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3581u9jare-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 20:34:35 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9KYZYg25559362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 20:34:35 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01C42124055;
 Wed,  9 Dec 2020 20:34:35 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 401E1124054;
 Wed,  9 Dec 2020 20:34:32 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 20:34:32 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [RFC 1/8] linux-headers: update against 5.10-rc7
Date: Wed,  9 Dec 2020 15:34:19 -0500
Message-Id: <1607546066-2240-2-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_16:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090140
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Placeholder commit to pull in changes from "vfio-pci/zdev: Pass the relaxed
alignment flag" and "vfio-pci/zdev: Introduce the PCISTB vfio region"

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 include/standard-headers/asm-x86/kvm_para.h        |  1 +
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h        |  2 +-
 include/standard-headers/linux/vhost_types.h       |  9 ++++++
 linux-headers/linux/vfio.h                         |  4 +++
 linux-headers/linux/vfio_zdev.h                    | 33 ++++++++++++++++++++++
 linux-headers/linux/vhost.h                        |  4 +++
 6 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/asm-x86/kvm_para.h b/include/standard-headers/asm-x86/kvm_para.h
index 07877d3..215d01b 100644
--- a/include/standard-headers/asm-x86/kvm_para.h
+++ b/include/standard-headers/asm-x86/kvm_para.h
@@ -32,6 +32,7 @@
 #define KVM_FEATURE_POLL_CONTROL	12
 #define KVM_FEATURE_PV_SCHED_YIELD	13
 #define KVM_FEATURE_ASYNC_PF_INT	14
+#define KVM_FEATURE_MSI_EXT_DEST_ID	15
 
 #define KVM_HINTS_REALTIME      0
 
diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
index 0a8c7c9..1677208 100644
--- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
+++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
@@ -176,7 +176,7 @@ struct pvrdma_port_attr {
 	uint8_t			subnet_timeout;
 	uint8_t			init_type_reply;
 	uint8_t			active_width;
-	uint16_t			active_speed;
+	uint8_t			active_speed;
 	uint8_t			phys_state;
 	uint8_t			reserved[2];
 };
diff --git a/include/standard-headers/linux/vhost_types.h b/include/standard-headers/linux/vhost_types.h
index 486630b..0bd2684 100644
--- a/include/standard-headers/linux/vhost_types.h
+++ b/include/standard-headers/linux/vhost_types.h
@@ -138,6 +138,15 @@ struct vhost_vdpa_config {
 	uint8_t buf[0];
 };
 
+/* vhost vdpa IOVA range
+ * @first: First address that can be mapped by vhost-vDPA
+ * @last: Last address that can be mapped by vhost-vDPA
+ */
+struct vhost_vdpa_iova_range {
+	uint64_t first;
+	uint64_t last;
+};
+
 /* Feature bits */
 /* Log all write descriptors. Can be changed while device is active. */
 #define VHOST_F_LOG_ALL 26
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index b92dcc4..703c20c 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -338,6 +338,10 @@ struct vfio_region_info_cap_type {
  * to do TLB invalidation on a GPU.
  */
 #define VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD	(1)
+/*
+ * IBM zPCI I/O region
+ */
+#define VFIO_REGION_SUBTYPE_IBM_ZPCI_IO		(2)
 
 /* sub-types for VFIO_REGION_TYPE_GFX */
 #define VFIO_REGION_SUBTYPE_GFX_EDID            (1)
diff --git a/linux-headers/linux/vfio_zdev.h b/linux-headers/linux/vfio_zdev.h
index b430939..22d3408 100644
--- a/linux-headers/linux/vfio_zdev.h
+++ b/linux-headers/linux/vfio_zdev.h
@@ -43,6 +43,7 @@ struct vfio_device_info_cap_zpci_group {
 	__u64 msi_addr;		/* MSI address */
 	__u64 flags;
 #define VFIO_DEVICE_INFO_ZPCI_FLAG_REFRESH 1 /* Program-specified TLB refresh */
+#define VFIO_DEVICE_INFO_ZPCI_FLAG_RELAXED 2 /* Relaxed Length and Alignment */
 	__u16 mui;		/* Measurement Block Update Interval */
 	__u16 noi;		/* Maximum number of MSIs */
 	__u16 maxstbl;		/* Maximum Store Block Length */
@@ -75,4 +76,36 @@ struct vfio_device_info_cap_zpci_pfip {
 	__u8 pfip[];
 };
 
+/**
+ * VFIO_REGION_SUBTYPE_IBM_ZPCI_IO - VFIO zPCI PCI Direct I/O Region
+ *
+ * This region is used to transfer I/O operations from the guest directly
+ * to the host zPCI I/O layer.
+ *
+ * The _hdr area is user-readable and is used to provide setup information.
+ * The _req area is user-writable and is used to provide the I/O operation.
+ */
+struct vfio_zpci_io_hdr {
+	__u64 flags;
+	__u16 max;		/* Max block operation size allowed */
+	__u16 reserved;
+	__u32 reserved2;
+};
+
+struct vfio_zpci_io_req {
+	__u64 flags;
+#define VFIO_ZPCI_IO_FLAG_READ (1 << 0) /* Read Operation Specified */
+#define VFIO_ZPCI_IO_FLAG_BLOCKW (1 << 1) /* Block Write Operation Specified */
+	__u64 gaddr;		/* Address of guest data */
+	__u64 offset;		/* Offset into target PCI Address Space */
+	__u32 reserved;
+	__u16 len;		/* Length of guest operation */
+	__u8 pcias;		/* Target PCI Address Space */
+	__u8 reserved2;
+};
+
+struct vfio_region_zpci_io {
+	struct vfio_zpci_io_hdr hdr;
+	struct vfio_zpci_io_req req;
+};
 #endif
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index 7523218..c998860 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -146,4 +146,8 @@
 
 /* Set event fd for config interrupt*/
 #define VHOST_VDPA_SET_CONFIG_CALL	_IOW(VHOST_VIRTIO, 0x77, int)
+
+/* Get the valid iova range */
+#define VHOST_VDPA_GET_IOVA_RANGE	_IOR(VHOST_VIRTIO, 0x78, \
+					     struct vhost_vdpa_iova_range)
 #endif
-- 
1.8.3.1


