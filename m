Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F86696C46
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzfH-00063U-7h; Tue, 14 Feb 2023 13:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRzfD-00062M-Vb
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRzfC-0007x7-5u
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676397861;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BIQTWua7O8XcniyKd7A3dPI12y+JiWlHpYw65GbxQuk=;
 b=GCMei8hVmFXJmJxZzsbR7HM4TXGNJTO6FUskTmay2/p/NkNMJaKc/1r4nZwLEFU3Feogsf
 3khbDlgzcg190pN+1wUl4Mgl9hTH96qac+7w7UQHm5xPp3ccqQARU0NmMUIAoggJeKhHOy
 kbCx0aWJIMkORN7nus9x/8W/KO3xG+4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341---nbvP4hMyS2bgRIgqZEvg-1; Tue, 14 Feb 2023 13:04:11 -0500
X-MC-Unique: --nbvP4hMyS2bgRIgqZEvg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r15-20020a5d494f000000b002c54d9b8312so1750377wrs.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BIQTWua7O8XcniyKd7A3dPI12y+JiWlHpYw65GbxQuk=;
 b=vVk8IlV9UaYFaXGpkQwiYvJ5b7o9zy6jHbNO7yv/uI8iYgdvaa8ArW3eQZz2g0Pt0f
 21sqJlC4RWFFshC8Xdr06Q1eH5g1dsj6AED0G/xJ7ghsm2hdt7a/DRz7d9/VUlPr9hwi
 W3nX5ArVkjqvn1Yum+MF2xh7u1Ma1G+p19IZfk4a45j/Tksd7HETccXvBMXR8mbpJD/L
 pFunH8STSYRHLxRK/SpXYI6mljA45YPAD2Pi5SWaAIdTod61sScM2Kc5ADivX1Wn3qmM
 yXRHBKLGQRBey6FHkKs/XJlIEHMg3sXSAI5IS4rWgt6gk44xLAwzFS4MgpUhaWsDrW+G
 q7oA==
X-Gm-Message-State: AO0yUKWwj8MSmjOlFtXlB5DS+r3Z2N7rxuNke0YvrcZ3q6sX9hnhZGTt
 svfKhQm4Jja2BENcvx6N8kaQ+Fm0AZNVhuS+plFZ7MuY/jIBrOVrT2bsCUXqL8fQxEeKQMyu3Dx
 hfgMksrfWrqujSqk=
X-Received: by 2002:a05:600c:1d13:b0:3df:eda1:439c with SMTP id
 l19-20020a05600c1d1300b003dfeda1439cmr512664wms.11.1676397850180; 
 Tue, 14 Feb 2023 10:04:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8aECWOO5VsnYFZxmYa7z/ogbqvVnlCBluWlLoPCKtTQDr2fJpai7kIixZ38I97hadh0s1V9w==
X-Received: by 2002:a05:600c:1d13:b0:3df:eda1:439c with SMTP id
 l19-20020a05600c1d1300b003dfeda1439cmr512638wms.11.1676397849894; 
 Tue, 14 Feb 2023 10:04:09 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f21-20020a05600c43d500b003dc522dd25esm17209133wmn.30.2023.02.14.10.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 10:04:09 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Eric Blake <eblake@redhat.com>,  Yanan Wang
 <wangyanan55@huawei.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v5 1/3] multifd: Create property
 multifd-sync-after-each-section
In-Reply-To: <87mt5goctt.fsf@pond.sub.org> (Markus Armbruster's message of
 "Tue, 14 Feb 2023 09:45:02 +0100")
References: <20230213091548.76444-1-quintela@redhat.com>
 <20230213091548.76444-2-quintela@redhat.com>
 <87mt5goctt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 14 Feb 2023 19:04:08 +0100
Message-ID: <87zg9g5dk7.fsf@secure.mitica>
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
>> We used to synchronize all channels at the end of each RAM section
>> sent.  That is not needed, so preparing to only synchronize once every
>> full round in latests patches.
>>
>> Notice that we initialize the property as true.  We will change the
>> default when we introduce the new mechanism.
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>
>> ---
>>
>> Rename each-iteration to after-each-section
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  qapi/migration.json   | 10 +++++++++-
>>  migration/migration.h |  1 +
>>  hw/core/machine.c     |  1 +
>>  migration/migration.c | 15 +++++++++++++--
>>  4 files changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index c84fa10e86..2907241b9c 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -478,6 +478,13 @@
>>  #                    should not affect the correctness of postcopy migration.
>>  #                    (since 7.1)
>>  #
>> +# @multifd-sync-after-each-section: Synchronize channels after each
>> +#                                   section is sent.
>
> What does it mean to synchronize channels?
>
> When would I want to, and why?
>
>> +#                                                     We used to do
>> +#                                   that in the past, but it is
>> +#                                   suboptimal.
>
> This isn't particularly helpful, I'm afraid.
>
>> +#                                   Default value is true until all code is in.
>
> As far as I can tell, it's actually *unused* for now, and a later patch
> will put it to use ...

We (well, libvert preffers) want capabilities to be false by default.
When I introduce a new capability/parameter:
- Patch1: I introduce the capability/parameter, it does nothing yet.
- Patch2: I conditionalize the old code on this capability.
          Default value is true (old code).
- Patch3: I introduce the new code to implement the feature.
          At this point I change the default.

Depending on complexity, Patch2 and 3 can be a series, but you get the
idea O:-)

>> +#                                   (since 8.0)

Retry.  What about:

# @multifd-sync-after-each-section: flush each channel after each
#                                   section sent.  This assures that
#                                   we can't mix pages from one
#                                   iteration through the dirty bitmap
#                                   with pages for the following
#                                   iteration.  We really only need to
#                                   do this flush after we have go
#                                   trhough all the dirty bitmap.  For
#                                   historical reasons, we do that after
#                                   each section.  This is suboptimal
#                                   (we flush too many times).
#                                   Default value is true until the code
#                                   to implement it is in tree.
#                                   (since 8.0)


Better?

>> +bool migrate_multifd_sync_after_each_section(void)
>> +{
>> +    MigrationState *s = migrate_get_current();
>> +
>> +    return true;
>> +    // We will change this when code gets in.
>> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
>
> ... here.
>
> No warning about unreachable code?  Checking... nope, gcc seems to not
> to care.

Yeap.  Gcc thinks this is ok.
In others try's I have done:

    return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];

If you preffer I can change to this, not strong opinions.

Later, Juan.


