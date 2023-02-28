Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4C6A6252
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8Ji-0002nF-QA; Tue, 28 Feb 2023 17:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pX8Je-0002mx-UR
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:19:22 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pX8Jc-0000X2-05
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:19:22 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7F6DA7457E7;
 Tue, 28 Feb 2023 23:19:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 09E4A745720; Tue, 28 Feb 2023 23:19:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 089B9745706;
 Tue, 28 Feb 2023 23:19:18 +0100 (CET)
Date: Tue, 28 Feb 2023 23:19:18 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: philmd@linaro.org
cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
In-Reply-To: <3b2d2ce2-f57d-41e0-eff6-e0a498138a88@eik.bme.hu>
Message-ID: <27d07ba5-83c7-5dcb-7d58-f8355d22abbc@eik.bme.hu>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com> <Y+pM+H1PvTUUHrhx@x1n>
 <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
 <Y+piDukOkeg+xs9G@x1n> <0d85fc1d-4c97-5874-d49c-03ac3c265e2f@eik.bme.hu>
 <Y+pwnar8b17Mu0u4@x1n> <d3ebfc88-8b03-cfb7-bc4f-9952521b3ba8@eik.bme.hu>
 <Y+qqvqW/K8yJWrTm@x1n> <3b2d2ce2-f57d-41e0-eff6-e0a498138a88@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023, BALATON Zoltan wrote:
