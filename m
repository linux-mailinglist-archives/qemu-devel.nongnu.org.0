Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB036116C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:51:19 +0200 (CEST)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX698-0004Ld-3s
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lX5dz-0005E5-MR; Thu, 15 Apr 2021 13:19:07 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:44439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lX5dp-0007eo-Ii; Thu, 15 Apr 2021 13:19:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 79F9725C5E9;
 Thu, 15 Apr 2021 19:18:47 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Apr
 2021 19:18:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005299d6363-7978-4634-8674-a9eb0ed4637f,
 223986A87AF8D074E4FEF7B99352A100DDD0E9F0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
Date: Thu, 15 Apr 2021 19:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 50e4b46c-3d43-4c0c-a7f2-a452ee3c2f8d
X-Ovh-Tracer-Id: 8464234028943444841
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 5:55 PM, Philippe Mathieu-Daudé wrote:
> On 4/15/21 4:54 PM, Peter Maydell wrote:
>> On Thu, 15 Apr 2021 at 15:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> --8<---------------cut here---------------start------------->8---
>>> accel/tcg: avoid re-translating one-shot instructions
>>>
>>> By definition a single instruction is capable of being an IO
>>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>>> a non-cached translation which would only do exactly this anyway.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>> accel/tcg/translate-all.c | 2 +-
>>>
>>> modified   accel/tcg/translate-all.c
>>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>>
>>>      if (phys_pc == -1) {
>>>          /* Generate a one-shot TB with 1 insn in it */
>>> -        cflags = (cflags & ~CF_COUNT_MASK) | 1;
>>> +        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>>      }
>>>
>>>      max_insns = cflags & CF_COUNT_MASK;
>>> --8<---------------cut here---------------end--------------->8---
>>
>> Yes, this fixes the problem. Do we want to put this in for 6.0? My
>> feeling is that executing from non-RAM is pretty niche, so maybe
>> if we need an rc4 anyway, but this isn't important enough to cause an
>> rc4 itself.
> 
> Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing Cédric).

You need to set the 'execute-in-place' machine option to load/execute the
instructions from the AHB window of CE0. It's not on by default because 
boot can be really slow with some recent u-boot which heavily trash the TBs.

But this seems to work fine with -rc3. 

C. 

