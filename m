Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31974EAE20
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:06:17 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBY8-0001u0-Lm
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:06:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1nZ9dU-0001t6-FX
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:03:41 -0400
Received: from [2a00:1450:4864:20::32b] (port=55260
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1nZ9dL-0005LJ-Td
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:03:34 -0400
Received: by mail-wm1-x32b.google.com with SMTP id r64so10044936wmr.4
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uwqzZ08WU8lx/IIQ7GU944+Hw852Wp++1nffUTAky2w=;
 b=k2jLjaMbMKnrucOCOK9WLhJAYKjKbKQf+M1FkUxBEUIO/YT2jV2n1mg+DeShxVE/vG
 W3swq8QwTs1jk8T9Ve6tzamxnFChCYC9RjHENXWziizRr1OLQ7EZohC17waMTZcL73ed
 L9KB2K4eSBE0sDzAqamuUepgN2qImp1dtcrk99HNqTUEK5MSogWpYEC1sFhU6yDKdjMW
 TOA6rYvcGTEtajHtDn+ccy3wk1RCQ5SR7Ju4sIyFPYQupWgfqy/feQDKveUo7L8OYizi
 +dKQCXHx2BndYr+caoiHPsHXEJKuqlCaN8XTBM9zaAyk/BX8rshXl1d5Ep1MV0F2esDf
 FpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uwqzZ08WU8lx/IIQ7GU944+Hw852Wp++1nffUTAky2w=;
 b=e5bnsxM8bVRtRs7Lv4KbKep0ktdA83T53TZyTe0ab6v7jVOXNXxCM3BilCPNI/Hhhh
 bXWPtcCraNv0omuXq4ol5Pb5BCWly7veHjROselkwB+kgA//JnF/FEmch82d1ZNMnfgF
 kVfq9sp4g0uHGS1LnRjbC0R72q7GkD5TQDCLA9Nduoflpa5cOUSkZ+iUfv7fE0KyQ3Me
 aQNvcLbMGZHh6ot8ukq1/4HNgvjlj1EgiNowT7QDhd4ibx+iaIO1cQK6YnoJYjgeybrG
 KSbSCNeTjjy7XJGobo+ymJS5I/50mOJCfoycpMXgL/zDzOa5Jl3BCQH+DN6YMZoZHemC
 lgVw==
X-Gm-Message-State: AOAM533v8OdNoEDHE9NWqd9xKXEQWU8w9hnjFqen6GEzh4YEi0P9qGEQ
 FMs5zO9pkaUglZfuoQxiJANZgQ==
X-Google-Smtp-Source: ABdhPJxRtPzRkRQ+W2NuZuqo83PEa4S4Hu6TkGPD5KNOCtyQN0dXmfTSTLmJa/BT5XS5Z0N8keGyRA==
X-Received: by 2002:a7b:ce1a:0:b0:38c:eb9c:d522 with SMTP id
 m26-20020a7bce1a000000b0038ceb9cd522mr6042046wmc.113.1648551807494; 
 Tue, 29 Mar 2022 04:03:27 -0700 (PDT)
Received: from localhost ([91.110.139.125]) by smtp.gmail.com with ESMTPSA id
 b8-20020a05600c4e0800b0038c6c37efc3sm1946642wmq.12.2022.03.29.04.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:03:27 -0700 (PDT)
From: Fam Zheng <fam.zheng@bytedance.com>
X-Google-Original-From: Fam Zheng <fam@euphon.net>
Date: Tue, 29 Mar 2022 12:03:26 +0100
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V6 21/27] vfio-pci: cpr part 3 (intx)
Message-ID: <20220329110326.GA447081@fam-dell>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-22-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628286241-217457-22-git-send-email-steven.sistare@oracle.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=fam.zheng@bytedance.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Mar 2022 09:00:23 -0400
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-08-06 14:43, Steve Sistare wrote:
> Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
> follows:
>   pin : Recover this from the vfio config in kernel space
>   interrupt : Preserve its eventfd descriptor across exec.
>   unmask : Ditto
>   route.irq : This could perhaps be recovered in vfio_pci_post_load by
>     calling pci_device_route_intx_to_irq(pin), whose implementation reads
>     config space for a bridge device such as ich9.  However, there is no
>     guarantee that the bridge vmstate is read before vfio vmstate.  Rather
>     than fiddling with MigrationPriority for vmstate handlers, explicitly
>     save route.irq in vfio vmstate.
>   pending : save in vfio vmstate.
>   mmap_timeout, mmap_timer : Re-initialize
>   bool kvm_accel : Re-initialize
> 
> In vfio_realize, defer calling vfio_intx_enable until the vmstate
> is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
> vfio_intx_kvm_enable to skip vfio initialization, but still perform
> kvm initialization.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>

