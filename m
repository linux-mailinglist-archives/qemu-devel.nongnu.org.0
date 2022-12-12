Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8254064A9BE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 22:50:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qg5-0001ZW-SK; Mon, 12 Dec 2022 16:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4qg3-0001ZK-Qp
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:49:35 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p4qg1-0000tf-OB
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 16:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670881767; bh=jbfvFYaAC2kh6hU8YB8cmuQneNe2u9AfbkHu38yziHs=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=YzqdiiyMr2zWCA+PsX/QWQj3l9SPCjvXN93x9eBAG6OFe0luFwAN6T2DOcXNnTDUI
 HAsrkY/IHtaICfQhnvZgjW7Wong5rgasgZhAmR37+sDEeF7xfFJ9Wnn4vW9Kxr3y6q
 FQCJi+KfJkLE30q63kEJ+YDf70H+Rvc76oEvCi5BvN7fdP7GRNbqijQBG98/QiV+Kz
 YYZd626Ph4ed19j+fkV/hVHjCqEvDnmq2W8mKy7/gKvoxd2baL+KnZBAE+8ttsIumZ
 mg8OPb00fSy5MajtmbWB35qS5WVPtgZfztkedYQsb/qF27rNUBUJ+oC5GCbgXBsSCf
 N5OCeenyHKhkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.137.92]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mKJ-1oswn62Tpz-017BSi; Mon, 12
 Dec 2022 22:49:27 +0100
Message-ID: <ab950366-4248-f0ee-c61d-2785d7df4ebd@gmx.de>
Date: Mon, 12 Dec 2022 22:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Add emulation for MADV_WIPEONFORK and
 MADV_KEEPONFORK in madvise()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org
References: <Y5bRnRaiSOUKRjdW@p100> <20221212211623.73367qpodubiunnp@heavy>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221212211623.73367qpodubiunnp@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vjpnJ6WNEqPdZHinwLBMG1U0cbKSqdqHIXX5bKiICEkPc40QP1c
 vUQVqN3z+cJmoCb5Kc0J+hRJDn2LNWfaFJ7oWdrBOuA2eGl9vPvVmgyFrzyg/Ip0k24iAj5
 tgtaR6kr9kphFgkrT3nhEPKTuz7guyf/7KibjVIK3SxzyuS1DWik5ZFvGMZt1kAmjrwEV2n
 ekei9wJ0WuQ0xdGxSpyRQ==
