Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436FD3E43C9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:22:15 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2QA-0005re-CQ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mD2P6-00056t-K5
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:21:08 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mD2P2-0008Fq-IK
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:21:08 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GjsRd30zDz84MR;
 Mon,  9 Aug 2021 18:15:57 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 18:20:53 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 18:20:53 +0800
Subject: Re: [Question] Reduce the msix_load cost for VFIO device
To: Alex Williamson <alex.williamson@redhat.com>
References: <61e3fdd1-13a1-0675-b5c8-f7bfe3e6a042@huawei.com>
 <20210803081941.66cccf40.alex.williamson@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <cc406126-8411-04fa-b6ac-86031ca2c28d@huawei.com>
Date: Mon, 9 Aug 2021 18:20:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210803081941.66cccf40.alex.williamson@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

ÔÚ 2021/8/3 22:19, Alex Williamson Ð´µÀ:
> On Tue, 3 Aug 2021 16:43:07 +0800
> "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
> <longpeng2@huawei.com> wrote:
> 
>> Hi Alex,
>>
>> We found that the msix_load() will cost 40~50ms if the VF has 60+ interrupts,
>> the following code cost too much for each interrupt:
>>
>> msix_load:
>>   for (vector = 0; vector < 60; vector++)
>>     msix_handle_mask_update
>>       vfio_msix_vector_do_use
>>         vfio_add_kvm_msi_virq
>>           kvm_irqchip_add_msi_route
>>             kvm_irqchip_commit_routes <-- cost 0.8ms each time
>>
>> In irq remapping mode, the VF interrupts are not routed through KVM irqchip
> 
> I'm not sure what this means.  Your MSIX interrupts are going through
> QEMU anyway?  Why?
> 
>> in fact, so maybe we can reduce this cost by "x-no-kvm-msix=ture", right?
>> Are there any risks if we do in this way ?
> 
> You're obviously free to configure your device this way, but the
> expectation is that any sort of startup latency is more than offset by
> improved runtime latency through the KVM route.  This option is usually
> reserved for debugging, when we want to see all interaction with the
> device in QEMU.
> 
> If there's a case where we're not detecting that a KVM route is
> ineffective, then we should figure out how to detect that and skip this
> code, but again the expectation is that the KVM route is worthwhile.
> 
> If this is specifically about kvm_irqchip_commit_routes(), maybe the
> setup path needs a way to batch multiple routes and defer the commit,
> if that's possible.  Thanks,
> 

I've implemented two options and did some simple tests, both options can reduce
the vfio_msix_enable/msix_load cost, especially in HW live migration case, it
can significantly reduce the downtime if the VF has more than 60+ vectors.

Option-1 is "defer the commit": add a kvm virq without immediate commit, the
virq would be kept in kvm_state.irq_routes for the moment, and only commit once
at last. But it's not easy to fallback to QEMU route if someone fails.

Option-2 is "defer the setup": use QEMU route as default in migration resume
phase, try to switch to KVM route when the vector first firing. The first draft
of the code is as below, do you have any suggestion ?


diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8..5656f3a 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -347,6 +347,11 @@ static void vfio_msi_interrupt(void *opaque)
         get_msg = msix_get_message;
         notify = msix_notify;

+        if (vector->need_switch) {
+            vector->need_switch = false;
+            vfio_add_kvm_msix_virq(vdev, vector, nr);
+        }
+
         /* A masked vector firing needs to use the PBA, enable it */
         if (msix_is_masked(&vdev->pdev, nr)) {
             set_bit(nr, vdev->msix->pending);
@@ -438,6 +443,26 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev,
VFIOMSIVector *vector,
     vector->virq = virq;
 }

+static void
+vfio_add_kvm_msix_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector, int nr)
+{
+    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
+    Error *err = NULL;
+    int fd;
+
+    vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+    if (vector->virq < 0) {
+        return;
+    }
+
+    fd = event_notifier_get_fd(&vector->kvm_interrupt);
+    if (vfio_set_irq_signaling(&vdev->vbasedev,
+                               VFIO_PCI_MSIX_IRQ_INDEX, nr,
+                               VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
+        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
+    }
+}
+
 static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
 {
     kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
@@ -490,7 +515,11 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev,
unsigned int nr,
         }
     } else {
         if (msg) {
-            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            if (vdev->lazy_set_virq) {
+                vector->need_switch = true;
+            } else {
+                vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            }
         }
     }

@@ -566,6 +595,16 @@ static void vfio_msix_vector_release(PCIDevice *pdev,
unsigned int nr)
     }
 }

+static void vfio_msix_pre_enable(VFIOPCIDevice *vdev)
+{
+    vdev->lazy_set_virq = true;
+}
+
+static void vfio_msix_post_enable(VFIOPCIDevice *vdev)
+{
+    vdev->lazy_set_virq = false;
+}
+
 static void vfio_msix_enable(VFIOPCIDevice *vdev)
 {
     PCIDevice *pdev = &vdev->pdev;
@@ -2466,7 +2505,9 @@ static int vfio_pci_load_config(VFIODevice *vbasedev,
QEMUFile *f)
     if (msi_enabled(pdev)) {
         vfio_msi_enable(vdev);
     } else if (msix_enabled(pdev)) {
+        vfio_msix_pre_enable(vdev);
         vfio_msix_enable(vdev);
+        vfio_msix_post_enable(vdev);
     }

     return ret;
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 6477751..31390f2 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -95,6 +95,7 @@ typedef struct VFIOMSIVector {
     struct VFIOPCIDevice *vdev; /* back pointer to device */
     int virq;
     bool use;
+    bool need_switch; /* try to switch to KVM interrupt ? */
 } VFIOMSIVector;

 enum {
@@ -171,6 +172,7 @@ struct VFIOPCIDevice {
     bool no_kvm_ioeventfd;
     bool no_vfio_ioeventfd;
     bool enable_ramfb;
+    bool lazy_set_virq;
     VFIODisplay *dpy;
     Notifier irqchip_change_notifier;
 };



> Alex
> 
> .
> 

