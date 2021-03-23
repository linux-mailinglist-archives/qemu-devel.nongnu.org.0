Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F50346210
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:57:16 +0100 (CET)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiT4-0007F0-G3
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOiQy-0003oj-Mu
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOiQx-00053X-1l
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616511302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nGqJYybGO2Jfi6PESA4WKXL1ZcwrmB31RrC1DV9ZLNo=;
 b=TV1sjD9brDJr3eJQInQeNWmGRK7wbCAeiDqpztdRjB5caH3N3JcZrYjppOV8YJjDJOAUWu
 0pnK9M0/DS+FNPljNFY3FhS62hpcd55bcbaCLyWrZLPJinsU+xTNGdN3r8w+JjI9VVzBav
 fnQ9ZLjI5PNU3iUfdZcPv4V5U7BQVEU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-XKb-jIe2NUm3ZbD7Z8sUMg-1; Tue, 23 Mar 2021 10:55:00 -0400
X-MC-Unique: XKb-jIe2NUm3ZbD7Z8sUMg-1
Received: by mail-qv1-f70.google.com with SMTP id x20so1738206qvd.21
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nGqJYybGO2Jfi6PESA4WKXL1ZcwrmB31RrC1DV9ZLNo=;
 b=qTEcoJzbNGh40LK2SoHyxyHFpWC57uKL7IwjbTzTvt6w19lwTua3/37wTnLnfqhdLP
 YX9W8m7IQf/aljznZ3EsQzfzhIicnEv977l2pqM7wILmWViDtIZ3NtiJy4BuELH6wkRM
 p3JlEI+6A1ZWMPUqH9/dN/jYpLxXkUkj9/z9k1qP/9CvAkvXXYtl8HsVlHFUSzhHwVjj
 VfmBIBgKJmEhw3lbQ/c0WKiN1T/F7WjEO/dCme9l6pPL4dGbBQgMalWhHGc19TQ66KuS
 dmeh7gT9z/wSDxagsxspCDvn0eD1XH3oW3Uvc+Tmzi9UdrYyAz4z6CITJX9nwGYemVdw
 Eecw==
X-Gm-Message-State: AOAM533F5wRfvnsKNX3yymxt6EU3+DtitXoB+IQibdLBOZdQX9oAdZZZ
 HSGHt0oWeySOMmRbInx5Q/bPh0yb9DJQXI/vOUlSRmX1d1KiqqobN8b82uAHVoXCfzC2f4lnvMt
 QlfRH8h4RpcCVcx8=
X-Received: by 2002:a37:ef15:: with SMTP id j21mr5647560qkk.385.1616511299638; 
 Tue, 23 Mar 2021 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw+JwtnNqa3ZZdAV7NBCXyFQX9T5zUBGPFbhM1LfCY0R5MuCI8STIeTnpzg5xST0E8rX9V9Q==
X-Received: by 2002:a37:ef15:: with SMTP id j21mr5647541qkk.385.1616511299379; 
 Tue, 23 Mar 2021 07:54:59 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id 4sm1503554qkj.119.2021.03.23.07.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:54:58 -0700 (PDT)
Date: Tue, 23 Mar 2021 10:54:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
Message-ID: <20210323145457.GC6486@xz-x1>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
 <20210322201716.GG16645@xz-x1>
 <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 10:51:57AM +0300, Andrey Gruzdev wrote:
> On 22.03.2021 23:17, Peter Xu wrote:
> > On Fri, Mar 19, 2021 at 05:52:47PM +0300, Andrey Gruzdev wrote:
> > > Added missing qemu_fflush() on buffer file holding precopy device state.
> > > Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
> > > Typical configurations often require >200KB for device state and VMDESC.
> > > 
> > > Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> > > ---
> > >   migration/migration.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index ca8b97baa5..32b48fe9f5 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
> > >        * with vCPUs running and, finally, write stashed non-RAM part of
> > >        * the vmstate from the buffer to the migration stream.
> > >        */
> > > -    s->bioc = qio_channel_buffer_new(128 * 1024);
> > > +    s->bioc = qio_channel_buffer_new(512 * 1024);
> > >       qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
> > >       fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
> > >       object_unref(OBJECT(s->bioc));
> > > @@ -3866,6 +3866,8 @@ static void *bg_migration_thread(void *opaque)
> > >       if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
> > >           goto fail;
> > >       }
> > > +    qemu_fflush(fb);
> > What will happen if the vmstates are bigger than 512KB?  Would the extra data
> > be dropped?
> 
> No, the buffer shall be reallocated and the original content shall be kept.

Oh right..

Would you comment above qemu_fflush() about it (maybe also move it right before
the call to qemu_put_buffer)?  Otherwise it indeed looks more like an
optimization rather than a bugfix.

For the long term I think we'd better have a helper:

        qemu_put_qio_channel_buffer(QEMUFile *file, QIOChannelBuffer *bioc)

So as to hide this flush operation, which is tricky. We'll have two users so
far:

        bg_migration_completion
        colo_do_checkpoint_transaction

IMHO it'll be nicer if you'd do it in this patch altogether!

Thanks,

-- 
Peter Xu


