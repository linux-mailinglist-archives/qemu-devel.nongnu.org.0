Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6399C6686F2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 23:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG63b-00070a-Pp; Thu, 12 Jan 2023 17:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pG63a-00070N-Ce
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:28:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pG63Y-0007KJ-GU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 17:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673562499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZLnvcy/mjGjQQf3Hb23VtwNCWFDaQBHKNbskTZCcKQ=;
 b=WuPP2NhiHFZ/7MwS/NULnGJjIjmU4Ykl8ewzf4zt8s4ZpleA4Owv4/NnK7pFxA4WhmaAMd
 yc138ptllEbsmyLcCXDsVzxu45kD4MBF0lPAVIhyjwXq6eI2BYiuPVFQF++9MWMaBlSrK1
 6Xq6o6TUrQEQH5aLdqDqEjh/lz/u+Bw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-1H5_y0AuPQK8vwkN_nYImA-1; Thu, 12 Jan 2023 17:28:18 -0500
X-MC-Unique: 1H5_y0AuPQK8vwkN_nYImA-1
Received: by mail-qv1-f69.google.com with SMTP id
 oj9-20020a056214440900b0053233473499so5882259qvb.8
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 14:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZLnvcy/mjGjQQf3Hb23VtwNCWFDaQBHKNbskTZCcKQ=;
 b=YoKB2ODW7+n1ky84r+aQt0gBlm6cKB47OI2vH7YSr8kvj0z/xoQKLDC/11u3JjXhdQ
 FBg+PhHp3mKIf+v7Z2oUoBRCl6QiJO+RhXdVR0bkCFMfGF2D5hSOWM8lcyK6BWDDCUqv
 kX6BgeZQNLY0EKMh3A74rRTI/lDl4wWQ8HIpxA/xiLOT3AyH+e4xdoavx/v9MNC+TQ32
 EFU3uFsIik4v8LjzE7O1HRGA+Uen5ibROHGlHGKJJkLDSxWDzIQrGxNyy+ivatRqqDQD
 h2Mx5VZg0PR8DK8q9bVQdNzevZbbJxPaBrFW4x3gfMF8ZeNtGyih2O7bouvyGThOxD8c
 Kung==
X-Gm-Message-State: AFqh2kpI4TsuNZYtHPXY7aDjpWkwuFZjUyowWCs7NxqrP9aq32kWqWM8
 YGeJJn1Sj2YktoVn+en4ZWkd/FA9n77ug+Y8okRmOLQG+8uyn5OG2XwpC/OWPDTzwwnQF/LGBKK
 tDf91JM1LULzFuW0=
X-Received: by 2002:ac8:6659:0:b0:3ae:64e0:58d3 with SMTP id
 j25-20020ac86659000000b003ae64e058d3mr15425597qtp.10.1673562497923; 
 Thu, 12 Jan 2023 14:28:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvaLkYuZaB0aOu5mtIOvGdh/SV/IPF0ZiSG/RHjltfrV3yX+BHh24E4DIBVGTraZPDk0SfAfw==
X-Received: by 2002:ac8:6659:0:b0:3ae:64e0:58d3 with SMTP id
 j25-20020ac86659000000b003ae64e058d3mr15425577qtp.10.1673562497642; 
 Thu, 12 Jan 2023 14:28:17 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 do55-20020a05620a2b3700b00706193127c6sm219430qkb.85.2023.01.12.14.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:28:16 -0800 (PST)
Date: Thu, 12 Jan 2023 17:28:15 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
Message-ID: <Y8CJf7hCy76AtfcF@x1n>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com>
 <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com>
 <Y8BlCeViRSzyTQ8+@work-vm> <Y8CGYZ3F/h1oXV+d@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8CGYZ3F/h1oXV+d@x1n>
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

