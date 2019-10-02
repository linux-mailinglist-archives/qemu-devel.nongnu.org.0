Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E0AC90AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 20:20:31 +0200 (CEST)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFjEk-0002kk-5R
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 14:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iFjDU-0002H1-RL
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 14:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iFjDR-0001Db-NT
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 14:19:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46228)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iFjDP-0001Cz-IU; Wed, 02 Oct 2019 14:19:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EE713066FA7;
 Wed,  2 Oct 2019 18:19:06 +0000 (UTC)
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48A62608C0;
 Wed,  2 Oct 2019 18:19:05 +0000 (UTC)
Subject: Re: [PATCH v2] s390x/tcg: MVCL: Exit to main loop if requested
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20191002082636.7739-1-david@redhat.com>
 <87zhijjwph.fsf@linaro.org> <0479ad1f-348e-ed40-c2c6-aef168afdb7e@linaro.org>
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
Message-ID: <271321d9-e43b-7a84-341b-17eb91972ada@redhat.com>
Date: Wed, 2 Oct 2019 20:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0479ad1f-348e-ed40-c2c6-aef168afdb7e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 02 Oct 2019 18:19:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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

On 02.10.19 18:47, Richard Henderson wrote:
> On 10/2/19 2:58 AM, Alex Benn=C3=A9e wrote:
>>
>> David Hildenbrand <david@redhat.com> writes:
>>
>>> MVCL is interruptible and we should check for interrupts and process
>>> them after writing back the variables to the registers. Let's check
>>> for any exit requests and exit to the main loop.
>>>
>>> When booting Fedora 30, I can see a handful of these exits and it see=
ms
>>> to work reliable. (it never get's triggered via EXECUTE, though)
>>>
>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>
>>> v1 -> v2:
>>> - Check only if icount_decr.u32 < 0
>>> - Drop should_interrupt_instruction() and perform the check inline
>>> - Rephrase comment, subject, and description
>>>
>>> ---
>>>  target/s390x/mem_helper.c | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
>>> index 4254548935..87e4ebd169 100644
>>> --- a/target/s390x/mem_helper.c
>>> +++ b/target/s390x/mem_helper.c
>>> @@ -1015,6 +1015,7 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint3=
2_t r1, uint32_t r2)
>>>      uint64_t srclen =3D env->regs[r2 + 1] & 0xffffff;
>>>      uint64_t src =3D get_address(env, r2);
>>>      uint8_t pad =3D env->regs[r2 + 1] >> 24;
>>> +    CPUState *cs =3D env_cpu(env);
>>>      S390Access srca, desta;
>>>      uint32_t cc, cur_len;
>>>
>>> @@ -1065,7 +1066,14 @@ uint32_t HELPER(mvcl)(CPUS390XState *env, uint=
32_t r1, uint32_t r2)
>>>          env->regs[r1 + 1] =3D deposit64(env->regs[r1 + 1], 0, 24, de=
stlen);
>>>          set_address_zero(env, r1, dest);
>>>
>>> -        /* TODO: Deliver interrupts. */
>>> +        /*
>>> +         * MVCL is interruptible. Check if somebody (e.g., cpu_inter=
rupt() or
>>> +         * cpu_exit()) asked us to return to the main loop. In case =
there is
>>> +         * no deliverable interrupt, we'll end up back in this handl=
er.
>>> +         */
>>> +        if
>>> (unlikely((int32_t)atomic_read(&cpu_neg(cs)->icount_decr.u32) < 0)) {
>>
>> I'm not sure about directly checking the icount_decr here. It really i=
s
>> an internal implementation detail for the generated code.
>=20
> But it's also the exact right thing to test.
>=20
>=20
>> Having said
>> that is seems cpu_interrupt() is messing with this directly rather tha=
n
>> calling cpu_exit() which sets the more easily checked &cpu->exit_reque=
st.
>>
>> This is potentially problematic as in other points in the cpu loop cod=
e
>> you see checks like this:
>>
>>     /* Finally, check if we need to exit to the main loop.  */
>>     if (unlikely(atomic_read(&cpu->exit_request))
>>         || (use_icount
>>             && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra =3D=
=3D 0)) {
>>         atomic_set(&cpu->exit_request, 0);
>>         if (cpu->exception_index =3D=3D -1) {
>>             cpu->exception_index =3D EXCP_INTERRUPT;
>>         }
>>         return true;
>>     }
>>
>> although I guess this is because interrupts and "exits" take subtly
>> different paths through the outer loop. Given that exits and interrupt=
s
>> are slightly different is what you want to check
>> atomic_read(&cpu->interrupt_request))?
>=20
> No, this is not about interrupts per se.
>=20
> The thing we're trying to solve here is MVCL running for a long time.  =
The
> length operand is 24 bits, so max 16MB can be copied with one instructi=
on.  We
> want to exit back to the main loop early when told to do so, as the ins=
n is
> officially restartable.
>=20
> Ordinarily, I would say move the loop out to the tcg level, but that cr=
eates
> further complications and I'd rather not open up that can of worms.

While that is feasible, I agree that it's not the simplest approach.

>=20
> There is still the special case of EXECUTE of MVCL, which I suspect mus=
t have
> some failure mode that we're not considering -- the setting and clearin=
g of
> ex_value can't help.  I have a suspicion that we need to special case t=
hat
> within helper_ex, just so that ex_value doesn't enter into it.

We could rap that in something like

cpu_cond_loop_exit_restore()

inspired by cond_resched() in the kernel. Then, at least the
implementation specifics are kept where they actually belong.

--=20

Thanks,

David / dhildenb

