Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D918597014
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:46:18 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJNA-0002N5-3w
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJJF-0005b6-Q4; Wed, 17 Aug 2022 09:42:13 -0400
Received: from [200.168.210.66] (port=58716 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oOJJE-0005vr-0d; Wed, 17 Aug 2022 09:42:13 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 17 Aug 2022 10:42:07 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id AA82E800134;
 Wed, 17 Aug 2022 10:42:06 -0300 (-03)
Message-ID: <524ce4b2-a5f3-3b42-3d49-d44aa33dadf4@eldorado.org.br>
Date: Wed, 17 Aug 2022 10:42:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 00/13] PowerPC interrupt rework
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <012f86ce-25da-a42d-3a36-f13f64c248e9@kaod.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <012f86ce-25da-a42d-3a36-f13f64c248e9@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Aug 2022 13:42:07.0123 (UTC)
 FILETIME=[246CE630:01D8B23F]
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

On 15/08/2022 17:02, Cédric Le Goater wrote:
> [ Adding Fabiano who reworked all exception models for 7.0 and Nick
>    who rewrote the Linux side sometime ago ]
> 
> On 8/15/22 18:20, Matheus Ferst wrote:
>> Currently, PowerPC interrupts are handled as follows:
>>
>> 1) The CPU_INTERRUPT_HARD bit of cs->interrupt_request gates all
>>     interrupts;
>> 2) The bits of env->pending_interrupts identify which particular
>>     interrupt is raised;
>> 3) ppc_set_irq can be used to set/clear env->pending_interrupt bit and
>>     CPU_INTERRUPT_HARD, but some places access env->pending_interrupt
>>     directly;
>> 4) ppc_cpu_exec_interrupt is called by cpu_handle_interrupt when
>>     cs->interrupt_request indicates that there is some interrupt pending.
>>     This method checks CPU_INTERRUPT_HARD and calls ppc_hw_interrupt. If
>>     env->pending_interrupt is zero after this call, CPU_INTERRUPT_HARD
>>     will be cleared.
>> 5) ppc_hw_interrupt checks if there is any unmasked interrupt and calls
>>     powerpc_excp with the appropriate POWERPC_EXCP_* value. The method
>>     will also reset the corresponding bit in env->pending_interrupt for
>>     interrupts that clear on delivery.
>>
>> If all pending interrupts are masked, CPU_INTERRUPT_HARD will be set,
>> but ppc_hw_interrupt will not deliver or clear the interrupt, so
>> CPU_INTERRUPT_HARD will not be reset by ppc_cpu_exec_interrupt. With
>> that, cs->has_work keeps returning true, creating a loop that acquires
>> and release qemu_mutex_lock_iothread, causing the poor performance
>> reported in [1].
>>
>> This patch series attempts to rework the PowerPC interrupt code to set
>> CPU_INTERRUPT_HARD only when there are unmasked interrupts. Then
>> cs->has_work can be simplified to a check of CPU_INTERRUPT_HARD, so it
>> also only returns true when at least one interrupt can be delivered.
>>
>> To achieve that, we are basically following Alex Bannée's suggestion[2]
>> in the original thread: the interrupt masking logic will be factored
>> out of ppc_hw_interrupt in a new method, ppc_pending_interrupts. This
>> method is then used to decide if CPU_INTERRUPT_HARD should be set or
>> cleared after changes to MSR, LPCR, env->pending_interrupts, and
>> power-management instructions.
>>
>> We used [3] to check for regressions at each patch in this series. After
>> patch 12, booting a powernv machine with a newer skiboot with "-smp 4"
>> goes from 1m09s to 20.79s.
> 
> whaou ! PowerNV is really an heavy weight platform, so that's a great
> improvement.
> 

Note that this result uses Frederic's test case, where one CPU 
decompresses the kernel and the others keep spinning to deliver a masked 
decrement interrupt. The improvement may not be that great with other 
workloads.

> Did you try KVM guests under PowerNV (L1 under an emulated L0) and KVM
> under pseries (L2 under an emulated L1) ? Try some intensive I/O on a
> SMP machine, like a large scp transfer.
> 

So far, I have mainly tested with buildroot boot+poweroff. I'll try 
these other tests too.

> We should try the MacOS images also.
> 
> Thanks,
> 
> C.

Unfortunately, I can't test with MacOS :/

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

