Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC84662201C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:09:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbm-000515-E1; Tue, 08 Nov 2022 18:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbf-0004wV-Va
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbY-0003gj-Jr
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:11 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8MtnV9007240
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=qGJT0K9hw0PUQvW5p2jfXfMpbDkwHMpTJCiR52y1Ylg=;
 b=ccPXFz208iRdXW8K6dw2kKh0KHC48TkWZia74KddjsAZYEWrZto7UjMgPMt0XHIl9Ruy
 1sc4nBaF7E3ho2pmmvIGmtVT9Wt5PIoAsDQH4NuVdsyfRHZXHZcO5Qh9fQY2PfqgHPUN
 5PcsHscdmFiZoemjQkJHuNY4YFtlE515j/MyVIk8JcLhCkGz3OZHqlcSMITwt8RF647c
 r8yKddIrD4DFjt3R4RQEL4pqKJQ9zHadZgevmSF9r21OS7yaVkEq2uNW/68s91DgEX7K
 BdTvymzNmmd299meVd+g8DAe0Y1KKdt20exEzY1voL/ypo/GF5VFVLsX9e+sKegY5nTq OA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqyy18469-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:52 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6a004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:51 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-22
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:51 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 21/24] vfio-user: pci reset
Date: Tue,  8 Nov 2022 15:13:43 -0800
Message-Id: <04ef8f670f8f7b320831ef2f86479bcec403c0b2.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: pcwt2zYjTnyz9FAoul2PDC2uGWVPzI_0
X-Proofpoint-ORIG-GUID: pcwt2zYjTnyz9FAoul2PDC2uGWVPzI_0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Message to tell the server to reset the device.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c  | 15 +++++++++++++++
 hw/vfio/user.c | 12 ++++++++++++
 hw/vfio/user.h |  1 +
 3 files changed, 28 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 559b20d..005fcf8 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3829,6 +3829,20 @@ static void vfio_user_instance_finalize(Object *obj)
     }
 }
 
+static void vfio_user_pci_reset(DeviceState *dev)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_pci_pre_reset(vdev);
+
+    if (vbasedev->reset_works) {
+        vfio_user_reset(vbasedev->proxy);
+    }
+
+    vfio_pci_post_reset(vdev);
+}
+
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
@@ -3842,6 +3856,7 @@ static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
+    dc->reset = vfio_user_pci_reset;
     device_class_set_props(dc, vfio_user_pci_dev_properties);
     dc->desc = "VFIO over socket PCI device assignment";
     pdc->realize = vfio_user_pci_realize;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 56b3616..ddf9e13 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1580,6 +1580,18 @@ static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
     return ret;
 }
 
+void vfio_user_reset(VFIOProxy *proxy)
+{
+    VFIOUserHdr msg;
+
+    vfio_user_request_msg(&msg, VFIO_USER_DEVICE_RESET, sizeof(msg), 0);
+
+    vfio_user_send_wait(proxy, &msg, NULL, 0, false);
+    if (msg.flags & VFIO_USER_ERROR) {
+        error_printf("reset reply error %d\n", msg.error_reply);
+    }
+}
+
 
 /*
  * Socket-based io_ops
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 18e3112..d88ffe5 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -96,6 +96,7 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp);
 void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size);
 void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error);
 void vfio_user_putfds(VFIOUserMsg *msg);
+void vfio_user_reset(VFIOProxy *proxy);
 
 extern VFIODevIO vfio_dev_io_sock;
 extern VFIOContIO vfio_cont_io_sock;
-- 
1.8.3.1


