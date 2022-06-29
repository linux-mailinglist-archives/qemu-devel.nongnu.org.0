Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF41560B4A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 22:56:57 +0200 (CEST)
Received: from localhost ([::1]:53176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ek4-0001O8-Ff
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 16:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6eis-0000X4-KW
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:55:42 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6eip-0007Rs-6I
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 16:55:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6CFC3112B70F8;
 Wed, 29 Jun 2022 22:55:34 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 22:55:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043e6b207a-363b-4a5e-9702-9d3b9066cc88,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <162badcf-fb35-11db-34b2-3957c8a21751@kaod.org>
Date: Wed, 29 Jun 2022 22:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Slowness with multi-thread TCG?
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, "Matheus K. Ferst"
 <matheus.ferst@eldorado.org.br>
CC: Frederic Barrat <fbarrat@linux.ibm.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
 <87h744keg7.fsf@linaro.org>
 <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
 <8735fojukm.fsf@linaro.org>
 <44596e63-1631-ee12-231c-15be9c914a74@linux.ibm.com>
 <9c97ae8f-f733-21fc-97d1-99af971e38fd@eldorado.org.br>
 <87ilojgzfs.fsf@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87ilojgzfs.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ffb953d5-7bd6-4037-8131-369b99b3a02d
X-Ovh-Tracer-Id: 13566530928807087011
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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

On 6/29/22 19:13, Alex Bennée wrote:
> 
> "Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:
> 
>> On 29/06/2022 12:36, Frederic Barrat wrote:
>>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que
>>> você possa confirmar o remetente e saber que o conteúdo é seguro. Em
>>> caso de e-mail suspeito entre imediatamente em contato com o DTI.
>>> On 29/06/2022 00:17, Alex Bennée wrote:
>>>> If you run the sync-profiler (via the HMP "sync-profile on") you can
>>>> then get a breakdown of which mutex's are being held and for how long
>>>> ("info sync-profile").
>>> Alex, a huge thank you!
>>> For the record, the "info sync-profile" showed:
>>> Type               Object  Call site                     Wait Time (s)
>>>          Count  Average (us)
>>> --------------------------------------------------------------------------------------------------
>>> BQL mutex  0x55eb89425540  accel/tcg/cpu-exec.c:744
>>> 96.31578
>>>       73589937          1.31
>>> BQL mutex  0x55eb89425540  target/ppc/helper_regs.c:207        0.00150
>>>           1178          1.27
>>> And it points to a lock in the interrupt delivery path, in
>>> cpu_handle_interrupt().
>>> I now understand the root cause. The interrupt signal for the
>>> decrementer interrupt remains set because the interrupt is not being
>>> delivered, per the config. I'm not quite sure what the proper fix is yet
>>> (there seems to be several implementations of the decrementer on ppc),
>>> but at least I understand why we are so slow.
>>>
>>
>> To summarize what we talked elsewhere:
>> 1 - The threads that are not decompressing the kernel have a pending
>> PPC_INTERRUPT_DECR, and cs->interrupt_request is CPU_INTERRUPT_HARD;
> 
> I think ppc_set_irq should be doing some gating before calling to set
> cs->interrupt_request.
> 
>> 2 - cpu_handle_interrupt calls ppc_cpu_exec_interrupt, that calls
>> ppc_hw_interrupt to handle the interrupt;
>> 3 - ppc_cpu_exec_interrupt decides that the interrupt cannot be
>> delivered immediately, so the corresponding bit in
>> env->pending_interrupts is not reset;
> 
> Is the logic controlled by ppc_hw_interrupt()? The stuff around
> async_deliver?
> 
> I think maybe some of the logic needs to be factored out and checked
> above. Also anywhere where env->msr is updated would need to check if
> we've just enabled a load of pending interrupts and then call
> ppc_set_irq.
> 
> However I'm not super familiar with the PPC code so I'll defer to the
> maintainers here ;-)


That part is a nightmare with a lot of history. It needs a rewrite.
we have a good testing environment and we should catch regressions.
Not for 7.1 though.



> 
>> 4 - ppc_cpu_exec_interrupt does not change cs->interrupt_request
>> because pending_interrupts != 0, so cpu_handle_interrupt will be
>> called again.
>>
>> This loop will acquire and release qemu_mutex_lock_iothread, slowing
>> down other threads that need this lock.
>>
>>> With a quick hack, I could verify that by moving that signal out of the
>>> way, the decompression time of the kernel is now peanuts, no matter the
>>> number of cpus. Even with one cpu, the 15 seconds measured before was
>>> already a huge waste, so it was not really a multiple-cpus problem.
>>> Multiple cpus were just highlighting it.
>>> Thanks again!
>>>     Fred
> 
> 


