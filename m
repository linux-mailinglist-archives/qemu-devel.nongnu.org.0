Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC945DBF2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 15:07:44 +0100 (CET)
Received: from localhost ([::1]:34394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFPb-0007Rn-DX
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 09:07:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mqFJV-00074v-QH; Thu, 25 Nov 2021 09:01:28 -0500
Received: from [2001:738:2001:2001::2001] (port=17906 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mqFJN-0001dV-RX; Thu, 25 Nov 2021 09:01:23 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 864D6748F53;
 Thu, 25 Nov 2021 15:01:12 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 605017475FA; Thu, 25 Nov 2021 15:01:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5ECE77462D3;
 Thu, 25 Nov 2021 15:01:12 +0100 (CET)
Date: Thu, 25 Nov 2021 15:01:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 1/3] target/ppc: Fixed call to deferred exception
In-Reply-To: <YZ78LSQVRU7YqAvu@yekko>
Message-ID: <a512166-19fa-6db9-8289-884bfcc4f19d@eik.bme.hu>
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
 <20211124172523.3598396-2-lucas.araujo@eldorado.org.br>
 <ad28911-f3e6-a95b-2541-4cacc1a3626e@eik.bme.hu> <YZ78LSQVRU7YqAvu@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, pc@us.ibm.com, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Nov 2021, David Gibson wrote:
> On Thu, Nov 25, 2021 at 01:49:46AM +0100, BALATON Zoltan wrote:
>> On Wed, 24 Nov 2021, Lucas Mateus Castro (alqotel) wrote:
>>> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
>>> after updating the value of FPSCR, but helper_float_check_status
>>> checks fp_status and fp_status isn't updated based on FPSCR and
>>> since the value of fp_status is reset earlier in the instruction,
>>> it's always 0.
>>>
>>> Because of this helper_float_check_status would change the FI bit to 0
>>> as this bit checks if the last operation was inexact and
>>> float_flag_inexact is always 0.
>>>
>>> These instructions also don't throw exceptions correctly since
>>> helper_float_check_status throw exceptions based on fp_status.
>>>
>>> This commit created a new helper, helper_fpscr_check_status that checks
>>> FPSCR value instead of fp_status and checks for a larger variety of
>>> exceptions than do_float_check_status.
>>>
>>> Since fp_status isn't used, gen_reset_fpstatus() was removed.
>>>
>>> The hardware used to compare QEMU's behavior to was a Power9.
>>>
>>> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
>>> ---
>>> target/ppc/fpu_helper.c            | 48 ++++++++++++++++++++++++++++++
>>> target/ppc/helper.h                |  1 +
>>> target/ppc/translate/fp-impl.c.inc |  9 ++----
>>> 3 files changed, 52 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
>>> index c4896cecc8..bb72715827 100644
>>> --- a/target/ppc/fpu_helper.c
>>> +++ b/target/ppc/fpu_helper.c
>>> @@ -414,6 +414,54 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
>>>     ppc_store_fpscr(env, val);
>>> }
>>>
>>> +void helper_fpscr_check_status(CPUPPCState *env)
>>> +{
>>> +    CPUState *cs = env_cpu(env);
>>> +    target_ulong fpscr = env->fpscr;
>>> +    int error = 0;
>>> +
>>> +    if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
>>> +        error = POWERPC_EXCP_FP_OX;
>>> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
>>> +        error = POWERPC_EXCP_FP_UX;
>>> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
>>> +        error = POWERPC_EXCP_FP_XX;
>>> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
>>
>> I wonder if these tests could be simplified by combining the masks if you
>> want to test for both bits set so e.g. fpscr & (FP_ZX | FP_ZE) should be the
>> same, shouldn't it?
>
> No, it's not.  In fact your version is equivalent as a boolean to
> 	((fpscr & FP_ZX) || (fpscr & FP_ZE))

Indeed, it was too late when I wrote. I was really thinking
(fprscr & (FP_ZX | FP_ZE)) == (FP_ZX | FP_ZE) but that's not simpler so 
that answers my question.

Regards,
BALATON Zoltan

