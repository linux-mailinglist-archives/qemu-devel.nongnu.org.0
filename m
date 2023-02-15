Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E0698554
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOA0-00052N-An; Wed, 15 Feb 2023 15:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSO9y-00051w-4X
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSO9w-00047P-Es
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676492023;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X5pu/+ljDfIVIHrjhIqLyk0ijW5baCX6KlHXkhfCwkw=;
 b=XmgJwGRyLJm1d+fBuMruzcRNs0egKyzJCnBGy9qOq1zIpk+6qs+jkgraJnVl5p0eMVByNx
 8JPGHMINU4vD6mWx6JIzbfrPW3B+WU1Tc8c73tS2UysDOW7KEmEAtbc0xiQLJiJLWl56IB
 odgLvwR4nlzV9YHlvye1NGN/vYgnjU8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-kkWLei_pM1isu0zyO122PQ-1; Wed, 15 Feb 2023 15:13:42 -0500
X-MC-Unique: kkWLei_pM1isu0zyO122PQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg9-20020a05600c3c8900b003e1e7d3db06so1694997wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5pu/+ljDfIVIHrjhIqLyk0ijW5baCX6KlHXkhfCwkw=;
 b=kBZr7sWCj0rmDfYLLKh/rt2A0d1yOKJ2QXnVusl9FkQtfukWsSFeg8g7I0XFx2k5O8
 Ee5/3RbdiO/4wGWfWhUotAhNk6I/qlJZhd/ph+3dltBJuY6iUQ6GrziUDxqF27CuJfGy
 qjllJhY/ur3zUEA2Wcryd8qgcqb0x4WpQpmif9mELjaIxqdo3+v1aev0JEyPy2KyAfMD
 HMicdfO+uMi4ZZWpB4Ef98AlfborE9gRSMHmsI6Mp3npnR3FM7chQsW3i/s2YH5luxqo
 o+WzYwQge96b9la1CHvmHyG7FZXf3Dk9cweTf06OKi3jdybYqXvQZm+WNgD0NSnIspCi
 PdIg==
X-Gm-Message-State: AO0yUKVh3eQsew5YnybX0hqlKJuy38wVs8wiURYbST/7CAZKdYPHBicC
 m8lMQggFZx23bjYoCyXqWc7uj+g/YBhE+Nwt380VK82Cc/ddoGOqVpRambBuxWrbulWWXtOHk5t
 nfK/zjkWizbHquN0=
X-Received: by 2002:a05:600c:2b45:b0:3df:85d2:c768 with SMTP id
 e5-20020a05600c2b4500b003df85d2c768mr2846768wmf.26.1676492021384; 
 Wed, 15 Feb 2023 12:13:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8FuQMFgM87Zj03RYEPZ2CDEBU3i3RmjgvBN2PxkKZfRA2kx65LQX5o7hSP8+nJLQFPWovwCA==
X-Received: by 2002:a05:600c:2b45:b0:3df:85d2:c768 with SMTP id
 e5-20020a05600c2b4500b003df85d2c768mr2846750wmf.26.1676492021053; 
 Wed, 15 Feb 2023 12:13:41 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003e209b45f6bsm264574wmc.29.2023.02.15.12.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:13:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 1/3] multifd: Create property
 multifd-flush-after-each-section
In-Reply-To: <Y+05hM4JPbfjUjn8@x1n> (Peter Xu's message of "Wed, 15 Feb 2023
 14:59:00 -0500")
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-2-quintela@redhat.com> <Y+05hM4JPbfjUjn8@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 21:13:39 +0100
Message-ID: <87edqqlma4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> On Wed, Feb 15, 2023 at 07:02:29PM +0100, Juan Quintela wrote:
>> We used to flush all channels at the end of each RAM section
>> sent.  That is not needed, so preparing to only flush after a full
>> iteration through all the RAM.
>> 
>> Default value of the property is false.  But we return "true" in
>> migrate_multifd_flush_after_each_section() until we implement the code
>> in following patches.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> This line can be dropped, after (I assume) git commit helped to add the
> other one below. :)

Gree, git and trailers is always so much fun.  Will try to fix them (again)

>
> Normally that's also why I put R-bs before my SoB because I should have two
> SoB but then I merge them into the last; git is happy with that too.
>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Acked-by: Peter Xu <peterx@redhat.com>

Thanks.

