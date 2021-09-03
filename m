Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE040032C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:22:00 +0200 (CEST)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBx1-0000X3-N6
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBkH-00089B-Q4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMBkF-0002i1-Nb
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630685326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xCxLym6MF4mXatqdavQGtSEUMvj4MY/e9ttKXXYBLxk=;
 b=fHJE1mM0AdJr9mRlsROcG9h5yFO4Jc63UsrCCDf7fQxTKNWnOEO0cG83G/OEuUny0djlbQ
 A+FZBK9iXmWJHIvJaFL9KxrJB+BGL7BcFVaUscvb9TL6CEPUwBARIrg3uUFqOCM7tU5/L2
 eBzohkDNfL4MVnUW8+fhJ2+OVVlWqKQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-C0qVJdXsO1CCjQNtyli4JA-1; Fri, 03 Sep 2021 12:08:45 -0400
X-MC-Unique: C0qVJdXsO1CCjQNtyli4JA-1
Received: by mail-qv1-f70.google.com with SMTP id
 i7-20020a056214030700b0036b565ee6c0so6165657qvu.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xCxLym6MF4mXatqdavQGtSEUMvj4MY/e9ttKXXYBLxk=;
 b=aphJySMu5ceYEIK6olXMq9hLcXbkeSgdJa/J9BSAKKH8kSLDwMqeKpxuUvBEpnRauR
 SCEW2jxBuVMyCr3/PT62cP7BN531Cq+nitOR9mveQnxszNvqKYHMGGqDjUI+5+8GeCA5
 ByGcSpObpFkoJRtzjMkVb/Lj4UPtIf7uMiqzc4zOIl7Q/bad2WcK5yFW1qj0MpBaFoiv
 n80yHcBYmkPhsuzbFeHf5GNMiLaJHY35PDWggozH1cacstJFlxMiGCKANX2ZYYnPeHXm
 tjsfubQZmJoA2rE+8C9JnzFRWX0q8EAUhFs1vCwFINbNmxD5AqJOKgs20Zsd1WS0lnIe
 kadA==
X-Gm-Message-State: AOAM532EghnfoUqxzeD8BnEYHtdYyqYiAGousKavKZ8Cz4BNgf438mC4
 d36neImNfVyFhk+55qRNTjjfnP5W9unjtIuL7cg4VztcoIEjywsqTI13oBDn0AxewNbCyIRUxEU
 QuBMeN0oS8QMLlG0=
X-Received: by 2002:a05:6214:1268:: with SMTP id
 r8mr4450836qvv.5.1630685324659; 
 Fri, 03 Sep 2021 09:08:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5nwHpUiTqKJxiJ4ZsJP+cSRNpdTGnDn9AD/PpklJBnoCtZv0HyHErFhHcvqj9qKac3oOBLw==
X-Received: by 2002:a05:6214:1268:: with SMTP id
 r8mr4450794qvv.5.1630685324353; 
 Fri, 03 Sep 2021 09:08:44 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id 102sm3439741qtc.62.2021.09.03.09.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:08:43 -0700 (PDT)
Date: Fri, 3 Sep 2021 12:08:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/2] dump-guest-memory: Add blocker for migration
Message-ID: <YTJIiul41GYw9imW@t490s>
References: <20210824152721.79747-1-peterx@redhat.com>
 <87zgt66jtn.fsf@dusky.pond.sub.org> <YSa3BAyTZJ/L0Few@t490s>
 <87fsuobkax.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87fsuobkax.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Gibson <dgibson@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 01:35:18PM +0200, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > Markus,
