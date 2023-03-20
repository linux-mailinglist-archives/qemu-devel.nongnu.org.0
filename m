Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638F86C0B70
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 08:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peA3Q-0007AO-Ov; Mon, 20 Mar 2023 03:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1peA3O-0007A9-DF
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 03:35:38 -0400
Received: from mailout2.samsung.com ([203.254.224.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1peA3K-0007zQ-RH
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 03:35:37 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230320073523epoutp02eec36a5a6ea992fcb28541f211f3c875~OEGHxQs9p2314223142epoutp025
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:35:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230320073523epoutp02eec36a5a6ea992fcb28541f211f3c875~OEGHxQs9p2314223142epoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679297723;
 bh=JGKeM1Mn1Hj40xKJVAW27puWUKWqmIwMwN1izXYtWWM=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=Evqvv0cVqSQyphnRiHRU1XXa78It6utP4bTDmSK4NrO0RVPpZDDKr4LQMCYsMpVnM
 dtW68VB+GCqZt6T3y6vEELUpeZ5O/FXyfc2RFUgBwUq5x65IvEoJegt6VaZ75m4R9+
 UNWFFvhs0uDr+ilAxg1Dqy95B+Zf/2zrXvU79idI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230320073523epcas2p253d418f1ae0c934c35e29083d96ec9dc~OEGHhhVLV0124401244epcas2p24;
 Mon, 20 Mar 2023 07:35:23 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.101]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Pg62z1ZQBz4x9Pr; Mon, 20 Mar
 2023 07:35:23 +0000 (GMT)
X-AuditID: b6c32a46-4e1ff70000007a4b-38-64180cbb33f3
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C3.AE.31307.BBC08146; Mon, 20 Mar 2023 16:35:23 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] vfio/pci: add support for VF token
From: Minwoo Im <minwoo.im@samsung.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.williamson@redhat.com" <alex.williamson@redhat.com>, SSDR Gost Dev
 <gost.dev@samsung.com>, Klaus Birkelund Jensen <k.jensen@samsung.com>,
 Minwoo Im <minwoo.im@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
Date: Mon, 20 Mar 2023 16:35:22 +0900
X-CMS-MailID: 20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7bCmhe5uHokUg9lL2Sy+/e9hs7h5YCeT
 xcnGPawWz04fYLY43ruDxYHV48m1zUwe7/ddZfPo27KKMYA5KtsmIzUxJbVIITUvOT8lMy/d
 Vsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB2inkkJZYk4pUCggsbhYSd/Opii/tCRV
 ISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7o3vJEaaCPSIVh1/+ZGlgXCXQ
 xcjJISFgIrGoZz5bFyMXh5DADkaJi+t3snYxcnDwCghK/N0hDGIKCxhLXGgOADGFBOQlfrwy
 AOkUFtCUeLf7DCuIzSagLtEw9RULiC0CVH3s8BJmkInMAjsZJbpXXGaCWMUrMaP9KQuELS2x
 fflWRghbQ+LHsl5mCFtU4ubqt+ww9vtj86FqRCRa752FqhGUePBzN1RcSmL//LlQdrVEw/Fn
 ULsqJH69fwBVby7x+/5usEN5BXwlnr+YDlbPIqAq0b5iOdQuF4mZ7b1gtzED/bj97RxmkH+Z
 gZ5cv0sfxJQQUJY4cguqgk+i4/Bfdpivdsx7ArVVWeLjoUNQWyUlll96zQZhe0hMvXwWbKuQ
 QKDEzqnL2CcwKsxCBPMsJHtnIexdwMi8ilEstaA4Nz212KjACB6zyfm5mxjBaU/LbQfjlLcf
 9A4xMnEwHmKU4GBWEuF1Y5ZIEeJNSaysSi3Kjy8qzUktPsRoCvTxRGYp0eR8YOLNK4k3NLE0
 MDEzMzQ3MjUwVxLnlbY9mSwkkJ5YkpqdmlqQWgTTx8TBKdXAlPgjat0V9wj5843ZZxRKQuVb
 rwgUBa6d+GyDfNHWk4aTd3rofBBJ52ZriNixZX/A5FPuAi8fCx+wmvl9/cvV09qdDK2dPqhF
 royKkImT1dF6suvWkqmH5D7IrLf5/8f0y3xpdVfxl/zOS3l+Oy29GlOwxOtqt75IrOz8+MWL
 C3aVSW84eVxrmqvGd6eFz/xzTzxbG7O4oYL7hfUJaZsvV87Ne/K/6ZCJl6K3xMLV53KunAqL
 /3l06VauewfVtA2PfPh7yWyjx6WD8v80b4V8usPhI/qu/PLGKxelL12ucPtQusT6Q4PdDP9g
 6WfKpzlz6/nUIt8KrdY32aBxZMo7gVUTtka5rJzAkTNpppi1rYYSS3FGoqEWc1FxIgDzAPvu
 BAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780
References: <CGME20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=minwoo.im@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-To: minwoo.im@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VF token was introduced [1] to kernel vfio-pci along with SR-IOV
support [2].  This patch adds support VF token among PF and VF(s). To
passthu PCIe VF to a VM, kernel >= v5.7 needs this.

It can be configured with UUID like:

  -device vfio-pci,host=DDDD:BB:DD:F,vf-token=<uuid>,...

[1] https://lore.kernel.org/linux-pci/158396393244.5601.10297430724964025753.stgit@gimli.home/
[2] https://lore.kernel.org/linux-pci/158396044753.5601.14804870681174789709.stgit@gimli.home/

Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/vfio/pci.c | 13 ++++++++++++-
 hw/vfio/pci.h |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ec9a854361..cf27f28936 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2856,6 +2856,8 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     int groupid;
     int i, ret;
     bool is_mdev;
+    char uuid[UUID_FMT_LEN];
+    char *name;
 
     if (!vbasedev->sysfsdev) {
         if (!(~vdev->host.domain || ~vdev->host.bus ||
@@ -2936,7 +2938,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
-    ret = vfio_get_device(group, vbasedev->name, vbasedev, errp);
+    if (!qemu_uuid_is_null(&vdev->vf_token)) {
+        qemu_uuid_unparse(&vdev->vf_token, uuid);
+        name = g_strdup_printf("%s vf_token=%s", vbasedev->name, uuid);
+    } else {
+        name = vbasedev->name;
+    }
+
+    ret = vfio_get_device(group, name, vbasedev, errp);
+    g_free(name);
     if (ret) {
         vfio_put_group(group);
         goto error;
@@ -3268,6 +3278,7 @@ static void vfio_instance_init(Object *obj)
 
 static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
+    DEFINE_PROP_UUID_NODEFAULT("vf-token", VFIOPCIDevice, vf_token),
     DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
     DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
                             vbasedev.pre_copy_dirty_page_tracking,
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 177abcc8fb..2674476d6c 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -137,6 +137,7 @@ struct VFIOPCIDevice {
     VFIOVGA *vga; /* 0xa0000, 0x3b0, 0x3c0 */
     void *igd_opregion;
     PCIHostDeviceAddress host;
+    QemuUUID vf_token;
     EventNotifier err_notifier;
     EventNotifier req_notifier;
     int (*resetfn)(struct VFIOPCIDevice *);
-- 
2.34.1


