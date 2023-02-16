Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A87699891
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 16:17:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfzK-0002gK-VB; Thu, 16 Feb 2023 10:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSfz8-0002fI-5t
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSfz3-0007sh-3s
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 10:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676560539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iope5n7nlONdbu6w2NBeZX86blkuT1x2vwE1dNNe9xI=;
 b=FJCXGiEKWBx1Hhj6NRTIcANg27mQr1Lb8O2GBDKj+BFyyIJ/pLh3/e0I7Y52yyr273Ia//
 yovHzksCZKFVUNIH3wCiwUiCVtwNVtCrONiZi/N5tVUjJo4aoQYdGcMmxb+rqzSdfYqROi
 bNSD5RHTS+EisxlHb+wmH9fWEXLlVZU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-rVezZP05OECdXYBYD6ldEQ-1; Thu, 16 Feb 2023 10:15:37 -0500
X-MC-Unique: rVezZP05OECdXYBYD6ldEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA1BC1C04197;
 Thu, 16 Feb 2023 15:15:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 669492026D4B;
 Thu, 16 Feb 2023 15:15:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5199121E6A1F; Thu, 16 Feb 2023 16:15:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,  Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [PATCH v6 1/3] multifd: Create property
 multifd-flush-after-each-section
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-2-quintela@redhat.com> <Y+05hM4JPbfjUjn8@x1n>
 <87edqqlma4.fsf@secure.mitica>
Date: Thu, 16 Feb 2023 16:15:35 +0100
In-Reply-To: <87edqqlma4.fsf@secure.mitica> (Juan Quintela's message of "Wed, 
 15 Feb 2023 21:13:39 +0100")
Message-ID: <87v8k1myjs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Juan Quintela <quintela@redhat.com> writes:

> Peter Xu <peterx@redhat.com> wrote:
>> On Wed, Feb 15, 2023 at 07:02:29PM +0100, Juan Quintela wrote:
>>> We used to flush all channels at the end of each RAM section
>>> sent.  That is not needed, so preparing to only flush after a full
>>> iteration through all the RAM.
>>> 
>>> Default value of the property is false.  But we return "true" in
>>> migrate_multifd_flush_after_each_section() until we implement the code
>>> in following patches.
>>> 
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>
>> This line can be dropped, after (I assume) git commit helped to add the
>> other one below. :)
>
> Gree, git and trailers is always so much fun.  Will try to fix them (again)
>
>>
>> Normally that's also why I put R-bs before my SoB because I should have two
>> SoB but then I merge them into the last; git is happy with that too.
>>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>
>> Acked-by: Peter Xu <peterx@redhat.com>
>
> Thanks.
>
>> But some nitpicks below (I'll leave those to you to decide whether to
>> rework or keep them as is..).
>>
>>>
>>> ---
>>> 
>>> Rename each-iteration to after-each-section
>>> Rename multifd-sync-after-each-section to
>>>        multifd-flush-after-each-section
>>> ---
>>>  qapi/migration.json   | 21 ++++++++++++++++++++-
>>>  migration/migration.h |  1 +
>>>  hw/core/machine.c     |  1 +
>>>  migration/migration.c | 17 +++++++++++++++--
>>>  4 files changed, 37 insertions(+), 3 deletions(-)
>>> 
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index c84fa10e86..3afd81174d 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -478,6 +478,24 @@
>>>  #                    should not affect the correctness of postcopy migration.
>>>  #                    (since 7.1)
>>>  #
>>> +# @multifd-flush-after-each-section: flush every channel after each
>>> +#                                    section sent.  This assures that
>>> +#                                    we can't mix pages from one
>>> +#                                    iteration through ram pages with

RAM

>>> +#                                    pages for the following
>>> +#                                    iteration.  We really only need
>>> +#                                    to do this flush after we have go

to flush after we have gone

>>> +#                                    through all the dirty pages.
>>> +#                                    For historical reasons, we do
>>> +#                                    that after each section.  This is

we flush after each section

>>> +#                                    suboptimal (we flush too many
>>> +#                                    times).

inefficient: we flush too often.

>>> +#                                    Default value is false.
>>> +#                                    Setting this capability has no
>>> +#                                    effect until the patch that
>>> +#                                    removes this comment.
>>> +#                                    (since 8.0)
>>
>> IMHO the core of this new "cap" is the new RAM_SAVE_FLAG_MULTIFD_FLUSH bit
>> in the stream protocol, but it's not referenced here.  I would suggest
>> simplify the content but highlight the core change:
>
> Actually it is the other way around.  What this capability will do is
> _NOT_ use RAM_SAVE_FLAG_MULTIFD_FLUSH protocol.
>
>>  @multifd-lazy-flush:  When enabled, multifd will only do sync flush after

Spell out "synchronrous".

>>                        each whole round of bitmap scan.  Otherwise it'll be

Suggest to scratch "whole".

>>                        done per RAM save iteration (which happens with a much
>>                        higher frequency).

Less detail than Juan's version.  I'm not sure how much detail is
appropriate for QMP reference documentation.

>>                        Please consider enable this as long as possible, and
>>                        keep this off only if any of the src/dst QEMU binary
>>                        doesn't support it.

Clear guidance on how to use it, good!

Perhaps state it more forcefully: "Enable this when both source and
destination support it."

>>
>>                        This capability is bound to the new RAM save flag
>>                        RAM_SAVE_FLAG_MULTIFD_FLUSH, the new flag will only
>>                        be used and recognized when this feature bit set.

Is RAM_SAVE_FLAG_MULTIFD_FLUSH visible in the QMP interface?  Or in the
migration stream?

I'm asking because doc comments are QMP reference documentation, but
when writing them, it's easy to mistake them for internal documentation,
because, well, they're comments.

> Name is wrong.  It would be multifd-non-lazy-flush.  And I don't like
> negatives.  Real name is:
>
> multifd-I-messed-and-flush-too-many-times.

If you don't like "non-lazy", say "eager".

>> I know you dislike multifd-lazy-flush, but that's still the best I can come
>> up with when writting this (yeah I still like it :-p), please bare with me
>> and take whatever you think the best.
>
> Libvirt assumes that all capabilities are false except if enabled.
> We want RAM_SAVE_FLAG_MULTFD_FLUSH by default (in new machine types).
>
> So, if we can do
>
> capability_use_new_way = true
>
> We change that to
>
> capability_use_old_way = true
>
> And then by default with false value is what we want.

Eventually, all supported migration peers will support lazy flush.  What
then?  Will we flip the default?  Or will we ignore the capability and
always flush lazily?

[...]


