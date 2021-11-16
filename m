Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A545328A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:02:08 +0100 (CET)
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmy6A-0004lA-LM
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mmy3u-0002z5-UG
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mmy3r-0005KF-Q6
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637067581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l2jCSvD4nOiU0m9CJEbtavogjyxvaOLF2d52TKCf23I=;
 b=IT5laTYDgequqnoheF+zhPBoBg5hKPsHjKrdlrhjwn1vQKHhOL4nRnr0Av8gL4ePyhtgY8
 6TumtifRt1pB+gA05HLHORFqy1byoZ7ZTPmTIONiDrrU0W48Siw1cMoqrDlwN7tMiRjSe3
 M3tw+C6wlcCLzbKukJ5eryuZtwj3qX8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-16FGnn5KPpqY3FsS9iB1xg-1; Tue, 16 Nov 2021 07:59:40 -0500
X-MC-Unique: 16FGnn5KPpqY3FsS9iB1xg-1
Received: by mail-pg1-f197.google.com with SMTP id
 p20-20020a63fe14000000b002cc2a31eaf6so10629217pgh.6
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l2jCSvD4nOiU0m9CJEbtavogjyxvaOLF2d52TKCf23I=;
 b=wGZXLLC0rTRmEx7radqjmkeY7pGyq2MGwPkbfN8JRsHPnWHoko9qxJNAO78eI7QIaw
 O+NOZf40e54DbFJKm5N3Uv08+rikVdx3BMVDgWQ86MrnB+uExbq0Op4JnHKvCJQDnnKV
 w35Hc7XIt4naTlMpwAZdvTM7H9Tvtv4LWRiBPgbrx4vaBTYwQXYB2BOjB0PZdA2qkK2Z
 d3f5CUh8BQHdkSu41o6All1Ff7NAyNSo+N5lsnj0ZI+Ujo7pkBmCsrDDNkD41+4I2+AB
 hjMmpra23Br6IQBTiHkrlMdLzQ0YAirkiH4ZV6/O92S3o7lkPi58HGTIGuzuF7UgzUHH
 KYcg==
X-Gm-Message-State: AOAM531dFUYURJ8w4q4mSDHJwTRBlTrp5ddqqYbA10DwnX3uBnVIovbN
 uamRYABbPXs/ixOSTEjOw0ByOHRLSqrqkzl848gZaNLkVvUig3ZbpZWcbCfOlPEmoQsJtnmfr+1
 mRIpOgW0tC9jJhUM=
X-Received: by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9 with SMTP id
 b11-20020a056a000a8b00b0044def7c94b9mr40195749pfl.36.1637067579284; 
 Tue, 16 Nov 2021 04:59:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwHJze7Tw76vw7euW0ap34PhgpXicBPvcmHwkddPNd54vd9TMqNEFvKdoQeKkjysvM2DWbKg==
X-Received: by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9 with SMTP id
 b11-20020a056a000a8b00b0044def7c94b9mr40195711pfl.36.1637067578928; 
 Tue, 16 Nov 2021 04:59:38 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id na15sm2879604pjb.31.2021.11.16.04.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 04:59:38 -0800 (PST)
Date: Tue, 16 Nov 2021 20:59:34 +0800
From: Peter Xu <peterx@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] dump-guest-memory: Use BQL to protect dump finalize
 process
Message-ID: <YZOrNjB77Os8f+SZ@xz-m1.local>
References: <20211116032234.1775-1-peterx@redhat.com>
 <06f0282f-9e15-7854-5f5a-0884fd810da4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <06f0282f-9e15-7854-5f5a-0884fd810da4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 12:20:37PM +0100, Laszlo Ersek wrote:
