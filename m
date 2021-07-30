Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F743DBD87
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 19:14:30 +0200 (CEST)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9W5d-0001Db-Pn
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 13:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m9W4W-0000Oc-3O
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:13:24 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1m9W4T-0002aT-3X
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:13:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 868D9201D9;
 Fri, 30 Jul 2021 17:13:14 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 30 Jul
 2021 19:13:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033562ee39-ffce-4330-8881-d8a2c058e709,
 76D9A100687C30740A262902056384F06FAB8BF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH for-6.2 07/43] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-8-richard.henderson@linaro.org>
 <CAFEAcA-SHZbfEppKBZxVw3+t4VRSRfN7yA4PNNHX9LQ=OkKhjw@mail.gmail.com>
 <b20e658f-f400-3921-a31e-25c0e8451b1e@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e77dc226-68e9-a48c-7e73-06ab0f89f845@kaod.org>
Date: Fri, 30 Jul 2021 19:13:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b20e658f-f400-3921-a31e-25c0e8451b1e@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fd7c5fdc-d7e6-46b3-831d-70c10cab2c24
X-Ovh-Tracer-Id: 3686759247510997984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrheehgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 8:05 PM, Richard Henderson wrote:
> On 7/29/21 3:44 AM, Peter Maydell wrote:
>> On Thu, 29 Jul 2021 at 01:51, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> We ought to have been recording the virtual address for reporting
>>> to the guest trap handler.
>>>
>>> Cc: qemu-ppc@nongnu.org
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/ppc/excp_helper.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index a79a0ed465..0b2c6de442 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -1503,6 +1503,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>>>       CPUPPCState *env = cs->env_ptr;
>>>       uint32_t insn;
>>>
>>> +    env->spr[SPR_DAR] = vaddr;
>>> +
>>
>> Is this the right SPR for all PPC variants? For instance the
>> kernel's code in arch/powerpc/kernel/exceptions-64e.S looks
>> in SPRN_DEAR, which is our SPR_BOOKE_DEAR or SPR_40x_DEAR.

Indeed :/

> I have no idea.  I glanced through a handful of the mmu's, and looked at the current BookS docs, but that's certainly not all.

I took a look at some more and for instance, e300 uses DAR and e500, 405, 476 use DEAR. 

DAR should be consistent over the server processors.

C.

> 
> I'll note that if we do need to set different regs for different mmus, we'll probably want to standardize on this one for user-only, like we did for the user-only copy of ppc_cpu_tlb_fill.
> 
> 
> r~
> 


