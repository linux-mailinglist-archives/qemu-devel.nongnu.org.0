Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEB414DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:08:54 +0200 (CEST)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4nk-0002gY-Ij
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4gJ-0004Wc-9F
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4g8-0001kC-7h
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632326458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+PZVJpqCWE4RVL5iERYpI69r+EbymTWq0r81wyQi2Y=;
 b=dy9EwAO8M0E5EllzoUemBFSPsCrM/JrnqO3lRSHOXsvwXNmmvxbFSwHBvjbPwEsRHOGsZU
 GDLRUzsdxWCqQyPKUP1BxoLRJU062zuTe62c8cMRDw1g5PE1TqtaXuKFfkONtDtDYfbum0
 Cf48Xlk9RexLFdhZW/Bad29M55i7L50=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-EVfHbfasNruFIukH-b2BzQ-1; Wed, 22 Sep 2021 12:00:57 -0400
X-MC-Unique: EVfHbfasNruFIukH-b2BzQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ib9-20020a0562141c8900b003671c3a1243so11810173qvb.21
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b+PZVJpqCWE4RVL5iERYpI69r+EbymTWq0r81wyQi2Y=;
 b=KAKs5IbaKsnsNtohNDkgD/LPTzh367fruzxp4Lwh+s1y2rRp6/HBfVVjCv08r6wRg2
 vjKmfhlBvCFhO/aD+sGnVuqNTPnrdF9LNIWaXNxqg8VSQY67l+EtaLOoXcveC/dUNS6C
 p2DifUNSbV3hm0jCI4s63WOiRWGoPqt9xPNkaDGCwOeVnq7agbg3Xj+NsacgVgDD37bM
 rlZTC2olT9zsZXmVz1BUe2QG3pRTgVahYkXXfTJLC7rbJ7V+sQyeDBvwhbGQj6pu8ko+
 nFCSXKhsu7BQoIbkCzj4zeVNQQLYxjDic4FUhhbAr+fTMsegURBuIDvh2kLsvp0xmH0j
 TJ5A==
X-Gm-Message-State: AOAM531zCYPV5US/YvRDshAvWQjwViqGyAyrXs2uliPR12aB6Lt9bI82
 +oL7g5CrKpOQZDD7Dz5vDUVtdGm7fcorGuOK3wcYHGeEA+DpL62fNNCqXGclx3glwEndAna8hu4
 e5zVE1TIPnbPURT0=
X-Received: by 2002:ac8:5905:: with SMTP id 5mr254101qty.286.1632326456291;
 Wed, 22 Sep 2021 09:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHo8XiSMdYXLswaY9LxJgdEDl9ciq+NtV2AbfSTX2YOUWleH/yjxfa4+sY7YGs1z75XpFzTQ==
X-Received: by 2002:ac8:5905:: with SMTP id 5mr254064qty.286.1632326455952;
 Wed, 22 Sep 2021 09:00:55 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id b14sm854682qkl.81.2021.09.22.09.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:00:55 -0700 (PDT)
Date: Wed, 22 Sep 2021 12:00:53 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 3/3] dump-guest-memory: Block live migration
Message-ID: <YUtTNZiGH4oFtVQi@t490s>
References: <20210826185813.248441-1-peterx@redhat.com>
 <20210826185813.248441-4-peterx@redhat.com>
 <CAJ+F1C+52DJb4c8Qx66xA1QS6dNGRhkgJYM883bAqcsez6gZAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+52DJb4c8Qx66xA1QS6dNGRhkgJYM883bAqcsez6gZAw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 07:18:15PM +0400, Marc-André Lureau wrote:
> Hi

Hi, Marc-André,

> 
> On Thu, Aug 26, 2021 at 11:01 PM Peter Xu <peterx@redhat.com> wrote:
> 
> > Both dump-guest-memory and live migration caches vm state at the beginning.
> > Either of them entering the other one will cause race on the vm state, and
> > even
> > more severe on that (please refer to the crash report in the bug link).
> >
> > Let's block live migration in dump-guest-memory, and that'll also block
> > dump-guest-memory if it detected that we're during a live migration.
> >
> > Side note: migrate_del_blocker() can be called even if the blocker is not
> > inserted yet, so it's safe to unconditionally delete that blocker in
> > dump_cleanup (g_slist_remove allows no-entry-found case).
> >
> > Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  dump/dump.c | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/dump/dump.c b/dump/dump.c
> > index ab625909f3..9c1c1fb738 100644
> > --- a/dump/dump.c
> > +++ b/dump/dump.c
> > @@ -29,6 +29,7 @@
> >  #include "qemu/error-report.h"
> >  #include "qemu/main-loop.h"
> >  #include "hw/misc/vmcoreinfo.h"
> > +#include "migration/blocker.h"
> >
> >  #ifdef TARGET_X86_64
> >  #include "win_dump.h"
> > @@ -47,6 +48,8 @@
> >
> >  #define MAX_GUEST_NOTE_SIZE (1 << 20) /* 1MB should be enough */
> >
> > +static Error *dump_migration_blocker;
> > +
> >  #define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)   \
> >      ((DIV_ROUND_UP((hdr_size), 4) +                     \
> >        DIV_ROUND_UP((name_size), 4) +                    \
> > @@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)
> >              qemu_mutex_unlock_iothread();
> >          }
> >      }
> > +    migrate_del_blocker(dump_migration_blocker);
> >
> >      return 0;
> >  }
> > @@ -1927,11 +1931,6 @@ void qmp_dump_guest_memory(bool paging, const char
> > *file,
> >      Error *local_err = NULL;
> >      bool detach_p = false;
> >
> > -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> >
> 
> This INMIGRATE check,
> 
> -        error_setg(errp, "Dump not allowed during incoming migration.");
> > -        return;
> > -    }
> > -
> >      /* if there is a dump in background, we should wait until the dump
> >       * finished */
> >      if (dump_in_progress()) {
> > @@ -2005,6 +2004,21 @@ void qmp_dump_guest_memory(bool paging, const char
> > *file,
> >          return;
> >      }
> >
> > +    if (!dump_migration_blocker) {
> > +        error_setg(&dump_migration_blocker,
> > +                   "Live migration disabled: dump-guest-memory in
> > progress");
> > +    }
> > +
> > +    /*
> > +     * Allows even for -only-migratable, but forbid migration during the
> > +     * process of dump guest memory.
> > +     */
> > +    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
> >
> 
> is now handled here with migration_is_idle() ?
> 
> I am not familiar enough with the run & migration states intricacies here

Hmm, I thought it covers both src/dst, but after I double checked it seems
not..

On the destination side, we seem to have used MigrationState somewhere like in
migration_channel_process_incoming for reading parameters and capabilities, but
OTOH we used MigrationIncomingState for most of the rest operations, e.g., to
maintain dst migration state changes.  Then migration_is_idle() won't work on
dst indeed..

I think we should rename migration_is_idle() to migration_src_is_idle() at some
point.

For now, I'll respin and just keep the RUN_STATE_INMIGRATE check above.

Thanks!

-- 
Peter Xu