Hi Steve,

Not directly related to this patch, but since the context is close: it looks
like this series only takes care of exec restart mode of vfio-pci, have you had
any thoughts on kexec reboot mode with vfio-pci?

The general idea is if DMAR context is not lost during kexec, we should be able
to set up irqfds again and things will just work?

Fam

--

PS some more info below:

I have some local kernel patches to kexec reboot most part of the host kernel
while keeping IOMMU DMAR tables in a valid state; with that, not many extra
things are needed in addition to restore it. A PoC is like below (I can share
more details of the kernel changes if this patch makes any sense):


commit f8951e58be86bd6e37f816394a9a73f28d8059fc
Author: Fam Zheng <fam.zheng@bytedance.com>
Date:   Mon Mar 21 13:19:49 2022 +0000

    cpr: Add live-update support to vfio-pci devices
    
    In cpr-save, always serialize the vfio-pci states.
    
    In cpr-load, add a '-restore' mode that will do
    VFIO_GROUP_GET_DEVICE_FD_INTACT and skip DMAR setup, somewhat similar to
    the current cpr exec mode.
    
    Signed-off-by: Fam Zheng <fam.zheng@bytedance.com>

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 73f4259556..e36f0ef97d 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -584,10 +584,15 @@ void msix_init_vector_notifiers(PCIDevice *dev,
                                 MSIVectorReleaseNotifier release_notifier,
                                 MSIVectorPollNotifier poll_notifier)
 {
+    int vector;
+
     assert(use_notifier && release_notifier);
     dev->msix_vector_use_notifier = use_notifier;
     dev->msix_vector_release_notifier = release_notifier;
     dev->msix_vector_poll_notifier = poll_notifier;
+    for (vector = 0; vector < dev->msix_entries_nr; ++vector) {
+        msix_handle_mask_update(dev, vector, true);
+    }
 }
 
 int msix_set_vector_notifiers(PCIDevice *dev,
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 605ffbb5d0..f1240410a8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2066,6 +2066,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     bool reused;
     VFIOAddressSpace *space;
 
+    if (restore) {
+        return 0;
+    }
     space = vfio_get_address_space(as);
     fd = cpr_find_fd("vfio_container_for_group", group->groupid);
     reused = (fd > 0);
@@ -2486,7 +2489,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     fd = cpr_find_fd(name, 0);
     reused = (fd >= 0);
     if (!reused) {
-        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
+        int op = restore ? VFIO_GROUP_GET_DEVICE_FD_INTACT : VFIO_GROUP_GET_DEVICE_FD;
+        fd = ioctl(group->fd, op, name);
     }
 
     if (fd < 0) {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e32513c668..9da5f93228 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -361,7 +361,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
      * Do not alter interrupt state during vfio_realize and cpr-load.  The
      * reused flag is cleared thereafter.
      */
-    if (!vdev->pdev.reused) {
+    if (!vdev->pdev.reused && !restore) {
         vfio_disable_interrupts(vdev);
     }
 
@@ -388,7 +388,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
     qemu_set_fd_handler(fd, vfio_intx_interrupt, NULL, vdev);
 
-    if (vdev->pdev.reused) {
+    if (vdev->pdev.reused && !restore) {
         vfio_intx_reenable_kvm(vdev, &err);
         goto finish;
     }
@@ -2326,6 +2326,9 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
     int ret, i, count;
     bool multi = false;
 
+    if (restore) {
+        return 0;
+    }
     trace_vfio_pci_hot_reset(vdev->vbasedev.name, single ? "one" : "multi");
 
     if (!single) {
@@ -3185,7 +3188,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
 
         /* Wait until cpr-load reads intx routing data to enable */
-        if (!pdev->reused) {
+        if (!pdev->reused && !restore) {
             ret = vfio_intx_enable(vdev, errp);
             if (ret) {
                 goto out_deregister;
@@ -3295,7 +3298,7 @@ static void vfio_pci_reset(DeviceState *dev)
     VFIOPCIDevice *vdev = VFIO_PCI(dev);
 
     /* Do not reset the device during qemu_system_reset prior to cpr-load */
-    if (vdev->pdev.reused) {
+    if (vdev->pdev.reused || restore) {
         return;
     }
 
@@ -3429,33 +3432,40 @@ static void vfio_merge_config(VFIOPCIDevice *vdev)
 
 static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
 {
-    int i, fd;
+    int i, fd, ret;
     bool pending = false;
     PCIDevice *pdev = &vdev->pdev;
 
+    pdev->msix_entries_nr = nr_vectors;
     vdev->nr_vectors = nr_vectors;
     vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
     vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
 
-    for (i = 0; i < nr_vectors; i++) {
-        VFIOMSIVector *vector = &vdev->msi_vectors[i];
-
-        fd = load_event_fd(vdev, "interrupt", i);
-        if (fd >= 0) {
-            vfio_vector_init(vdev, i);
-            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+    if (restore) {
+        ret = vfio_enable_vectors(vdev, true);
+        if (ret) {
+            error_report("vfio: failed to enable vectors, %d", ret);
         }
+    } else {
+        for (i = 0; i < nr_vectors; i++) {
+            VFIOMSIVector *vector = &vdev->msi_vectors[i];
 
-        if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
-            vfio_add_kvm_msi_virq(vdev, vector, i, msix);
-        }
+            fd = load_event_fd(vdev, "interrupt", i);
+            if (fd >= 0) {
+                vfio_vector_init(vdev, i);
+                qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+            }
 
-        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
-            set_bit(i, vdev->msix->pending);
-            pending = true;
+            if (load_event_fd(vdev, "kvm_interrupt", i) >= 0) {
+                vfio_add_kvm_msi_virq(vdev, vector, i, msix);
+            }
+
+            if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
+                set_bit(i, vdev->msix->pending);
+                pending = true;
+            }
         }
     }
-
     if (msix) {
         memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
     }
@@ -3534,7 +3544,7 @@ static const VMStateDescription vfio_intx_vmstate = {
 
 static bool vfio_pci_needed(void *opaque)
 {
-    return cpr_get_mode() == CPR_MODE_RESTART;
+    return 1;
 }
 
 static const VMStateDescription vfio_pci_vmstate = {
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 6241c20fb1..0179b0aa90 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -26,6 +26,7 @@ void configure_rtc(QemuOpts *opts);
 void qemu_init_subsystems(void);
 
 extern int autostart;
+extern int restore;
 
 typedef enum {
     VGA_NONE, VGA_STD, VGA_CIRRUS, VGA_VMWARE, VGA_XENFB, VGA_QXL,
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index e680594f27..65c3bab074 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -188,6 +188,8 @@ struct vfio_group_status {
  */
 #define VFIO_GROUP_GET_DEVICE_FD	_IO(VFIO_TYPE, VFIO_BASE + 6)
 
+#define VFIO_GROUP_GET_DEVICE_FD_INTACT	_IO(VFIO_TYPE, VFIO_BASE + 21)
+
 /* --------------- IOCTLs for DEVICE file descriptors --------------- */
 
 /**
diff --git a/qemu-options.hx b/qemu-options.hx
index 8b90d04cb9..03666a59b3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3984,6 +3984,10 @@ SRST
     option is experimental.
 ERST
 
+DEF("restore", 0, QEMU_OPTION_restore, \
+    "-restore              restore mode",
+    QEMU_ARCH_ALL)
+
 DEF("S", 0, QEMU_OPTION_S, \
     "-S              freeze CPU at startup (use 'c' to start execution)\n",
     QEMU_ARCH_ALL)
diff --git a/softmmu/globals.c b/softmmu/globals.c
index a18fd8dcf3..6fcb5846b4 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -41,6 +41,7 @@ bool enable_cpu_pm;
 int nb_nics;
 NICInfo nd_table[MAX_NICS];
 int autostart = 1;
+int restore;
 int vga_interface_type = VGA_NONE;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index f14e29e622..fba6b577cb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3088,6 +3088,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_S:
                 autostart = 0;
                 break;
+            case QEMU_OPTION_restore:
+                restore = 1;
+                break;
             case QEMU_OPTION_k:
                 keyboard_layout = optarg;
                 break;

