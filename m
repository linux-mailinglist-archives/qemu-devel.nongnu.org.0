Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504E2BABA0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 15:07:46 +0100 (CET)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg74j-0007QT-MV
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 09:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kg73U-0006gR-6I; Fri, 20 Nov 2020 09:06:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kg73R-00070q-2U; Fri, 20 Nov 2020 09:06:27 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CcyxX75LKzLqMg;
 Fri, 20 Nov 2020 22:05:36 +0800 (CST)
Received: from [10.174.187.179] (10.174.187.179) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Nov 2020 22:05:50 +0800
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
Date: Fri, 20 Nov 2020 22:05:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201119104127.5e243efa@w520.home>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, dgilbert@redhat.com,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/20 1:41, Alex Williamson wrote:
> On Thu, 19 Nov 2020 14:13:24 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> On 11/14/2020 2:47 PM, Shenming Lu wrote:
>>> When running VFIO migration, I found that the restoring of VFIO PCI device’s
>>> config space is before VGIC on ARM64 target. But generally, interrupt controllers
>>> need to be restored before PCI devices.   
>>
>> Is there any other way by which VGIC can be restored before PCI device?

As far as I know, it seems to have to depend on priorities in the non-iterable process.

>>
>>> Besides, if a VFIO PCI device is
>>> configured to have directly-injected MSIs (VLPIs), the restoring of its config
>>> space will trigger the configuring of these VLPIs (in kernel), where it would
>>> return an error as I saw due to the dependency on kvm’s vgic.
>>>   
>>
>> Can this be fixed in kernel to re-initialize the kernel state?

Did you mean to reconfigure these VLPIs when restoring kvm's vgic?
But the fact is that this error is not caused by kernel, it is due to the incorrect
calling order of qemu...

>>
>>> To avoid this, we can move the saving of the config space from the iterable
>>> process to the non-iterable process, so that it will be called after VGIC
>>> according to their priorities.
>>>   
>>
>> With this change, at resume side, pre-copy phase data would reach 
>> destination without restored config space. VFIO device on destination 
>> might need it's config space setup and validated before it can accept 
>> further VFIO device specific migration state.
>>
>> This also changes bit-stream, so it would break migration with original 
>> migration patch-set.
> 
> Config space can continue to change while in pre-copy, if we're only
> sending config space at the initiation of pre-copy, how are any changes
> that might occur before the VM is stopped conveyed to the target?  For
> example the guest might reboot and a device returned to INTx mode from
> MSI during pre-copy.  Thanks,

What I see is that the config space is only saved once in save_live_complete_precopy
currently...
As you said, a VFIO device might need it's config space setup first, and
the config space can continue to change while in pre-copy, Did you mean we
have to migrate the config space in save_live_iterate?
However, I still have a little doubt about the restoring dependence between
the qemu emulated config space and the device data...

Besides, if we surely can't move the saving of the config space back, can we
just move some actions which are triggered by the restoring of the config space
back (such as vfio_msix_enable())?

The demo patch is as follows (but it seems that .save_state is not a appropriate
place to do it. -_-):

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 55261562d4..9cf0310148 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -44,6 +44,7 @@
 #define VFIO_MIG_FLAG_DEV_CONFIG_STATE  (0xffffffffef100002ULL)
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
+#define VFIO_MIG_FLAG_DEV_STATE_TRIGGER (0xffffffffef100005ULL)

 static int64_t bytes_transferred;

@@ -368,6 +369,15 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }

+static void vfio_device_state_trigger(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    if (vbasedev->ops && vbasedev->ops->vfio_trigger_config) {
+        vbasedev->ops->vfio_trigger_config(vbasedev);
+    }
+}
+
 static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -620,6 +630,13 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }

+static void vfio_save_state_trigger(QEMUFile *f, void *opaque)
+{
+    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_STATE_TRIGGER);
+
+    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+}
+
 static int vfio_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
@@ -700,6 +717,18 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             }
             break;
         }
+        case VFIO_MIG_FLAG_DEV_STATE_TRIGGER:
+        {
+            vfio_device_state_trigger(opaque);
+            data = qemu_get_be64(f);
+            if (data == VFIO_MIG_FLAG_END_OF_STATE) {
+                return ret;
+            } else {
+                error_report("%s: STATE TRIGGER: EOS not found 0x%"PRIx64,
+                             vbasedev->name, data);
+                return -EINVAL;
+            }
+        }
         default:
             error_report("%s: Unknown tag 0x%"PRIx64, vbasedev->name, data);
             return -EINVAL;
@@ -720,6 +749,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_state = vfio_save_state_trigger,
     .load_setup = vfio_load_setup,
     .load_cleanup = vfio_load_cleanup,
     .load_state = vfio_load_state,
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 58c0ce8971..4cd2feee92 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2441,13 +2441,19 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
     vfio_pci_write_config(pdev, PCI_COMMAND,
                           pci_get_word(pdev->config + PCI_COMMAND), 2);

+    return ret;
+}
+
+static void vfio_pci_trigger_config(VFIODevice *vbasedev)
+{
+    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
+    PCIDevice *pdev = &vdev->pdev;
+
     if (msi_enabled(pdev)) {
         vfio_msi_enable(vdev);
     } else if (msix_enabled(pdev)) {
         vfio_msix_enable(vdev);
     }
-
-    return ret;
 }

 static VFIODeviceOps vfio_pci_ops = {
@@ -2457,6 +2463,7 @@ static VFIODeviceOps vfio_pci_ops = {
     .vfio_get_object = vfio_pci_get_object,
     .vfio_save_config = vfio_pci_save_config,
     .vfio_load_config = vfio_pci_load_config,
+    .vfio_trigger_config = vfio_pci_trigger_config,
 };

 int vfio_populate_vga(VFIOPCIDevice *vdev, Error **errp)
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index baeb4dcff1..4680a3e8d0 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -138,6 +138,7 @@ struct VFIODeviceOps {
     Object *(*vfio_get_object)(VFIODevice *vdev);
     void (*vfio_save_config)(VFIODevice *vdev, QEMUFile *f);
     int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
+    void (*vfio_trigger_config)(VFIODevice *vdev);
 };

 typedef struct VFIOGroup {
-- 
2.19.1

