Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757335E4D3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:18:10 +0200 (CEST)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMfx-00065x-JV
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWMce-0003xD-SL
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:14:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWMcd-0003Rs-3o
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:14:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D088AD71;
 Tue, 13 Apr 2021 17:14:41 +0000 (UTC)
Subject: Re: [RFC v12 62/65] target/arm: refactor arm_cpu_finalize_features
 into cpu64
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-63-cfontana@suse.de>
 <3e3b446d-59a6-9cba-94a1-9613cc3644c6@linaro.org>
 <e488590e-cbc5-6bd6-a7c5-3ea16b82eb88@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <9eef3217-ce70-7054-7150-e9cf4a5d4131@suse.de>
Date: Tue, 13 Apr 2021 19:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e488590e-cbc5-6bd6-a7c5-3ea16b82eb88@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 3/28/21 9:15 PM, Richard Henderson wrote:
> On 3/28/21 1:12 PM, Richard Henderson wrote:
>> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>>> +++ b/target/arm/monitor.c
>>> @@ -184,9 +184,11 @@ CpuModelExpansionInfo 
>>> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>>           if (!err) {
>>>               visit_check_struct(visitor, &err);
>>>           }
>>> +#ifdef TARGET_AARCH64
>>>           if (!err) {
>>> -            arm_cpu_finalize_features(ARM_CPU(obj), &err);
>>> +            aarch64_cpu_finalize_features(ARM_CPU(obj), &err);
>>>           }
>>> +#endif /* TARGET_AARCH64 */
>>>           visit_end_struct(visitor, NULL);
>>>           visit_free(visitor);
>>>           if (err) {
>>> @@ -195,7 +197,9 @@ CpuModelExpansionInfo 
>>> *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>>               return NULL;
>>>           }
>>>       } else {
>>> -        arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
>>> +#ifdef TARGET_AARCH64
>>> +        aarch64_cpu_finalize_features(ARM_CPU(obj), &error_abort);
>>> +#endif /* TARGET_AARCH64 */
>>
>> These ifdefs are not an improvement.

Right, here we cannot use is_a64(), and I have not found another way other than adding a stub for the function?

> 
> And are actively wrong, since we've lost the runtime test for ARM_FEATURE_AARCH64.
> 
> r~
> 

Right will fix.

Thanks

C