> >
> > On Wed, Aug 25, 2021 at 09:54:12AM +0200, Markus Armbruster wrote:
> >> Peter Xu <peterx@redhat.com> writes:
> >> 
> >> > Both dump-guest-memory and live migration have vm state cached internally.
> >> > Allowing them to happen together means the vm state can be messed up.  Simply
> >> > block live migration for dump-guest-memory.
> >> >
> >> > One trivial thing to mention is we should still allow dump-guest-memory even if
> >> > -only-migratable is specified, because that flag should majorly be used to
> >> > guarantee not adding devices that will block migration by accident.  Dump guest
> >> > memory is not like that - it'll only block for the seconds when it's dumping.
> >> 
> >> I recently ran into a similarly unusual use of migration blockers:
> >> 
> >>     Subject: -only-migrate and the two different uses of migration blockers
> >>      (was: spapr_events: Sure we may ignore migrate_add_blocker() failure?)
> >>     Date: Mon, 19 Jul 2021 13:00:20 +0200 (5 weeks, 1 day, 20 hours ago)
> >>     Message-ID: <87sg0amuuz.fsf_-_@dusky.pond.sub.org>
> >> 
> >>     We appear to use migration blockers in two ways:
> >> 
> >>     (1) Prevent migration for an indefinite time, typically due to use of
> >>     some feature that isn't compatible with migration.
> >> 
> >>     (2) Delay migration for a short time.
> >> 
> >>     Option -only-migrate is designed for (1).  It interferes with (2).
> >> 
> >>     Example for (1): device "x-pci-proxy-dev" doesn't support migration.  It
> >>     adds a migration blocker on realize, and deletes it on unrealize.  With
> >>     -only-migrate, device realize fails.  Works as designed.
> >> 
> >>     Example for (2): spapr_mce_req_event() makes an effort to prevent
> >>     migration degrate the reporting of FWNMIs.  It adds a migration blocker
> >>     when it receives one, and deletes it when it's done handling it.  This
> >>     is a best effort; if migration is already in progress by the time FWNMI
> >>     is received, we simply carry on, and that's okay.  However, option
> >>     -only-migrate sabotages the best effort entirely.
> >> 
> >>     While this isn't exactly terrible, it may be a weakness in our thinking
> >>     and our infrastructure.  I'm bringing it up so the people in charge are
> >>     aware :)
> >> 
> >> https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg04723.html
> >> 
> >> Downthread there, Dave Gilbert opined
> >> 
> >>     It almost feels like they need a way to temporarily hold off
> >>     'completion' of migratio - i.e. the phase where we stop the CPU and
> >>     write the device data;  mind you you'd also probably want it to stop
> >>     cold-migrates/snapshots?
> >
> > Yeah, maybe spapr_mce_req_event() can be another candidate of the internal
> > version of migration_add_blocker().
> >
> > I can add a patch to replace it if anyone likes me to.
> >
> > Both cold and live snapshot should have checked migration blockers, I think.
> > E.g., cold snapshot has:
> >
> > bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
> >                   bool has_devices, strList *devices, Error **errp)
> > {
> >     [...]
> >     if (migration_is_blocked(errp)) {
> >         return false;
> >     }
> >     [...]
> > }
> >
> > While the live snapshot shares similar code in migrate_prepare().
> >
> > So looks safe that nothing wrong should happen within add/del pair of blockers.
> >
> > However I do see that it's possible we'll allow the add_blocker to succeed even
> > if during cold snapshot, because migration_is_idle() in migration_add_blocker()
> > only checks migration state, not RUN_STATE_SAVE_VM.  So I'm wondering whether
> > we'd like one more patch to cover that too, like:
> >
> > ---8<---
> >
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 41429680c2..9c602a4ac1 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -2055,15 +2055,16 @@ void migrate_init(MigrationState *s)
> >  
> >  int migrate_add_blocker_internal(Error *reason, Error **errp)
> >  {
> > -    if (migration_is_idle()) {
> > -        migration_blockers = g_slist_prepend(migration_blockers, reason);
> > -        return 0;
> > +    /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
> > +    if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
> > +        error_propagate_prepend(errp, error_copy(reason),
> > +                                "disallowing migration blocker "
> > +                                "(migration in progress) for: ");
> > +        return -EBUSY;
> >      }
> >  
> > -    error_propagate_prepend(errp, error_copy(reason),
> > -                            "disallowing migration blocker "
> > -                            "(migration in progress) for: ");
> > -    return -EBUSY;
> > +    migration_blockers = g_slist_prepend(migration_blockers, reason);
> > +    return 0;
> >  }
> >  
> >  int migrate_add_blocker(Error *reason, Error **errp)
> > ---8<---
> >
> > It'll by accident also cover guest dump which also sets RUN_STATE_SAVE_VM, but
> > I think that's ok.
> >
> > Thanks,
> 
> I delayed answering this in the hope of finding the time to think.  No
> luck.  This is a quick answer, hopefully better than nothing and not too
> confused.
> 
> "Snapshot should honor migration blockers" feels like an independent
> issue.  I can't comment on it, because I haven't done my thinking there.

Yes it's independent, but I do think they're similar to live migration.  Let's
wait for Dave or Juan to chim in.

> 
> I'm not sure you fully got Dave's suggestion to "temporarily hold off
> 'completion'".  Let me explain (Dave, please correct misunderstandings,
> if any).
> 
> Migration blockers and migration are mutually exclusive: you can't
> migrate while such blockers are in effect (trying to immediately fails),
> and you can't add such blockers while migration is in progress.
> 
> The temporary blockers Dave suggested do not block migration, only its
> *completion* phase.  This makes sense *only* for short-lived blockers.
> If such temporary blockers are in effect when migration is ready to
> enter its completion phase, that entry is delayed until the temporary
> blockers are gone.  If you try to add a temporary blocker while
> migration is in its completion phase, the add blocks until migration
> exists its completion phase.

I see, that sounds like what a mutex would do (which we'll hold during
completion phase of migration), and it looks reasonable.

But I think it's not a blocker of not having a bigger protection - so far my
approach should be blocking the whole migration.  To be explicit:

  - If we dump-guest-memory during migration (not only completion phase,
    anytime after it starts), it fails dump-guest-mem.

  - If we try to live migrate during guest-dump-memory, it fails migration.

So basically that's a "bigger mutex".  We may want to shrink it further, but
IMHO it can also be done on top (and we need some more work to do to justify
everything will still be okay).

It shouldn't be in a rush, imo, and it should be low priority because we don't
really have those two collide each other, not to mention when dump-guest-memory
during completing of migration.

Thanks,

-- 
Peter Xu


