Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4A63C9DE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 21:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07Yk-00034P-AE; Tue, 29 Nov 2022 15:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p07Yf-00033U-8m
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:50:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p07Yd-0001eA-2w
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 15:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669755020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5cx8V2WLJrQVtLO7d8XDB9Zraf5be6FNmNqAbwi8w74=;
 b=BzDynBBbPi1buXogm7M2O8S7m0roXD9e7uGaqcd5LR/PehgjtP3AG9mBolWcdqp6fs3Ss/
 jit6z/UqZEu8aC4Y99ysSBg3rQZThEpkzIHDVNvzULInmRt/Mc8XspiFii6++GSMUIYjSl
 xoDbHy3HbG8m/GsMW6Y8Ojgz6ty38bI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-7TDjQ5JdOJSlhM6AicXhzQ-1; Tue, 29 Nov 2022 15:50:16 -0500
X-MC-Unique: 7TDjQ5JdOJSlhM6AicXhzQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 i4-20020ac813c4000000b003a5044a818cso23712913qtj.11
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 12:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cx8V2WLJrQVtLO7d8XDB9Zraf5be6FNmNqAbwi8w74=;
 b=kC0O9aJpah6Vy/Aj2hQnd5sfR62w8SKEGyrfhhp7UoCuKpLlKjCBx5vWQMommlA8sD
 gZrvX7S6QMcmBF2zPiuUcLKb3T6Wtyesqr2uSuNL2u0Ghsv4K2w37wme1WL0SLTK1Oyh
 1NP3bxEWpbD4IoVi0372P8hlHn74jvQCjXNqJyO2FxX8UGXyAYkyWF2x9UQDTKCm6k8B
 sqB4NgB3B1qS7EpBjX5GHPhj4yi3d2ENmZnQW1la5WPOHhLEdrPaADS0a+axHu826Ukt
 PJTZ2eejnKNyfOxa3xyo41i5Ad0axEmsKtN+bH5iix2LRJjPpFDjnX0Y/HwDWG7o4UoL
 n5EQ==
X-Gm-Message-State: ANoB5pkkw7iM5UtwaDhX/WK5TmTzOU9FXyHjdic3dBv9NVapc6TMn1N+
 V/YOSm2Lqx0MVP+GWrPXZAyEp+P0EG58Pp4SkbXWjhHaheNWq8dLz6QolngsMqGWM8fCinRSMFi
 aAru0wcLtk8lljIw=
X-Received: by 2002:ac8:43cc:0:b0:3a6:89b2:c696 with SMTP id
 w12-20020ac843cc000000b003a689b2c696mr2304761qtn.317.1669755015541; 
 Tue, 29 Nov 2022 12:50:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6eFtPEUwJGe3lKs7yRWf2SXPgPp2q2KGWNuQG/rWLvRe6BL7A+PH6SVhBiEZ5ZH/o8r3Lv/w==
X-Received: by 2002:ac8:43cc:0:b0:3a6:89b2:c696 with SMTP id
 w12-20020ac843cc000000b003a689b2c696mr2304742qtn.317.1669755015277; 
 Tue, 29 Nov 2022 12:50:15 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 k12-20020a05620a414c00b006fa22f0494bsm11665545qko.117.2022.11.29.12.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:50:14 -0800 (PST)
Date: Tue, 29 Nov 2022 15:50:13 -0500
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Li Xiaohui <xiaohli@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Fix yank on postcopy multifd crashing
 guest after migration
Message-ID: <Y4ZwhZVDh9ac6MH8@x1n>
References: <20221109055629.789795-1-leobras@redhat.com> <Y3+WGof3MQtaCYdS@x1n>
 <CAJ6HWG4KaEbUYHe75i4ty66nosHEM8ZJW0c1W4Q=s4YeNnP_rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG4KaEbUYHe75i4ty66nosHEM8ZJW0c1W4Q=s4YeNnP_rA@mail.gmail.com>
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

On Tue, Nov 29, 2022 at 05:28:26PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter,

Leo,

> 
> On Thu, Nov 24, 2022 at 1:04 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Nov 09, 2022 at 02:56:29AM -0300, Leonardo Bras wrote:
> > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > index a0cdb714f7..250caff7f4 100644
> > > --- a/migration/savevm.c
> > > +++ b/migration/savevm.c
> > > @@ -1889,6 +1889,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
> > >          exit(EXIT_FAILURE);
> > >      }
> > >
> > > +    migration_load_cleanup();
> >
> > It's a bit weird to call multifd-load-clean in a listen phase..
> 
> I agree.
> 
> >
> > How about moving it right above
> > trace_process_incoming_migration_co_postcopy_end_main()?  Then the new
> > helper can also be static.
> 
> Seems a nice Idea to have this function to be static.
> 
> We have to guarantee this is run after the migration finished, but
> before migration_incoming_state_destroy().

IIUC it doesn't need to be when migration finished.  It should be fine as
long as we finished precopy phase, and that's what the migration coroutine
does, iiuc.  The thing is postcopy doesn't use multifd at all, so logically
it can be released before postcopy starts.

Actually, IMHO it'll be safer to do it like that, just to make sure we
won't accidentally receive multifd pages _after_ postcopy starts, because
that'll be another more severe and hard to debug issue since the guest can
see partial copied pages from multifd recv channels.

> 
> You suggested calling it right above of
> trace_process_incoming_migration_co_postcopy_end_main(), which git
> grep pointed me to an if clause in process_incoming_migration_co().
> If I got the location correctly, it would not help: this coroutine is
> ran just after the VM went to the target host, and not when the
> migration finished.
> 
> If we are using multifd channels, this will break the migration with
> segmentation fault (SIGSEGV), since the channels have not finished
> sending yet.

If this happens, then I had a feeling that there's something else that
needs syncs.  As I discussed above, we should make sure multifd pages all
landed before we start vcpu threads.

Said that, now I think I'm not against your original proposal to fix this
immediate crash.  However I am still wondering whether we really should
disable multifd with postcopy, as there seem to be still a few missing
pieces even to enable multifd during precopy-only.

Thanks,

-- 
Peter Xu


