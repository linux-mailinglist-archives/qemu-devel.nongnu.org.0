Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE15329B3B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:59:42 +0100 (CET)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2kf-0000yK-LM
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH2jl-0000Q9-M9
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:58:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:44056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH2jk-0002Ys-4c
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:58:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3459AD2B;
 Tue,  2 Mar 2021 10:58:42 +0000 (UTC)
Subject: Re: [RFC v2 07/24] target/arm: move physical address translation to
 new modules
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-8-cfontana@suse.de>
 <a4938d38-eec9-361c-b689-77832a3da75d@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f55ca3a4-1852-7293-53ab-5f38ad65ac69@suse.de>
Date: Tue, 2 Mar 2021 11:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a4938d38-eec9-361c-b689-77832a3da75d@linaro.org>
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 7:49 PM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -1023,9 +1023,6 @@ typedef struct ARMVAParameters {
>>       bool using64k   : 1;
>>   } ARMVAParameters;
>>   
>> -ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>> -                                   ARMMMUIdx mmu_idx, bool data);
>> -
> 
> Moving aa64_va_parameters away from its struct return is not good.  Either move 
> them both or not at all.

Good point, will take a look at both options.
> 
> The collection of stuff you've split out into get-phys-addr.h is pretty random. 
>   Let's just leave it all in internals.h for now.  We can make a more reasoned 
> decision vs all of the vma and regime related functions.
> 
> 
> r~
> 

The goal here was to make get_phys_addr accessible from KVM too.

get_phys_addr requires the va_parameters family of functions.

Lets see..

Thanks,

C

