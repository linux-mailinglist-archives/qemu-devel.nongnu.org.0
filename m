Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9934588AF5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 13:14:00 +0200 (CEST)
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJCK7-0001O9-Ni
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 07:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oJCEM-0003tQ-7R
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oJCEI-000495-MQ
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659524877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OcEGkV3/zb941iwtTvPuEZEmPDY+7QrxrqNr180ZZIM=;
 b=EXnBTWgk7q4UR1FObTR1KXDcuaKuwLX50/tFmOEHCpAt6jUH95j3gJOdyInQ3gHt7/OXPP
 PHb6VMjYuE1iLmzmYdQB60urU5gNs6qzGvQYhj57d07DYFWFLo81I61ycSVFqsm5FSdGDH
 CGmVmBMEJGhYSUgIf3ii3QyafapZAqs=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-W1EeHfoRPNmlMq5CHBvkCw-1; Wed, 03 Aug 2022 07:07:56 -0400
X-MC-Unique: W1EeHfoRPNmlMq5CHBvkCw-1
Received: by mail-il1-f199.google.com with SMTP id
 j5-20020a056e02218500b002de1cf2347bso8556526ila.2
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 04:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OcEGkV3/zb941iwtTvPuEZEmPDY+7QrxrqNr180ZZIM=;
 b=LAG5Dkd5I037DV3y7djuiw6G9DQOLNUx3zW29pnC9hLrWifbCZqAn8YWEdDqnX643K
 myDkxSeYjxHMLf0/egvCRewLkB/P+xUybenvCLDfZy+Lk2Kllyr3k2B+GP0B0+LP/g78
 7J//vyiaTikBDlQxY8/hRsb9Lq9EiFo5zWqRKin9SXOOrE6fcrwCTfd1xXUe4a04YEYK
 W/g4zRKmhM3Y2h2EwfxNDU5k825K3m889LlElT86oW6FRwK94NVlOiaI8mpIF2tyqBiA
 EaTKSb7jgelVj7WSQX1Pq1v3ZE3Pb82IclyOiYcQ5By+tJyH1L9zoHVxyF0ynxx+Bc8d
 yvUg==
X-Gm-Message-State: AJIora8++lPPw3FFbBxV1HMe9rVlwdA6VfguvDX84hugMq7WVLEFMnGH
 2qZgSA8TxoCxv9XjAQM5Vhw+vWy2Ju6jbjxicwjMCbWRPnq+so+k93aj7bHt82TdklTpo+gvwO4
 cTBNgof7sK9u5NY3t1s9WfuscLitTn8g=
X-Received: by 2002:a05:6602:15c8:b0:67c:45c7:40c9 with SMTP id
 f8-20020a05660215c800b0067c45c740c9mr8973003iow.138.1659524875513; 
 Wed, 03 Aug 2022 04:07:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sIC6UsjJFVZWXBncAJfjfkGBkh360OVyksDTVgRe9qvGO4zJpINBXeKgqj4Vm5Jwl/M2m4t3qQIO9kZjook7k=
X-Received: by 2002:a05:6602:15c8:b0:67c:45c7:40c9 with SMTP id
 f8-20020a05660215c800b0067c45c740c9mr8972980iow.138.1659524875284; Wed, 03
 Aug 2022 04:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
 <20220729130040.1428779-3-afaria@redhat.com>
 <YupSAhFRK962i+nL@work-vm>
In-Reply-To: <YupSAhFRK962i+nL@work-vm>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 3 Aug 2022 12:07:19 +0100
Message-ID: <CAELaAXyh0MzuVzDCfhC8hJNAwb=niwFRsXqhc63JiWGxxitkqg@mail.gmail.com>
Subject: Re: [RFC v2 02/10] Drop unused static function return values
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Hannes Reinecke <hare@suse.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Peter Lieven <pl@kamp.de>,
 kvm@vger.kernel.org, 
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Stefan Weil <sw@weilnetz.de>, 
 Klaus Jensen <its@irrelevant.dk>, Laurent Vivier <lvivier@redhat.com>, 
 Alberto Garcia <berto@igalia.com>, Michael Roth <michael.roth@amd.com>, 
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Aug 3, 2022 at 11:46 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Alberto Faria (afaria@redhat.com) wrote:
> > Make non-void static functions whose return values are ignored by
> > all callers return void instead.
> >
> > These functions were found by static-analyzer.py.
> >
> > Not all occurrences of this problem were fixed.
> >
> > Signed-off-by: Alberto Faria <afaria@redhat.com>
>
> <snip>
>
> > diff --git a/migration/migration.c b/migration/migration.c
> > index e03f698a3c..4698080f96 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -175,7 +175,7 @@ static MigrationIncomingState *current_incoming;
> >
> >  static GSList *migration_blockers;
> >
> > -static bool migration_object_check(MigrationState *ms, Error **errp);
> > +static void migration_object_check(MigrationState *ms, Error **errp);
> >  static int migration_maybe_pause(MigrationState *s,
> >                                   int *current_active_state,
> >                                   int new_state);
> > @@ -4485,15 +4485,15 @@ static void migration_instance_init(Object *obj)
> >   * Return true if check pass, false otherwise. Error will be put
> >   * inside errp if provided.
> >   */
> > -static bool migration_object_check(MigrationState *ms, Error **errp)
> > +static void migration_object_check(MigrationState *ms, Error **errp)
> >  {
>
> I'm not sure if this is a good change.
> Where we have a function that returns an error via an Error ** it's
> normal practice for us to return a bool to say whether it generated an
> error.
>
> Now, in our case we only call it with error_fatal:
>
>     migration_object_check(current_migration, &error_fatal);
>
> so the bool isn't used/checked.
>
> So I'm a bit conflicted:
>
>   a) Using error_fatal is the easiest way to handle this function
>   b) Things taking Error ** normally do return a flag value
>   c) But it's not used in this case.
>
> Hmm.

I guess this generalizes to the bigger question of whether a global
"return-value-never-used" check makes sense and brings value. Maybe
there are too many cases where it would be preferable to keep the
return value for consistency? Maybe they're not that many and could be
tagged with __attribute__((unused))?

But in this particular case, perhaps we could drop the Error **errp
parameter and directly pass &error_fatal to migrate_params_check() and
migrate_caps_check().

Alberto


