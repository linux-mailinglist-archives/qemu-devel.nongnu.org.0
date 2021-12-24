Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81147EEE9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 14:04:34 +0100 (CET)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0kFM-0002E4-Hk
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 08:04:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1n0kE1-0001MC-8U; Fri, 24 Dec 2021 08:03:09 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1n0kDt-0002Li-Rb; Fri, 24 Dec 2021 08:03:08 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JL6bH6m1HzZdqh;
 Fri, 24 Dec 2021 20:59:39 +0800 (CST)
Received: from dggpeml100022.china.huawei.com (7.185.36.176) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 24 Dec 2021 21:02:51 +0800
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpeml100022.china.huawei.com (7.185.36.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 24 Dec 2021 21:02:51 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.020;
 Fri, 24 Dec 2021 21:02:51 +0800
To: Richard Henderson <richard.henderson@linaro.org>, Oleg Vasilev
 <me@svin.in>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 2/2] accel/tcg: replace phys_pc with asid in TB htable
 key
Thread-Topic: [RFC PATCH 2/2] accel/tcg: replace phys_pc with asid in TB
 htable key
Thread-Index: AQHX91QNy2ZGGleQ50C6S5nMGmROpg==
Date: Fri, 24 Dec 2021 13:02:51 +0000
Message-ID: <e05dd835e5ad4cb9aec3ccf0c7369c30@huawei.com>
References: <20211222164947.634759-1-me@svin.in>
 <20211222164947.634759-3-me@svin.in>
 <3f3440c3-4a1b-a272-c445-58ff7341bfd3@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.162.240]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=vasilev.oleg@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Vasilev Oleg <vasilev.oleg@huawei.com>
From:  Vasilev Oleg via <qemu-devel@nongnu.org>

On 12/23/2021 7:31 PM, Richard Henderson wrote:=0A=
> On 12/22/21 8:50 AM, Oleg Vasilev wrote:=0A=
>> From: Oleg Vasilev <vasilev.oleg@huawei.com>=0A=
>>=0A=
>> Using a physical pc requires to translate address every time next block=
=0A=
>> needs to be found and executed. This also contaminates TLB with code-rel=
ated=0A=
>> records.=0A=
>>=0A=
>> Instead, I suggest we introduce an architecture-specific address space=
=0A=
>> identifier, and use it to distinguish between different AS's=0A=
>> translation blocks.=0A=
> =0A=
> Why do you believe that asid is sufficient here?  You're not invalidating=
 any more TBs =0A=
> that I can see.  What happens when the kernel re-uses an asid?=0A=
=0A=
Hi,=0A=
=0A=
Sorry, I had some comments for the patch, but forgot to put it in.=0A=
=0A=
So, I think I interpret the term "asid" in some other sense, namely, an=0A=
identifier, which is constant during whole lifespan of an address space.=0A=
Same as PID in that sense. Do you think this is a viable approach?=0A=
=0A=
If we assume translation table wouldn't change during process life,=0A=
after the death of the process, all it address space would be anyway=0A=
unmapped and corresponding translation blocks would be invalidated.=0A=
=0A=
=0A=
> =0A=
> I believe this patch to be fundamentally flawed.=0A=
=0A=
Maybe it is, I just wanted to get feedback from you guys. Do you think=0A=
maybe exists some other way, which would not require translating va->pa=0A=
every time to look up next block?=0A=
=0A=
More context is in:=0A=
=0A=
 Subject: Suggestions for TCG performance improvements=0A=
 Date: Thu, 2 Dec 2021 09:47:13 +0000=0A=
 Message-ID: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>=0A=
=0A=
> =0A=
> All that said,=0A=
> =0A=
>> +/* Returns the identifier for a current address space. */=0A=
>> +static uint64_t arm_get_asid(CPUState *cs)=0A=
>> +{=0A=
>> +    ARMCPU *cpu =3D ARM_CPU(cs);=0A=
>> +    CPUARMState *env =3D &cpu->env;=0A=
>> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);=0A=
>> +    uint64_t tcr =3D regime_tcr(env, mmu_idx)->raw_tcr;=0A=
>> +=0A=
>> +#define TCR_A1     (1U << 22)=0A=
>> +    return regime_ttbr(env, mmu_idx, (tcr&TCR_A1)>0);=0A=
>> +}=0A=
> =0A=
> Why are you returning the entire ttbr, and not the asid in the top 16 bit=
s?=0A=
=0A=
Actually, for my particular case I seem to need to return the lowest 40=0A=
bits, which is actual base for TT.=0A=
=0A=
Thanks,=0A=
Oleg=0A=
=0A=
> =0A=
> =0A=
> r~=0A=
> =0A=
=0A=

