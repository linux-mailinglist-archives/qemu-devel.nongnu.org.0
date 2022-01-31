Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB24A4CC2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:08:25 +0100 (CET)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaAB-0003Es-1z
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:08:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nEa2c-0007Bp-W0; Mon, 31 Jan 2022 12:00:36 -0500
Received: from [2001:41c9:1:41f::167] (port=41226
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nEa2Y-0006c4-Sl; Mon, 31 Jan 2022 12:00:34 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nEa1R-00031W-FP; Mon, 31 Jan 2022 16:59:25 +0000
Message-ID: <6902a813-16cd-86e5-b851-d244d42e0be2@ilande.co.uk>
Date: Mon, 31 Jan 2022 16:59:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220131110811.619053-1-clg@kaod.org>
 <20220131110811.619053-3-clg@kaod.org>
 <b878009a-cf35-1465-9bae-11d50ac84241@ilande.co.uk>
 <560147a3-7583-b62f-a194-6af1066ccbef@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <560147a3-7583-b62f-a194-6af1066ccbef@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PULL 02/41] target/ppc: 603: fix restore of GPRs 0-3 on rfi
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 31/01/2022 14:11, Cédric Le Goater wrote:

> On 1/31/22 13:01, Mark Cave-Ayland wrote:
>> On 31/01/2022 11:07, Cédric Le Goater wrote:
>>
>>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>
>>> After a TLB miss exception, GPRs 0-3 must be restored on rfi.
>>>
>>> This is managed by hreg_store_msr() which is called by do_rfi()
>>>
>>> However, hreg_store_msr() does it if MSR[TGPR] is unset in the
>>> passed MSR value.
>>>
>>> The problem is that do_rfi() is given the content of SRR1 as
>>> the value to be set in MSR, but TGPR bit is not part of SRR1
>>> and that bit is used for something else and is sometimes set
>>> to 1, leading to hreg_store_msr() not restoring GPRs.
>>>
>>> So, do the same way as for POW bit, force clearing it.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Cc: Cedric Le Goater <clg@kaod.org>
>>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> Message-Id: <20220120103824.239573-1-christophe.leroy@csgroup.eu>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   target/ppc/excp_helper.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index bc646c67a0f5..980f62fd7964 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -1164,6 +1164,10 @@ static void do_rfi(CPUPPCState *env, target_ulong nip, 
>>> target_ulong msr)
>>>       /* MSR:POW cannot be set by any form of rfi */
>>>       msr &= ~(1ULL << MSR_POW);
>>> +    /* MSR:TGPR cannot be set by any form of rfi */
>>> +    if (env->flags & POWERPC_FLAG_TGPR)
>>> +        msr &= ~(1ULL << MSR_TGPR);
>>> +
>>>   #if defined(TARGET_PPC64)
>>>       /* Switching to 32-bit ? Crop the nip */
>>>       if (!msr_is_64bit(env, msr)) {
>>
>> Have you tried a pre-PR push to Gitlab CI for your pull-ppc-20220130 tag? I'd 
>> expect this to fail the check-patch job due to the missing braces around the if() 
>> statement.
> 
> All is fine :
> 
>    https://gitlab.com/legoater/qemu/-/pipelines/458888936
> 
> I even did a checkpatch before sending and it did not complain :/

This is really odd: it seems checkpatch.pl is broken here. For example, applying that 
single patch onto git master:

$ wget -O- https://patchew.org/QEMU/20220131110811.619053-3-clg@kaod.org/mbox | git am -3

$ ./scripts/checkpatch.pl HEAD~1..HEAD
total: 0 errors, 0 warnings, 10 lines checked

Commit d9565580c846 (target/ppc: 603: fix restore of GPRs 0-3 on rfi) has no obvious 
style problems and is ready for submission.


Here we see checkpatch.pl has no issues with the output of git diff, but when you run 
it on the whole file:

$ ./scripts/checkpatch.pl -f target/ppc/excp_helper.c
ERROR: if this code is redundant consider removing it
#904: FILE: target/ppc/excp_helper.c:904:
+#if 0 /* TODO */

ERROR: braces {} are necessary for all arms of this statement
#1168: FILE: target/ppc/excp_helper.c:1168:
+    if (env->flags & POWERPC_FLAG_TGPR)
[...]

total: 2 errors, 0 warnings, 1491 lines checked

target/ppc/excp_helper.c has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

... it shows up. How is it possible for checkpatch.pl to miss things when processing 
diffs instead of whole files?


ATB,

Mark.

