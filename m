Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A63D1367
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:11:15 +0200 (CEST)
Received: from localhost ([::1]:52086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EoU-0001m2-Tm
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6EmY-0007W5-Kn
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:09:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6EmU-0007n4-Va
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626883749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sfaNiKYIO8qCkKwzPhJaRW7eGrRYJtV2WuqG+TEjiwk=;
 b=WdZGWvKZs+vW8f/FUJYnN8fOO7pxPdGGPCAcJoVvQOD0VP1BqRtdyi600EaNyDPEBl4Y/C
 kZLv2fvyQXcKeJB7rusc3I8PMq4HqdMdlHm1s9HAVcD1sx1b6Ow5xGkNY6No3NsVKsNJCg
 KP6Hl3PNne7UzCCSLsngY6nJ/se5DNU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-IRYuzYpfNX-6424zZkfL8w-1; Wed, 21 Jul 2021 12:09:08 -0400
X-MC-Unique: IRYuzYpfNX-6424zZkfL8w-1
Received: by mail-ej1-f70.google.com with SMTP id
 sd15-20020a170906ce2fb0290512261c5475so971061ejb.13
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sfaNiKYIO8qCkKwzPhJaRW7eGrRYJtV2WuqG+TEjiwk=;
 b=RAk+lnhtqpdnWCgYm4T43r9uFFFXFjXB4YfL23Cm6BPpfVddWOF4N9ZAHPc7qJuCyl
 jkSmk/lVQOXDbTgca2lIPXXHF6qDfMmdcQIwZ2N74B2GwYkV2hFHEOR4SD9Q/XL4uxHn
 uWZLc5jKBErGmqQAh+tyFCUDOLpnK080qeatp5EUYf5F6DOWO7KuDujWwyPkorTeSkW+
 4R+iSZGbDd/KcHumbaJw4NFrq7DpdX3M7k1egvYHX+c9AsT34eJyiduWOJCf72aRKYu4
 Irl6a9dbeuKoSjtO3GHUMbxwgS8ov0gE1HHXGBFfqmFypI0g1m+qB1FTqVBgbFDY/Jrs
 KzAA==
X-Gm-Message-State: AOAM531s9JIcIduEjt9yOSEKvnkAmE5xx32mIJWKoenQlbFvpbk9Y9oi
 sYSklMWuXqKzCXC/ChRWDAGy0n05K71hIyTTN5EI9g+sSy+Mej46AMU5Z8ZnlB45cxa+0nhoTTh
 BiOm9dYjACwR/Zzc=
X-Received: by 2002:a17:906:8683:: with SMTP id
 g3mr40433239ejx.126.1626883746252; 
 Wed, 21 Jul 2021 09:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwXO3NKccfd42i1thH4S00b1DdJRW+Y34ST9TNjRqrBZUlzmkzC/GqS6Wn/YYJI6SQapGQAw==
X-Received: by 2002:a17:906:8683:: with SMTP id
 g3mr40433197ejx.126.1626883745973; 
 Wed, 21 Jul 2021 09:09:05 -0700 (PDT)
Received: from redhat.com ([2.55.134.65])
 by smtp.gmail.com with ESMTPSA id f22sm10919111edr.16.2021.07.21.09.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 09:09:05 -0700 (PDT)
Date: Wed, 21 Jul 2021 12:09:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PULL v3 05/19] hw/acpi/ich9: Set ACPI PCI hot-plug as default
 on Q35
Message-ID: <20210721120659-mutt-send-email-mst@kernel.org>
References: <20210716151416.155127-1-mst@redhat.com>
 <20210716151416.155127-6-mst@redhat.com>
 <f8de5dbc-ed4c-ba99-8981-583fa42961cb@redhat.com>
 <73728485-d133-e629-46ee-2ca586b71de6@redhat.com>
 <20210721165934.2f81f3f3@redhat.com>
 <4f90fcaa-581e-40b9-8f57-ad6c92bd98b2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4f90fcaa-581e-40b9-8f57-ad6c92bd98b2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
 Eduardo Habkost <ehabkost@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 05:49:16PM +0200, Laurent Vivier wrote:
