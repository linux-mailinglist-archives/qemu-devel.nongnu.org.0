Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51379573C8D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:33:01 +0200 (CEST)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBhAS-0000GI-Dz
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBh6Y-0003vM-Cd; Wed, 13 Jul 2022 14:28:58 -0400
Received: from [200.168.210.66] (port=10455 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBh6V-0001lw-Pj; Wed, 13 Jul 2022 14:28:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 13 Jul 2022 15:28:45 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 2FA588001C2;
 Wed, 13 Jul 2022 15:28:45 -0300 (-03)
Message-ID: <e0b127c3-d849-e9b1-dbe3-0c5188ba4718@eldorado.org.br>
Date: Wed, 13 Jul 2022 15:28:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH] target/ppc: don't print TB in ppc_cpu_dump_state if
 it's not initialized
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, groug@kaod.org
References: <20220712192505.127375-1-matheus.ferst@eldorado.org.br>
 <59ca7363-455a-0181-afc0-63a391cdd19d@gmail.com> <Ys4sIPFmV3CAizpL@yekko>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <Ys4sIPFmV3CAizpL@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 13 Jul 2022 18:28:45.0603 (UTC)
 FILETIME=[630F6F30:01D896E6]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 12/07/2022 23:21, David Gibson wrote:
> On Tue, Jul 12, 2022 at 06:13:44PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 7/12/22 16:25, Matheus Ferst wrote:
>>> When using "-machine none", env->tb_env is not allocated, causing the
>>> segmentation fault reported in issue #85 (launchpad bug #811683). To
>>> avoid this problem, check if the pointer != NULL before calling the
>>> methods to print TBU/TBL/DECR.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>> This patch fixes the reported problem, but may be an incomplete solution
>>> since many other places dereference env->tb_env without checking for
>>> NULL. AFAICS, "-machine none" is the only way to trigger this problem,
>>> and I'm not familiar with the use-cases for this option.
>>
>> The "none"  machine type is mainly used by libvirt to do instrospection
>> of the available options/capabilities of the QEMU binary. It starts a QEMU
>> process like the following:
>>
>> ./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config -nodefaults \
>>        -nographic -machine none,accel=kvm:tcg -daemonize
>>
>> And then it uses QMP to probe the binary.
>>
>> Aside from this libvirt usage I am not aware of anyone else using -machine
>> none extensively.
> 
> Right.  -machine none basically cannot work as a real machine for
> POWER (maybe some other CPUs as well).  At least the more modern POWER
> CPUs simply cannot boot without a bunch of supporting board/system
> level elements, and there's not really a sane way to encode those into
> individual emulated devices at present (maybe ever).
> 
> One of those things is that POWER expects the timebases to be
> synchronized across all CPUs in the system, which obviously can't be
> done locally to a single CPU chip.  It requires system level
> operations, which is why it's handled by the machine type
> 
> [Example: a typical sequence which might be handled in hardware by
>   low-level firmware would be to use machine-specific board-level
>   registers to suspend the clock pulse to the CPUs which drives the
>   timebase, then write the same value to the TB on each CPU, then
>   (atomically) restart the clock pulse using board registers again]
>  

So I guess it's safe to assume that it's impossible to run code with 
"-machine none", and then there would be no reason to check for NULL in 
the mtspr/mfspr path, right?

>>> Should we stop assuming env->tb_env != NULL and add checks everywhere?
>>> Or should we find a way to provide Time Base/Decrementer for
>>> "-machine none"?
>>> ---
>>
>> Are there other cases where env->tb_env can be NULL, aside from the case
>> reported in the bug?
> 
> If there are, I'd say that's a bug in the machine type.  Setting up
> (and synchronizing) the timebase is part of the machine's job.
> 

With "-machine none", it seems that the only places where it could 
happen are:

i) Monitor code: there are some other places where env_tb is used, like 
monitor_get_tb{u,l} and monitor_get_decr, so commands like "p $tbu" or 
"p $dect" cause a segfault too.
ii) mtspr/mfspr: it shouldn't be a problem if it's not possible to run 
code without a machine.
iii) gdbstub: we're not reading or setting TB{U,L} from gdb, which may 
be an issue on its own, but not related to #85.

>> I don't mind the bug fix, but I'm not fond of the idea of adding additional
>> checks because of this particular issue. I mean, the bug is using  the 'prep'
>> machine that Thomas removed year ago in b2ce76a0730. If there's no other
>> foreseeable problem, that we care about, with env->tb_env being NULL, IMO
>> let's fix the bug and move on.
>>

I'll send a v2 fixing the other segfault in monitor, and then I guess we 
have a complete solution. Thanks Daniel and David for the feedback.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

