Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782E3D11C8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:02:03 +0200 (CEST)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6DjV-0002CA-Qu
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6DhI-0000tm-LM
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6DhF-0002bm-0e
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626879580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Vthb0maNibPcjMQVPrXvj94z3wyHXs9XNLW6WKctlQ=;
 b=EKcXT4qyJegqK9hfr38zQYSnhRNISq8sCbYN7pwrPnlCOUsP4QlFg98A3Zamq5BWU0+XiO
 gXeXrN79J1SCW4TrrxZc2YUqaMRlMb9+cMN1mzgqLKS+V/mpWIxMxEyLZUb9OgafMLcxuN
 8ql0mtgendCcdHuca2chVmKl6yKYFho=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-hleEoCnWOU-Z7S9jw8GiTg-1; Wed, 21 Jul 2021 10:59:39 -0400
X-MC-Unique: hleEoCnWOU-Z7S9jw8GiTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 y6-20020a7bc1860000b0290227b53c7cefso672878wmi.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 07:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Vthb0maNibPcjMQVPrXvj94z3wyHXs9XNLW6WKctlQ=;
 b=mAWSSzV4VBDew28/pPnBYLdhfLuXX5qylt+hP/DxQBu+iaZCmhWZQRi6BDoYuLKWKb
 EAomIWgZ6cjM+b8+MGzAIRhvtmY6CdqSTjVjLTEsrld1mrkrWGFiTeOgX92JrbSYR3CB
 mWqEwsojpxnKb9bVHl5x5lpO3i7anLRnMgGwCGhNWj6wy+Sr6ppIc9QK+jq0YcWp2II3
 AJrUmYDUKhR6i1yyK+V1vM3NxZ4W0MVS23Ph+C+ZNgSZ8sTGr6pIkwP1E5/NHmd+q0fh
 LRxpIF7RfIMlOCpR1iprPGU3H1PK3ZnFWDsHY3EG+YEkp24gd6FzH8Mao4MVmsOf0qu1
 GL4g==
X-Gm-Message-State: AOAM532J0ZA28lGnzhbzByqXv5LFk5kiuUW1GmPGsST/mICSCQPICT+T
 GfaKsLtph6IVeIFYlEVDS5GGym3jHfzHumGvBKLBpYStwLMpkJ3OormTdV0afKrDIzy+DtWYuw3
 +FMlmhENmCgH8fNI=
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr4590432wmq.150.1626879576676; 
 Wed, 21 Jul 2021 07:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzV6Xc0qQLR/+4TQrkBr6fq3jHIRnz6kJ+LMqdT8/FRDtSrfJq5IupvrtPvl9T/QcPvQBjPw==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr4590406wmq.150.1626879576341; 
 Wed, 21 Jul 2021 07:59:36 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o5sm143197wms.43.2021.07.21.07.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 07:59:35 -0700 (PDT)
Date: Wed, 21 Jul 2021 16:59:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PULL v3 05/19] hw/acpi/ich9: Set ACPI PCI hot-plug as default
 on Q35
Message-ID: <20210721165934.2f81f3f3@redhat.com>
In-Reply-To: <73728485-d133-e629-46ee-2ca586b71de6@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
 <20210716151416.155127-6-mst@redhat.com>
 <f8de5dbc-ed4c-ba99-8981-583fa42961cb@redhat.com>
 <73728485-d133-e629-46ee-2ca586b71de6@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Julia Suvorova <jusual@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 14:56:06 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> On 20/07/2021 13:38, Laurent Vivier wrote:
> > On 16/07/2021 17:15, Michael S. Tsirkin wrote:  
> >> From: Julia Suvorova <jusual@redhat.com>
> >>
> >> Q35 has three different types of PCI devices hot-plug: PCIe Native,
> >> SHPC Native and ACPI hot-plug. This patch changes the default choice
> >> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> >> ability to use SHPC and PCIe Native for hot-plugged bridges.
> >>
> >> This is a list of the PCIe Native hot-plug issues that led to this
> >> change:
> >>     * no racy behavior during boot (see 110c477c2ed)
> >>     * no delay during deleting - after the actual power off software
> >>       must wait at least 1 second before indicating about it. This case
> >>       is quite important for users, it even has its own bug:
> >>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
> >>     * no timer-based behavior - in addition to the previous example,
> >>       the attention button has a 5-second waiting period, during which
> >>       the operation can be canceled with a second press. While this
> >>       looks fine for manual button control, automation will result in
> >>       the need to queue or drop events, and the software receiving
> >>       events in all sort of unspecified combinations of attention/power
> >>       indicator states, which is racy and uppredictable.
> >>     * fixes:
> >>         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
> >>         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
> >>
> >> To return to PCIe Native hot-plug:
> >>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> >>
> >> Known issue: older linux guests need the following flag
> >> to allow hotplugged pci express devices to use io:
> >>         -device pcie-root-port,io-reserve=4096.
> >> io is unusual for pci express so this seems minor.
> >> We'll fix this by a follow up patch.
> >>
> >> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> >> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >> Message-Id: <20210713004205.775386-6-jusual@redhat.com>
> >> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> >> ---
> >>  hw/acpi/ich9.c | 2 +-
> >>  hw/i386/pc.c   | 1 +
> >>  2 files changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> >> index 2f4eb453ac..778e27b659 100644
> >> --- a/hw/acpi/ich9.c
> >> +++ b/hw/acpi/ich9.c
> >> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >>      pm->disable_s3 = 0;
> >>      pm->disable_s4 = 0;
> >>      pm->s4_val = 2;
> >> -    pm->use_acpi_hotplug_bridge = false;
> >> +    pm->use_acpi_hotplug_bridge = true;
> >>  
> >>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> >>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index aa79c5e0e6..f4c7a78362 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_0[] = {
> >>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
> >>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> >>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
> >> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
> >>  };
> >>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
> >>  
> >>  
> > 
> > There is an issue with this patch.
> > 
> > When I try to unplug a VFIO device I have the following error and the device is not unplugged:
> > 
> > (qemu) device_del hostdev0
> > 
> > [   34.116714] ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND
> > (20201113/psargs-330)
> > [   34.117987] ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error
> > (AE_NOT_FOUND) (20201113/psparse-531)
> > [   34.119318] ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND)
> > (20201113/psparse-531)
> > [   34.120600] ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01]
> > (20201113/evgpe-515)
> > 
> > We can see device is not unplugged (03:00.0)
> > 
> > # lspci -v -s 03:00.0
> > 03:00.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
> > 	Subsystem: Intel Corporation Device 0000
> > 	Flags: bus master, fast devsel, latency 0
> > 	Memory at fe800000 (64-bit, prefetchable) [size=64K]
> > 	Memory at fe810000 (64-bit, prefetchable) [size=16K]
> > 	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
> > 	Capabilities: [a0] Express Endpoint, MSI 00
> > 	Capabilities: [100] Advanced Error Reporting
> > 	Capabilities: [1a0] Transaction Processing Hints
> > 	Capabilities: [1d0] Access Control Services
> > 	Kernel driver in use: iavf
> > 	Kernel modules: iavf
> > 
> > My guest kernel is from RHEL 8.5 (4.18.0-310.el8.x86_64) and my command line is:
> > 
> > $QEMU \
> > -L .../pc-bios \
> > -nodefaults \
> > -nographic \
> > -machine q35 \
> > -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
> > -device pcie-pci-bridge,id=pcie-pci-bridge-0,addr=0x0,bus=pcie-root-port-0  \
> > -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2 \
> > -device pcie-root-port,id=pcie-root-port-2,port=0x2,addr=0x1.0x2,bus=pcie.0,chassis=3 \
> > -device pcie-root-port,id=pcie-root-port-3,port=0x3,addr=0x1.0x3,bus=pcie.0,chassis=4 \
> > -device
> > pcie-root-port,id=pcie_extra_root_port_0,multifunction=on,bus=pcie.0,addr=0x3,chassis=5 \
> > -nodefaults \
> > -m 4066  \
> > -smp 4 \
> > -device virtio-scsi-pci,id=virtio_scsi_pci0,bus=pcie-root-port-2,addr=0x0 \
> > -blockdev
> > node-name=file_image1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=$IMAGE,cache.direct=on,cache.no-fl\
> > -blockdev
> > node-name=drive_image1,driver=qcow2,read-only=off,cache.direct=on,cache.no-flush=off,file=file_image1
> > \
> > -device scsi-hd,id=image1,drive=drive_image1,write-cache=on \
> > -enable-kvm \
> > -serial mon:stdio \
> > -device vfio-pci,host=04:02.0,bus=pcie-root-port-1,addr=0x0,id=hostdev0
> > 
> > PCI 04:02.0 is:
> > 
> > $ lspci -v -s 04:02.0
> > 04:02.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
> > 	Subsystem: Intel Corporation Device 0000
> > 	Flags: fast devsel, NUMA node 0, IOMMU group 53
> > 	Memory at 92400000 (64-bit, prefetchable) [virtual] [size=64K]
> > 	Memory at 92910000 (64-bit, prefetchable) [virtual] [size=16K]
> > 	Capabilities: <access denied>
> > 	Kernel driver in use: vfio-pci
> > 	Kernel modules: iavf
> > 
> > Any idea?  
> 
> It also happens with non-VFIO device like e1000e:
> 
> ...
> -device e1000e,bus=pcie-root-port-1,addr=0x0,id=hostdev0 \
                     ^^^^^^^^^^^^^
