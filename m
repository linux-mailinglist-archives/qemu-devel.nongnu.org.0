Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7C694D06
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbot-0005MH-Uk; Mon, 13 Feb 2023 11:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pRboq-0005Ls-V9
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:36:45 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pRbon-0002OV-Th
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:36:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 871A6746324;
 Mon, 13 Feb 2023 17:34:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3BA0E7457E7; Mon, 13 Feb 2023 17:34:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 38569745706;
 Mon, 13 Feb 2023 17:34:04 +0100 (CET)
Date: Mon, 13 Feb 2023 17:34:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Xu <peterx@redhat.com>
cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 philmd@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
In-Reply-To: <Y+piDukOkeg+xs9G@x1n>
Message-ID: <0d85fc1d-4c97-5874-d49c-03ac3c265e2f@eik.bme.hu>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com> <Y+pM+H1PvTUUHrhx@x1n>
 <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
 <Y+piDukOkeg+xs9G@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 13 Feb 2023, Peter Xu wrote:
> On Mon, Feb 13, 2023 at 03:47:42PM +0100, BALATON Zoltan wrote:
>> On Mon, 13 Feb 2023, Peter Xu wrote:
>>> On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
>>>> On 07/02/2023 17.33, BALATON Zoltan wrote:
>>>>> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>>>>>> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>>>>>>> Currently -d guest_errors enables logging of different invalid actions
>>>>>>> by the guest such as misusing hardware, accessing missing features or
>>>>>>> invalid memory areas. The memory access logging can be quite verbose
>>>>>>> which obscures the other messages enabled by this debug switch so
>>>>>>> separate it by adding a new -d memaccess option to make it possible to
>>>>>>> control it independently of other guest error logs.
>>>>>>>
>>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>
>>>>>> Ping? Could somebody review and pick it up please?
>>>>>
>>>>> Ping?
>>>>
>>>> Patch makes sense to me and looks fine, so:
>>>>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>
>>>> ... I think this should go via one of the "Memory API" maintainers branches?
>>>> Paolo? Peter? David?
>>>
>>> Paolo normally does the pull, I assume that'll still be the case.  The
>>> patch looks good to me if Phil's comment will be addressed on merging with
>>> the old mask, which makes sense to me:
>>
>> Keeping the old mask kind of defies the purpose. I've tried to explain that
>> in the commit message but now that two of you did not get it maybe that
>> message needs to be clarified instead?
>
> I think it's clear enough.  My fault to not read carefully into the
> message, sorry.
>
> However, could you explain why a memory_region_access_valid() failure
> shouldn't belong to LOG_GUEST_ERROR?
>
> commit e54eba1986f6c4bac2951e7f90a849cd842e25e4
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Thu Oct 18 14:11:35 2012 +0100
>
>    qemu-log: Add new log category for guest bugs
>
>    Add a new category for device models to log guest behaviour
>    which is likely to be a guest bug of some kind (accessing
>    nonexistent registers, reading 32 bit wide registers with
>    a byte access, etc). Making this its own log category allows
>    those who care (mostly guest OS authors) to see the complaints
>    without bothering most users.
>
> Such an illegal memory access is definitely a suitable candidate of guest
> misbehave to me.

Problem is that a lot of machines have unimplemented hardware that are 
valid on real machine but we don't model them so running guests which 
access these generate constant flow of unassigned memory access log which 
obscures the actual guest_errors when an modelled device is accessed in 
unexpected ways. For an example you can try booting MorphOS on 
mac99,via=pmu as described here: 
http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
(or the pegasos2 command too). We could add dummy registers to silence 
these but I think it's better to either implement it correctly or leave it 
unimplemented so we don't hide errors by the dummy implementation.

> Not to mention Phil always have a good point that you may be violating
> others using guest_error already so what they wanted to capture can
> misterious going away without noticing, even if it may service your goal.
> IOW it's a slight ABI and I think we ned justification to break it.

Probably this should be documented in changelog or do we need depracation 
for a debug option meant for developers mostly? I did not think so. Also I 
can't think of other way to solve this without changing what guest_erorrs 
do unless we change the name of that flag as well. Also not that when this 
was originally added it did not contain mem access logs as those were 
controlled by a define in memory.c until Philippe changed it and added 
them to guest_errors. So in a way I want the previous functionality back.

Regards,
BALATON Zoltan

