Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A518361AE6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:56:21 +0200 (CEST)
Received: from localhost ([::1]:55622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJKu-0004hH-DD
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lXJK6-00045S-Ku
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:55:30 -0400
Received: from 10.mo51.mail-out.ovh.net ([46.105.77.235]:57848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lXJK4-0007tP-GS
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:55:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1DB4F278181;
 Fri, 16 Apr 2021 09:55:23 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 09:55:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001abd74327-f1ae-4712-bcbd-30c04eed69b0,
 98643AE5B40D77660504470F9E4DE59E1F602129) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
 <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
 <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <959e497c-7873-f449-c3d8-546479cccace@kaod.org>
Date: Fri, 16 Apr 2021 09:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 273d0e23-ca36-4178-ad91-255a9d141f3f
X-Ovh-Tracer-Id: 4821947828536642409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelgedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 7:34 PM, Peter Maydell wrote:
> On Thu, 15 Apr 2021 at 18:18, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 4/15/21 5:55 PM, Philippe Mathieu-Daudé wrote:
>>> On 4/15/21 4:54 PM, Peter Maydell wrote:
>>>> On Thu, 15 Apr 2021 at 15:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>> --8<---------------cut here---------------start------------->8---
>>>>> accel/tcg: avoid re-translating one-shot instructions
>>>>>
>>>>> By definition a single instruction is capable of being an IO
>>>>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>>>>> a non-cached translation which would only do exactly this anyway.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>
>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> accel/tcg/translate-all.c | 2 +-
>>>>>
>>>>> modified   accel/tcg/translate-all.c
>>>>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>>>
>>>>>      if (phys_pc == -1) {
>>>>>          /* Generate a one-shot TB with 1 insn in it */
>>>>> -        cflags = (cflags & ~CF_COUNT_MASK) | 1;
>>>>> +        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>>>>      }
>>>>>
>>>>>      max_insns = cflags & CF_COUNT_MASK;
>>>>> --8<---------------cut here---------------end--------------->8---
>>>>
>>>> Yes, this fixes the problem. Do we want to put this in for 6.0? My
>>>> feeling is that executing from non-RAM is pretty niche, so maybe
>>>> if we need an rc4 anyway, but this isn't important enough to cause an
>>>> rc4 itself.
>>>
>>> Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing Cédric).
>>
>> You need to set the 'execute-in-place' machine option to load/execute the
>> instructions from the AHB window of CE0. It's not on by default because
>> boot can be really slow with some recent u-boot which heavily trash the TBs.
>>
>> But this seems to work fine with -rc3.
> 
> Triggering the bug requires both execute-in-place and -icount -- did
> you test with -icount enabled?

It crashes.

Thanks,

C. 

$ qemu-system-arm -M romulus-bmc,execute-in-place=true -icount auto -drive file=./flash-romulus,format=raw,if=mtd  -serial mon:stdio
qemu: fatal: cpu_io_recompile: could not find TB for pc=0x7efbcc001992
R00=0005107a R01=00000000 R02=00000000 R03=00000000
R04=00000350 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=00000000 R14=00000350 R15=00000c70
PSR=400001d3 -Z-- A S svc32
s00=00000000 s01=00000000 d00=0000000000000000
s02=00000000 s03=00000000 d01=0000000000000000
s04=00000000 s05=00000000 d02=0000000000000000
s06=00000000 s07=00000000 d03=0000000000000000
s08=00000000 s09=00000000 d04=0000000000000000
s10=00000000 s11=00000000 d05=0000000000000000
s12=00000000 s13=00000000 d06=0000000000000000
s14=00000000 s15=00000000 d07=0000000000000000
s16=00000000 s17=00000000 d08=0000000000000000
s18=00000000 s19=00000000 d09=0000000000000000
s20=00000000 s21=00000000 d10=0000000000000000
s22=00000000 s23=00000000 d11=0000000000000000
s24=00000000 s25=00000000 d12=0000000000000000
s26=00000000 s27=00000000 d13=0000000000000000
s28=00000000 s29=00000000 d14=0000000000000000
s30=00000000 s31=00000000 d15=0000000000000000
FPSCR: 00000000
Aborted (core dumped)

