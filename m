Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27620349BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 22:46:23 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPXo5-0001e7-PN
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 17:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPXmG-0001Ao-17
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 17:44:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:56500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPXmE-0003Kk-96
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 17:44:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21D86AF98;
 Thu, 25 Mar 2021 21:44:24 +0000 (UTC)
Subject: Re: [RFC v11 22/55] target/arm: move sve_zcr_len_for_el to common_cpu
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-15-cfontana@suse.de>
 <6eb61895-7d00-e8c6-fca4-2a70e7e2b066@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <22e4d85e-90ac-47f0-1048-953b6362fd4f@suse.de>
Date: Thu, 25 Mar 2021 22:44:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6eb61895-7d00-e8c6-fca4-2a70e7e2b066@linaro.org>
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

On 3/24/21 11:03 PM, Richard Henderson wrote:
> On 3/23/21 9:46 AM, Claudio Fontana wrote:
>> it is required by arch-dump.c and cpu.c, so apparently
>> we need this for KVM too
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> 
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> +/*
>> + * these are AARCH64-only, but due to the chain of dependencies,
>> + * between HELPER prototypes, hflags, cpreg definitions and functions in
>> + * tcg/ etc, it becomes incredibly messy to add what should be here:
>> + *
>> + * #ifdef TARGET_AARCH64
>> + */
>> +
>> +static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
>> +{
>> +    uint32_t end_len;
>> +
>> +    end_len = start_len &= 0xf;
>> +    if (!test_bit(start_len, cpu->sve_vq_map)) {
>> +        end_len = find_last_bit(cpu->sve_vq_map, start_len);
>> +        assert(end_len < start_len);
>> +    }
>> +    return end_len;
>> +}
> 
> I guess you could
> 
> #ifdef TARGET_AARCH64
>      ...
> #else
>      g_assert_not_reached();
> #endif
> 
> Dunno if it's worth it or not, since they're small.
> 
> 
> r~
> 

I'll check this again. IIRC I _did_ handle the HELPER() / hflags / cpreg problem in the end,
so it should be possible to make this actually right (ie #ifdef TARGET_AARCH64)







