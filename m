Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A633C6D042F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:59:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqvO-0007CD-T5; Thu, 30 Mar 2023 07:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1phqvM-0007C1-El
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:58:36 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1phqvK-0004WA-AL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:58:36 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4038E41999;
 Thu, 30 Mar 2023 13:58:24 +0200 (CEST)
Message-ID: <0e3f3a98-835f-b26c-649e-a8a35edce660@proxmox.com>
Date: Thu, 30 Mar 2023 13:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 19/54] acpi: pc: isa bridge: use AcpiDevAmlIf interface to
 build ISA device descriptors
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-20-mst@redhat.com>
 <ba6a8777-723d-7e6c-bec7-71819cedb66d@proxmox.com>
 <20230330102227.39b44b71@imammedo.users.ipa.redhat.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20230330102227.39b44b71@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 30.03.23 um 10:22 schrieb Igor Mammedov:
> On Tue, 28 Mar 2023 14:58:21 +0200
> Fiona Ebner <f.ebner@proxmox.com> wrote:
> 
>> Am 10.06.22 um 09:57 schrieb Michael S. Tsirkin:
>>> From: Igor Mammedov <imammedo@redhat.com>
>>>
>>> replaces ad-hoc build_isa_devices_aml() with generic AcpiDevAmlIf
>>> way to build bridge AML including all devices that are attached to
>>> its ISA bus.
>>>
>>> Later when PCI is converted to AcpiDevAmlIf, build_piix4_isa_bridge()
>>> will also be dropped since PCI parts itself will take care of
>>> building device prologue/epilogue AML for each enumerated PCI
>>> device.
>>>
>>> Expected AML change is contextual, where ISA devices are moved
>>> from separately declared _SB.PCI0.ISA scope , directly under
>>> Device(ISA) node.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>>> Message-Id: <20220608135340.3304695-20-imammedo@redhat.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>  
>>
>> Hi,
>> while trying to reproduce another issue, I ended up with a Windows 10
>> guest that would boot with QEMU 7.0, but get stuck after the Windows
>> logo/spinning circles with QEMU 7.1 (also with 8.0.0-rc1). Machine type
>> is pc-i440fx-6.2[0]. Bisecting led to this commit.
>>
>> It only happens the first time the VM is booted, killing the process and
>> re-trying always worked afterwards. So it's not a big deal and might
>> just be some ACPI-related Windows quirk. But I thought I should ask here
>> to be sure.
>>
>> For bisecting, I restored the disk state after each attempt. While
>> getting stuck sometimes took 3-4 attempts, I tested about 10 times until
>> I declared a commit good, and re-tested the commit before this one 15
>> times, so I'm pretty sure this is the one where the issue started appearing.
>>
>> So, anything that could potentially be wrong with the commit or is this
>> most likely just some Windows quirk/bug we can't do much about?
>>
>> If you need more information, please let me know!
> 
> Please describe in more detail your setup/steps where it reproduces
> (incl. Windows version/build, used QEMU CLI) so I could try to reproduce it locally.
> 
> (in past there were issues with German version that some where
> experience but not reproducible on my side, that resolved with
> upgrading to newer QEMU (if I recall correctly issue was opened
> on QEMU's gitlab tracker))
> 

Windows 10 Education
Version 1809
Build 17763.1

It's not the German ISO, I used default settings (except location
Austria and German keymap) and I don't think I did anything other than
shutdown after the install was over.

The command line is below. I did use our patched QEMU builds when I got
into the situation, but I don't think they touch anything ACPI-related
and bisecting was done without our patches on top.

I tried to reproduce the situation again from scratch today, but wasn't
able to. I do still have the problematic disk (snapshot) where the issue
occurs as an LVM-Thin volume. If you'd like to have access to that,
please send me a direct mail and we can discuss the details there.

Best Regards,
Fiona

>>
>> Best Regards,
>> Fiona
>>
>> [0] command line:
>>> ./qemu-system-x86_64 \
>>>   -accel 'kvm' \
>>>   -name 'stuckafterrollbackonboot,debug-threads=on' \
>>>   -no-shutdown \
>>>   -chardev 'socket,id=qmp,path=/var/run/qemu-server/161.qmp,server=on,wait=off' \
>>>   -mon 'chardev=qmp,mode=control' \
>>>   -chardev 'socket,id=qmp-event,path=/var/run/qmeventd.sock,reconnect=5' \
>>>   -mon 'chardev=qmp-event,mode=control' \
>>>   -pidfile /var/run/qemu-server/161.pid \
>>>   -smbios 'type=1,uuid=f2b77ed0-73c1-4372-9490-b2c1b59431af' \
>>>   -smp '4,sockets=1,cores=4,maxcpus=4' \
>>>   -nodefaults \
>>>   -boot 'menu=on,strict=on,reboot-timeout=1000,splash=/usr/share/qemu-server/bootsplash.jpg' \
>>>   -vnc 'unix:/var/run/qemu-server/161.vnc,password=on' \
>>>   -no-hpet \
>>>   -cpu 'kvm64,enforce,hv_ipi,hv_relaxed,hv_reset,hv_runtime,hv_spinlocks=0x1fff,hv_stimer,hv_synic,hv_time,hv_vapic,hv_vpindex,+kvm_pv_eoi,+kvm_pv_unhalt,+lahf_lm,+sep' \
>>>   -m 6144 \
>>>   -device 'pci-bridge,id=pci.1,chassis_nr=1,bus=pci.0,addr=0x1e' \
>>>   -device 'pci-bridge,id=pci.2,chassis_nr=2,bus=pci.0,addr=0x1f' \
>>>   -device 'pci-bridge,id=pci.3,chassis_nr=3,bus=pci.0,addr=0x5' \
>>>   -device 'vmgenid,guid=faa21a64-5921-45fe-9ff3-1f132b9ed029' \
>>>   -device 'piix3-usb-uhci,id=uhci,bus=pci.0,addr=0x1.0x2' \
>>>   -device 'usb-tablet,id=tablet,bus=uhci.0,port=1' \
>>>   -device 'VGA,id=vga,bus=pci.0,addr=0x2,edid=off' \
>>>   -device 'virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x3,free-page-reporting=on' \
>>>   -iscsi 'initiator-name=iqn.1993-08.org.debian:01:7d9a912f961' \
>>>   -device 'ahci,id=ahci0,multifunction=on,bus=pci.0,addr=0x7' \
>>>   -drive 'file=/dev/pve/vm-161-disk-0,if=none,id=drive-sata0,format=raw,cache=none,aio=io_uring,detect-zeroes=on' \
>>>   -device 'ide-hd,bus=ahci0.0,drive=drive-sata0,id=sata0,bootindex=100' \
>>>   -netdev 'type=tap,id=net0,ifname=tap161i0,script=/var/lib/qemu-server/pve-bridge,downscript=/var/lib/qemu-server/pve-bridgedown' \
>>>   -device 'e1000,mac=42:BF:8B:AE:68:05,netdev=net0,bus=pci.0,addr=0x12,id=net0,bootindex=102' \
>>>   -rtc 'driftfix=slew,base=localtime' \
>>>   -machine 'type=pc-i440fx-6.2' \
>>>   -global 'kvm-pit.lost_tick_policy=discard'  
>>



