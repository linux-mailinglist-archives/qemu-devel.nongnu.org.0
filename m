Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C63F9B2C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 16:54:20 +0200 (CEST)
Received: from localhost ([::1]:37798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdFB-0002zF-DT
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 10:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJdBv-0007am-96
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 10:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJdBq-0008KH-Db
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630075837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RF7S9SZ1Ixc8kiSINQmXoTiSrzLGXF10qJYNWSdDwpQ=;
 b=CQfvdM9OQUBc1sk31qAJbV46+nd9+uBl9XZIf48tPCPzm1tAr0ekPCtzqWX4/aHJ61nSt+
 tT4mAM1kbhUeeMn794ma9/Hf9f6GbVvQAszWCc2o7DlrCGeEQknql7i3QrOSZ7qsvuJ+jL
 RZuLO/zCFY8YJo5vdp5VkAazHMncWLM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109--KdHVBilPdeySLqWuS1pnw-1; Fri, 27 Aug 2021 10:50:36 -0400
X-MC-Unique: -KdHVBilPdeySLqWuS1pnw-1
Received: by mail-qv1-f71.google.com with SMTP id
 q2-20020ad45ca2000000b00374fa0dbedfso3112283qvh.1
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 07:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RF7S9SZ1Ixc8kiSINQmXoTiSrzLGXF10qJYNWSdDwpQ=;
 b=IThhUfnGzdd5OfcpuI3pqIWkmmllnY4/yNguwuqrRwV6JQhIqeSWMbFptozHYkQNA2
 KoZnY9yfvOfcUn5nyhGyR2K9//T17S9C0uGZwTKFNnWhx/Z5qABVqwfyIZf2ko2T/1tv
 nxbAeo8pF3lvmzJH4flJBoYgJ6wYByqQTCQZnb0m0g09nerSzCl/wulRy++98bray/Lz
 ysXnVCKbfxddF69rinGsZnmpQAj+i2MI972dugsBDk3A2NDip49Z45/8xaKIaml6OBLK
 +wc3k+DKfZxjA4b5xYuggqqqzmyYKk6Ozm2UfA4eOtr4H92jiSFwufnIG9ci8vvxebXo
 qcWA==
X-Gm-Message-State: AOAM5334eTB9my8UrtZuL767X/1itZBLrod2kbIt8ILOrHIXNjHwf4Cb
 bJMv+kL+2X+eVale4vYJLBXaTl6uT3vRX7OIW35kTzK2ez6SI4HbOOrJ43TpQmFnCMCGeNXIdYx
 561OmmtDhiL+yv5Q=
X-Received: by 2002:a0c:b356:: with SMTP id a22mr10201701qvf.7.1630075835758; 
 Fri, 27 Aug 2021 07:50:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOT1VJ7ctzYjJynjVvDMBUSa3fATWjKgj5nKNI7/gcVujYsHWYOjVaAF19w1Eok8hpzck0dA==
X-Received: by 2002:a0c:b356:: with SMTP id a22mr10201667qvf.7.1630075835475; 
 Fri, 27 Aug 2021 07:50:35 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id b7sm1893250qtt.12.2021.08.27.07.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 07:50:34 -0700 (PDT)
Date: Fri, 27 Aug 2021 10:50:33 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 3/3] dump-guest-memory: Block live migration
Message-ID: <YSj7uS+Oj5NWOsSy@t490s>
References: <20210826185813.248441-1-peterx@redhat.com>
 <20210826185813.248441-4-peterx@redhat.com>
 <CAMxuvayocGDRH-PDf3LQPjcCh-XD1Sor2aHUAi1DEfFPHmjrKA@mail.gmail.com>
 <CAMxuvaxf6vw4WqsKQSsPnBqF92JaEcJbEeUhOL1M=2Dc6_oY=Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxf6vw4WqsKQSsPnBqF92JaEcJbEeUhOL1M=2Dc6_oY=Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 11:51:04AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Aug 27, 2021 at 11:44 AM Marc-André Lureau <
