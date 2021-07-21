Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA833D12D9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:52:54 +0200 (CEST)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EWj-0007YD-Bg
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6ETN-0002Px-2e
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6ETK-0002Oz-SZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626882562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+g8z+7RqWh5BZTVfGfzslWD84TLnNVDzzJB5mmig+m4=;
 b=eKxvk3pd9XKezsx5abG6jiEGesErFqR6TJxBmlKIXXZPaVWNqHBve6V+DaTCgXCyO3ga62
 nZ/NOLShlOuGnshYcMAFPKqv5tK9pIDwS2oNlQjJGk/ZhiYkkg6wNVK5VrAci6xI+20dR6
 QopwLGDKqHYGNk8SZAkF7SrB0IShNgU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-GZukquNSO7OUGs2SF1lVkg-1; Wed, 21 Jul 2021 11:49:19 -0400
X-MC-Unique: GZukquNSO7OUGs2SF1lVkg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d8-20020adf9c880000b0290141a87409b5so1172661wre.16
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+g8z+7RqWh5BZTVfGfzslWD84TLnNVDzzJB5mmig+m4=;
 b=iDPLDoNinya9B86167Ea4DO6610DWDLJL99A295Bxw6No0PzFL1NLNvfmDpQTMs1AC
 hDV1v8XmmpG0Nq9yhJbgGM5xlyeSFdTeMQ3EVdRVoS8pcBRjOkCTPrVnu2+LQ2wmiWoE
 jjm1vQfTIOjXszy6gxx5PcbRDfDTLnkjFloR8eHCvP9/fJz6ZImN8wURJ+vgVeEVLPIv
 vQvnDbGIwRqAG7IDPNnCv+is6I+QXc7puNobFuXTb371HoQ2PXUYBFhsGZUiEMqVzDFX
 QQVrxZ6J29IZNKXzLDRVhuN+VjBNzWV3oXYfc5XiUEqFS5CIH1A7ZAHB/ez0Jnq6V8BF
 YeYg==
X-Gm-Message-State: AOAM533meFC48MBK0YYvDIGoJryzF74CzjVR5oWSl4XXEroPK34iQLVQ
 D58WRk6UNRBwk9/4ktJ6nxGVItmu3onb4MCuYghKDTA/mau1TZaA87YI0CKSfDYLwRb6oDI2YP7
 Ujrrkt4It/WsMJm8=
X-Received: by 2002:a1c:a992:: with SMTP id s140mr4643866wme.113.1626882558237; 
 Wed, 21 Jul 2021 08:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0cUuaIlURQVgKZ1WVkoEFgLcNlFp36Q0Je2uV+1oxgeiYNK1msc886F6IE2Bu5+3BGusGOg==
X-Received: by 2002:a1c:a992:: with SMTP id s140mr4643838wme.113.1626882557927; 
 Wed, 21 Jul 2021 08:49:17 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id c125sm307308wme.36.2021.07.21.08.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 08:49:17 -0700 (PDT)
Subject: Re: [PULL v3 05/19] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
To: Igor Mammedov <imammedo@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
 <20210716151416.155127-6-mst@redhat.com>
 <f8de5dbc-ed4c-ba99-8981-583fa42961cb@redhat.com>
 <73728485-d133-e629-46ee-2ca586b71de6@redhat.com>
 <20210721165934.2f81f3f3@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <4f90fcaa-581e-40b9-8f57-ad6c92bd98b2@redhat.com>
Date: Wed, 21 Jul 2021 17:49:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721165934.2f81f3f3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIMWL_WL_HIGH=-1.459, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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

