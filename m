Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B9A3580FB
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:41:07 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUS5x-0004CU-9P
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUS45-00030y-Hv
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:39:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:48246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUS3y-0006by-ND
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:39:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0171B007;
 Thu,  8 Apr 2021 10:39:00 +0000 (UTC)
Subject: Re: [RFC v12 17/65] target/arm: tcg: add stubs for some helpers for
 non-tcg builds
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-18-cfontana@suse.de>
 <20afd643-604c-8b0a-fe02-3e6a08c5f848@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <90f7f2b7-d9cb-d9ab-d285-9dc186981cc2@suse.de>
Date: Thu, 8 Apr 2021 12:39:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20afd643-604c-8b0a-fe02-3e6a08c5f848@linaro.org>
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

On 3/28/21 6:22 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> +int fp_exception_el(CPUARMState *env, int cur_el)
>> +{
>> +    return 0;
>> +}
> 
> Oh, I'm pretty sure this should be identical with sve_exception_el, where the 
> fpu may or may not be enabled for a given cpu state (e.g. lazy fpu switching in 
> the kvm guest kernel).
> 
> Are we really returning constant 0 for kvm before your patch set?
> 
> 
> r~
> 

I tried to remember and follow the fp_exception_el in detail,
and _maybe_ the assumption here was the same as I had before, ie: KVM arm_hcr_el2_eff() = 0?

So as we changed this assumption for arm_hcr_el2_eff(), and ended up taking the whole implementation for KVM too,
we might need to do the same for fp_exception_el?

Thanks,

Claudio



