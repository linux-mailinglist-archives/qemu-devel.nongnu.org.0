Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA49349C04
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 22:58:49 +0100 (CET)
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPY08-0004Bh-D9
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 17:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPXyM-0003fP-Mw
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 17:56:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:60224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPXyL-0000gL-6Q
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 17:56:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D7B6AE04;
 Thu, 25 Mar 2021 21:56:55 +0000 (UTC)
Subject: Re: [RFC v11 47/55] target/arm: make is_aa64 and arm_el_is_aa64 a
 macro for !TARGET_AARCH64
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-40-cfontana@suse.de>
 <f8b0629b-a0da-e85e-5729-3f29eeb247ef@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ac1f0768-660f-85c2-899b-41093c850f00@suse.de>
Date: Thu, 25 Mar 2021 22:56:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f8b0629b-a0da-e85e-5729-3f29eeb247ef@linaro.org>
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

On 3/25/21 8:03 PM, Richard Henderson wrote:
> On 3/23/21 9:46 AM, Claudio Fontana wrote:
>> +#define is_a64(env) (false)
> ...
>> +#define arm_el_is_aa64(env, el) (false)
> 
> Why a define and not have the ifdef inside the static inline?
> 
> This define is causing you to make other random changes to avoid unused 
> variables, and I'm not keen.
> 
> If you're running into problems with --enable-debug not eliminating code 
> blocks, leading to link errors, then I think that 
> __attribute__((always_inline)) and a comment will be the best option.

right, I need to make this guaranteed to cause code elision, so that I can avoid including unneeded function definitions for aarch64 in arm builds.

> 
> 
>> +
>> +#endif /* TARGET_AARCH64 */
>> +
>> +/**
>> + * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
>> + * E.g. when in secure state, fields in HCR_EL2 are suppressed,
>> + * "for all purposes other than a direct read or write access of HCR_EL2."
>> + * Not included here is HCR_RW.
>> + */
>> +uint64_t arm_hcr_el2_eff(CPUARMState *env);
> 
> Is this diff being weird or did you really move this declaration, and if so, why?
> 
> 
> r~
> 


