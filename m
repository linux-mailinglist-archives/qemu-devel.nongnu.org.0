Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F003CFA28
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:10:11 +0200 (CEST)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pVi-0007Uy-5W
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m5pIE-0000GY-RZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m5pIC-0000AS-IJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZXxmZZh6IXsiLrPGNe4YDY2ekH004pB/wX2SzU/NzI=;
 b=expAom/65vOWqXp68N4PgV1cSl3kibaI2eRGUXE3O0wT+b1rzMvfzZ5vVU7cRn/3vIU6bw
 oBcwdhPB3zoMobl9u24Q6WMv8g7Zko8mVh9RQEcRTGjCa/rOsmXxpnODLw0hOCgSYXVemZ
 be0p1UnICe9aappNTa27gMdkznQcojk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-TmIljuzgMp2TGsoXBCxHbw-1; Tue, 20 Jul 2021 08:56:10 -0400
X-MC-Unique: TmIljuzgMp2TGsoXBCxHbw-1
Received: by mail-wm1-f70.google.com with SMTP id
 x6-20020a7bc2060000b0290218ad9a8d4aso465647wmi.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 05:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ZXxmZZh6IXsiLrPGNe4YDY2ekH004pB/wX2SzU/NzI=;
 b=SVP5IlmfNliHSgGHCaSa0m2ELE0LCbs7MjBQeVVLl/xjNnrnyjeL9gfNbbQR8wUY1p
 HjEdKrTMhQue8etPDSEE1jBaZs3murdOxc/yDkoAH5eOlkWbebgCP06orOObEHsFeasd
 9cDtJq+8esqZrfkwLiANBa2w6JnPYo63DVyb/fISpM58i9LvQ09CUL2jVnSTnxPJOgJN
 Df5mugfAsNo9wCFtPdmRLV3sbu+M2Yl2XgGGnqrM1OGMkoL/Ge1j1gV7TKWywtTB6etu
 b5RFXvyFt8wl1BRxJCKFKIs+7gxcNsuTaa0kE/ssezCD5cSVm7Y5t3G8utwB5d1cgmBi
 lbMw==
X-Gm-Message-State: AOAM533eWQEONFVko+ehsHGKNAS41dubXAJN1A8Kgavh5OjFppM1ABEP
 W0/qJz1QU9ppCC/zzaxzp46TbfzNRTjXWuvKLdLa12KaTOZPR/tW4MRFiP83XluQuZHWWo5XJ09
 pRcRFIfJHCd/LGAA=
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr21984378wmk.40.1626785769089; 
 Tue, 20 Jul 2021 05:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXugjnrk5UQPepFjVaEQbawUPMg9RRkambUj0Gm2hSMlM+xSG/xTYnlcvugol2U6/0eBn1Nw==
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr21984364wmk.40.1626785768905; 
 Tue, 20 Jul 2021 05:56:08 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id v15sm20353102wmj.11.2021.07.20.05.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 05:56:08 -0700 (PDT)
Subject: Re: [PULL v3 05/19] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
From: Laurent Vivier <lvivier@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Julia Suvorova <jusual@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
 <20210716151416.155127-6-mst@redhat.com>
 <f8de5dbc-ed4c-ba99-8981-583fa42961cb@redhat.com>
