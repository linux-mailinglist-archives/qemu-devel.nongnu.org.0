Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53552428AA5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:16:32 +0200 (CEST)
Received: from localhost ([::1]:57106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZsMB-0000h4-Dv
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZsJk-0008Ab-WF
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:14:01 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:24575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZsJi-0001Uo-7d
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:14:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6EB487475FA;
 Mon, 11 Oct 2021 12:13:55 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4521E746353; Mon, 11 Oct 2021 12:13:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 42FA9746333;
 Mon, 11 Oct 2021 12:13:55 +0200 (CEST)
Date: Mon, 11 Oct 2021 12:13:55 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: ACPI endianness
In-Reply-To: <612d2f0b-f312-073d-b796-c76357ba51a2@redhat.com>
Message-ID: <d8284c4-c2e7-15e9-bec5-b2f619e1e6ad@eik.bme.hu>
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
 <612d2f0b-f312-073d-b796-c76357ba51a2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-754291012-1633947235=:61615"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-754291012-1633947235=:61615
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 11 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/10/21 15:24, BALATON Zoltan wrote:
>> Hello,
>>
>> I'm trying to fix shutdown and reboot on pegasos2 which uses ACPI as
>> part of the VIA VT8231 (similar to and modelled in hw/isa/vt82c686b.c)
>> and found that the guest writes to ACPI PM1aCNT register come out with
>> wrong endianness but not shure why. I have this:
>>
>> $ qemu-system-ppc -M pegasos2 -monitor stdio
>> (qemu) info mtree
>> [...]
>> memory-region: pci1-io
>>   0000000000000000-000000000000ffff (prio 0, i/o): pci1-io
>> [...]
>>     0000000000000f00-0000000000000f7f (prio 0, i/o): via-pm
>>       0000000000000f00-0000000000000f03 (prio 0, i/o): acpi-evt
>>       0000000000000f04-0000000000000f05 (prio 0, i/o): acpi-cnt
>>       0000000000000f08-0000000000000f0b (prio 0, i/o): acpi-tmr
>>
>> memory-region: system
>>   0000000000000000-ffffffffffffffff (prio 0, i/o): system
>>     0000000000000000-000000001fffffff (prio 0, ram): pegasos2.ram
>>     0000000080000000-00000000bfffffff (prio 0, i/o): alias pci1-mem0-win
>> @pci1-mem 0000000080000000-00000000bfffffff
>>     00000000c0000000-00000000dfffffff (prio 0, i/o): alias pci0-mem0-win
>> @pci0-mem 00000000c0000000-00000000dfffffff
>>     00000000f1000000-00000000f100ffff (prio 0, i/o): mv64361
>>     00000000f8000000-00000000f8ffffff (prio 0, i/o): alias pci0-io-win
>> @pci0-io 0000000000000000-0000000000ffffff
>>     00000000f9000000-00000000f9ffffff (prio 0, i/o): alias pci0-mem1-win
>> @pci0-mem 0000000000000000-0000000000ffffff
>>     00000000fd000000-00000000fdffffff (prio 0, i/o): alias pci1-mem1-win
>> @pci1-mem 0000000000000000-0000000000ffffff
>>     00000000fe000000-00000000feffffff (prio 0, i/o): alias pci1-io-win
>> @pci1-io 0000000000000000-0000000000ffffff
>>     00000000ff800000-00000000ffffffff (prio 0, i/o): alias pci1-mem3-win
>> @pci1-mem 00000000ff800000-00000000ffffffff
>>     00000000fff00000-00000000fff7ffff (prio 0, rom): pegasos2.rom
>>
>> The guest (which is big endian PPC and I think wotks on real hardware)
>> writes to 0xf05 in the io region which should be the high byte of the
>> little endian register but in the acpi code it comes out wrong, instead
>> of 0x2800 I get in acpi_pm1_cnt_write: val=0x28
>
> Looks like a northbridge issue (MV64340).
> Does Pegasos2 enables bus swapping?
> See hw/pci-host/mv64361.c:585:
>
> static void warn_swap_bit(uint64_t val)
> {
>    if ((val & 0x3000000ULL) >> 24 != 1) {
>        qemu_log_mask(LOG_UNIMP, "%s: Data swap not implemented", __func__);
>    }
> }

No, guests don't use this feature just byteswap themselves and write 
little endian values to the mapped io region. (Or in this case just write 
one byte of the 16 bit value, it specifically writes 0x28 to 0xf05.) 
That's why I think the device model should not byteswap itself so the acpi 
regions should be declared native endian and let the guest handle it. Some 
mentions I've found say that native endian means don't byteswap, little 
endian means byteswap if vcpu is big endian and big endian means byteswap 
if vcpu is little endian. Since guests already account for this and write 
little endian values to these regions there's no need to byteswap in 
device model and changing to native endian should not affect little endian 
machines so unless there's a better argument I'll try sending a patch.

Regards,
BALATON Zoltan
--3866299591-754291012-1633947235=:61615--

