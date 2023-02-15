Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACE697B71
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:07:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGYv-0000vf-F3; Wed, 15 Feb 2023 07:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSGYr-0000uz-NV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSGYo-0001lr-E7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676462807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kidTgwvwjgmftsLG+RhYWVVdNJh0MM9sobOT2WarSSk=;
 b=F67RqhllDDvH4wbsH/tyuu8/8BjP2eHfQMn9F0WkRrC62GjZeT0rBBlJrAuU2uVFXdZii8
 5MmHTad7+7yciAY3ivqwA39xaOyy+c/W9Vy9f3VpqjgqHccKcHk+VKw/e3QWwwaELNDICb
 0H7j7tMt8KXLZbdH700sTPjJ9fVm68Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-DiI52SWzMiijGxvbgaNCLQ-1; Wed, 15 Feb 2023 07:06:45 -0500
X-MC-Unique: DiI52SWzMiijGxvbgaNCLQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DC328027FD;
 Wed, 15 Feb 2023 12:06:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA33E492B15;
 Wed, 15 Feb 2023 12:06:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA03F21E6A1F; Wed, 15 Feb 2023 13:06:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Eric Blake <eblake@redhat.com>,  Yanan Wang
 <wangyanan55@huawei.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 1/3] multifd: Create property
 multifd-sync-after-each-section
References: <20230213091548.76444-1-quintela@redhat.com>
 <20230213091548.76444-2-quintela@redhat.com>
 <87mt5goctt.fsf@pond.sub.org> <87zg9g5dk7.fsf@secure.mitica>
Date: Wed, 15 Feb 2023 13:06:43 +0100
In-Reply-To: <87zg9g5dk7.fsf@secure.mitica> (Juan Quintela's message of "Tue, 
 14 Feb 2023 19:04:08 +0100")
Message-ID: <87mt5fb0a4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> Markus Armbruster <armbru@redhat.com> wrote:
>> Juan Quintela <quintela@redhat.com> writes:
>>
>>> We used to synchronize all channels at the end of each RAM section
>>> sent.  That is not needed, so preparing to only synchronize once every
>>> full round in latests patches.
>>>
>>> Notice that we initialize the property as true.  We will change the
>>> default when we introduce the new mechanism.
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>>
>>> ---
>>>
>>> Rename each-iteration to after-each-section
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>>  qapi/migration.json   | 10 +++++++++-
>>>  migration/migration.h |  1 +
>>>  hw/core/machine.c     |  1 +
>>>  migration/migration.c | 15 +++++++++++++--
>>>  4 files changed, 24 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index c84fa10e86..2907241b9c 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -478,6 +478,13 @@
>>>  #                    should not affect the correctness of postcopy migration.
>>>  #                    (since 7.1)
>>>  #
>>> +# @multifd-sync-after-each-section: Synchronize channels after each
>>> +#                                   section is sent.
>>
>> What does it mean to synchronize channels?
>>
>> When would I want to, and why?
>>
>>> +#                                                     We used to do
>>> +#                                   that in the past, but it is
>>> +#                                   suboptimal.
>>
>> This isn't particularly helpful, I'm afraid.
>>
>>> +#                                   Default value is true until all code is in.
>>
>> As far as I can tell, it's actually *unused* for now, and a later patch
>> will put it to use ...
>
> We (well, libvert preffers) want capabilities to be false by default.
> When I introduce a new capability/parameter:
> - Patch1: I introduce the capability/parameter, it does nothing yet.
> - Patch2: I conditionalize the old code on this capability.
>           Default value is true (old code).
> - Patch3: I introduce the new code to implement the feature.
>           At this point I change the default.
>
> Depending on complexity, Patch2 and 3 can be a series, but you get the
> idea O:-)

I'm fine with this approach, as long as commit messages and comments
reflect reality :)

>>> +#                                   (since 8.0)
>
> Retry.  What about:
>
> # @multifd-sync-after-each-section: flush each channel after each
> #                                   section sent.  This assures that
> #                                   we can't mix pages from one
> #                                   iteration through the dirty bitmap
> #                                   with pages for the following
> #                                   iteration.  We really only need to
> #                                   do this flush after we have go
> #                                   trhough all the dirty bitmap.  For

s/trhough/through/

> #                                   historical reasons, we do that after
> #                                   each section.  This is suboptimal
> #                                   (we flush too many times).
> #                                   Default value is true until the code
> #                                   to implement it is in tree.
> #                                   (since 8.0)
>
>
> Better?

Yes, except the comment suggests value false does something, which isn't
true, yet.

Possible solutions:

1. Accept only configurations that work as advertized:

   Patch1: add code to reject value false with a suitable "not
   implemented" error message.  Since the behavior is temporary within a
   single series, documenting this feels optional.

   Patch2: no change.

   Patch3: drop the code rejecting false.

2. Document configurations that don't yet work as advertized:

   Patch1: doc comment states the capability is not yet implemented.

   Patch2: no change.

   Patch3: drop the comment.

No need to mess with documenting temporary default true in either case.

>>> +bool migrate_multifd_sync_after_each_section(void)
>>> +{
>>> +    MigrationState *s = migrate_get_current();
>>> +
>>> +    return true;
>>> +    // We will change this when code gets in.
>>> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
>>
>> ... here.
>>
>> No warning about unreachable code?  Checking... nope, gcc seems to not
>> to care.
>
> Yeap.  Gcc thinks this is ok.
> In others try's I have done:
>
>     return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
>
> If you preffer I can change to this, not strong opinions.

Matter of taste, you pick what you like best.

I'd simply start with

      return true;              /* TODO implement */

and replace it with the real expression when its callers are ready for
it.


