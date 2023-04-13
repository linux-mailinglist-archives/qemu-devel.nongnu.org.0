Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA56E0B6C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 12:34:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmuGG-0002ly-W8; Thu, 13 Apr 2023 06:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pmuGE-0002lj-CD
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 06:33:02 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pmuGB-0006YD-Tx
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 06:33:01 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 6190B40C37;
 Thu, 13 Apr 2023 12:32:49 +0200 (CEST)
Message-ID: <ff5ccf7b-158f-262d-3155-305e2d48dc37@proxmox.com>
Date: Thu, 13 Apr 2023 12:32:48 +0200
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
 <0e3f3a98-835f-b26c-649e-a8a35edce660@proxmox.com>
 <20230412141822.03507c56@imammedo.users.ipa.redhat.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20230412141822.03507c56@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.083,
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

Am 12.04.23 um 14:18 schrieb Igor Mammedov:
> On Thu, 30 Mar 2023 13:58:22 +0200
> Fiona Ebner <f.ebner@proxmox.com> wrote:
> 
>> Am 30.03.23 um 10:22 schrieb Igor Mammedov:
>>> On Tue, 28 Mar 2023 14:58:21 +0200
>>> Fiona Ebner <f.ebner@proxmox.com> wrote:
>>>   
>>>>
>>>> Hi,
>>>> while trying to reproduce another issue, I ended up with a Windows 10
>>>> guest that would boot with QEMU 7.0, but get stuck after the Windows
>>>> logo/spinning circles with QEMU 7.1 (also with 8.0.0-rc1). Machine type
>>>> is pc-i440fx-6.2[0]. Bisecting led to this commit.
>>>>
>>>> It only happens the first time the VM is booted, killing the process and
>>>> re-trying always worked afterwards. So it's not a big deal and might
>>>> just be some ACPI-related Windows quirk. But I thought I should ask here
>>>> to be sure.
>>>>
>>>> For bisecting, I restored the disk state after each attempt. While
>>>> getting stuck sometimes took 3-4 attempts, I tested about 10 times until
>>>> I declared a commit good, and re-tested the commit before this one 15
>>>> times, so I'm pretty sure this is the one where the issue started appearing.
>>>>
>>>> So, anything that could potentially be wrong with the commit or is this
>>>> most likely just some Windows quirk/bug we can't do much about?
>>>>
>>>> If you need more information, please let me know!  
>>>
>>> Please describe in more detail your setup/steps where it reproduces
>>> (incl. Windows version/build, used QEMU CLI) so I could try to reproduce it locally.
>>>
>>> (in past there were issues with German version that some where
>>> experience but not reproducible on my side, that resolved with
>>> upgrading to newer QEMU (if I recall correctly issue was opened
>>> on QEMU's gitlab tracker))
>>>   
>>
>> Windows 10 Education
>> Version 1809
>> Build 17763.1
>>
>> It's not the German ISO, I used default settings (except location
>> Austria and German keymap) and I don't think I did anything other than
>> shutdown after the install was over.
>>
>> The command line is below. I did use our patched QEMU builds when I got
>> into the situation, but I don't think they touch anything ACPI-related
>> and bisecting was done without our patches on top.
>>
>> I tried to reproduce the situation again from scratch today, but wasn't
>> able to. I do still have the problematic disk (snapshot) where the issue
>> occurs as an LVM-Thin volume. If you'd like to have access to that,
>> please send me a direct mail and we can discuss the details there.
> 
> I couldn't reproduce the issue on my host either.
> If you still have access to 'broken' disk image, you can try to enable
> kernel debug mode in guest and try to attach with debugger to it to see
> where it is stuck.
> 
> quick instructions how to do it:
>  https://gitlab.com/qemu-project/qemu/-/issues/774#note_1270248862
> or read more extensive MS docs on topic.
> 

Hmm, I guess I won't be able to enable kernel debug mode without losing
the problematic state of the image. The VM only gets stuck during the
first boot attempt.

Still, I wanted to give it a shot in the hope I can trigger it again
when shutting down with QEMU 6.2.0 and booting with QEMU 7.1.0. I made a
copy of the VM intending to use it as the debug host, but didn't get the
COM port to show up in the guest with
-serial unix:/tmp/com1,server,nowait
I checked in the Device Manager with "Show hidden devices" enabled.

Anyway, when starting the original problematic VM again, it now also got
stuck (visually, in the same place) with QEMU 6.2.0! But only until I
rebooted my host, which made it working with QEMU 6.2.0 again. So I'd
say this commit has nothing to do with the issue after all, just made it
more likely to trigger for me. And also seems less likely to be a QEMU
issue now :)

Best Regards,
Fiona