Message-ID: <73728485-d133-e629-46ee-2ca586b71de6@redhat.com>
Date: Tue, 20 Jul 2021 14:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f8de5dbc-ed4c-ba99-8981-583fa42961cb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2021 13:38, Laurent Vivier wrote:
> On 16/07/2021 17:15, Michael S. Tsirkin wrote:
>> From: Julia Suvorova <jusual@redhat.com>
>>
>> Q35 has three different types of PCI devices hot-plug: PCIe Native,
>> SHPC Native and ACPI hot-plug. This patch changes the default choice
>> for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
>> ability to use SHPC and PCIe Native for hot-plugged bridges.
>>
>> This is a list of the PCIe Native hot-plug issues that led to this
>> change:
>>     * no racy behavior during boot (see 110c477c2ed)
>>     * no delay during deleting - after the actual power off software
>>       must wait at least 1 second before indicating about it. This case
>>       is quite important for users, it even has its own bug:
>>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>>     * no timer-based behavior - in addition to the previous example,
>>       the attention button has a 5-second waiting period, during which
>>       the operation can be canceled with a second press. While this
>>       looks fine for manual button control, automation will result in
>>       the need to queue or drop events, and the software receiving
>>       events in all sort of unspecified combinations of attention/power
>>       indicator states, which is racy and uppredictable.
>>     * fixes:
>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
>>         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
>>
>> To return to PCIe Native hot-plug:
>>     -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
>>
>> Known issue: older linux guests need the following flag
>> to allow hotplugged pci express devices to use io:
>>         -device pcie-root-port,io-reserve=4096.
>> io is unusual for pci express so this seems minor.
>> We'll fix this by a follow up patch.
>>
>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> Message-Id: <20210713004205.775386-6-jusual@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>  hw/acpi/ich9.c | 2 +-
>>  hw/i386/pc.c   | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
>> index 2f4eb453ac..778e27b659 100644
>> --- a/hw/acpi/ich9.c
>> +++ b/hw/acpi/ich9.c
>> @@ -427,7 +427,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>>      pm->disable_s3 = 0;
>>      pm->disable_s4 = 0;
>>      pm->s4_val = 2;
>> -    pm->use_acpi_hotplug_bridge = false;
>> +    pm->use_acpi_hotplug_bridge = true;
>>  
>>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index aa79c5e0e6..f4c7a78362 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_0[] = {
>>      { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
>>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
>>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
>> +    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
>>  };
>>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>>  
>>
> 
> There is an issue with this patch.
> 
> When I try to unplug a VFIO device I have the following error and the device is not unplugged:
> 
> (qemu) device_del hostdev0
> 
> [   34.116714] ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND
> (20201113/psargs-330)
> [   34.117987] ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error
> (AE_NOT_FOUND) (20201113/psparse-531)
> [   34.119318] ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND)
> (20201113/psparse-531)
> [   34.120600] ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01]
> (20201113/evgpe-515)
> 
> We can see device is not unplugged (03:00.0)
> 
> # lspci -v -s 03:00.0
> 03:00.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
> 	Subsystem: Intel Corporation Device 0000
> 	Flags: bus master, fast devsel, latency 0
> 	Memory at fe800000 (64-bit, prefetchable) [size=64K]
> 	Memory at fe810000 (64-bit, prefetchable) [size=16K]
> 	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
> 	Capabilities: [a0] Express Endpoint, MSI 00
> 	Capabilities: [100] Advanced Error Reporting
> 	Capabilities: [1a0] Transaction Processing Hints
> 	Capabilities: [1d0] Access Control Services
> 	Kernel driver in use: iavf
> 	Kernel modules: iavf
> 
> My guest kernel is from RHEL 8.5 (4.18.0-310.el8.x86_64) and my command line is:
> 
> $QEMU \
> -L .../pc-bios \
> -nodefaults \
> -nographic \
> -machine q35 \
> -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
> -device pcie-pci-bridge,id=pcie-pci-bridge-0,addr=0x0,bus=pcie-root-port-0  \
> -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2 \
> -device pcie-root-port,id=pcie-root-port-2,port=0x2,addr=0x1.0x2,bus=pcie.0,chassis=3 \
> -device pcie-root-port,id=pcie-root-port-3,port=0x3,addr=0x1.0x3,bus=pcie.0,chassis=4 \
> -device
> pcie-root-port,id=pcie_extra_root_port_0,multifunction=on,bus=pcie.0,addr=0x3,chassis=5 \
> -nodefaults \
> -m 4066  \
> -smp 4 \
> -device virtio-scsi-pci,id=virtio_scsi_pci0,bus=pcie-root-port-2,addr=0x0 \
> -blockdev
> node-name=file_image1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=$IMAGE,cache.direct=on,cache.no-fl\
> -blockdev
> node-name=drive_image1,driver=qcow2,read-only=off,cache.direct=on,cache.no-flush=off,file=file_image1
> \
> -device scsi-hd,id=image1,drive=drive_image1,write-cache=on \
> -enable-kvm \
> -serial mon:stdio \
> -device vfio-pci,host=04:02.0,bus=pcie-root-port-1,addr=0x0,id=hostdev0
> 
> PCI 04:02.0 is:
> 
> $ lspci -v -s 04:02.0
> 04:02.0 Ethernet controller: Intel Corporation Ethernet Virtual Function 700 Series (rev 02)
> 	Subsystem: Intel Corporation Device 0000
> 	Flags: fast devsel, NUMA node 0, IOMMU group 53
> 	Memory at 92400000 (64-bit, prefetchable) [virtual] [size=64K]
> 	Memory at 92910000 (64-bit, prefetchable) [virtual] [size=16K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: vfio-pci
> 	Kernel modules: iavf
> 
> Any idea?

It also happens with non-VFIO device like e1000e:

...
-device e1000e,bus=pcie-root-port-1,addr=0x0,id=hostdev0 \
...
device_del hostdev0

[   40.275904] ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND
(20201113/psargs-330)
[   40.277189] ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error
(AE_NOT_FOUND) (20201113/psparse-531)
[   40.278529] ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND)
(20201113/psparse-531)
[   40.279819] ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01]
(20201113/evgpe-515)

# lspci -v -s 03:00.0
03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection
	Subsystem: Intel Corporation Device 0000
	Flags: bus master, fast devsel, latency 0, IRQ 21
	Memory at fdc40000 (32-bit, non-prefetchable) [size=128K]
	Memory at fdc60000 (32-bit, non-prefetchable) [size=128K]
	I/O ports at c000 [size=32]
	Memory at fdc80000 (32-bit, non-prefetchable) [size=16K]
	Expansion ROM at fdc00000 [disabled] [size=256K]
	Capabilities: [c8] Power Management version 2
	Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
	Capabilities: [e0] Express Endpoint, MSI 00
	Capabilities: [a0] MSI-X: Enable+ Count=5 Masked-
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [140] Device Serial Number 52-54-00-ff-ff-12-34-56
	Kernel driver in use: e1000e
	Kernel modules: e1000e

Thanks,
Laurent


