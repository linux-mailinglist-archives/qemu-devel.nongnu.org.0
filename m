Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB913344669
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:01:35 +0100 (CET)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOL7e-0002VE-Ho
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKyB-0001GU-F9
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:51:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:37268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKy9-00074l-MY
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:51:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 283A8AC1F;
 Mon, 22 Mar 2021 13:51:44 +0000 (UTC)
Subject: Re: [RFC] accel: add cpu_reset
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322132800.7470-1-cfontana@suse.de>
 <20210322132800.7470-2-cfontana@suse.de>
 <e972fe2e-3871-422c-f85d-baea7066c55b@redhat.com>
 <2019426d-3515-2a87-5b12-cd6d877b0553@suse.de>
 <1c5870b0-4ffe-afec-b852-fa895592ecf0@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <66e9d4a3-0309-f6b5-6541-99a2091fb6a3@suse.de>
Date: Mon, 22 Mar 2021 14:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1c5870b0-4ffe-afec-b852-fa895592ecf0@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 2:45 PM, Paolo Bonzini wrote:
> On 22/03/21 14:35, Claudio Fontana wrote:
>> On 3/22/21 2:31 PM, Paolo Bonzini wrote:
>>> On 22/03/21 14:27, Claudio Fontana wrote:
>>>> This surprisingly works without moving cpu_reset() to a specific_ss
>>>> module, even though accel-common.c is specific_ss, hw/core/cpu.c is
>>>> common_ss. How come the call to accel_reset_cpu works?
>>>
>>> I don't understand the question.  Why wouldn't it work? :)
>>>
>>> Paolo
>>>
>>
>> Heh probably something I forgot or do not understand around the specific_ss / common_ss distinction.
>>
>> I was under the (wrong?) impression that we build some tools or components that include common_ss objects, but not specific_ss.
>>
>> And maybe I am just wrong, and things are simpler than I expected.
> 
> No, all emulators include:
> 
> - some parts of common_ss, compiled once per build.  These are files 
> that do not use target-specific definitions.  Other sourcesets also 
> define once-per-build files, and in fact they end up in common_ss via 
> the add_all method of sourcesets; softmmu_ss, for example is added to 
> common_ss under the CONFIG_SOFTMMU condition.
> 
> - some parts of specific_ss, compiled once per target because these 
> files use target-specific definitions.
> 
> - the entirety of the respective hw/ and target/ sourcesets.
> 
> It is possible to include calls from one sourceset to another (including 
> from common to specific) as long as the conditions ensure that the 
> symbol is defined.


I guess this last sentence is the more tricky for me to get: "as long as the conditions ensure that the symbol is defined".

> 
> Paolo
> 

Thanks for the explanation, I would assume that "make check" then would be able to catch such problems?

Which targets would I need to build to ensure that any problems with this are detected? Do we cover all of these cases with our gitlab CI?

Ciao,

Claudio