> On Mon, 13 Feb 2023, Peter Xu wrote:
>> On Mon, Feb 13, 2023 at 07:34:55PM +0100, BALATON Zoltan wrote:
>>> On Mon, 13 Feb 2023, Peter Xu wrote:
>>>> On Mon, Feb 13, 2023 at 05:34:04PM +0100, BALATON Zoltan wrote:
>>>>> On Mon, 13 Feb 2023, Peter Xu wrote:
>>>>>> On Mon, Feb 13, 2023 at 03:47:42PM +0100, BALATON Zoltan wrote:
>>>>>>> On Mon, 13 Feb 2023, Peter Xu wrote:
>>>>>>>> On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
>>>>>>>>> On 07/02/2023 17.33, BALATON Zoltan wrote:
>>>>>>>>>> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>>>>>>>>>>> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>>>>>>>>>>>> Currently -d guest_errors enables logging of different invalid 
>>>>>>>>>>>> actions
>>>>>>>>>>>> by the guest such as misusing hardware, accessing missing 
>>>>>>>>>>>> features or
>>>>>>>>>>>> invalid memory areas. The memory access logging can be quite 
>>>>>>>>>>>> verbose
>>>>>>>>>>>> which obscures the other messages enabled by this debug switch so
>>>>>>>>>>>> separate it by adding a new -d memaccess option to make it 
>>>>>>>>>>>> possible to
>>>>>>>>>>>> control it independently of other guest error logs.
>>>>>>>>>>>> 
>>>>>>>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>>>>>> 
>>>>>>>>>>> Ping? Could somebody review and pick it up please?
>>>>>>>>>> 
>>>>>>>>>> Ping?
>>>>>>>>> 
>>>>>>>>> Patch makes sense to me and looks fine, so:
>>>>>>>>> 
>>>>>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>>>>>> 
>>>>>>>>> ... I think this should go via one of the "Memory API" maintainers 
>>>>>>>>> branches?
>>>>>>>>> Paolo? Peter? David?
>>>>>>>> 
>>>>>>>> Paolo normally does the pull, I assume that'll still be the case. 
>>>>>>>> The
>>>>>>>> patch looks good to me if Phil's comment will be addressed on merging 
>>>>>>>> with
>>>>>>>> the old mask, which makes sense to me:
>>>>>>> 
>>>>>>> Keeping the old mask kind of defies the purpose. I've tried to explain 
>>>>>>> that
>>>>>>> in the commit message but now that two of you did not get it maybe 
>>>>>>> that
>>>>>>> message needs to be clarified instead?
>>>>>> 
>>>>>> I think it's clear enough.  My fault to not read carefully into the
>>>>>> message, sorry.
>>>>>> 
>>>>>> However, could you explain why a memory_region_access_valid() failure
>>>>>> shouldn't belong to LOG_GUEST_ERROR?
>>>>>> 
>>>>>> commit e54eba1986f6c4bac2951e7f90a849cd842e25e4
>>>>>> Author: Peter Maydell <peter.maydell@linaro.org>
>>>>>> Date:   Thu Oct 18 14:11:35 2012 +0100
>>>>>>
>>>>>>    qemu-log: Add new log category for guest bugs
>>>>>>
>>>>>>    Add a new category for device models to log guest behaviour
>>>>>>    which is likely to be a guest bug of some kind (accessing
>>>>>>    nonexistent registers, reading 32 bit wide registers with
>>>>>>    a byte access, etc). Making this its own log category allows
>>>>>>    those who care (mostly guest OS authors) to see the complaints
>>>>>>    without bothering most users.
>>>>>> 
>>>>>> Such an illegal memory access is definitely a suitable candidate of 
>>>>>> guest
>>>>>> misbehave to me.
>>>>> 
>>>>> Problem is that a lot of machines have unimplemented hardware that are 
>>>>> valid
>>>>> on real machine but we don't model them so running guests which access 
>>>>> these
>>>>> generate constant flow of unassigned memory access log which obscures 
>>>>> the
>>>>> actual guest_errors when an modelled device is accessed in unexpected 
>>>>> ways.
>>>>> For an example you can try booting MorphOS on mac99,via=pmu as described
>>>>> here: http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>>>>> (or the pegasos2 command too). We could add dummy registers to silence 
>>>>> these
>>>>> but I think it's better to either implement it correctly or leave it
>>>>> unimplemented so we don't hide errors by the dummy implementation.
>>>>> 
>>>>>> Not to mention Phil always have a good point that you may be violating
>>>>>> others using guest_error already so what they wanted to capture can
>>>>>> misterious going away without noticing, even if it may service your 
>>>>>> goal.
>>>>>> IOW it's a slight ABI and I think we ned justification to break it.
>>>>> 
>>>>> Probably this should be documented in changelog or do we need 
>>>>> depracation
>>>>> for a debug option meant for developers mostly? I did not think so. Also 
>>>>> I
>>>>> can't think of other way to solve this without changing what 
>>>>> guest_erorrs do
>>>>> unless we change the name of that flag as well. Also not that when this 
>>>>> was
>>>>> originally added it did not contain mem access logs as those were 
>>>>> controlled
>>>>> by a define in memory.c until Philippe changed it and added them to
>>>>> guest_errors. So in a way I want the previous functionality back.
>>>> 
>>>> I see, thanks.
>>>> 
>>>> Indeed it's only a debug option, so I don't know whether the abi needs 
>>>> the
>>>> attention here.
>>>> 
>>>> I quickly looked at all the masks and afaict this is really a special and
>>>> very useful one that if I'm a cloud provider I can run some script trying
>>>> to capture those violations using this bit to identify suspecious guests.
>>>> 
>>>> So I think it would still be great to not break it if possible, IMHO.
>>>> 
>>>> Since currently I don't see an immediate limitation of having qemu log 
>>>> mask
>>>> being a single bit for each of the entry, one way to satisfy your need 
>>>> (and
>>>> also keep the old behavior, iiuc), is to make guest_errors a sugar syntax
>>>> to cover 2 bits.  It shouldn't be complicated at all, I assume:
>>>> 
>>>> +/* This covers the generic guest errors besides memory violations */
>>>> #define LOG_GUEST_ERROR    (1 << 11)
>>>> 
>>>> +/*
>>>> + * This covers the guest errors on memory violations; see 
>>>> LOG_GUEST_ERROR
>>>> + * for generic guest errors.
>>>> + */
>>>> +#define LOG_GUEST_ERROR_MEM      (1 << 21)
>>>> +#define LOG_GUEST_ERROR_ALL      (LOG_GUEST_ERROR | LOG_GUEST_ERROR_MEM)
>>>> 
>>>> -    { LOG_GUEST_ERROR, "guest_errors",
>>>> +    { LOG_GUEST_ERROR_ALL, "guest_errors",
>>>> 
>>>> Then somehow squashed with your changes.  It'll make "guest_errors" not
>>>> exactly matching the name of LOG_* but I think it may not be a big 
>>>> concern.
>>> 
>>> I'm not sure I understand this. So -d memaccess would give me the 
>>> unassigned
>>> logs, that's fine and -d guest_errors are both LOG_GUEST_ERROR and 
>>> memaccess
>>> like currently but what option would give me just the guest_Errors before
>>> mem access started to use this flag too? (I could not locate the commit 
>>> that
>>> changed this but I remember previously the unassigned mem logs were 
>>> enabled
>>> with a define in memory.c.) Do we need another -d option for just the 
>>> guest
>>> errors then? What should that be called?
>> 
>> I forgot to add those two definitions into qemu_log_items just now.  It can
>> be defined as:
>>
>>  - "guest_errors_common" for !mem errors
>>  - "guest_errors_mem" for mem errors
>>  - "guest_errors" for mem+!mem (compatible to the old code)
>
> OK I get that now but I would still like to call these differently. For one 
> these are very long and also not quite clear. Unassigned mem access is most 
> often not a guest error but error in emulating hardware, that is guest 
> accessing devices we don't model will result in these so the guest does 
> nothing wrong is't just missing emulation. Therefore I'd keep the flag called 
> LOG_MEM_ACCESS and corresponding -d memaccess option. We can keep 
> guest_errors to do what it does now setting both flags but then we need a new 
> name for LOG_GUEST_ERROR alone. We could call that -d guest_error and then 
> deprecate guest_errors to eventually get everybody convert to use -d 
> guest_error,memeaccess instead which would also match the flags but I'm also 
> OK with some other -d option name for just LOG_GUEST_ERROR however I don't 
> think renaming the LOG_GUEST_ERROR flag is a good idea so that would result 
> in mismatch between flag and option, but that could be OK.
>
>> With the two lines added:
>> 
>> -    { LOG_GUEST_ERROR, "guest_errors",
>> +    { LOG_GUEST_ERROR_ALL, "guest_errors",
>>       "log when the guest OS does something invalid (eg accessing a\n"
>>       "non-existent register)" },
>> +    { LOG_GUEST_ERROR, "guest_errors_common", "..." },
>> +    { LOG_GUEST_ERROR_MEM, "guest_errors_mem", "..." },
>> 
>> I saw that Phil revoked his concern, I don't have a strong opinion
>> personally, assuming Phil knows better on that since he modified the memory
>> loggings before.  If all are happy with this, please proceed with either
>> way.
>
> IIUC he was OK with adding memaccess as long as guest_errors will not change 
> so together with this proposal but he can clarify what he prefers. I just 
> want separate -d options for memaccess and the rest that's now in 
> guest_errors the way it was before mem access errors were added to this flag.

This is less important now, I can carry this single patch a bit longer but 
if you can decide on the above I may be able to still change it and 
resubmit a new version. If you're too busy to think about it now we can 
come back to this in next devel cycle.

Regards,
BALATON Zoltan

