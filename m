Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B8702711
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:23:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTUG-0001HF-Qk; Mon, 15 May 2023 04:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTUE-0001Gi-86
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyTUB-0004ap-KH
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684138994;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nc8r82BNPbB9nBy1bPFmOOBDj0d/nU4ymkWWYp5DM3s=;
 b=MtFZ5IO7KtEpkwGIhFK9pwGbmBcSK4IrdKhZA4v+F/rK2IzMyAzBwBxqJq3koTQGqzZ3/+
 kbZZrc2yzrUGboAn9YNz/oAsZDgNJhoVJo43sFP8SBBeyip1G1XRkjlNmMco0rvVoEKbdL
 4NbTghm+Iyp2PvzLGwAjtk776EznpYI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-WW5oyEzEObmLwHmwU5Y9Rg-1; Mon, 15 May 2023 04:23:13 -0400
X-MC-Unique: WW5oyEzEObmLwHmwU5Y9Rg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f4245ffb03so53164735e9.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684138992; x=1686730992;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nc8r82BNPbB9nBy1bPFmOOBDj0d/nU4ymkWWYp5DM3s=;
 b=HGLd8lWuX9JDktnWaYVlN5sTFODKA1jKKSNBec2joTNe3nWCFJ9FY8QCYaCt2K7jdx
 U4luNZc8ntG6mR2/6/TJGLeehi0KMioRbtzSBQlWytkWryQ9WtxvHnOW81hnVfwf/PyY
 DeDaEcrMChbWejPd2AYkRzuX34TK9/T6e3G5o3jUO/gfY7QPX1RuCWjfFglu/3wpKSFV
 +E5jP71fPomPwiDhTG/lstc4U9/S95vD6OwHmiOimvVfi3Y2l28EA++K3UKDKqHTAxVC
 NkSDhUa2ltmlft5xi8QHBl6ffQTglYSeb/5ABI3dIKMuLh2s82plVdgBGGUhKbVFL94r
 650Q==
X-Gm-Message-State: AC+VfDyq6zYmkA6XSb9a0OxL1I4dKiVzQGVAXwKH9uiI5AZ8tAvUt9iz
 0xieZ2Oi/h4QhyTDBJuLCGLlbjeUlpFSmKASQqnHZ3lnM3pQQvVizUBG3L+gpn7Dl2zm5ewwUEX
 0V5pmYEmPOjksBvYIrNqj4SbH3w==
X-Received: by 2002:a7b:cc15:0:b0:3f0:9564:f4f6 with SMTP id
 f21-20020a7bcc15000000b003f09564f4f6mr22211245wmh.1.1684138992268; 
 Mon, 15 May 2023 01:23:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7SApW3APtS0w9kM92yybMJNyGytPLxMgiS0iJ4v+gCyh3Y9AwyCi8XQ7qrBEYWRjVFSkfJpg==
X-Received: by 2002:a7b:cc15:0:b0:3f0:9564:f4f6 with SMTP id
 f21-20020a7bcc15000000b003f09564f4f6mr22211234wmh.1.1684138991956; 
 Mon, 15 May 2023 01:23:11 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884b3sm10568362wmg.20.2023.05.15.01.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 01:23:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: <gudkov.andrei@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <eblake@redhat.com>,  <armbru@redhat.com>,
 <berrange@redhat.com>,  <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 2/4] migration/calc-dirty-rate: detailed stats in
 sampling mode
In-Reply-To: <ZF47+rkmPdTKIaH8@DESKTOP-0LHM7NF.china.huawei.com> (gudkov
 andrei's message of "Fri, 12 May 2023 16:18:04 +0300")
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
 <875y906qce.fsf@secure.mitica>
 <ZF47+rkmPdTKIaH8@DESKTOP-0LHM7NF.china.huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 10:23:10 +0200
Message-ID: <87fs7y2ec1.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

<gudkov.andrei@huawei.com> wrote:
> On Wed, May 10, 2023 at 07:36:33PM +0200, Juan Quintela wrote:
>> Andrei Gudkov <gudkov.andrei@huawei.com> wrote:
>> > Collect number of dirty pages for progresseively increasing time
>> > periods starting with 125ms up to number of seconds specified with
>> > calc-dirty-rate. Report through qmp and hmp: 1) vector of dirty page
>> > measurements, 2) page size, 3) total number of VM pages, 4) number
>> > of sampled pages.
>> >
>> > Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
>> > ---
>> >  migration/dirtyrate.c | 165 +++++++++++++++++++++++++++++-------------
>> >  migration/dirtyrate.h |  25 ++++++-
>> >  qapi/migration.json   |  24 +++++-
>> 
>> You need the equivalent of this in your .git/config file.
>> 
>> [diff]
>> 	orderFile = scripts/git.orderfile
>> 
>> In particular:
>> *json files cames first
>> *.h second
>> *.c third
>> 
>> >  3 files changed, 160 insertions(+), 54 deletions(-)
>> >
>> > diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> > index acba3213a3..4491bbe91a 100644
>> > --- a/migration/dirtyrate.c
>> > +++ b/migration/dirtyrate.c
>> > @@ -224,6 +224,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>> >      info->calc_time = DirtyStat.calc_time;
>> >      info->sample_pages = DirtyStat.sample_pages;
>> >      info->mode = dirtyrate_mode;
>> > +    info->page_size = TARGET_PAGE_SIZE;
>> 
>> I thought we exported this trough ""info migrate"
>> but we do it only if we are in the middle of a migration.  Perhaps we
>> should print it always.
>
> So, which one do you prefer? To keep it here or to make "info migrate" print it always (or both)?

info migrate to print it always.  Thanks.

>> > @@ -1814,7 +1830,13 @@
>> >             'calc-time': 'int64',
>> >             'sample-pages': 'uint64',
>> >             'mode': 'DirtyRateMeasureMode',
>> > -           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
>> > +           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ],
>> > +           'page-size': 'int64',
>> 
>> 2 things:
>> a- this is exported in info migrate, so you can get it from there.
>> b- even if we export it here, it is as size or uint64, negative page
>>    size make no sense (not that I am expecting to have page that don't
>>    fit in a int O:-)
>
> But can you be sure that in the future you are not going to return
> sentinel value like "-1"? :)

For page-size?  I don't expect it.  And if I want a sentinel values,
UINT64_MAX, UINT64_MAX-1 and friends looks good enough for me.

>> Same for the rest of the counters.
>
> Ok, but I still insist on using 64 bit types for the page number counters.
> It looks to me that 16TiB VM is a matter of near future.

size_t is 64 bits on any host that is able to handle 16TiB guests O:-)
But I am indifferent to uint64_t or size_t (I am only on 64 bit machines,
so it is the same for me).  That would only help in 32bits hosts, but I
am pretty sure that nobody is using them seriously (for migration)
because all the 32bit bugs that I get on migration is from the build
bots, not real users.

Later, Juan.


