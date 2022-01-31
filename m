Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687224A4D97
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:54:42 +0100 (CET)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEasz-0003PE-7k
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEapS-0000Yx-Cq
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:51:02 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEapQ-0006Nf-C6
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:51:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 50A46219FD;
 Mon, 31 Jan 2022 17:50:50 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 18:50:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006f29a13a3-cf1d-403e-9de3-74a5aa55de9f,
 4E4406098780EA2DD5F77ED28C3E8FA94DEDF1FC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6f79d6b9-fa49-dd33-412a-05249df3971a@kaod.org>
Date: Mon, 31 Jan 2022 18:50:48 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b878009a-cf35-1465-9bae-11d50ac84241@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d4b5f305-c150-463c-a5a1-a3ff32469a0f
X-Ovh-Tracer-Id: 2412240553131543401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index bc646c67a0f5..980f62fd7964 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1164,6 +1164,10 @@ static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>>       /* MSR:POW cannot be set by any form of rfi */
>>       msr &= ~(1ULL << MSR_POW);
>> +    /* MSR:TGPR cannot be set by any form of rfi */
>> +    if (env->flags & POWERPC_FLAG_TGPR)
>> +        msr &= ~(1ULL << MSR_TGPR);
>> +
>>   #if defined(TARGET_PPC64)
>>       /* Switching to 32-bit ? Crop the nip */
>>       if (!msr_is_64bit(env, msr)) {
> 
> Have you tried a pre-PR push to Gitlab CI for your pull-ppc-20220130 tag? I'd expect this to fail the check-patch job due to the missing braces around the if() statement.

It seems that ctx_statement_block() is confused because
the patch ends with a '{'.

Thanks,

C.