> On 21/07/2021 16:59, Igor Mammedov wrote:
> > On Tue, 20 Jul 2021 14:56:06 +0200
> > Laurent Vivier <lvivier@redhat.com> wrote:
> > 
> >> On 20/07/2021 13:38, Laurent Vivier wrote:
> >>> On 16/07/2021 17:15, Michael S. Tsirkin wrote:  
> >>>> From: Julia Suvorova <jusual@redhat.com>
> >>>>
> >>>> Q35 has three different types of PCI devices hot-plug: PCIe Native,
> >>>> SHPC Native and ACPI hot-plug. This patch changes the default choice
> >>>> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
> >>>> ability to use SHPC and PCIe Native for hot-plugged bridges.
> >>>>
> >>>> This is a list of the PCIe Native hot-plug issues that led to this
> >>>> change:
> >>>>     * no racy behavior during boot (see 110c477c2ed)
> >>>>     * no delay during deleting - after the actual power off software
> >>>>       must wait at least 1 second before indicating about it. This case
> >>>>       is quite important for users, it even has its own bug:
> >>>>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
> >>>>     * no timer-based behavior - in addition to the previous example,
> >>>>       the attention button has a 5-second waiting period, during which
> >>>>       the operation can be canceled with a second press. While this
> >>>>       looks fine for manual button control, automation will result in
> >>>>       the need to queue or drop events, and the software receiving
> >>>>       events in all sort of unspecified combinations of attention/power
> >>>>       indicator states, which is racy and uppredictable.
> >>>>     * fixes:
> >>>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
> >>>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
> >>>>
> >>>> To return to PCIe Native hot-plug:
> >>>>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> >>>>
> >>>> Known issue: older linux guests need the following flag
> >>>> to allow hotplugged pci express devices to use io:
> >>>>         -device pcie-root-port,io-reserve=4096.
> >>>> io is unusual for pci express so this seems minor.
> >>>> We'll fix this by a follow up patch.
> >>>>
> >>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> >>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >>>> Message-Id: <20210713004205.775386-6-jusual@redhat.com>
> >>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> >>>> ---
> >>>>  hw/acpi/ich9.c | 2 +-
> >>>>  hw/i386/pc.c   | 1 +
> >>>>  2 files changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> >>>> index 2f4eb453ac..778e27b659 100644
> >>>> --- a/hw/acpi/ich9.c
> >>>> +++ b/hw/acpi/ich9.c
> >>>> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >>>>      pm->disable_s3 = 0;
> >>>>      pm->disable_s4 = 0;
> >>>>      pm->s4_val = 2;
> >>>> -    pm->use_acpi_hotplug_bridge = false;
> >>>> +    pm->use_acpi_hotplug_bridge = true;
> >>>>  
> >>>>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
> >>>>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> >>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >>>> index aa79c5e0e6..f4c7a78362 100644
> >>>> --- a/hw/i386/pc.c
> >>>> +++ b/hw/i386/pc.c
> >>>> @@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_0[] = {
> >>>>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
> >>>>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
> >>>>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
> >>>> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
> >>>>  };
> >>>>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
> >>>>  
> >>>>  
> >>>
> >>> There is an issue with this patch.
> >>>
> >>> When I try to unplug a VFIO device I have the following error and the device is not unplugged:
> >>>
> >>> (qemu) device_del hostdev0
> >>>
> >>> [   34.116714] ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND
> >>> (20201113/psargs-330)
> >>> [   34.117987] ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error
> >>> (AE_NOT_FOUND) (20201113/psparse-531)
> >>> [   34.119318] ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND)
> >>> (20201113/psparse-531)
> >>> [   34.120600] ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01]
> >>> (20201113/evgpe-515)
> >>>
> >>> We can see device is not unplugged (03:00.0)
> >>>
> >>> # lspci -v -s 03:00.0
> >>> 03:00.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
> >>> 	Subsystem: Intel Corporation Device 0000
> >>> 	Flags: bus master, fast devsel, latency 0
> >>> 	Memory at fe800000 (64-bit, prefetchable) [size=64K]
> >>> 	Memory at fe810000 (64-bit, prefetchable) [size=16K]
> >>> 	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
> >>> 	Capabilities: [a0] Express Endpoint, MSI 00
> >>> 	Capabilities: [100] Advanced Error Reporting
> >>> 	Capabilities: [1a0] Transaction Processing Hints
> >>> 	Capabilities: [1d0] Access Control Services
> >>> 	Kernel driver in use: iavf
> >>> 	Kernel modules: iavf
> >>>
> >>> My guest kernel is from RHEL 8.5 (4.18.0-310.el8.x86_64) and my command line is:
> >>>
> >>> $QEMU \
> >>> -L .../pc-bios \
> >>> -nodefaults \
> >>> -nographic \
> >>> -machine q35 \
> >>> -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
> >>> -device pcie-pci-bridge,id=pcie-pci-bridge-0,addr=0x0,bus=pcie-root-port-0  \
> >>> -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2 \
> >>> -device pcie-root-port,id=pcie-root-port-2,port=0x2,addr=0x1.0x2,bus=pcie.0,chassis=3 \
> >>> -device pcie-root-port,id=pcie-root-port-3,port=0x3,addr=0x1.0x3,bus=pcie.0,chassis=4 \
> >>> -device
> >>> pcie-root-port,id=pcie_extra_root_port_0,multifunction=on,bus=pcie.0,addr=0x3,chassis=5 \
> >>> -nodefaults \
> >>> -m 4066  \
> >>> -smp 4 \
> >>> -device virtio-scsi-pci,id=virtio_scsi_pci0,bus=pcie-root-port-2,addr=0x0 \
> >>> -blockdev
> >>> node-name=file_image1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=$IMAGE,cache.direct=on,cache.no-fl\
> >>> -blockdev
> >>> node-name=drive_image1,driver=qcow2,read-only=off,cache.direct=on,cache.no-flush=off,file=file_image1
> >>> \
> >>> -device scsi-hd,id=image1,drive=drive_image1,write-cache=on \
> >>> -enable-kvm \
> >>> -serial mon:stdio \
> >>> -device vfio-pci,host=04:02.0,bus=pcie-root-port-1,addr=0x0,id=hostdev0
> >>>
> >>> PCI 04:02.0 is:
> >>>
> >>> $ lspci -v -s 04:02.0
> >>> 04:02.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
> >>> 	Subsystem: Intel Corporation Device 0000
> >>> 	Flags: fast devsel, NUMA node 0, IOMMU group 53
> >>> 	Memory at 92400000 (64-bit, prefetchable) [virtual] [size=64K]
> >>> 	Memory at 92910000 (64-bit, prefetchable) [virtual] [size=16K]
> >>> 	Capabilities: <access denied>
> >>> 	Kernel driver in use: vfio-pci
> >>> 	Kernel modules: iavf
> >>>
> >>> Any idea?  
> >>
> >> It also happens with non-VFIO device like e1000e:
> >>
> >> ...
> >> -device e1000e,bus=pcie-root-port-1,addr=0x0,id=hostdev0 \
> >                      ^^^^^^^^^^^^^
> > ACPI hotplug operates on slot level, so functions greater than 0 are not considered,
> > hence unexpected ACPI error. For above CLI, setting 'addr' on root-ports to dedicated slots
> > should fix issue.
> > 
> 
> Thank you for your answer.
> 
> It works well with something like this:
> 
> ...
> -device pcie-root-port,id=pcie-root-port-0,addr=0x1,bus=pcie.0,chassis=1 \
> -device pcie-root-port,id=pcie-root-port-1,addr=0x2,bus=pcie.0,chassis=2 \
> -device pcie-root-port,id=pcie-root-port-2,addr=0x3,bus=pcie.0,chassis=3 \
> -device pcie-root-port,id=pcie-root-port-3,addr=0x4,bus=pcie.0,chassis=4 \
> -device e1000e,mac=52:54:00:12:34:56,id=hostdev0,bus=pcie-root-port-1 \
> ...
> 
> Is this what you meant?
> 
> On an other hand, the previous configuration worked well before this patch, can we see
> that as a regression?
> 
> Thanks,
> Laurent


I agree, port itself can be multifunction, slot behind it is a single
function. Looks like a bug to me. Julia?

-- 
MST