> But some nitpicks below (I'll leave those to you to decide whether to
> rework or keep them as is..).
>
>>
>> ---
>> 
>> Rename each-iteration to after-each-section
>> Rename multifd-sync-after-each-section to
>>        multifd-flush-after-each-section
>> ---
>>  qapi/migration.json   | 21 ++++++++++++++++++++-
>>  migration/migration.h |  1 +
>>  hw/core/machine.c     |  1 +
>>  migration/migration.c | 17 +++++++++++++++--
>>  4 files changed, 37 insertions(+), 3 deletions(-)
>> 
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index c84fa10e86..3afd81174d 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -478,6 +478,24 @@
>>  #                    should not affect the correctness of postcopy migration.
>>  #                    (since 7.1)
>>  #
>> +# @multifd-flush-after-each-section: flush every channel after each
>> +#                                    section sent.  This assures that
>> +#                                    we can't mix pages from one
>> +#                                    iteration through ram pages with
>> +#                                    pages for the following
>> +#                                    iteration.  We really only need
>> +#                                    to do this flush after we have go
>> +#                                    through all the dirty pages.
>> +#                                    For historical reasons, we do
>> +#                                    that after each section.  This is
>> +#                                    suboptimal (we flush too many
>> +#                                    times).
>> +#                                    Default value is false.
>> +#                                    Setting this capability has no
>> +#                                    effect until the patch that
>> +#                                    removes this comment.
>> +#                                    (since 8.0)
>
> IMHO the core of this new "cap" is the new RAM_SAVE_FLAG_MULTIFD_FLUSH bit
> in the stream protocol, but it's not referenced here.  I would suggest
> simplify the content but highlight the core change:

Actually it is the other way around.  What this capability will do is
_NOT_ use RAM_SAVE_FLAG_MULTIFD_FLUSH protocol.

>  @multifd-lazy-flush:  When enabled, multifd will only do sync flush after
>                        each whole round of bitmap scan.  Otherwise it'll be
>                        done per RAM save iteration (which happens with a much
>                        higher frequency).
>
>                        Please consider enable this as long as possible, and
>                        keep this off only if any of the src/dst QEMU binary
>                        doesn't support it.
>
>                        This capability is bound to the new RAM save flag
>                        RAM_SAVE_FLAG_MULTIFD_FLUSH, the new flag will only
>                        be used and recognized when this feature bit set.

Name is wrong.  It would be multifd-non-lazy-flush.  And I don't like
negatives.  Real name is:

multifd-I-messed-and-flush-too-many-times.


> I know you dislike multifd-lazy-flush, but that's still the best I can come
> up with when writting this (yeah I still like it :-p), please bare with me
> and take whatever you think the best.

Libvirt assumes that all capabilities are false except if enabled.
We want RAM_SAVE_FLAG_MULTFD_FLUSH by default (in new machine types).

So, if we can do

capability_use_new_way = true

We change that to

capability_use_old_way = true

And then by default with false value is what we want.

>> +bool migrate_multifd_flush_after_each_section(void)
>> +{
>> +    MigrationState *s = migrate_get_current();
>> +
>> +    /*
>> +     * Until the patch that remove this comment, we always return that
>> +     * the capability is enabled.
>> +     */
>> +    return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION];
>
> (I'd rather not care about what happens if someone applies only this patch
>  not the latter two by dropping "true ||" directly here, but again, no a
>  huge deal)
>
>> +}

It don't matter at all.

Patch1: Introduces the code for a capability, but nothing else.
        It makes the capability be true always (remember old code)
Patch2: Makes old code conditional on this capability (see that we have
        force it to be true).
Patch3: Introduce code for the new capability, and "protect" it for the
        capability being false.  We can remove the "trick" that we just
        had.

See discussion on v5 with Markus for more details.

Later, Juan.

>> +
>>  bool migrate_pause_before_switchover(void)
>>  {
>>      MigrationState *s;
>> @@ -4535,7 +4547,8 @@ static Property migration_properties[] = {
>>      DEFINE_PROP_MIG_CAP("x-zero-copy-send",
>>              MIGRATION_CAPABILITY_ZERO_COPY_SEND),
>>  #endif
>> -
>> +    DEFINE_PROP_MIG_CAP("multifd-flush-after-each-section",
>> +                        MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> -- 
>> 2.39.1
>> 
>> 


