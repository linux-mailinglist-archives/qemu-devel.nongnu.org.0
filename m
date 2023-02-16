Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691F699B06
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:15:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShpQ-0008Vh-8J; Thu, 16 Feb 2023 12:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pShpM-0008Pw-M1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:13:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pShpK-0008Eg-EU
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676567625;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dywHeXbPTl3wReWRnOa+UwHFUDxi7YaD7hHTBu19w6c=;
 b=J8K4XdST9JtgDEFyvRNKp6rigFFJAGz7JpVm/1DXpJg4j/tgEG19eKKUIa+K13R3JuCeyd
 UTttAMQ3k2WSfCBOeDMyWZ/iMi4Zj7+29C61cThd1AixD92XCzAee97AoRUsvp8CgMdZo7
 AHnyFYH/uzDrd0TF7eU6mdDUBEB18cg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-BEYgDr1pP8Wtk_SGl2RJMA-1; Thu, 16 Feb 2023 12:13:41 -0500
X-MC-Unique: BEYgDr1pP8Wtk_SGl2RJMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so3465164wmq.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dywHeXbPTl3wReWRnOa+UwHFUDxi7YaD7hHTBu19w6c=;
 b=JAz4R1vKs76H9WyGFG8aNdOiYHgIpKTI+roXRpQvXvq9TiOL05/sfxLOakppVid3Ej
 o7MM6IMRmmQJT9VOcB59IAYi2kV5ZVoERcg94+DG2emmQjCKxbcEpMWy2FXLCO8Q0aYl
 czXAx19d1QRMuXcSDVGLLenaYZLU8OeM5xY+SwGb+TSSNEKeVLvFG+3Zu30+fvGfiDDd
 QMlZZkfX3PXqlceZ4LnOkN2ep0nLS2PNyUxlMr4khXgGYdNSdwhk9GAKRxxdESW5YCaF
 32dHbeMKweJC0uh0LqSIfznVWBnBn6Pzrv4G//Pv9crpUsDoV2rvR13UN9jNKJAFG38R
 VqAw==
X-Gm-Message-State: AO0yUKU5LKa02jl55AEEqMfDnUVrL3ZsX68e5lzxdkel0lwWVbjwnUmc
 fyH2IcFzDVOuj1o1WIgdLbMJ+yrFSbnZnET6pBDc+hl/US3442fRiuyFM2x5xQysh4NPaKORXhd
 ugNNool0aCs3bqvw=
X-Received: by 2002:adf:cc86:0:b0:2c5:5b9d:70ee with SMTP id
 p6-20020adfcc86000000b002c55b9d70eemr5202956wrj.22.1676567620348; 
 Thu, 16 Feb 2023 09:13:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9asIpgnhE4XqrPFfDnvg3sLJvXJbmBqiOQqKLSH2awDeAmTUOeWW09/vToH/DKxzEbKm4ISg==
X-Received: by 2002:adf:cc86:0:b0:2c5:5b9d:70ee with SMTP id
 p6-20020adfcc86000000b002c55b9d70eemr5202938wrj.22.1676567620050; 
 Thu, 16 Feb 2023 09:13:40 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z18-20020adff1d2000000b002c57c7b06e3sm1932181wro.83.2023.02.16.09.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:13:39 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,  qemu-devel@nongnu.org,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v6 1/3] multifd: Create property
 multifd-flush-after-each-section
In-Reply-To: <87v8k1myjs.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 16 Feb 2023 16:15:35 +0100")
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-2-quintela@redhat.com> <Y+05hM4JPbfjUjn8@x1n>
 <87edqqlma4.fsf@secure.mitica> <87v8k1myjs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 18:13:38 +0100
Message-ID: <87a61dfs8t.fsf@secure.mitica>
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

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>>>> @@ -478,6 +478,24 @@
>>>>  #                    should not affect the correctness of postcopy migration.
>>>>  #                    (since 7.1)
>>>>  #
>>>> +# @multifd-flush-after-each-section: flush every channel after each
>>>> +#                                    section sent.  This assures that
>>>> +#                                    we can't mix pages from one
>>>> +#                                    iteration through ram pages with
>
> RAM

OK.

>>>> +#                                    pages for the following
>>>> +#                                    iteration.  We really only need
>>>> +#                                    to do this flush after we have go
>
> to flush after we have gone

OK