UI-OutboundReport: notjunk:1;M01:P0:i2LFp46qkY8=;0nXHUONIJtQzNEMGrjtU7NMQ9lN
 h20IyfTIFEcwbRNJZJmllPiIWBukC51Wn2YhbzgZswqhmCS8mk5fQ3YoWghnfpIZVkIJVHziF
 sfgcn/SvI8TZaNm9reCdgPkDXMJbZfL2fH3k7EalusacNxsbpu8k5GHNZ5t7MFakIJmQbuCMq
 BdZBPOc/3Yi0pmehrZVbvboaIrrVlbA/nFh3Di1C2m+6f7UkrK37DJA5VUEiiJ0jPeohnjb7O
 4N4ZzpMFxpUIxsPgGRG1wm7BTNr4SGq8nFZnpPpOJrt2vdCQZ8ozJK/vsXPbNsYUxRPlBZfD8
 fegCB/m8lWj+0WDaAmDMkuROJXaQqcLctd8Un/QAHvx9cSy29bCESa0AHkqY1fDZS3dmCZ80E
 XR7AaqMitYtPgM6rp/LljwJk4KxdDsJ4b8vgkxpkJ14bNQ8PVqdqkvz3Kest/XD+dOHF54FpC
 z7zq2wobQYo46HQkzxRV4KkBvE2KqST72rdWSfTN2VmjZJbHdBbahUowFPtXsQy6BoEYxk5/A
 e4Am1K13vpoZAd9DOoSTjgigUuruMOob5lKQ03j/CFa/+Ou/cbvobtmENi5Tc9yeH0GFYjueI
 cEQXocf3UPXTicsrSIr0/6KN8C9IA08v6mLp5Jgh27madhIZkrNSeQ194bN9m9pBYUrfNU2E1
 gxMpUFaPB2WSbE9KTVfywaZcoav1+8gb51i/b6FgjKFy5D4yFgvemY/lEioF02C9nZ3VuHqVw
 m7W/9GiGafwusJ2MLo/Wm60vYbbn30ieXi+i8g+INy/CI/TzEaUPvjSCsqY9CEKHi1Wel9WWb
 j1vW64phDKbVt1xTe4LXXfj4gIzcdRmJgHKgMqrpBpR+KyTTF8cjSA4/50rgz1LY1lDa01Sqi
 0mgB+Ewz6Ce0euQZIusrWz1h2Hw760pfkukQoPexpQr7vX9YUGtjCCOD1yhAdor/Qe21jovSu
 aT/9sg==
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/12/22 22:16, Ilya Leoshkevich wrote:
> On Mon, Dec 12, 2022 at 08:00:45AM +0100, Helge Deller wrote:
>> Both parameters have a different value on the parisc platform, so first
>> translate the target value into a host value for usage in the native
>> madvise() syscall.
>>
>> Those parameters are often used by security sensitive applications (e.g=
.
>> tor browser, boringssl, ...) which expect the call to return a proper
>> return code on failure, so return -EINVAL if qemu fails to forward the
>> syscall to the host OS.
>>
>> Tested with testcase of tor browser when running hppa-linux guest on
>> x86-64 host.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
>> index 10f5079331..c75342108c 100644
>> --- a/linux-user/mmap.c
>> +++ b/linux-user/mmap.c
>> @@ -901,11 +901,25 @@ abi_long target_madvise(abi_ulong start, abi_ulon=
g len_in, int advice)
>>           return -TARGET_EINVAL;
>>       }
>>
>> +    /* Translate for some architectures which have different MADV_xxx =
values */
>> +    switch (advice) {
>> +    case TARGET_MADV_DONTNEED:      /* alpha */
>> +        advice =3D MADV_DONTNEED;
>> +        break;
>> +    case TARGET_MADV_WIPEONFORK:    /* parisc */
>> +        advice =3D MADV_WIPEONFORK;
>> +        break;
>> +    case TARGET_MADV_KEEPONFORK:    /* parisc */
>> +        advice =3D MADV_KEEPONFORK;
>> +        break;
>> +    /* we do not care about the other MADV_xxx values yet */
>> +    }
>> +
>>       /*
>>        * A straight passthrough may not be safe because qemu sometimes =
turns
>>        * private file-backed mappings into anonymous mappings.
>>        *
>> -     * This is a hint, so ignoring and returning success is ok.
>> +     * For MADV_DONTNEED, which is a hint, ignoring and returning succ=
ess is ok.
>
> Actually, MADV_DONTNEED is one of the few values, which is not always a
> hint - it can be used to e.g. zero out pages.

Right, it _should_ zero out pages and return 0, or otherwise return failur=
e.
I think the problem is that some userspace apps will then sadly break if w=
e
change the current behaviour....

Anyway, in this patch I didn't wanted to touch MAD_DONTNEED.

> As the next paragraph states, strictly speaking, MADV_DONTNEED is
> currently broken, because it can indeed be ignored without indication
> in some cases, but it's still arguably better than not honoring it at
> all.

Yep.

>>        *
>>        * This breaks MADV_DONTNEED, completely implementing which is qu=
ite
>>        * complicated. However, there is one low-hanging fruit: mappings=
 that are
>> @@ -913,11 +927,17 @@ abi_long target_madvise(abi_ulong start, abi_ulon=
g len_in, int advice)
>>        * passthrough is safe, so do it.
>>        */
>>       mmap_lock();
>> -    if (advice =3D=3D TARGET_MADV_DONTNEED &&
>> -        can_passthrough_madv_dontneed(start, end)) {
>> -        ret =3D get_errno(madvise(g2h_untagged(start), len, MADV_DONTN=
EED));
>> -        if (ret =3D=3D 0) {
>> -            page_reset_target_data(start, start + len);
>> +    switch (advice) {
>> +    case MADV_WIPEONFORK:
>> +    case MADV_KEEPONFORK:
>> +        ret =3D -EINVAL;
>> +        /* fall through */
>> +    case MADV_DONTNEED:
>> +        if (can_passthrough_madv_dontneed(start, end)) {
>> +            ret =3D get_errno(madvise(g2h_untagged(start), len, advice=
));
>> +            if ((advice =3D=3D MADV_DONTNEED) && (ret =3D=3D 0)) {
>> +                page_reset_target_data(start, start + len);
>> +            }
>>           }
>>       }
>>       mmap_unlock();
>>
>
> Nit: maybe rename can_passthrough_madv_dontneed() to can_passthrough(),
> since now it's used not only for MADV_DONTNEED?

Maybe can_passthrough_madvise() is better?

> With the MADV_DONTNEED comment change:

Just for me to understand correctly:
You propose that I shouldn't touch that comment in my followup-patch, righ=
t?
That's ok.

> Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

Thanks!
Helge

