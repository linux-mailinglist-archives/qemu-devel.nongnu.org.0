Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B3607973
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:23:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsvn-0004Km-Tm
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:23:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsvi-00063i-CG
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olsvG-0003TO-TE; Fri, 21 Oct 2022 10:22:56 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1olsvD-0004QZ-SN; Fri, 21 Oct 2022 10:22:54 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 11:21:47 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 781708001F1;
 Fri, 21 Oct 2022 11:21:47 -0300 (-03)
Message-ID: <c3f938c1-17ba-9052-030a-54993ece1a46@eldorado.org.br>
Date: Fri, 21 Oct 2022 11:21:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 00/29] PowerPC interrupt rework
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org, farosas@linux.ibm.com
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <56d9bc9d-65ac-05a5-d35b-4d64766687a4@gmail.com>
 <3cf56329-4513-d983-88da-4265a1d5f677@gmail.com>
 <d47b8750-02d8-ed94-78d6-4fcbd7b92c56@eldorado.org.br>
 <0fc9927d-44cd-8260-1a4d-810364946973@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <0fc9927d-44cd-8260-1a4d-810364946973@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2022 14:21:47.0861 (UTC)
 FILETIME=[744E7050:01D8E558]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 21/10/2022 07:56, Daniel Henrique Barboza wrote:
> Matheus,
> 
> I did some digging yesterday. There are 2 distinct things happening:
> 
> - the apparent problem with the avocado test. After doing more and more 
> tests
> it seems like the test failure rate is lower than 10%. With a simple script
> to exercise it in my laptop:
> 
> n=1
> while [ 1 ]; do
>         make -j check-avocado \
>                 
> AVOCADO_TESTS='tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_e500' ;
>         if [ $? -ne 0 ]; then
>                 echo "test failed after $n interactions"
>                 exit 1
>         fi
>         ((n=n+1))
> done
> 
> In master I managed to get up to 100+ runs without failure. Sometimes I 
> get 90,
> 50, 30 runs before failure and so on. This is an OK failure rate in my 
> opinion,
> so if any code contribution does not dramatically increase this failure 
> rate I'm
> fine with it. This also means that I'll not be skipping the test.
> 

Thanks for this testing, I suspect we may have more than one bug that 
causes this test failure.

> - back to this series, I couldn't manage to get a single successful run 
> with
> patch 27 applied. On the other hand, running the aforementioned script with
> patches 1-26 I just got 96 test runs before the first failure. This is 
> enough
> evidence for me to believe that, yeah, patch 27 is really doing 
> something that is
> messing with the icount replay for e500 one way or the other.
>
Patch 27 is definitely wrong - other places that write in special 
registers and SPRs that may cause an interrupt (e.g., 
gen_helper_store_decr, gen_mtmsr[d]) call gen_io_start, so we also 
should use it before helper_ppc_maybe_interrupt. Without that call, we 
hit the cpu_abort in icount_handle_interrupt when using icount if 
writee[i] unmasks a pending interrupt.

The current writee[i] may be wrong in not calling it too, as it may 
cause an interrupt to be delivered. However, before the interrupt 
rework, CPU_INTERRUPT_HARD was set somewhere else, so it wouldn't 
trigger the abort.

That said, even after adding this call I still see failures after ~200 
iterations of this test, so we may have more problems to tackle here. 
However, it's not a CPU abort anymore, the second QEMU invocation exits 
with zero without writing anything to the console.

> 
> All that said, patches 1-26 are queued in ppc-next.
> 
> 
> On 10/20/22 10:40, Matheus K. Ferst wrote:
>> On 20/10/2022 08:18, Daniel Henrique Barboza wrote:
>>> On 10/19/22 18:55, Daniel Henrique Barboza wrote:
>>>> Matheus,
>>>>
>>>> This series fails 'make check-avocado' in an e500 test. This is the 
>>>> error output:
>>>
>>> Scrap that.
>>>
>>> This avocado test is also failing on master 10% of the time, give or 
>>> take.
>>> It might be case that patch 27 makes the failure more consistent, but 
>>> I can't
>>> say it's the culprit.
>>>
>>>
>>> I'll take a closer look and see if I can diagnose one particular 
>>> commit that
>>> is making the patch fail 1 out of 10 times. It can be case where I 
>>> might need
>>> to skip the test altogether.
>>>
>>
>> Nice catch. I guess we need a gen_icount_io_start before calling 
>> helper_ppc_maybe_interrupt, so maybe it's better to make a 
>> gen_ppc_maybe_interrupt that calls icount and the helper. I'll give it 
>> a bit more testing and re-spin the series.
> 
> 
> Don't need to re-spin everything (unless you needed to do some changes in
> the patches prior). Just resend patch 27+.
> 
> 

Ok, I'll send 27-29 with based on ppc-next.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


