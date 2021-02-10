Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169A316848
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:50:05 +0100 (CET)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9psa-0006Io-Cy
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9prh-0005TW-OP
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:49:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:54450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9prf-000229-SH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:49:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC5DFAB98;
 Wed, 10 Feb 2021 13:49:04 +0000 (UTC)
Subject: Re: [PATCH v16 21/23] accel: introduce new accessor functions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-22-cfontana@suse.de>
 <2bb1cba6-e1a0-80a7-4c05-fb221f4f8230@linaro.org>
 <16c471e4-06a9-92bf-2d6f-0da0b0fc5a50@suse.de>
 <055de896-2354-ebce-baed-11c801e53964@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <96fc5b2e-3198-d75f-1f4b-bda8383a9c11@suse.de>
Date: Wed, 10 Feb 2021 14:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <055de896-2354-ebce-baed-11c801e53964@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 1:54 PM, Philippe Mathieu-Daudé wrote:
> On 2/8/21 1:50 PM, Claudio Fontana wrote:
>> On 2/5/21 9:14 PM, Richard Henderson wrote:
>>> On 2/4/21 6:39 AM, Claudio Fontana wrote:
>>>> @@ -6725,10 +6722,8 @@ static void x86_cpu_initfn(Object *obj)
>>>>          x86_cpu_load_model(cpu, xcc->model);
>>>>      }
>>>>  
>>>> -    /* if required, do the accelerator-specific cpu initialization */
>>>> -    if (cc->accel_cpu) {
>>>> -        cc->accel_cpu->cpu_instance_init(CPU(obj));
>>>> -    }
>>>> +    /* if required, do accelerator-specific cpu initializations */
>>>> +    accel_cpu_instance_init(CPU(obj));
>>>>  }
>>>
>>> Why is this only done for x86?
>>>
>>>
>>> r~
>>>
>>
>> It makes sense to include the other architectures.
>>
>> As the next step I would like to apply this to ARM, but to me it makes sense to first complete Philippe's series,
>> which reshuffles things so that TCG-only / KVM-only builds are both possible and error-free:
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777627.html
> 
> TBH this series is very unlikely to be merged before yours,
> so go ahead... (eventually you can cherry-pick what you need
> from it).
> 
> 

After taking a short look at the ARM side, I think I need first a detour to split more CONFIG_USER_ONLY code from the rest.

I'll experiment with using meson to add a target-only user_ss variable, and apply it to i386 and arm.

Ciao,

Claudio

