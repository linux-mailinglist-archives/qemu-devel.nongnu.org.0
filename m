Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A956528F6A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:23:42 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhFl-0007Yd-5Q
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nqhEG-0006nm-Mm
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nqhED-0001j6-RK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652732523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loumk7RgqFyJIytedZp7EfT4/IOUaZM+EMNB8014S+s=;
 b=efbcgtJ55sX7yAWjA9r/dhfdPrTWwm41qD/NGStysbteqbrd+UlDHi0P0BYinAHXHFpsly
 5lzsV/THQ+GDATucMRVXqQ2Sd5YDoYAy13/ofvcZ3gq0FWpCTY0k3UM49CWH0Cuk1NnwYh
 c5ic1HkcY8/DWj7CAAutruQ9gAhEPkM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-b13b0miDPEe4866wkhLG0Q-1; Mon, 16 May 2022 16:22:02 -0400
X-MC-Unique: b13b0miDPEe4866wkhLG0Q-1
Received: by mail-il1-f197.google.com with SMTP id
 w14-20020a056e021c8e00b002cf20eefac2so8295160ill.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=loumk7RgqFyJIytedZp7EfT4/IOUaZM+EMNB8014S+s=;
 b=1FPgvaamlf3aYJc6Th+aWk06Jd6MxQCpacUxmFw4oeFq4vwKco/7dWzwtTOg48mixa
 qbXrp7nmcE9PLWUrZXdAOL0ake1oD3AMY+RB5UL5tp8mama1DKQXOfAR0EW0uEOEEP5S
 L2HnCw4OCLXM4nM9Wy4p6+aZ10idgl3/SKJpWaSp3wrU0uNW11FjqNPINrrEpgORbz7k
 UMRG4bKtUern5HqT1Aq3ELbfLe9q4Abh3WBzTArVByQXo67t31n3tIJBAQMAR6I9uBsi
 I21Fqu+xS8KyolwhScE6gV+6YAYkRjqerfyMQZodWqbTAxG2jDw1fZYXhKvXDjFZn4GT
 YrAQ==
X-Gm-Message-State: AOAM533e4REsGRaFyJF/IYEchds8CRgVGzAGV7UPKjiZyt2jxKWwC/md
 lL2hD6yuGomG8EESCO8LsjhMG2m4C5pprvyk2Xd0aDaUlCiSMYV/iXnYq5ozq4yGs/8738zsaGu
 tvEuWjyfMb3PdRbY=
X-Received: by 2002:a05:6e02:15c2:b0:2b8:4642:8e3c with SMTP id
 q2-20020a056e0215c200b002b846428e3cmr9638290ilu.244.1652732521676; 
 Mon, 16 May 2022 13:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl0q7CA7DTprJMllTbVKpmDujQR7IgXE7ppku6aTmyJOIrsLN6NeyXhR7EgmaqhnO4/bFQkg==
X-Received: by 2002:a05:6e02:15c2:b0:2b8:4642:8e3c with SMTP id
 q2-20020a056e0215c200b002b846428e3cmr9638274ilu.244.1652732521396; 
 Mon, 16 May 2022 13:22:01 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h23-20020a0566380f9700b0032b3a781751sm3050537jal.21.2022.05.16.13.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:22:00 -0700 (PDT)
Date: Mon, 16 May 2022 14:22:00 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, <qemu-devel@nongnu.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, "Cornelia Huck" <cohuck@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, "Mark Bloch" <mbloch@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
Message-ID: <20220516142200.57003872.alex.williamson@redhat.com>
In-Reply-To: <87h75psowp.fsf@secure.mitica>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 16 May 2022 13:22:14 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Avihai Horon <avihaih@nvidia.com> wrote:
> > Currently, if IOMMU of a VFIO container doesn't support dirty page
> > tracking, migration is blocked completely. This is because a DMA-able
> > VFIO device can dirty RAM pages without updating QEMU about it, thus
> > breaking the migration.
> >
> > However, this doesn't mean that migration can't be done at all. If
> > migration pre-copy phase is skipped, the VFIO device doesn't have a
> > chance to dirty RAM pages that have been migrated already, thus
> > eliminating the problem previously mentioned.
> >
> > Hence, in such case allow migration but skip pre-copy phase.
> >
> > Signed-off-by: Avihai Horon <avihaih@nvidia.com>  
> 
> I don't know (TM).
> Several issues:
> - Patch is ugly as hell (ok, that depends on taste)
> - It changes migration_iteration_run() instead of directly
>   migration_thread.
> - There is already another case where we skip the sending of RAM
>   (localhost migration with shared memory)
> 
> In migration/ram.c:
> 
> static int ram_find_and_save_block(RAMState *rs, bool last_stage)
> {
>     PageSearchStatus pss;
>     int pages = 0;
>     bool again, found;
> 
>     /* No dirty page as there is zero RAM */
>     if (!ram_bytes_total()) {
>         return pages;
>     }
> 
> This is the other place where we _don't_ send any RAM at all.
> 
> I don't have a great idea about how to make things clear at a higher
> level, I have to think about this.

It seems like if we have devices dictating what type of migrations can
be performed then there probably needs to be a switch to restrict use of
such devices just as we have the -only-migratable switch now to prevent
attaching devices that don't support migration.  I'd guess that we need
the switch to opt-in to allowing such devices to maintain
compatibility.  There's probably a whole pile of qapi things missing to
expose this to management tools as well.  Thanks,

Alex

> > ---
> >  hw/vfio/migration.c   | 9 ++++++++-
> >  migration/migration.c | 5 +++++
> >  migration/migration.h | 3 +++
> >  3 files changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> > index 21e8f9d4d4..d4b6653026 100644
> > --- a/hw/vfio/migration.c
> > +++ b/hw/vfio/migration.c
> > @@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
> >      struct vfio_region_info *info = NULL;
> >      int ret = -ENOTSUP;
> >  
> > -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> > +    if (!vbasedev->enable_migration) {
> >          goto add_blocker;
> >      }
> >  
> > +    if (!container->dirty_pages_supported) {
> > +        warn_report(
> > +            "%s: IOMMU of the device's VFIO container doesn't support dirty page tracking, migration pre-copy phase will be skipped",
> > +            vbasedev->name);
> > +        migrate_get_current()->skip_precopy = true;
> > +    }
> > +
> >      ret = vfio_get_dev_region_info(vbasedev,
> >                                     VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> >                                     VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 5a31b23bd6..668343508d 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -3593,6 +3593,11 @@ static MigIterateState migration_iteration_run(MigrationState *s)
> >      uint64_t pending_size, pend_pre, pend_compat, pend_post;
> >      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
> >  
> > +    if (s->skip_precopy) {
> > +        migration_completion(s);
> > +        return MIG_ITERATE_BREAK;
> > +    }
> > +
> >      qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
> >                                &pend_compat, &pend_post);
> >      pending_size = pend_pre + pend_compat + pend_post;
> > diff --git a/migration/migration.h b/migration/migration.h
> > index a863032b71..876713e7e1 100644
> > --- a/migration/migration.h
> > +++ b/migration/migration.h
> > @@ -332,6 +332,9 @@ struct MigrationState {
> >       * This save hostname when out-going migration starts
> >       */
> >      char *hostname;
> > +
> > +    /* Whether to skip pre-copy phase of migration or not */
> > +    bool skip_precopy;
> >  };
> >  
> >  void migrate_set_state(int *state, int old_state, int new_state);  
> 