On Thu, Jan 12, 2023 at 05:14:57PM -0500, Peter Xu wrote:
> On Thu, Jan 12, 2023 at 07:52:41PM +0000, Dr. David Alan Gilbert wrote:
> > * David Hildenbrand (david@redhat.com) wrote:
> > > On 12.01.23 18:56, Dr. David Alan Gilbert wrote:
> > > > * David Hildenbrand (david@redhat.com) wrote:
> > > > > For virtio-mem, we want to have the plugged/unplugged state of memory
> > > > > blocks available before migrating any actual RAM content, and perform
> > > > > sanity checks before touching anything on the destination. This
> > > > > information is immutable on the migration source while migration is active,
> > > > > 
> > > > > We want to use this information for proper preallocation support with
> > > > > migration: currently, we don't preallocate memory on the migration target,
> > > > > and especially with hugetlb, we can easily run out of hugetlb pages during
> > > > > RAM migration and will crash (SIGBUS) instead of catching this gracefully
> > > > > via preallocation.
> > > > > 
> > > > > Migrating device state via a vmsd before we start iterating is currently
> > > > > impossible: the only approach that would be possible is avoiding a vmsd
> > > > > and migrating state manually during save_setup(), to be restored during
> > > > > load_state().
> > > > > 
> > > > > Let's allow for migrating device state via a vmsd early, during the
> > > > > setup phase in qemu_savevm_state_setup(). To keep it simple, we
> > > > > indicate applicable vmds's using an "immutable" flag.
> > > > > 
> > > > > Note that only very selected devices (i.e., ones seriously messing with
> > > > > RAM setup) are supposed to make use of such early state migration.
> > > > > 
> > > > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > > > ---
> > > > >   include/migration/vmstate.h |  5 +++++
> > > > >   migration/savevm.c          | 14 ++++++++++++++
> > > > >   2 files changed, 19 insertions(+)
> > > > > 
> > > > > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > > > > index ad24aa1934..dd06c3abad 100644
> > > > > --- a/include/migration/vmstate.h
> > > > > +++ b/include/migration/vmstate.h
> > > > > @@ -179,6 +179,11 @@ struct VMStateField {
> > > > >   struct VMStateDescription {
> > > > >       const char *name;
> > > > >       int unmigratable;
> > > > > +    /*
> > > > > +     * The state is immutable while migration is active and is saved
> > > > > +     * during the setup phase, to be restored early on the destination.
> > > > > +     */
> > > > > +    int immutable;
> > > > 
> > > > A bool would be nicer (as it would for unmigratable above)
> > > 
> > > Yes, I chose an int for consistency with "unmigratable". I can turn that
> > > into a bool.
> > > 
> > > I'd even include a cleanup patch for unmigratable if it wouldn't be ...
> > > 
> > > $ git grep "unmigratable \=" | wc -l
> > > 29
> > 
> > It might be OK if you just change the declaration; I mean '1' is pretty
> > close to true? (I think...)
> > Anyway, at least make the new one a bool.
> 
> Agreed bool is better.  Can we rename it to something like "early_setup"?
> "immutable" isn't clear on its most important attribute (on when it'll be
> migrated).  Meanwhile I'd hope we can comment that explicitly.  I'd go with:
> 
>   /*
>    * This VMSD describes something that should be sent during setup phase
>    * of migration.  It plays similar role as save_setup() for explicitly
>    * registered vmstate entries, the only difference is the vmsd will be
>    * sent right at the start of migration.
>    */
>   bool early_setup;

Let me try some even better wording..

    /*
     * This VMSD describes something that should be sent during setup phase
     * of migration.  It plays similar role as save_setup() for explicitly
     * registered vmstate entries, so it can be seen as a way to describe
     * save_setup() in vmsd structures.
     *
     * One SaveStateEntry should either have the save_setup() specified or
     * the vmsd with early_setup set to true.  It should never have both
     * things set.
     */
    bool early_setup;

There's one tricky thing that we'll send QEMU_VM_SECTION_START for
save_setup() entries but QEMU_VM_SECTION_FULL for vmsd early_setup
entries.

David, do you think we can slightly modify your new version of
vmstate_save() so as to pass in the section_type?  I think it'll be even
cleaner to send QEMU_VM_SECTION_START for the early vmsds too.  I assume
this shouldn't affect your goal and anything else.

> 
> > 
> > > > >       int version_id;
> > > > >       int minimum_version_id;
> > > > >       MigrationPriority priority;
> > > > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > > > index ff2b8d0064..536d6f662b 100644
> > > > > --- a/migration/savevm.c
> > > > > +++ b/migration/savevm.c
> > > > > @@ -1200,6 +1200,15 @@ void qemu_savevm_state_setup(QEMUFile *f)
> > > > >       trace_savevm_state_setup();
> > > > >       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> > > > > +        if (se->vmsd && se->vmsd->immutable) {
> > > > > +            ret = vmstate_save(f, se, ms->vmdesc);
> > > > > +            if (ret) {
> > > > > +                qemu_file_set_error(f, ret);
> > > > > +                break;
> > > > > +            }
> > > > > +            continue;
> > > > > +        }
> > > > > +
> > > > 
> > > > Does this give you the ordering you want? i.e. there's no guarantee here
> > > > that immutables come first?
> > > 
> > > Yes, for virtio-mem at least this is fine. There are no real ordering
> > > requirements in regard to save_setup().
> > > 
> > > I guess one could use vmstate priorities to affect the ordering, if
> > > required.
> > > 
> > > So for my use case this is good enough, any suggestions? Thanks.
> > 
> > OK, but consider whether it might be better just to have a separate
> > QTAILQ_FOREACH look in savevm_state_setup that first does all the
> > immutables, and then all the setups.
> 
> After patch 1 the order may not matter iiuc, because each call to the
> immutable vmsds calls the new vmstate_save() which will always send
> QEMU_VM_SECTION_FULL and footers along the vmsd.
> 
> Thanks,
> 
> -- 
> Peter Xu

-- 
Peter Xu


