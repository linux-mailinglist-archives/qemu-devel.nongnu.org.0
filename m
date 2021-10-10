Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D654281E7
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 16:27:43 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZZnh-00005T-Jh
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 10:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZZmc-0007nH-PF
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 10:26:34 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZZmZ-0001CM-Hy
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 10:26:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9B045746333;
 Sun, 10 Oct 2021 16:26:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 71906745953; Sun, 10 Oct 2021 16:26:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6FBE67457EE;
 Sun, 10 Oct 2021 16:26:26 +0200 (CEST)
Date: Sun, 10 Oct 2021 16:26:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: ACPI endianness
In-Reply-To: <20211010100318-mutt-send-email-mst@kernel.org>
Message-ID: <517ba062-ecb8-335-2924-e873d36de8d3@eik.bme.hu>
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
 <20211010100318-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 10 Oct 2021, Michael S. Tsirkin wrote:
> On Sun, Oct 10, 2021 at 03:24:32PM +0200, BALATON Zoltan wrote:
>> Hello,
>>
>> I'm trying to fix shutdown and reboot on pegasos2 which uses ACPI as part of
>> the VIA VT8231 (similar to and modelled in hw/isa/vt82c686b.c) and found
>> that the guest writes to ACPI PM1aCNT register come out with wrong
>> endianness but not shure why. I have this:
>>
>> $ qemu-system-ppc -M pegasos2 -monitor stdio
>> (qemu) info mtree
>> [...]
>> memory-region: pci1-io
>>   0000000000000000-000000000000ffff (prio 0, i/o): pci1-io
>> [...]
>>     0000000000000f00-0000000000000f7f (prio 0, i/o): via-pm
>>       0000000000000f00-0000000000000f03 (prio 0, i/o): acpi-evt
>>       0000000000000f04-0000000000000f05 (prio 0, i/o): acpi-cnt
>>       0000000000000f08-0000000000000f0b (prio 0, i/o): acpi-tmr
>>
>> memory-region: system
>>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>>     0000000000000000-000000001fffffff (prio 0, ram): pegasos2.ram
>>     0000000080000000-00000000bfffffff (prio 0, i/o): alias pci1-mem0-win @pci1-mem 0000000080000000-00000000bfffffff
>>     00000000c0000000-00000000dfffffff (prio 0, i/o): alias pci0-mem0-win @pci0-mem 00000000c0000000-00000000dfffffff
>>     00000000f1000000-00000000f100ffff (prio 0, i/o): mv64361
>>     00000000f8000000-00000000f8ffffff (prio 0, i/o): alias pci0-io-win @pci0-io 0000000000000000-0000000000ffffff
>>     00000000f9000000-00000000f9ffffff (prio 0, i/o): alias pci0-mem1-win @pci0-mem 0000000000000000-0000000000ffffff
>>     00000000fd000000-00000000fdffffff (prio 0, i/o): alias pci1-mem1-win @pci1-mem 0000000000000000-0000000000ffffff
>>     00000000fe000000-00000000feffffff (prio 0, i/o): alias pci1-io-win @pci1-io 0000000000000000-0000000000ffffff
>>     00000000ff800000-00000000ffffffff (prio 0, i/o): alias pci1-mem3-win @pci1-mem 00000000ff800000-00000000ffffffff
>>     00000000fff00000-00000000fff7ffff (prio 0, rom): pegasos2.rom
>>
>> The guest (which is big endian PPC and I think wotks on real hardware)
>> writes to 0xf05 in the io region which should be the high byte of the little
>> endian register but in the acpi code it comes out wrong, instead of 0x2800 I
>> get in acpi_pm1_cnt_write: val=0x28
>>
>> The memory regions involved are:
>>
>> acpi-cnt (hw/acpi/core.c):
>>
>> static const MemoryRegionOps acpi_pm_cnt_ops = {
>>     .read = acpi_pm_cnt_read,
>>     .write = acpi_pm_cnt_write,
>>     .impl.min_access_size = 2,
>>     .valid.min_access_size = 1,
>>     .valid.max_access_size = 2,
>>     .endianness = DEVICE_LITTLE_ENDIAN,
>> };
>>
>> via-pm (hw/isa/vt82c686.c):
>>
>> static const MemoryRegionOps pm_io_ops = {
>>     .read = pm_io_read,
>>     .write = pm_io_write,
>>     .endianness = DEVICE_NATIVE_ENDIAN,
>>     .impl = {
>>         .min_access_size = 1,
>>         .max_access_size = 1,
>>     },
>> };
>>
>> Also tried removing .impl from pm_io_ops but that does not help. Changing
>> acpi_pm_cnt_ops to DEVICE_NATIVE_ENDIAN fixes it but not sure what else
>> could that break. Should these ACPI regions be native endian or how else to
>> fix this for the vt82xx case?
>>
>> Regards,
>> BALATON Zoltan
>
> Does it help if you change via to DEVICE_LITTLE_ENDIAN?

No. That region is just acting as a container for the ACPI regions so they 
can be moved together to the base address settable by the guest (and maybe 
implementing some other regs later if needed but we don't do that now) but 
looks like it's not involved in read/write to acpi regs as its ops are not 
called and the write goes through to the acpi-cnt region. So it also does 
not matter if I change endianness or impl in pm_io_ops in vt82c686.c.

These acpi bits only seem to be used on piix4 and ich9 apart from vt82xx 
and those are probably used on little endian hosts while vt8231 is used on 
pegasos2 which is big endian PPC and vt82c686b on fullong2e which I think 
is little endian MIPS. What does NATIVE_ENDIAN actually mean? It does not 
seem to be documented anywhere. Would it change anything if the ACPI 
regions are changed ro NATIVE_ENDIAN for little endian machines that are 
all the other usages? If not then maybe that's the way to go.

Regards,
BALATON Zoltan

