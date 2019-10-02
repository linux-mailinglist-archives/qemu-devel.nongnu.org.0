Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842BC480F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 09:06:02 +0200 (CEST)
Received: from localhost ([::1]:52180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFYi0-00076I-Q3
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 03:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iFYh4-0006MB-NP
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iFYh2-0001nW-1e
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:05:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39252)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iFYh1-0001lZ-PP; Wed, 02 Oct 2019 03:04:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 416952543;
 Wed,  2 Oct 2019 07:04:58 +0000 (UTC)
Received: from [10.36.117.58] (ovpn-117-58.ams2.redhat.com [10.36.117.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F00AE5C1D4;
 Wed,  2 Oct 2019 07:04:56 +0000 (UTC)
Subject: Re: [PATCH v1] s390x/tcg: MVCL: Exit to main loop if there are
 pending interrupts
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191001181655.25948-1-david@redhat.com>
 <720221d3-84a6-9940-812e-b427acfc99ed@linaro.org>
 <42c78e3f-be24-a919-b1b9-0b52381a9214@redhat.com>
 <d4af4bce-b7e9-2418-6706-fb9b7010dc8e@linaro.org>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwX4EEwECACgFAljj9eoCGwMFCQlmAYAGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEE3eEPcA/4Na5IIP/3T/FIQMxIfNzZshIq687qgG
 8UbspuE/YSUDdv7r5szYTK6KPTlqN8NAcSfheywbuYD9A4ZeSBWD3/NAVUdrCaRP2IvFyELj
 xoMvfJccbq45BxzgEspg/bVahNbyuBpLBVjVWwRtFCUEXkyazksSv8pdTMAs9IucChvFmmq3
 jJ2vlaz9lYt/lxN246fIVceckPMiUveimngvXZw21VOAhfQ+/sofXF8JCFv2mFcBDoa7eYob
 s0FLpmqFaeNRHAlzMWgSsP80qx5nWWEvRLdKWi533N2vC/EyunN3HcBwVrXH4hxRBMco3jvM
 m8VKLKao9wKj82qSivUnkPIwsAGNPdFoPbgghCQiBjBe6A75Z2xHFrzo7t1jg7nQfIyNC7ez
 MZBJ59sqA9EDMEJPlLNIeJmqslXPjmMFnE7Mby/+335WJYDulsRybN+W5rLT5aMvhC6x6POK
 z55fMNKrMASCzBJum2Fwjf/VnuGRYkhKCqqZ8gJ3OvmR50tInDV2jZ1DQgc3i550T5JDpToh
 dPBxZocIhzg+MBSRDXcJmHOx/7nQm3iQ6iLuwmXsRC6f5FbFefk9EjuTKcLMvBsEx+2DEx0E
 UnmJ4hVg7u1PQ+2Oy+Lh/opK/BDiqlQ8Pz2jiXv5xkECvr/3Sv59hlOCZMOaiLTTjtOIU7Tq
 7ut6OL64oAq+zsFNBFXLn5EBEADn1959INH2cwYJv0tsxf5MUCghCj/CA/lc/LMthqQ773ga
 uB9mN+F1rE9cyyXb6jyOGn+GUjMbnq1o121Vm0+neKHUCBtHyseBfDXHA6m4B3mUTWo13nid
 0e4AM71r0DS8+KYh6zvweLX/LL5kQS9GQeT+QNroXcC1NzWbitts6TZ+IrPOwT1hfB4WNC+X
 2n4AzDqp3+ILiVST2DT4VBc11Gz6jijpC/KI5Al8ZDhRwG47LUiuQmt3yqrmN63V9wzaPhC+
 xbwIsNZlLUvuRnmBPkTJwwrFRZvwu5GPHNndBjVpAfaSTOfppyKBTccu2AXJXWAE1Xjh6GOC
 8mlFjZwLxWFqdPHR1n2aPVgoiTLk34LR/bXO+e0GpzFXT7enwyvFFFyAS0Nk1q/7EChPcbRb
 hJqEBpRNZemxmg55zC3GLvgLKd5A09MOM2BrMea+l0FUR+PuTenh2YmnmLRTro6eZ/qYwWkC
 u8FFIw4pT0OUDMyLgi+GI1aMpVogTZJ70FgV0pUAlpmrzk/bLbRkF3TwgucpyPtcpmQtTkWS
 gDS50QG9DR/1As3LLLcNkwJBZzBG6PWbvcOyrwMQUF1nl4SSPV0LLH63+BrrHasfJzxKXzqg
 rW28CTAE2x8qi7e/6M/+XXhrsMYG+uaViM7n2je3qKe7ofum3s4vq7oFCPsOgwARAQABwsFl
 BBgBAgAPBQJVy5+RAhsMBQkJZgGAAAoJEE3eEPcA/4NagOsP/jPoIBb/iXVbM+fmSHOjEshl
 KMwEl/m5iLj3iHnHPVLBUWrXPdS7iQijJA/VLxjnFknhaS60hkUNWexDMxVVP/6lbOrs4bDZ
 NEWDMktAeqJaFtxackPszlcpRVkAs6Msn9tu8hlvB517pyUgvuD7ZS9gGOMmYwFQDyytpepo
 YApVV00P0u3AaE0Cj/o71STqGJKZxcVhPaZ+LR+UCBZOyKfEyq+ZN311VpOJZ1IvTExf+S/5
 lqnciDtbO3I4Wq0ArLX1gs1q1XlXLaVaA3yVqeC8E7kOchDNinD3hJS4OX0e1gdsx/e6COvy
 qNg5aL5n0Kl4fcVqM0LdIhsubVs4eiNCa5XMSYpXmVi3HAuFyg9dN+x8thSwI836FoMASwOl
 C7tHsTjnSGufB+D7F7ZBT61BffNBBIm1KdMxcxqLUVXpBQHHlGkbwI+3Ye+nE6HmZH7IwLwV
 W+Ajl7oYF+jeKaH4DZFtgLYGLtZ1LDwKPjX7VAsa4Yx7S5+EBAaZGxK510MjIx6SGrZWBrrV
 TEvdV00F2MnQoeXKzD7O4WFbL55hhyGgfWTHwZ457iN9SgYi1JLPqWkZB0JRXIEtjd4JEQcx
 +8Umfre0Xt4713VxMygW0PnQt5aSQdMD58jHFxTk092mU+yIHj5LeYgvwSgZN4airXk5yRXl
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <35424050-6341-4613-ff2f-536b4f35162b@redhat.com>
Date: Wed, 2 Oct 2019 09:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d4af4bce-b7e9-2418-6706-fb9b7010dc8e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 02 Oct 2019 07:04:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.10.19 23:59, Richard Henderson wrote:
> On 10/1/19 12:47 PM, David Hildenbrand wrote:
>> On 01.10.19 21:17, Richard Henderson wrote:
>>> On 10/1/19 11:16 AM, David Hildenbrand wrote:
>>>> +static inline bool should_interrupt_instruction(CPUState *cs)
>>>> +{
>>>> +    /*
>>>> +     * Something asked us to stop executing chained TBs, e.g.,
>>>> +     * cpu_interrupt() or cpu_exit().
>>>> +     */
>>>> +    if ((int32_t)atomic_read(&cpu_neg(cs)->icount_decr.u32) < 0) {
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    /* We have a deliverable interrupt pending. */
>>>> +    if ((atomic_read(&cs->interrupt_request) & CPU_INTERRUPT_HARD) &&
>>>> +        s390_cpu_has_int(S390_CPU(cs))) {
>>>> +        return true;
>>>> +    }
>>>> +    return false;
>>>> +}
>>>
>>> The first condition should be true whenever the second condition is true.
>>
>> @@ -1018,6 +1018,7 @@ static inline bool should_interrupt_instruction(CPUState *cs)
>>      /* We have a deliverable interrupt pending. */
>>      if ((atomic_read(&cs->interrupt_request) & CPU_INTERRUPT_HARD) &&
>>          s390_cpu_has_int(S390_CPU(cs))) {
>> +        g_assert((int32_t)atomic_read(&cpu_neg(cs)->icount_decr.u32) < 0);
>>          return true;
>>      }
>>      return false;
>>
>>
>> ...
>>
>>
>> [   60.109761] systemd[1]: Set hostname to <rhel8>.
>> **
>> ERROR:/home/dhildenb/git/qemu/target/s390x/mem_helper.c:1021:should_interrupt_instruction: assertion failed: ((int32_t)atomic_read(&cpu_neg(cs)->icount_decr.u32) < 0)
>>
>>
>> A race? Roughly 20-30% pass the first but not the second check. And
>> in total, on a Fedora 30 boot, I can maybe see 30 calls of
>> should_interrupt_instruction() succeeding.
>>
>> I thought these could be pending interrupts that were not deliverable
>> when injected but are now deliverable. For these,
>> icount_decr.u32.high would already have been set to 0.
>>
>> OTOH, I guess we always exit the TB in case we change the "deliverable" state
>> of an IRQ, e.g., after LPSW or LCTL. E.g.,
>>
>> static DisasJumpType op_lctlg(DisasContext *s, DisasOps *o)
>> {
>> ...
>>     /* Exit to main loop to reevaluate s390_cpu_exec_interrupt.  */
>>     return DISAS_PC_STALE_NOCHAIN;
>> }
>>
>> Maybe really a race then - or we are not properly exiting back to the
>> main loop in all scenarios.
> 
> I think that it's a race right here in should_interrupt_instruction.
> 
> Notice, interrupt_request gets set before icount_decr.  Indeed, the barrier
> happens immediately before the set of icount_decr in cpu_exit().
> 
> (It is briefly confusing that we have a barrier in cpu_exit and not in
> tcg_handle_interrupt.  But that's explained by the cpu_is_self -- no need for a
> barrier for the current cpu.  I also think we could usefully use
> atomic_store_release instead of a separate smp_wmb.)
> 
> Therefore checking interrupt_request after checking icount_decr violates the
> ordering rules.
> 
> This is confirmed, ish, by noticing putting a breakpoint at that second return
> (or assert) and noticing that icount_decr.u16.hi == -1.  It did get set by one
> of the other threads, and before gdb managed to stop the world.

I am still puzzled why I can trigger that many races. I'll do some more
investigation, however, if there would be a deliverable interrupt which
will not set icount_decr.u16.hi == -1, then we would have to fix
something that ionstead. So the second check in this patch can indeed
go, thanks for clarifying!

-- 

Thanks,

David / dhildenb

