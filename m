Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1516948A1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:51:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaA1-0004vc-TG; Mon, 13 Feb 2023 09:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pRa9w-0004tg-W9
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:50:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pRa9s-0007Hi-R8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:50:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 873A374632B;
 Mon, 13 Feb 2023 15:47:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0F177746324; Mon, 13 Feb 2023 15:47:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0D58F745706;
 Mon, 13 Feb 2023 15:47:42 +0100 (CET)
Date: Mon, 13 Feb 2023 15:47:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Xu <peterx@redhat.com>
cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 philmd@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
In-Reply-To: <Y+pM+H1PvTUUHrhx@x1n>
Message-ID: <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com> <Y+pM+H1PvTUUHrhx@x1n>
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
> On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
>> On 07/02/2023 17.33, BALATON Zoltan wrote:
>>> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>>>> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>>>>> Currently -d guest_errors enables logging of different invalid actions
>>>>> by the guest such as misusing hardware, accessing missing features or
>>>>> invalid memory areas. The memory access logging can be quite verbose
>>>>> which obscures the other messages enabled by this debug switch so
>>>>> separate it by adding a new -d memaccess option to make it possible to
>>>>> control it independently of other guest error logs.
>>>>>
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>
>>>> Ping? Could somebody review and pick it up please?
>>>
>>> Ping?
>>
>> Patch makes sense to me and looks fine, so:
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> ... I think this should go via one of the "Memory API" maintainers branches?
>> Paolo? Peter? David?
>
> Paolo normally does the pull, I assume that'll still be the case.  The
> patch looks good to me if Phil's comment will be addressed on merging with
> the old mask, which makes sense to me:

Keeping the old mask kind of defies the purpose. I've tried to explain 
that in the commit message but now that two of you did not get it maybe 
that message needs to be clarified instead?

Regards,
BALATON Zoltan

> Acked-by: Peter Xu <peterx@redhat.com>
>
> Thanks,
>
>

