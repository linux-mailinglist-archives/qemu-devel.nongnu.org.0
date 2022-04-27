Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDAE51123C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 09:17:07 +0200 (CEST)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njbv8-0005lw-Hk
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 03:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njboc-0002Ie-FZ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:10:22 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:35141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njboa-0002Nt-5k
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:10:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C87822126F;
 Wed, 27 Apr 2022 07:10:15 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 09:10:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00364a010f4-c6fa-486a-ac98-955a272b7b01,
 17BF23367636C0D6DAFD61CED3DAD67CB3096C97) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <eb7ec5f6-effb-fba5-21fa-60707754f9d3@kaod.org>
Date: Wed, 27 Apr 2022 09:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/7] VSX MMA Implementation
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, "Lucas Mateus Castro(alqotel)"
 <lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <CACPK8Xea8cE3bAPKqDDgQ671m+rxTo57OPYrDTBOEDrpLSD9tg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xea8cE3bAPKqDDgQ671m+rxTo57OPYrDTBOEDrpLSD9tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0f6ba559-8d8a-4ff7-ab43-ab1eae7b53eb
X-Ovh-Tracer-Id: 17030080519717882802
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffgefgkeevvedvvdffleefheelfffhhfetgeekudeuveffffekjeeiveffledthfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 4/27/22 08:21, Joel Stanley wrote:
> On Tue, 26 Apr 2022 at 12:51, Lucas Mateus Castro(alqotel)
> <lucas.araujo@eldorado.org.br> wrote:
>>
>> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
>>
>> This patch series is an RFC of the Matrix-Multiply Assist (MMA)
>> instructions implementation from the PowerISA 3.1
>>
>> These and the VDIV/VMOD implementation are the last new PowerISA 3.1
>> instructions left to be implemented.
>>
>> Thanks
>> Lucas Mateus Castro (alqotel) (7):
>>    target/ppc: Implement xxm[tf]acc and xxsetaccz
>>    target/ppc: Implemented xvi*ger* instructions
>>    target/ppc: Implemented pmxvi*ger* instructions
>>    target/ppc: Implemented xvf*ger*
>>    target/ppc: Implemented xvf16ger*
>>    target/ppc: Implemented pmxvf*ger*
>>    target/ppc: Implemented [pm]xvbf16ger2*
> 
> I have a small test case for the MMA instructions that Alistair wrote
> a while back[1]. It passes when run with these patches applied
> (previously it would sigill).

Could we have your Tested-by then ?


> 
> $ qemu-ppc64le -cpu power10  -L ~/ppc64le/ ./test -m
> Smoke test MMA
> MMA[0] = 1 (Correct)
> MMA[1] = 2 (Correct)
> MMA[2] = 3 (Correct)
> MMA[3] = 4 (Correct)
> MMA[4] = 2 (Correct)
> MMA[5] = 4 (Correct)
> MMA[6] = 6 (Correct)
> MMA[7] = 8 (Correct)
> MMA[8] = 3 (Correct)
> MMA[9] = 6 (Correct)
> MMA[10] = 9 (Correct)
> MMA[11] = 12 (Correct)
> MMA[12] = 4 (Correct)
> MMA[13] = 8 (Correct)
> MMA[14] = 12 (Correct)
> MMA[15] = 16 (Correct)
> 
> [1] https://github.com/shenki/p10_tests

Looks like a good candidate for tests/tcg/ppc64le/. Adding Matheus and Leandro.

Thanks,

C.



> 
> 
>>
>>   include/fpu/softfloat.h             |   9 ++
>>   target/ppc/cpu.h                    |  15 +++
>>   target/ppc/fpu_helper.c             | 130 ++++++++++++++++++
>>   target/ppc/helper.h                 |   7 +
>>   target/ppc/insn32.decode            |  49 +++++++
>>   target/ppc/insn64.decode            |  80 +++++++++++
>>   target/ppc/int_helper.c             |  85 ++++++++++++
>>   target/ppc/internal.h               |  28 ++++
>>   target/ppc/translate/vsx-impl.c.inc | 200 ++++++++++++++++++++++++++++
>>   9 files changed, 603 insertions(+)
>>
>> --
>> 2.31.1
>>
>>


