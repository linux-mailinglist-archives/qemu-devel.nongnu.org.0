Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1B32B9FE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:45:41 +0100 (CET)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWVA-00037I-KC
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lHWOj-0004no-6u
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:39:01 -0500
Received: from mx2.suse.de ([195.135.220.15]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lHWOf-0005R3-Un
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:39:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C65DACBC;
 Wed,  3 Mar 2021 18:38:56 +0000 (UTC)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <25bce8e9-2fad-6568-66a5-278a04817f63@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <57a2c344-e54e-a4f9-64b6-df810f3c3c35@suse.de>
Date: Wed, 3 Mar 2021 19:38:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <25bce8e9-2fad-6568-66a5-278a04817f63@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 7:34 PM, Philippe Mathieu-Daudé wrote:
> On 3/3/21 6:57 PM, Claudio Fontana wrote:
>> On 3/1/21 5:23 PM, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 2/23/21 10:18 AM, Philippe Mathieu-Daudé wrote:
>>>>> On 2/22/21 8:00 PM, Alex Bennée wrote:
>>>>>>
>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>
>>>>>>> Hi all,
>>>>>>>
>>>>>>> this is an experiment, a cleanup based on and requiring the series
>>>>>>> "i386 cleanup PART 2":
>>>>>>>
>>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html
>>>>>>>
>>>>>>> The goal is to split the code between TCG-only and non-TCG code,
>>>>>>> fixing the KVM-only build (configure --disable-tcg),
>>>>>>>
>>>>>>> and laying the ground for further cleanups and the use of the
>>>>>>> new accel objects in the hierarchy to specialize the cpu
>>>>>>> according to the accelerator.
>>>>>>>
>>>>>>> This is known to be an early state, with probably a lot of work
>>>>>>> still needed.
>>>>>>
>>>>>> Well early work is looking pretty good:
>>>>>>
>>>>>>   18:59:22 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh qemu-system-aarch64
>>>>>>   -rwxr-xr-x 1 alex alex 107M Feb 22 18:08 qemu-system-aarch64*
>>>>>>   18:59:29 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh ../disable.tcg/qemu-system-aarch64
>>>>>>   -rwxr-xr-x 1 alex alex 76M Feb 22 17:47 ../disable.tcg/qemu-system-aarch64*
>>>>>
>>>>> :~)
>>>>>
>>>>>>
>>>>>> and I've tested the KVM side works well enough with a basic image.
>>>>>
>>>>>
>>>>
>>>> I am working on the next version, one thing I noticed among others as I get close to the v2,
>>>> is the fact that tests/ for arm require tcg in many cases.
>>>
>>> I think in a lot of cases they are historical because developers
>>> generally weren't running on native hardware. That said off the top of
>>> my head:
>>>
>>>   tests/tcg - linux-user, so implies TCG
>>>   tests/tcg/system - use semihosting (at least for arm/aarch64) - which implies TCG
>>>   tests/acceptance/[replay_kernel/reverse_debugging/tcg_plugins] - all need TCG features
>>>
>>> I don't think there is any reason the others can't run with KVM - and
>>> probably should on real hardware.
>>
>>
>> One thing I noticed is that tests try to run qemu-system-aarch64 with accel "qtest" and machine "virt",
>> and the thing tries to create a cortex-a15 cpu model for some unknown reason.
>>
>> Digging and sweating..
> 
> I already sent a series to fix that, feel free to reuse
> some patches:
> https://www.mail-archive.com/qemu-block@nongnu.org/msg80440.html
> 

Ah yes I took already something from here, will look some more thanks!

Ciao,

Claudio