>>>> +#                                    through all the dirty pages.
>>>> +#                                    For historical reasons, we do
>>>> +#                                    that after each section.  This is

> we flush after each section

OK

>>>> +#                                    suboptimal (we flush too many
>>>> +#                                    times).

> inefficient: we flush too often.

OK

>>>> +#                                    Default value is false.
>>>> +#                                    Setting this capability has no
>>>> +#                                    effect until the patch that
>>>> +#                                    removes this comment.
>>>> +#                                    (since 8.0)
>>>
>>> IMHO the core of this new "cap" is the new RAM_SAVE_FLAG_MULTIFD_FLUSH bit
>>> in the stream protocol, but it's not referenced here.  I would suggest
>>> simplify the content but highlight the core change:
>>
>> Actually it is the other way around.  What this capability will do is
>> _NOT_ use RAM_SAVE_FLAG_MULTIFD_FLUSH protocol.
>>
>>>  @multifd-lazy-flush:  When enabled, multifd will only do sync flush after
>
> Spell out "synchronrous".
ok.

>>>                        each whole round of bitmap scan.  Otherwise it'll be
>
> Suggest to scratch "whole".

ok.

>>>                        done per RAM save iteration (which happens with a much
>>>                        higher frequency).
>
> Less detail than Juan's version.  I'm not sure how much detail is
> appropriate for QMP reference documentation.
>
>>>                        Please consider enable this as long as possible, and
>>>                        keep this off only if any of the src/dst QEMU binary
>>>                        doesn't support it.
>
> Clear guidance on how to use it, good!
>
> Perhaps state it more forcefully: "Enable this when both source and
> destination support it."
>
>>>
>>>                        This capability is bound to the new RAM save flag
>>>                        RAM_SAVE_FLAG_MULTIFD_FLUSH, the new flag will only
>>>                        be used and recognized when this feature bit set.
>
> Is RAM_SAVE_FLAG_MULTIFD_FLUSH visible in the QMP interface?  Or in the
> migration stream?

No.  Only migration stream.

> I'm asking because doc comments are QMP reference documentation, but
> when writing them, it's easy to mistake them for internal documentation,
> because, well, they're comments.

>> Name is wrong.  It would be multifd-non-lazy-flush.  And I don't like
>> negatives.  Real name is:
>>
>> multifd-I-messed-and-flush-too-many-times.
>
> If you don't like "non-lazy", say "eager".

more than eager it is unnecesary.

>>> I know you dislike multifd-lazy-flush, but that's still the best I can come
>>> up with when writting this (yeah I still like it :-p), please bare with me
>>> and take whatever you think the best.
>>
>> Libvirt assumes that all capabilities are false except if enabled.
>> We want RAM_SAVE_FLAG_MULTFD_FLUSH by default (in new machine types).
>>
>> So, if we can do
>>
>> capability_use_new_way = true
>>
>> We change that to
>>
>> capability_use_old_way = true
>>
>> And then by default with false value is what we want.
>
> Eventually, all supported migration peers will support lazy flush.  What
> then?  Will we flip the default?  Or will we ignore the capability and
> always flush lazily?

I have to take a step back.  Cope with me.

How we fix problems in migration that make the stream incompatible.
We create a property.

static Property migration_properties[] = {
    ...
    DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
                      decompress_error_check, true),
    ....
}

In this case it is true by default.

GlobalProperty hw_compat_2_12[] = {
    { "migration", "decompress-error-check", "off" },
    ...
};

We introduced it on whatever machine that is newer than 2_12.
Then we make it "off" for older machine types, that way we make sure
that migration from old qemu to new qemu works.

And we can even left libvirt, if they know that both qemus are new, they
can setup the property to true even for old machine types.

So, what we have:

Machine 2_13 and newer use the new code.
Machine 2_12 and older use the old code (by default).
We _can_ migrate machine 2_12 with new code, but we need to setup it
correctly on both sides.
We can run the old code with machine type 2_13.  But I admit than that
is only useful for testing, debugging, meassuring performance, etc.

So, the idea here is that we flush a lot of times for old machine types,
and we only flush when needed for new machine types.  Libvirt (or
whoever) can use the new method if it sees fit just using the
capability.

Now that I am telling this, I can switch back to a property instead of a
capability:
- I can have the any default value that I want
- So I can name it multifd_lazy_flush or whatever.

Later, Juan.


