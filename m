Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632156AC3E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:52:28 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9XY1-0006nA-Sk
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o9XWq-0005On-0p
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o9XWm-0001o9-Lg
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ks6OzCvuh17lB7jFCNsA8BVI5XHQh01HLXayl/Gj6lU=;
 b=Oo/lCgCU3pP/u+lhdFJqnpHaedTGl+pkA4QkJiE8gnC/vrKka5k1H7Xh/ST4O6jhpGTCuz
 Zow5C0phiCEBjyb/fwfS3hLah3+ZO7L+iiRDGYS1cbedO8tKoYE4JNtNTozQtcGy8h4eSQ
 aRsOgEvHeIoZ7ogSpZEkE+7KKQm7+pY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-qMQWYcDkOQuimISFstqXwA-1; Thu, 07 Jul 2022 15:50:59 -0400
X-MC-Unique: qMQWYcDkOQuimISFstqXwA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y18-20020a056402441200b0043564cdf765so14619124eda.11
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 12:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ks6OzCvuh17lB7jFCNsA8BVI5XHQh01HLXayl/Gj6lU=;
 b=vijBhIpp2Q0dHmuM8oBbINH4l2ViDsSKM/UE99PRFCcw9Nb3vXMgQomanYClD0G/9G
 GI3rXajqwSwcDi5PcL6rLMm1TO1O6uIyfmuGsOpg49yU7Ot73yk1SIgfU/7FuWXSoUW6
 h7VI5eKAi8s+MDUDss9yG0i5YZxVqCHw4JORqnR8voOe8UpWwMcD+896yvuebr0PNVhX
 pGqRdGRJQhuyDRD4w2EksxV348Z7eyjPel/rLGugJpzm/mkjLUJU//WkjMSlbd4Gu5kS
 X0UVyIobMTWnxF/YSf8dRXmxsiGFbnVp8DOjtrJBsWlp3b3u2oEq16eJGpzsVWNb2H+B
 /IPg==
X-Gm-Message-State: AJIora/7JyDcW+UaMgpku0wlJj33lsvHIC8vCS1KDQrSlE82bTPmpXmS
 xDshqdgChC8FlIDd4mcX02b2cU8VyatPbh2c3Fkpncp4NiYyOZi2Y3J86hQb3YRyU29R5JNH84K
 hElttuUnaR9+f70+zeG8IW9xtWAVyvFY=
X-Received: by 2002:a17:907:7f22:b0:726:8962:d5a6 with SMTP id
 qf34-20020a1709077f2200b007268962d5a6mr47252829ejc.717.1657223458521; 
 Thu, 07 Jul 2022 12:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBmTBNxWZHT0xFoGloTlNZqLrBwbmN9nQ5tUqJSsbfTIo8idZhkbbDVdFN6tSJuXsby4qbe+5DvULZ0NdJ3SA=
X-Received: by 2002:a17:907:7f22:b0:726:8962:d5a6 with SMTP id
 qf34-20020a1709077f2200b007268962d5a6mr47252810ejc.717.1657223458276; Thu, 07
 Jul 2022 12:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-3-leobras@redhat.com>
 <Yscdy/YZZ6H1Qpr3@xz-m1.local>
In-Reply-To: <Yscdy/YZZ6H1Qpr3@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 7 Jul 2022 16:50:47 -0300
Message-ID: <CAJ6HWG7CDKKWfyiPQqRtUzEmnB5gTzHdOMJMTH1VvV1wG6LVoA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Add dirty-sync-missed-zero-copy migration stat
To: Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Thu, Jul 7, 2022 at 2:54 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jul 04, 2022 at 05:23:14PM -0300, Leonardo Bras wrote:
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  qapi/migration.json   | 7 ++++++-
> >  migration/migration.c | 2 ++
> >  monitor/hmp-cmds.c    | 4 ++++
> >  3 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 7102e474a6..fed08b9b88 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -55,6 +55,10 @@
> >  # @postcopy-bytes: The number of bytes sent during the post-copy phase
> >  #                  (since 7.0).
> >  #
> > +# @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
> > +#                               not avoid copying zero pages.  This is between 0
>
> Avoid copying zero pages?  Isn't this for counting MSG_ZEROCOPY fallbacks?

Yes, sorry, I think I got confused at some point between some cuts & pastes.
It should be "not avoid copying dirty pages." I will fix that on a V4.


>
> > +#                               and @dirty-sync-count * @multifd-channels.
>
> I'd not name it as "dirty-sync-*" because fundamentally the accounting is
> not doing like that (more in latter patch).

Ok, I will take a look & answer there.

> I also think we should squash
> patch 2/3 as patch 3 only started to provide meaningful values.

IIRC Previously in zero-copy-send implementation, I was asked to keep the
property/capability in a separated patch in order to make it easier to review.
So I thought it would be helpful now.

>
> > +#                               (since 7.1)
> >  # Since: 0.14
> >  ##
> >  { 'struct': 'MigrationStats',
> > @@ -65,7 +69,8 @@
> >             'postcopy-requests' : 'int', 'page-size' : 'int',
> >             'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
> >             'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
> > -           'postcopy-bytes' : 'uint64' } }
> > +           'postcopy-bytes' : 'uint64',
> > +           'dirty-sync-missed-zero-copy' : 'uint64' } }
> >
> >  ##
> >  # @XBZRLECacheStats:
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 78f5057373..048f7f8bdb 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -1027,6 +1027,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
> >      info->ram->normal_bytes = ram_counters.normal * page_size;
> >      info->ram->mbps = s->mbps;
> >      info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
> > +    info->ram->dirty_sync_missed_zero_copy =
> > +            ram_counters.dirty_sync_missed_zero_copy;
> >      info->ram->postcopy_requests = ram_counters.postcopy_requests;
> >      info->ram->page_size = page_size;
> >      info->ram->multifd_bytes = ram_counters.multifd_bytes;
> > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > index ca98df0495..5f3be9e405 100644
> > --- a/monitor/hmp-cmds.c
> > +++ b/monitor/hmp-cmds.c
> > @@ -307,6 +307,10 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
> >              monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
> >                             info->ram->postcopy_bytes >> 10);
> >          }
> > +        if (info->ram->dirty_sync_missed_zero_copy) {
> > +            monitor_printf(mon, "missed zero-copy on: %" PRIu64 " iterations\n",
> > +                           info->ram->dirty_sync_missed_zero_copy);
>
> I suggest we don't call it "iterations" because it's not the generic mean
> of iterations.

Yeah, I thought that too, but I could not think on anything better.
What do you suggest instead?

Best regards,
Leo

>
> > +        }
> >      }
> >
> >      if (info->has_disk) {
> > --
> > 2.36.1
> >
>
> --
> Peter Xu
>


