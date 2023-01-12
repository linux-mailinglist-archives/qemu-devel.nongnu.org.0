Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC43667E4A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 19:40:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG2Uw-0007Eh-UB; Thu, 12 Jan 2023 13:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2Um-0007EK-Lw
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:40:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pG2Uk-0002zG-DN
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 13:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673548806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0AMmiQiM2lJ1a7iMs2zqaBgkF1TxxYwijoDPXVggbxM=;
 b=ANBmbGl7FCELlvpIWVa8AD0NCAS51BeqnudziWUjEP2EKAThG/+QixzkY0lr2PAmMzzRYW
 0dihTDKoqXzjZeA7dCw+QLiRm2Bo4cE3+E468U0bqqi+nuYih73Nr7gnv9NR3K+BFnNW0S
 lfoyGkb4L98y7JyI3PxmDnY9kBUklJw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-36-eVDfYmnKNRSuqQ-EDmVvFQ-1; Thu, 12 Jan 2023 13:40:04 -0500
X-MC-Unique: eVDfYmnKNRSuqQ-EDmVvFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so12881485wmq.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 10:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AMmiQiM2lJ1a7iMs2zqaBgkF1TxxYwijoDPXVggbxM=;
 b=nxevz946OUBhOGUQKREUWbhD8/8fLlDul5cLC6bhtjLps55l7aA5Iwh89cLac7rHVx
 EbKttDM8y1HD/Gced8VoknGo4X5MU+jNQ2eodw3aJbGByRm84WUZ6d3lL0EH1i7GRfzN
 Ddz6PuybCmbT0di2SW17BCjWbOtJom3UjLGAGTiK1Fz1FbqdVBBavTQLoFqPICNaI+jR
 w5JTx69vv9TNmAdU1q7FB70/uTQEnHXFHKeRnrtpgNBcIchDDWvM/KrXOb+ILs7ZfM2I
 /NEWLLEnmba24nRMu1XyzS/fcJxqX5ucbfPEVWbm/uYfpxp2cChq23kvUYb9TIxuQpcE
 mr9g==
X-Gm-Message-State: AFqh2koKIHEusdTqfbmupQFlVm2QvH5v+fmwRhiYeKxOizNqm/uXm+tR
 yz85+xHQXJYkxdKmeHu8S4vS73LCjOShnS6Ow++ZWaZqzoD9i+JLT4W1/OOyL/ga1p3IvoFBsjn
 Fb/16XO7FI3rBGrU=
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id
 l40-20020a05600c1d2800b003d21d51246emr59467266wms.9.1673548802879; 
 Thu, 12 Jan 2023 10:40:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXubydx3i+LhVQrfV+lWZ9Deu6pq30TZLGQ1CazpO1TSBedoUFWYaYQBhsz1baYXmsSIBWWnbg==
X-Received: by 2002:a05:600c:1d28:b0:3d2:1d51:246e with SMTP id
 l40-20020a05600c1d2800b003d21d51246emr59467251wms.9.1673548802662; 
 Thu, 12 Jan 2023 10:40:02 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm24303655wmo.3.2023.01.12.10.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 10:40:02 -0800 (PST)
Date: Thu, 12 Jan 2023 18:40:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Message-ID: <Y8BUAIZ9nn7sXzou@work-vm>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-3-david@redhat.com>
 <Y8BGzE/HtpXZJ8Lz@work-vm>
 <7d80a8d2-1426-2a71-6a7a-eeaac31c4df5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d80a8d2-1426-2a71-6a7a-eeaac31c4df5@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* David Hildenbrand (david@redhat.com) wrote:
> On 12.01.23 18:43, Dr. David Alan Gilbert wrote:
> > * David Hildenbrand (david@redhat.com) wrote:
> > > ... and store it in the migration state. This is a preparation for
> > > storing selected vmds's already in qemu_savevm_state_setup().
> > > 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   migration/migration.c |  4 ++++
> > >   migration/migration.h |  4 ++++
> > >   migration/savevm.c    | 18 ++++++++++++------
> > >   3 files changed, 20 insertions(+), 6 deletions(-)
> > > 
> 
> [1]
> 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index 52b5d39244..1d33a7efa0 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
> > >       s->vm_was_running = false;
> > >       s->iteration_initial_bytes = 0;
> > >       s->threshold_size = 0;
> > > +
> > > +    json_writer_free(s->vmdesc);
> > > +    s->vmdesc = NULL;
> > >   }
> 
> [...]
> 
> > >       trace_savevm_state_setup();
> > >       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> > >           if (!se->ops || !se->ops->save_setup) {
> > > @@ -1390,15 +1395,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> > >                                                       bool in_postcopy,
> > >                                                       bool inactivate_disks)
> > >   {
> > > -    g_autoptr(JSONWriter) vmdesc = NULL;
> > > +    MigrationState *ms = migrate_get_current();
> > > +    JSONWriter *vmdesc = ms->vmdesc;
> > >       int vmdesc_len;
> > >       SaveStateEntry *se;
> > >       int ret;
> > > -    vmdesc = json_writer_new(false);
> > > -    json_writer_start_object(vmdesc, NULL);
> > > -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
> > > -    json_writer_start_array(vmdesc, "devices");
> > >       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> > >           ret = vmstate_save(f, se, vmdesc);
> > >           if (ret) {
> > > @@ -1433,6 +1435,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> > >           qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
> > >       }
> > > +    /* Free it now to detect any inconsistencies. */
> > > +    json_writer_free(vmdesc);
> > > +    ms->vmdesc = NULL;
> > 
> > and this only happens when this succesfully exits;  so if this errors
> > out, and then you retry an outwards migration, I think you've leaked a
> > writer.
> 
> Shouldn't the change [1] to migrate_init() cover that?

Hmm OK, yes it does - I guess it does mean you keep the allocation
around for a bit longer, but that's OK in practice since normally you'll
be quitting soon.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -- 
> Thanks,
> 
> David / dhildenb
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


