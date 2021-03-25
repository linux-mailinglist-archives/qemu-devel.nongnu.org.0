Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99876349400
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:28:04 +0100 (CET)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQxv-0001Ay-Lw
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPQw1-0007e5-Qb
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:26:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:39104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPQvz-0007jq-0X
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:26:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 306FFAC16;
 Thu, 25 Mar 2021 14:26:01 +0000 (UTC)
Subject: Re: [RFC v11 23/55] target/arm: move arm_sctlr away from tcg helpers
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-16-cfontana@suse.de>
 <2251f4fa-a0da-2706-8a21-329dc3f7c56d@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <69cd4555-d8cb-536f-2ded-43a394c36e00@suse.de>
Date: Thu, 25 Mar 2021 15:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2251f4fa-a0da-2706-8a21-329dc3f7c56d@linaro.org>
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

On 3/24/21 11:07 PM, Richard Henderson wrote:
> On 3/23/21 9:46 AM, Claudio Fontana wrote:
>> this function is used for kvm too, add it to the
>> cpu-common module.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
>>   /* #endif TARGET_AARCH64 , see matching comment above */
>> +
>> +uint64_t arm_sctlr(CPUARMState *env, int el)
>> +{
>> +    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
>> +    if (el == 0) {
>> +        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
>> +        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
>> +            ? 2 : 1;
> 
> I only thought of it because of the comment, but *E20_0 is aarch64 only; 
> aarch32 always uses el = 1 here.  ;-)
> 
> 
> r~

In this case, maybe we should do:


uint64_t arm_sctlr(CPUARMState *env, int el)
{
    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
    if (el == 0) {
#ifdef TARGET_AARCH64
        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
            ? 2 : 1;
#else
        el = 1;
#endif
    }
    return env->cp15.sctlr_el[el];
}

?

Thanks,

Claudio


