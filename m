Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF1D4A5871
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:23:56 +0100 (CET)
Received: from localhost ([::1]:42092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEoSB-0000eC-Rq
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:23:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEo6l-0005Bv-5N
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:01:49 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:46077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEo6j-00017v-5u
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:01:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AF2C823912;
 Tue,  1 Feb 2022 08:01:40 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:01:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0039b531be2-7841-4363-b41c-40d20d2b8b1e,
 FC28BB27814F05D37416E671BAFA2F1ED858982E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <67473aa8-d0de-d4d9-1b5d-9129c6b4e3b8@kaod.org>
Date: Tue, 1 Feb 2022 09:01:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 02/41] target/ppc: 603: fix restore of GPRs 0-3 on rfi
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220131110811.619053-1-clg@kaod.org>
 <20220131110811.619053-3-clg@kaod.org>
 <b878009a-cf35-1465-9bae-11d50ac84241@ilande.co.uk>
 <6f79d6b9-fa49-dd33-412a-05249df3971a@kaod.org>
 <1ec3a3f5-3ee9-199d-35d8-50d3e772b050@ilande.co.uk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1ec3a3f5-3ee9-199d-35d8-50d3e772b050@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 06b1b369-d227-44bc-954f-92372deb5510
X-Ovh-Tracer-Id: 16781538112003935081
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgedvgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 20:08, Mark Cave-Ayland wrote:
> On 31/01/2022 17:50, Cédric Le Goater wrote:
> 
>>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>>> index bc646c67a0f5..980f62fd7964 100644
>>>> --- a/target/ppc/excp_helper.c
>>>> +++ b/target/ppc/excp_helper.c
>>>> @@ -1164,6 +1164,10 @@ static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>>>>       /* MSR:POW cannot be set by any form of rfi */
>>>>       msr &= ~(1ULL << MSR_POW);
>>>> +    /* MSR:TGPR cannot be set by any form of rfi */
>>>> +    if (env->flags & POWERPC_FLAG_TGPR)
>>>> +        msr &= ~(1ULL << MSR_TGPR);
>>>> +
>>>>   #if defined(TARGET_PPC64)
>>>>       /* Switching to 32-bit ? Crop the nip */
>>>>       if (!msr_is_64bit(env, msr)) {
>>>
>>> Have you tried a pre-PR push to Gitlab CI for your pull-ppc-20220130 tag? I'd expect this to fail the check-patch job due to the missing braces around the if() statement.
>>
>> It seems that ctx_statement_block() is confused because
>> the patch ends with a '{'.
> 
> Nice work! My experience with Perl is fairly minimal so that would have probably taken me some time to figure out.

Fixing the issue is another story. This part looks like forth to me !

Thanks,

C.

