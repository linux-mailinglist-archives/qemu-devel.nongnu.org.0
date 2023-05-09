Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A56FD1FE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 00:01:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwVNq-0004NU-6D; Tue, 09 May 2023 18:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwVNh-0004L9-6C
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwVNf-0003e7-5n
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683669621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CwClyvExvhUOcjO77Dya0a7V972SdH0wCG7mSU3dEQ8=;
 b=bh0XpjL2FvEAAPVEBG4dISr3jFyVU0rGJs6HDA3BAmxbG3GMkmUbUoQC2vKdqXf3jxpH5K
 373+nRgUYG5hsFEoIel+1U/Ylf2lbgPVgeUYu4gVvl2C9bVrLc71EBT/Qoy9vaar9QEXrz
 YT6sL1LiRmkTdZutaVkpqF4isW+IjJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-p_66oQo3PZipr3LCaqAdQQ-1; Tue, 09 May 2023 18:00:18 -0400
X-MC-Unique: p_66oQo3PZipr3LCaqAdQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17AEB886461;
 Tue,  9 May 2023 22:00:18 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.18.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 332462166B26;
 Tue,  9 May 2023 22:00:17 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Minwoo Im <minwoo.im@samsung.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 1/3] vfio/pci: add support for VF token
Date: Tue,  9 May 2023 15:59:21 -0600
Message-Id: <20230509215923.3186420-2-alex.williamson@redhat.com>
In-Reply-To: <20230509215923.3186420-1-alex.williamson@redhat.com>
References: <20230509215923.3186420-1-alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Minwoo Im <minwoo.im@samsung.com>

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
Link: https://lore.kernel.org/r/20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c | 13 ++++++++++++-
 hw/vfio/pci.h |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ec9a854361ac..cf27f28936cb 100644
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
index 177abcc8fb67..2674476d6c77 100644
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
2.39.2


