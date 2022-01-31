Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813384A4A86
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:28:36 +0100 (CET)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYbb-0004ev-Lb
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEXP8-0001DQ-0D
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:11:39 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:40379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEXP5-0000AU-Jq
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:11:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 12C92DB43D49;
 Mon, 31 Jan 2022 15:11:33 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 15:11:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001d569dcc3-db00-480b-86df-5bafc15cf54b,
 4E4406098780EA2DD5F77ED28C3E8FA94DEDF1FC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <560147a3-7583-b62f-a194-6af1066ccbef@kaod.org>
Date: Mon, 31 Jan 2022 15:11:32 +0100
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
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6ee2dc94-b138-4ba6-96a3-5f03ea97e058
X-Ovh-Tracer-Id: 17155336884479560553
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrghrohhsrghssehlihhnuhigrdhisghmrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 1/31/22 13:01, Mark Cave-Ayland wrote:
> On 31/01/2022 11:07, Cédric Le Goater wrote:
> 
>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>>
>> After a TLB miss exception, GPRs 0-3 must be restored on rfi.
>>
>> This is managed by hreg_store_msr() which is called by do_rfi()
>>
>> However, hreg_store_msr() does it if MSR[TGPR] is unset in the
>> passed MSR value.
>>
>> The problem is that do_rfi() is given the content of SRR1 as
>> the value to be set in MSR, but TGPR bit is not part of SRR1
>> and that bit is used for something else and is sometimes set
>> to 1, leading to hreg_store_msr() not restoring GPRs.
>>
>> So, do the same way as for POW bit, force clearing it.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Cedric Le Goater <clg@kaod.org>
>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>> Message-Id: <20220120103824.239573-1-christophe.leroy@csgroup.eu>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   target/ppc/excp_helper.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
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

All is fine :

   https://gitlab.com/legoater/qemu/-/pipelines/458888936

I even did a checkpatch before sending and it did not complain :/

Thanks,

C.