> On 11/16/21 04:22, Peter Xu wrote:
> > When finalizing the dump-guest-memory with detached mode, we'll first set dump
> > status to either FAIL or COMPLETE before doing the cleanup, however right after
> > the dump status change it's possible that another dump-guest-memory qmp command
> > is sent so both the main thread and dump thread (which is during cleanup) could
> > be accessing dump state in paralell.  That's racy.
> > 
> > Fix it by protecting the finalizing phase of dump-guest-memory using BQL as
> > well.  To do that, we expand the BQL from dump_cleanup() into dump_process(),
> > so we will take the BQL longer than before.  The critical section must cover
> > the status switch from ACTIVE->{FAIL|COMPLETE} so as to make sure there's no
> > race any more.
> > 
> > We can also just introduce a specific mutex to serialize the dump process, but
> > BQL should be enough for now so far, not to mention vm_start() in dump_cleanup
> > will need BQL anyway, so maybe easier to just use the same mutex.
> > 
> > Reported-by: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  dump/dump.c | 24 ++++++++++++++++++------
> >  1 file changed, 18 insertions(+), 6 deletions(-)
> > 
> > diff --git a/dump/dump.c b/dump/dump.c
> > index 662d0a62cd..196b7b8ab9 100644
> > --- a/dump/dump.c
> > +++ b/dump/dump.c
> > @@ -96,13 +96,7 @@ static int dump_cleanup(DumpState *s)
> >      g_free(s->guest_note);
> >      s->guest_note = NULL;
> >      if (s->resume) {
> > -        if (s->detached) {
> > -            qemu_mutex_lock_iothread();
> > -        }
> >          vm_start();
> > -        if (s->detached) {
> > -            qemu_mutex_unlock_iothread();
> > -        }
> >      }
> >      migrate_del_blocker(dump_migration_blocker);
> >  
> > @@ -1873,6 +1867,11 @@ static void dump_process(DumpState *s, Error **errp)
> >      Error *local_err = NULL;
> >      DumpQueryResult *result = NULL;
> >  
> > +    /*
> > +     * When running with detached mode, these operations are not run with BQL.
> > +     * It's still safe, because it's protected by setting s->state to ACTIVE,
> 
> I think this is a typo: it should be s->status.
> 
> > +     * so dump_in_progress() check will block yet another dump-guest-memory.
> > +     */
> >      if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
> >  #ifdef TARGET_X86_64
> >          create_win_dump(s, &local_err);
> > @@ -1883,6 +1882,15 @@ static void dump_process(DumpState *s, Error **errp)
> >          create_vmcore(s, &local_err);
> >      }
> >  
> > +    /*
> > +     * Serialize the finalizing of dump process using BQL to make sure no
> > +     * concurrent access to DumpState is allowed.  BQL is also required for
> > +     * dump_cleanup as vm_start() needs it.
> > +     */
> > +    if (s->detached) {
> > +        qemu_mutex_lock_iothread();
> > +    }
> > +
> >      /* make sure status is written after written_size updates */
> >      smp_wmb();
> >      qatomic_set(&s->status,
> > @@ -1898,6 +1906,10 @@ static void dump_process(DumpState *s, Error **errp)
> >  
> >      error_propagate(errp, local_err);
> >      dump_cleanup(s);
> > +
> > +    if (s->detached) {
> > +        qemu_mutex_unlock_iothread();
> > +    }
> >  }
> >  
> >  static void *dump_thread(void *data)
> > 
> 
> The detached dumping thread now runs dump_cleanup() with the BQL held, so:
> 
> dump_thread()
>   dump_process()
>     [ dump status is now FAILED or COMPLETED ]
>     dump_cleanup()
>       vm_start()
>       [ runstate is now "running" I guess? ]
>       migrate_del_blocker()
>         g_slist_remove(migration_blockers) <------ read-modify-write #1
> 
> is now called under the BQL's protection.
> 
> Assuming a new dump request is issued in parallel over QMP, we have (on
> another thread -- the main thread I guess?):
> 
> qmp_dump_guest_memory()
>   [ dumping *not* in progress ]
>   migrate_add_blocker_internal()
>     [ runstate is *not* RUN_STATE_SAVE_VM ]
>     g_slist_prepend(migration_blockers) <------- RMW #2
> 
> and this is not protected by any *explicit* acquiral of the BQL.
> 
> I know very little of the BQL, unfortunately. *IF* your argument is that
> qmp_dump_guest_memory() is entered with the BQL *already held*, then the
> patch is fine, IMO. Because in that case, during the short while that
> the detached dumping thread is cleaning up, the main thread (?) cannot
> acquire the BQL, and so it cannot enter qmp_dump_guest_memory() at all.
> If that's your point,

Yes that's the point.  qmp_dump_guest_memory() must be with BQL held.  For
example, dump_init() will call vm_start() if VM is running:

    if (runstate_is_running()) {
        vm_stop(RUN_STATE_SAVE_VM);
        s->resume = true;
    } else {
        s->resume = false;
    }

And vm_stop() needs BQL.  The same to vm_start() if detached mode is not
enabled.  If we call qmp_dump_guest_memory() without BQL that'll be a very
severe issue, imho.

> then:
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> 
> *Otherwise*, I don't understand how the patch helps protecting the
> "migration_blockers" object. (Because, although RMW#1 is now protected,
> RMW#2 is not.)

I took it for granted that BQL needs to be taken for qmp_dump_guest_memory()
without explicitly explaining.  I'll refine the commit message and mention that
in v2.

Thanks,

-- 
Peter Xu


