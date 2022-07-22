Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE8F57E17C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:34:31 +0200 (CEST)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErrR-0002b3-Nd
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oErlj-0006Xu-QH
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:28:35 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:65420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1oErlg-0003xU-Mf
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:28:35 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 542BF424F9;
 Fri, 22 Jul 2022 14:28:29 +0200 (CEST)
Message-ID: <e4c49e1d-4c37-981f-0611-afc754d52202@proxmox.com>
Date: Fri, 22 Jul 2022 14:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Guest reboot issues since QEMU 6.0 and Linux 5.11
Content-Language: en-US
To: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Cc: Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Mira Limbeck <m.limbeck@proxmox.com>
References: <eb0e0c7e-5b6f-a573-43f6-bd58be243d6b@proxmox.com>
 <8ac992205e740722160f770821a49278bfa12b0a.camel@redhat.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <8ac992205e740722160f770821a49278bfa12b0a.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.07.22 um 17:51 schrieb Maxim Levitsky:
> On Thu, 2022-07-21 at 14:49 +0200, Fabian Ebner wrote:
>> Hi,
>> since about half a year ago, we're getting user reports about guest
>> reboot issues with KVM/QEMU[0].
>>
>> The most common scenario is a Windows Server VM (2012R2/2016/2019,
>> UEFI/OVMF and SeaBIOS) getting stuck during the screen with the Windows
>> logo and the spinning circles after a reboot was triggered from within
>> the guest. Quitting the kvm process and booting with a fresh instance
>> works. The issue seems to become more likely, the longer the kvm
>> instance runs.
>>
>> We did not get such reports while we were providing Linux 5.4 and QEMU
>> 5.2.0, but we do with Linux 5.11/5.13/5.15 and QEMU 6.x.
>>
>> I'm just wondering if anybody has seen this issue before or might have a
>> hunch what it's about? Any tips on what to look out for when debugging
>> are also greatly appreciated!
>>
>> We do have debug access to a user's test VM and the VM state was saved
>> before a problematic reboot, but I can't modify the host system there.
>> AFAICT QEMU just executes guest code as usual, but I'm really not sure
>> what to look out for.
>>
>> That VM has CPU type host, and a colleague did have a similar enough CPU
>> to load the VM state, but for him, the reboot went through normally. On
>> the user's system, it triggers consistently after loading the VM state
>> and rebooting.
>>
>> So unfortunately, we didn't manage to reproduce the issue locally yet.
>> With two other images provided by users, we ran into a boot loop, where
>> QEMU resets the CPUs and does a few KVM_RUNs before the exit reason is
>> KVM_EXIT_SHUTDOWN (which to my understanding indicates a triple fa
>> ult)
>> and then it repeats. It's not clear if the issues are related.
> 
> 
> Does the guest have HyperV enabled in it (that is nested virtualization?)
> 

For all three machines described above
Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
indicates that HyperV is disabled.

> Intel or AMD?
> 

We do have reports for both Intel and AMD.

> Does the VM uses secure boot / SMM?
> 

The customer VM which can reliably trigger the issue after loading the
state and rebooting uses SeaBIOS. For the other two VMs,
Confirm-SecureBootUEFI
returns "False".

SMM might be a lead! We did disable SMM in the past, because apparently
there were problems with it (didn't dig out which, was before I worked
here), and the timing of enabling it and the reports coming in would
match. I guess (some) guest OSes don't expect it to be suddenly turned on?

However, there is a report of a user with two clusters with QEMU 5.2,
one with kernel 5.4 without the issue and one with kernel 5.11 with the
issue (Windows VM with spinning circles). So that's confusing :/


We do use some additional options if the OS type is "Windows" in our
high-level configuration, including hyperV enlightenments:

> -cpu 'host,hv_ipi,hv_relaxed,hv_reset,hv_runtime,hv_spinlocks=0x1fff,hv_stimer,hv_synic,hv_time,hv_vapic,hv_vpindex,+kvm_pv_eoi,+kvm_pv_unhalt'
> -no-hpet
> -rtc 'driftfix=slew,base=localtime'
> -global 'kvm-pit.lost_tick_policy=discard'

But one user reported running into the issue even with OS type "other",
i.e. when the above options are not present and CPU flags should be just
'+kvm_pv_eoi,+kvm_pv_unhalt'. There are also reports with CPU type
different from 'host', also with 'kvm64' (where we automatically set the
flags +lahf_lm,+sep).


Thank you and Best Regards,
Fiona

P.S. Please don't mind the (from your perspective sudden) name change.
I'm still the same person and don't intend to change it again :)

> Best regards,
> 	Maxim Levitsky
> 
>>
>> There are also a few reports about non-Windows VMs, mostly Ubuntu 20.04
>> with UEFI/OVMF, but again, it's not clear if the issues are related.
>>
>> [0]: https://forum.proxmox.com/threads/100744/
>> (the forum thread is a bit chaotic unfortunately).
>>
>> Best Regards,
>> Fabi
>>
>>
> 
> 
> 