> marcandre.lureau@redhat.com> wrote:
> 
> > Hi
> >
> > On Thu, Aug 26, 2021 at 10:58 PM Peter Xu <peterx@redhat.com> wrote:
> >
> >> Both dump-guest-memory and live migration caches vm state at the
> >> beginning.
> >> Either of them entering the other one will cause race on the vm state,
> >> and even
> >> more severe on that (please refer to the crash report in the bug link).
> >>
> >> Let's block live migration in dump-guest-memory, and that'll also block
> >> dump-guest-memory if it detected that we're during a live migration.
> >>
> >> Side note: migrate_del_blocker() can be called even if the blocker is not
> >> inserted yet, so it's safe to unconditionally delete that blocker in
> >> dump_cleanup (g_slist_remove allows no-entry-found case).
> >>
> >> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
> >> Signed-off-by: Peter Xu <peterx@redhat.com>
> >> ---
> >>  dump/dump.c | 24 +++++++++++++++++++-----
> >>  1 file changed, 19 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/dump/dump.c b/dump/dump.c
> >> index ab625909f3..9c1c1fb738 100644
> >> --- a/dump/dump.c
> >> +++ b/dump/dump.c
> >> @@ -29,6 +29,7 @@
> >>  #include "qemu/error-report.h"
> >>  #include "qemu/main-loop.h"
> >>  #include "hw/misc/vmcoreinfo.h"
> >> +#include "migration/blocker.h"
> >>
> >>  #ifdef TARGET_X86_64
> >>  #include "win_dump.h"
> >> @@ -47,6 +48,8 @@
> >>
> >>  #define MAX_GUEST_NOTE_SIZE (1 << 20) /* 1MB should be enough */
> >>
> >> +static Error *dump_migration_blocker;
> >> +
> >>  #define ELF_NOTE_SIZE(hdr_size, name_size, desc_size)   \
> >>      ((DIV_ROUND_UP((hdr_size), 4) +                     \
> >>        DIV_ROUND_UP((name_size), 4) +                    \
> >> @@ -101,6 +104,7 @@ static int dump_cleanup(DumpState *s)
> >>              qemu_mutex_unlock_iothread();
> >>          }
> >>      }
> >> +    migrate_del_blocker(dump_migration_blocker);
> >>
> >>      return 0;
> >>  }
> >> @@ -1927,11 +1931,6 @@ void qmp_dump_guest_memory(bool paging, const char
> >> *file,
> >>      Error *local_err = NULL;
> >>      bool detach_p = false;
> >>
> >> -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> >> -        error_setg(errp, "Dump not allowed during incoming migration.");
> >> -        return;
> >> -    }
> >> -
> >>      /* if there is a dump in background, we should wait until the dump
> >>       * finished */
> >>      if (dump_in_progress()) {
> >> @@ -2005,6 +2004,21 @@ void qmp_dump_guest_memory(bool paging, const char
> >> *file,
> >>          return;
> >>      }
> >>
> >> +    if (!dump_migration_blocker) {
> >> +        error_setg(&dump_migration_blocker,
> >> +                   "Live migration disabled: dump-guest-memory in
> >> progress");
> >> +    }
> >> +
> >> +    /*
> >> +     * Allows even for -only-migratable, but forbid migration during the
> >> +     * process of dump guest memory.
> >> +     */
> >> +    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
> >> +        /* Remember to release the fd before passing it over to dump
> >> state */
> >> +        close(fd);
> >> +        return;
> >> +    }
> >>
> >
> > I would move it earlier.  Why not leave it at the beginning of the
> > function as it was?
> >
> >
> Ah I think it's because dump_cleanup() isn't called when returning earlier.
> But relying on a cleanup done outside of this function is not obvious.
> Either dump_cleanup() should be called from here, or the blocker code
> should be moved to dump_init() imho.

Note that dump_cleanup() cleans s->fd, however fd has not delievered to s->fd
now.

I can move it into dump_init() but I need to put it after setting s->fd to make
dump_cleanup work.  That could look a bit weird (as checking migration blocker
shouldn't really be bound to initialize of dump states).

There's another way to move add blocker to the entry of dump_in_progress()
check, however then all the checks between dump_in_progress() and before
opening the fd will not be able to "return" directly but we'll need to del the
blocker if any of those check fails.

That's how I come up with the current patch, which looks the easiest change and
still looks clean.

Besides, I think dump_in_progress() can be removed too with patch 1 checks
SAVEVM state too, however that's a side effect of migration_is_idle() and
dump_in_progres is doing the check in different ways by looking up dump state,
so I kept it.

Thanks,

-- 
Peter Xu


