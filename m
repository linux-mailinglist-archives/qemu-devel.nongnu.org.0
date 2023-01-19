Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17785673479
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRDy-0005si-V1; Thu, 19 Jan 2023 04:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIRDx-0005s2-MU
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:28:45 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIRDv-00071Q-Im
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:28:45 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id BDC2344C100E;
 Thu, 19 Jan 2023 09:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BDC2344C100E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674120521;
 bh=iBWlQueb2Z1qbGs2wpwNRjwrOdh83WxzZFQBrETvKpM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ViPiOK5lnRk6lkcm4ndC6TPB+7wRYBO5Q4QlGAKFtRzqiKnmZBwToIlGfKDaluUno
 ss9qnhXiNoZ8oK+6PJi95RcwIsH/QDBYKwwaj865scrSKyti6ii4yHynOYy4Y6gHhQ
 BbVKjgF3U+iz2q0/PI8fwECDeEcqL1i/LoNS/zNc=
Message-ID: <9d4496aa-e479-ccf1-662f-d07c899f3926@ispras.ru>
Date: Thu, 19 Jan 2023 12:28:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: reverse-{debugging,continue} not working on v7.2.0, i386 guest
Content-Language: en-US
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <Y8eOSedPWlOjriho@localhost>
 <cf7bf2cb-b142-6658-5778-081d5b3b4c2b@ispras.ru> <Y8eyGAr3JUz0J18P@localhost>
 <07fb4654-d019-9279-c386-7694330e5a42@ispras.ru> <Y8jJrYfA7kC/4jYk@hyeyoo>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <Y8jJrYfA7kC/4jYk@hyeyoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19.01.2023 07:40, Hyeonggon Yoo wrote:
> On Wed, Jan 18, 2023 at 12:39:16PM +0300, Pavel Dovgalyuk wrote:
>> Sometimes replay (or reverse debugging) have problems due to incomplete or
>> incorrect virtual device save/load implementation.
>>
>> Can you try removing -cpu from your command line?
>>
>> Or you can provide the files you load and I'll debug this case.
> 
> Ah, sorry to bother. I installed breakpoint _after_ kernel panic,
> and installing breakpoint before boot worked fine. Every seems great!

Glad to hear that.

> 
> Just a side question, is there a reason QEMU record/replay
> does not support -smp N (> 1)? is this feature planed, or should I use
> other tools to debug SMP bugs?

Parallel SMP deterministic emulation is very hard.
However, I think multiple-cores-on-single-core deterministic emulation 
will be supported someday.

> 
>> On 18.01.2023 11:47, Hyeonggon Yoo wrote:
>>> On Wed, Jan 18, 2023 at 10:12:48AM +0300, Pavel Dovgalyuk wrote:
>>>> As replay works well, the reverse debugging should be ok too.
>>>> But for "going back" it needs a VM snapshot that can be used for reload.
>>>>
>>>> Snapshots are saved on qcow2 images connected to QEMU.
>>>> Therefore you need to add an empty qcow2 to your command line with the
>>>> following option: -drive file=empty.qcow2,if=none,id=rr
>>>
>>> Oh, I guessed it's possible to reverse-debug without snapshot,
>>> and your comments definitely helped! adding empty disk and snapshotting solved it.
>>>
>>> But I faced another problem:
>>>
>>> (gdb) b __list_del_entry_valid
>>> (gdb) reverse-continue
>>>
>>> (it stuck forever)
>>> ^C
>>> (gdb) info registers
>>> eax            0xefe19f74          -270426252
>>> ecx            0x0                 0
>>> edx            0xefe19f74          -270426252
>>> ebx            0xf6ff4620          -151042528
>>> esp            0xc02e9a34          0xc02e9a34
>>> ebp            0xc02e9a6c          0xc02e9a6c
>>> esi            0xc4fffb20          -989856992
>>> edi            0xefe19f70          -270426256
>>> eip            0xc1f38400          0xc1f38400 <__list_del_entry_valid>
>>> eflags         0x6                 [ IOPL=0 PF ]
>>> cs             0x60                96
>>> ss             0x68                104
>>> ds             0x7b                123
>>> es             0x7b                123
>>> fs             0xd8                216
>>> gs             0x0                 0
>>> fs_base        0x31cb4000          835403776
>>> gs_base        0x0                 0
>>> k_gs_base      0x0                 0
>>> cr0            0x80050033          [ PG AM WP NE ET MP PE ]
>>> cr2            0xffcb1000          -3469312
>>> cr3            0x534e000           [ PDBR=0 PCID=0 ]
>>> cr4            0x406d0             [ PSE MCE PGE OSFXSR OSXMMEXCPT OSXSAVE ]
>>> cr8            0x1                 1
>>> efer           0x0                 [ ]
>>>
>>> it stuck here and it's not 'last breakpoint hit' from the panic
>>> (it's early in boot), and stepi, nexti, continue commands do not work and
>>> there's no forward progress. (eip doesn't change)
>>>
>>> Did I miss something or did something wrong?
>>>
>>> thank you so much with your help.
>>>
>>> --
>>> Best regards,
>>> Hyeonggon
>>>
>>>>
>>>> And you also need to add rrsnapshot to icount for creating the snapshot at
>>>> the start of VM execution:
>>>> -icount shift=auto,rr=record,rrfile=$REPLAY_FILE,rrsnapshot=start
>>>>
>>>>
>>>> On 18.01.2023 09:14, Hyeonggon Yoo wrote:
>>>>> Hello QEMU folks.
>>>>> I was struggling to fix a recent heisenbug in the Linux kernel,
>>>>> and fortunately the bug was reproducible with TCG and -smp 1.
>>>>>
>>>>> I'm using qemu version 7.2.0, and guest architecture is i386.
>>>>> I tried to inspect the bug using record/replay and reverse-debugging
>>>>> feature in the QEMU.
>>>>>
>>>>>
>>>>> recorded with:
>>>>>
>>>>> qemu-system-i386 \
>>>>>            -icount shift=auto,rr=record,rrfile=$REPLAY_FILE \
>>>>>            -kernel arch/x86/boot/bzImage \
>>>>>            -cpu SandyBridge \
>>>>>            -initrd debian-i386.cgz \
>>>>>            -smp 1 \
>>>>>            -m 1024 \
>>>>>            -nographic \
>>>>>            -net none \
>>>>>            -append "page_owner=on console=ttyS0"
>>>>>
>>>>> and replayed with:
>>>>>
>>>>> qemu-system-i386 \
>>>>>            -icount shift=auto,rr=replay,rrfile=$REPLAY_FILE \
>>>>>            -kernel arch/x86/boot/bzImage \
>>>>>            -cpu SandyBridge \
>>>>>            -initrd debian-i386.cgz \
>>>>>            -smp 1 \
>>>>>            -m 1024 \
>>>>>            -nographic \
>>>>>            -net none \
>>>>>            -s \
>>>>>            -append "page_owner=on console=ttyS0"
>>>>>
>>>>> (I'm using a initrd image instead of a disk file.)
>>>>>
>>>>> The record and replay works well. The bug is reliably reproduced
>>>>> when relaying. but when I try to reverse-continue or reverse-stepi after
>>>>> kernel panic, the gdb only says:
>>>>>
>>>>> 	"remote failure reply 'E14'"
>>>>>
>>>>> Is there something I'm missing, or record/replay do not work with
>>>>> QEMU v7.2.0 or i386?
>>>>>
>>>>> --
>>>>> Best regards,
>>>>> Hyeonggon
>>>>
>>
> 


