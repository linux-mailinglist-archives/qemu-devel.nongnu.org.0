Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8517F66865A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 23:07:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG5iF-0001m9-8q; Thu, 12 Jan 2023 17:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pG5iC-0001lp-CD
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pG5iA-0003OS-Gz
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673561173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fj0eizv4bu4KzyTYacqdNmjyTqAEpKT2H872VeB59iQ=;
 b=apYAmozGZSmH2AX/dKO6WNjUzyB6OofzpD/nO0Q+6gbMvBgy+zShmz1n9e7s3zhtnuVZmy
 ygDC3Yk0CvvTzNDGFfuWsPBEQ094e79cdYDiij5oLvqzOux/mEtMDpfFot2gmvY+W1qOUP
 ksWT4v/pSyIcJm4FxJ0lYf2mrRXpnp4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-XHcJiQtdNxuZHu0MZzEERQ-1; Thu, 12 Jan 2023 17:06:12 -0500
X-MC-Unique: XHcJiQtdNxuZHu0MZzEERQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 y6-20020a05620a44c600b00704d482d3a0so14112276qkp.21
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 14:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fj0eizv4bu4KzyTYacqdNmjyTqAEpKT2H872VeB59iQ=;
 b=JeEmTFr6jYAhN4XImy1HQfQpvvtP+tHzOSJziUrAIq7s4ikywA9Qf/80nQ6wBhCu1M
 PBF8Pyr6JmSbRTwg5GDR+cgQ6pDUfRQb+iCCbyIlhHn2oEaXWHlqVhp4vjBF+pL85xuw
 olkIemt0kdq7Ofqmemk2sIX0QeUZDPXPM2FwF5Ihn8UP73F4v55PJmTnaO8UeTwC90Ou
 90O5+XTKEt+xZRojUt5cftpaZ5jiDL6dxz5+l36u7ynDe1EAj90MzjiuWd47416nH1um
 PLi675sEF2EVkzVCvcncuKAMi5S3s7M02NAq347A/SVxxH1gacy0rS+wGsa9cQeIpEYV
 ywjQ==
X-Gm-Message-State: AFqh2kpSRmozDcQszo60DSJ2sThZ+BKlMxLaAYN2c0LUIMV4nigAgzSW
 TIleUHXud8R1umxzYG/NoRDDMI+ANlavBpcgo5qJCDfGX+EpTJu3phX6EVUj4uVRrdJpabSSoHP
 HL7byqQARlcMPHIE=
X-Received: by 2002:ac8:4514:0:b0:3ab:6b9c:7285 with SMTP id
 q20-20020ac84514000000b003ab6b9c7285mr102066400qtn.44.1673561171732; 
 Thu, 12 Jan 2023 14:06:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNKwPR663+toFO7V/QBpUfqRZfk4Q4Pgg2V5S1i3jZo2RbYYUinq2uq6jdf/RrKUDrtvEAKw==
X-Received: by 2002:ac8:4514:0:b0:3ab:6b9c:7285 with SMTP id
 q20-20020ac84514000000b003ab6b9c7285mr102066371qtn.44.1673561171397; 
 Thu, 12 Jan 2023 14:06:11 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 fv13-20020a05622a4a0d00b003ae189c7454sm5745946qtb.91.2023.01.12.14.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:06:10 -0800 (PST)
Date: Thu, 12 Jan 2023 17:06:09 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Message-ID: <Y8CEUcXek3FPEwCe@x1n>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-3-david@redhat.com>
 <Y8BGzE/HtpXZJ8Lz@work-vm>
 <7d80a8d2-1426-2a71-6a7a-eeaac31c4df5@redhat.com>
 <Y8BUAIZ9nn7sXzou@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8BUAIZ9nn7sXzou@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Thu, Jan 12, 2023 at 06:40:00PM +0000, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
> > On 12.01.23 18:43, Dr. David Alan Gilbert wrote:
> > > * David Hildenbrand (david@redhat.com) wrote:
> > > > ... and store it in the migration state. This is a preparation for
> > > > storing selected vmds's already in qemu_savevm_state_setup().
> > > > 
> > > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > > ---
> > > >   migration/migration.c |  4 ++++
> > > >   migration/migration.h |  4 ++++
> > > >   migration/savevm.c    | 18 ++++++++++++------
> > > >   3 files changed, 20 insertions(+), 6 deletions(-)
> > > > 
> > 
> > [1]
> > 
> > > > diff --git a/migration/migration.c b/migration/migration.c
> > > > index 52b5d39244..1d33a7efa0 100644
> > > > --- a/migration/migration.c
> > > > +++ b/migration/migration.c
> > > > @@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
> > > >       s->vm_was_running = false;
> > > >       s->iteration_initial_bytes = 0;
> > > >       s->threshold_size = 0;
> > > > +
> > > > +    json_writer_free(s->vmdesc);
> > > > +    s->vmdesc = NULL;
> > > >   }
> > 
> > [...]
> > 
> > > >       trace_savevm_state_setup();
> > > >       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> > > >           if (!se->ops || !se->ops->save_setup) {
> > > > @@ -1390,15 +1395,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> > > >                                                       bool in_postcopy,
> > > >                                                       bool inactivate_disks)
> > > >   {
> > > > -    g_autoptr(JSONWriter) vmdesc = NULL;
> > > > +    MigrationState *ms = migrate_get_current();
> > > > +    JSONWriter *vmdesc = ms->vmdesc;
> > > >       int vmdesc_len;
> > > >       SaveStateEntry *se;
> > > >       int ret;
> > > > -    vmdesc = json_writer_new(false);
> > > > -    json_writer_start_object(vmdesc, NULL);
> > > > -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
> > > > -    json_writer_start_array(vmdesc, "devices");
> > > >       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> > > >           ret = vmstate_save(f, se, vmdesc);
> > > >           if (ret) {
> > > > @@ -1433,6 +1435,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
> > > >           qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
> > > >       }
> > > > +    /* Free it now to detect any inconsistencies. */
> > > > +    json_writer_free(vmdesc);
> > > > +    ms->vmdesc = NULL;
> > > 
> > > and this only happens when this succesfully exits;  so if this errors
> > > out, and then you retry an outwards migration, I think you've leaked a
> > > writer.
> > 
> > Shouldn't the change [1] to migrate_init() cover that?
> 
> Hmm OK, yes it does - I guess it does mean you keep the allocation
> around for a bit longer, but that's OK in practice since normally you'll
> be quitting soon.

Instead of json_writer_free() here and there, how about free it in
migrate_fd_cleanup() once and for all?

-- 
Peter Xu


