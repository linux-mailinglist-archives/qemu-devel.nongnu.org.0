Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91272358020
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:59:05 +0200 (CEST)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURRI-00071y-MS
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUROA-0005VE-A8
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:55:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:54010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lURO7-000654-GT
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:55:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D36C0AF95;
 Thu,  8 Apr 2021 09:55:44 +0000 (UTC)
Subject: Re: [RFC v12 24/65] target/arm: move arm_sctlr away from tcg helpers
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-25-cfontana@suse.de>
 <1ce5eecf-af32-208d-b10f-be7dbb097023@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <c4d56553-e55a-e2e3-6a07-b9d13d1e9edb@suse.de>
Date: Thu, 8 Apr 2021 11:55:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1ce5eecf-af32-208d-b10f-be7dbb097023@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 6:12 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> this function is used for kvm too, add it to the
>> cpu-common module.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   target/arm/cpu-common.c | 15 +++++++++++++++
>>   target/arm/tcg/helper.c | 11 -----------
>>   2 files changed, 15 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
>> index a34f7f19d8..892e075298 100644
>> --- a/target/arm/cpu-common.c
>> +++ b/target/arm/cpu-common.c
>> @@ -342,3 +342,18 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
>>   }
>>   
>>   /* #endif TARGET_AARCH64 , see matching comment above */
>> +
>> +uint64_t arm_sctlr(CPUARMState *env, int el)
>> +{
>> +    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
>> +    if (el == 0) {
>> +#ifdef TARGET_AARCH64
>> +        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
>> +        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
>> +            ? 2 : 1;
>> +#else
>> +        el = 1;
>> +#endif /* TARGET_AARCH64 */
>> +    }
> 
> My comment was merely an observation; I'm not sure it's a good idea.  And you 

I think it is valuable, it made things clearer to me.


> should never make this functional change while moving code.

Will add a separate patch.

> 
> 
> r~
> 

Thanks,

C