On 21/07/2021 16:59, Igor Mammedov wrote:
> On Tue, 20 Jul 2021 14:56:06 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
> 
>> On 20/07/2021 13:38, Laurent Vivier wrote:
>>> On 16/07/2021 17:15, Michael S. Tsirkin wrote:  
>>>> From: Julia Suvorova <jusual@redhat.com>
>>>>
>>>> Q35 has three different types of PCI devices hot-plug: PCIe Native,
>>>> SHPC Native and ACPI hot-plug. This patch changes the default choice
>>>> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
>>>> ability to use SHPC and PCIe Native for hot-plugged bridges.
>>>>
>>>> This is a list of the PCIe Native hot-plug issues that led to this
>>>> change:
>>>>     * no racy behavior during boot (see 110c477c2ed)
>>>>     * no delay during deleting - after the actual power off software
>>>>       must wait at least 1 second before indicating about it. This case
>>>>       is quite important for users, it even has its own bug:
>>>>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>>>>     * no timer-based behavior - in addition to the previous example,
>>>>       the attention button has a 5-second waiting period, during which
>>>>       the operation can be canceled with a second press. While this
>>>>       looks fine for manual button control, automation will result in
>>>>       the need to queue or drop events, and the software receiving
>>>>       events in all sort of unspecified combinations of attention/power
>>>>       indicator states, which is racy and uppredictable.
>>>>     * fixes:
>>>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
>>>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
>>>>
>>>> To return to PCIe Native hot-plug:
>>>>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
>>>>
>>>> Known issue: older linux guests need the following flag
>>>> to allow hotplugged pci express devices to use io:
>>>>         -device pcie-root-port,io-reserve=4096.
>>>> io is unusual for pci express so this seems minor.
>>>> We'll fix this by a follow up patch.
>>>>
>>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
>>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>>> Message-Id: <20210713004205.775386-6-jusual@redhat.com>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>>>> ---
>>>>  hw/acpi/ich9.c | 2 +-
>>>>  hw/i386/pc.c   | 1 +
>>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
>>>> index 2f4eb453ac..778e27b659 100644
>>>> --- a/hw/acpi/ich9.c
>>>> +++ b/hw/acpi/ich9.c
>>>> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>>>>      pm->disable_s3 = 0;
>>>>      pm->disable_s4 = 0;
>>>>      pm->s4_val = 2;
>>>> -    pm->use_acpi_hotplug_bridge = false;
>>>> +    pm->use_acpi_hotplug_bridge = true;
>>>>  
>>>>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>>>>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index aa79c5e0e6..f4c7a78362 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_0[] = {
>>>>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
>>>>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
>>>>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
>>>> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
>>>>  };
>>>>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>>>>  
>>>>  
>>>
>>> There is an issue with this patch.
>>>
>>> When I try to unplug a VFIO device I have the following error and the device is not unplugged:
>>>
>>> (qemu) device_del hostdev0
>>>
>>> [   34.116714] ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND
>>> (20201113/psargs-330)
>>> [   34.117987] ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error
>>> (AE_NOT_FOUND) (20201113/psparse-531)
>>> [   34.119318] ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND)
>>> (20201113/psparse-531)
>>> [   34.120600] ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01]
>>> (20201113/evgpe-515)
>>>
>>> We can see device is not unplugged (03:00.0)
>>>
>>> # lspci -v -s 03:00.0
>>> 03:00.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
>>> 	Subsystem: Intel Corporation Device 0000
>>> 	Flags: bus master, fast devsel, latency 0
>>> 	Memory at fe800000 (64-bit, prefetchable) [size=64K]
>>> 	Memory at fe810000 (64-bit, prefetchable) [size=16K]
>>> 	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
>>> 	Capabilities: [a0] Express Endpoint, MSI 00
>>> 	Capabilities: [100] Advanced Error Reporting
>>> 	Capabilities: [1a0] Transaction Processing Hints
>>> 	Capabilities: [1d0] Access Control Services
>>> 	Kernel driver in use: iavf
>>> 	Kernel modules: iavf
>>>
>>> My guest kernel is from RHEL 8.5 (4.18.0-310.el8.x86_64) and my command line is:
>>>
>>> $QEMU \
>>> -L .../pc-bios \
>>> -nodefaults \
>>> -nographic \
>>> -machine q35 \
>>> -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
>>> -device pcie-pci-bridge,id=pcie-pci-bridge-0,addr=0x0,bus=pcie-root-port-0  \
>>> -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2 \
>>> -device pcie-root-port,id=pcie-root-port-2,port=0x2,addr=0x1.0x2,bus=pcie.0,chassis=3 \
>>> -device pcie-root-port,id=pcie-root-port-3,port=0x3,addr=0x1.0x3,bus=pcie.0,chassis=4 \
>>> -device
>>> pcie-root-port,id=pcie_extra_root_port_0,multifunction=on,bus=pcie.0,addr=0x3,chassis=5 \
>>> -nodefaults \
>>> -m 4066  \
>>> -smp 4 \
>>> -device virtio-scsi-pci,id=virtio_scsi_pci0,bus=pcie-root-port-2,addr=0x0 \
>>> -blockdev
>>> node-name=file_image1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=$IMAGE,cache.direct=on,cache.no-fl\
>>> -blockdev
>>> node-name=drive_image1,driver=qcow2,read-only=off,cache.direct=on,cache.no-flush=off,file=file_image1
>>> \
>>> -device scsi-hd,id=image1,drive=drive_image1,write-cache=on \
>>> -enable-kvm \
>>> -serial mon:stdio \
>>> -device vfio-pci,host=04:02.0,bus=pcie-root-port-1,addr=0x0,id=hostdev0
>>>
>>> PCI 04:02.0 is:
>>>
>>> $ lspci -v -s 04:02.0
>>> 04:02.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
>>> 	Subsystem: Intel Corporation Device 0000
>>> 	Flags: fast devsel, NUMA node 0, IOMMU group 53
>>> 	Memory at 92400000 (64-bit, prefetchable) [virtual] [size=64K]
>>> 	Memory at 92910000 (64-bit, prefetchable) [virtual] [size=16K]
>>> 	Capabilities: <access denied>
>>> 	Kernel driver in use: vfio-pci
>>> 	Kernel modules: iavf
>>>
>>> Any idea?  
>>
>> It also happens with non-VFIO device like e1000e:
>>
>> ...
>> -device e1000e,bus=pcie-root-port-1,addr=0x0,id=hostdev0 \
>                      ^^^^^^^^^^^^^
> ACPI hotplug operates on slot level, so functions greater than 0 are not considered,
> hence unexpected ACPI error. For above CLI, setting 'addr' on root-ports to dedicated slots
> should fix issue.
> 

Thank you for your answer.

It works well with something like this:

...
-device pcie-root-port,id=pcie-root-port-0,addr=0x1,bus=pcie.0,chassis=1 \
-device pcie-root-port,id=pcie-root-port-1,addr=0x2,bus=pcie.0,chassis=2 \
-device pcie-root-port,id=pcie-root-port-2,addr=0x3,bus=pcie.0,chassis=3 \
-device pcie-root-port,id=pcie-root-port-3,addr=0x4,bus=pcie.0,chassis=4 \
-device e1000e,mac=52:54:00:12:34:56,id=hostdev0,bus=pcie-root-port-1 \
...

Is this what you meant?

On an other hand, the previous configuration worked well before this patch, can we see
that as a regression?

Thanks,
Laurent