ACPI hotplug operates on slot level, so functions greater than 0 are not considered,
hence unexpected ACPI error. For above CLI, setting 'addr' on root-ports to dedicated slots
should fix issue.

The same will happen on PC machine if you assign bridge to any function other than 0.

Following should fix ACPI error:

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 17836149fe..e2345bd7d0 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -527,7 +527,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             QLIST_FOREACH(sec, &bus->child, sibling) {
                 int32_t devfn = sec->parent_dev->devfn;
 
-                if (pci_bus_is_root(sec)) {
+                if (pci_bus_is_root(sec) || PCI_FUNC(devfn)) {
                     continue;
                 }

but unplug request will stay ignored if root port/bridge is not on function 0.

> ...
> device_del hostdev0
> 
> [   40.275904] ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND
> (20201113/psargs-330)
> [   40.277189] ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error
> (AE_NOT_FOUND) (20201113/psparse-531)
> [   40.278529] ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND)
> (20201113/psparse-531)
> [   40.279819] ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01]
> (20201113/evgpe-515)
> 
> # lspci -v -s 03:00.0
> 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection
> 	Subsystem: Intel Corporation Device 0000
> 	Flags: bus master, fast devsel, latency 0, IRQ 21
> 	Memory at fdc40000 (32-bit, non-prefetchable) [size=128K]
> 	Memory at fdc60000 (32-bit, non-prefetchable) [size=128K]
> 	I/O ports at c000 [size=32]
> 	Memory at fdc80000 (32-bit, non-prefetchable) [size=16K]
> 	Expansion ROM at fdc00000 [disabled] [size=256K]
> 	Capabilities: [c8] Power Management version 2
> 	Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
> 	Capabilities: [e0] Express Endpoint, MSI 00
> 	Capabilities: [a0] MSI-X: Enable+ Count=5 Masked-
> 	Capabilities: [100] Advanced Error Reporting
> 	Capabilities: [140] Device Serial Number 52-54-00-ff-ff-12-34-56
> 	Kernel driver in use: e1000e
> 	Kernel modules: e1000e
> 
> Thanks,
> Laurent
> 


