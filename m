Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DF4DADAA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:41:17 +0100 (CET)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQ9b-0005HD-SZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:41:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUQ5r-0003Ea-IQ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nUQ5m-0005KI-B0
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647423427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3oXWjeULzsgfMjb8h+gGdBHMTWZx02xohSiScpk6WOw=;
 b=WB1m7Rw653o3Uupsodj2ebqHgalhkcWTfW5xkRMWdpPUh1ShG6WVYtgfo80qDU7cmndEaX
 H78+6UqbFn3fdBcoXZgEfntHab91/D0hwWozZjuZDNkSisu1uYFG1+LXVqvaTF9nczg5K4
 RbQjq3AZf7rKyHXZp8h5H+r7qsL2hAY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-1CXYrmM4NJWyjdc6lrU4VA-1; Wed, 16 Mar 2022 05:37:06 -0400
X-MC-Unique: 1CXYrmM4NJWyjdc6lrU4VA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v67-20020a1cac46000000b00383e71bb26fso556027wme.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 02:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3oXWjeULzsgfMjb8h+gGdBHMTWZx02xohSiScpk6WOw=;
 b=J/3iTdtod98NJLgNSAk7YDbJ3cICll3FNb8yDSmn585zmZRbs7hRQ3J+JQAZGEkFwa
 1nqGvtl+ADJhLiMUos8rMi2Dy7FJqCDFBVInqPLDmizQMFfiOl0KVqZxU7vebqM5jhE7
 Yny9iJKMHxH4k+xV/NZRem92rK3vYJnibcY3AHlV/X+s9V8umJfLYr15QiTzOgELVzKS
 2K3PUBw+L5Kbmv8N11WxewlEL3PxJ6UpgK/hNg4RBMYUHZ9pv/VBa/aLcPiZlBvWYFWU
 y4jw8zqxgBhKpfXdmWjDgDLRI8B/8+rxLA6/OOACEFRAYtEI/sJU9BB3l9cWH46mZhdY
 go0A==
X-Gm-Message-State: AOAM532D7eyogBJ7l04rgxSJ7jBVVeCyNDhwb9+Y9XMH8y4JzWv+/ju5
 Mga1692MDRj8vV2Fi/5BmUfUlt+oPitZ+rK0tSoMbp5UDE970Sfo62QYe0xIZpbeybK22ZCHL8M
 r+WU2loLoSz5UEsw=
X-Received: by 2002:a05:600c:354f:b0:38a:29e:8540 with SMTP id
 i15-20020a05600c354f00b0038a029e8540mr6693704wmq.20.1647423424903; 
 Wed, 16 Mar 2022 02:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0lN3SxCBnR75d3xXIIIOhJieeJLGjVXPvOZQJ5dK3Gzt2cCXtKvGA8eufDAPZdH8hTjqBlg==
X-Received: by 2002:a05:600c:354f:b0:38a:29e:8540 with SMTP id
 i15-20020a05600c354f00b0038a029e8540mr6693668wmq.20.1647423424497; 
 Wed, 16 Mar 2022 02:37:04 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b00389e8184edcsm4553734wmq.35.2022.03.16.02.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 02:37:03 -0700 (PDT)
Date: Wed, 16 Mar 2022 09:37:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] softmmu/physmem: Use qemu_madvise
Message-ID: <YjGvvRvPRV3ACbFY@work-vm>
References: <20220316040405.4131-1-adeason@sinenomine.net>
 <9c36fe6b-39e1-0bfc-d2bb-97b106828ee1@redhat.com>
 <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96=yDKOknYmCKriWDJe4g-q07+b8yL3tFUf9=G-o84zA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Andrew Deason <adeason@sinenomine.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 16 Mar 2022 at 07:53, David Hildenbrand <david@redhat.com> wrote:
> >
> > On 16.03.22 05:04, Andrew Deason wrote:
> > > We have a thin wrapper around madvise, called qemu_madvise, which
> > > provides consistent behavior for the !CONFIG_MADVISE case, and works
> > > around some platform-specific quirks (some platforms only provide
> > > posix_madvise, and some don't offer all 'advise' types). This specific
> > > caller of madvise has never used it, tracing back to its original
> > > introduction in commit e0b266f01dd2 ("migration_completion: Take
> > > current state").
> > >
> > > Call qemu_madvise here, to follow the same logic as all of our other
> > > madvise callers. This slightly changes the behavior for
> > > !CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
> > > error message), but this is now more consistent with other callers
> > > that use qemu_madvise.
> > >
> > > Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> > > ---
> > > Looking at the history of commits that touch this madvise() call, it
> > > doesn't _look_ like there's any reason to be directly calling madvise vs
> > > qemu_advise (I don't see anything mentioned), but I'm not sure.
> > >
> > >  softmmu/physmem.c | 12 ++----------
> > >  1 file changed, 2 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > > index 43ae70fbe2..900c692b5e 100644
> > > --- a/softmmu/physmem.c
> > > +++ b/softmmu/physmem.c
> > > @@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
> > >                           rb->idstr, start, length, ret);
> > >              goto err;
> > >  #endif
> > >          }
> > >          if (need_madvise) {
> > >              /* For normal RAM this causes it to be unmapped,
> > >               * for shared memory it causes the local mapping to disappear
> > >               * and to fall back on the file contents (which we just
> > >               * fallocate'd away).
> > >               */
> > > -#if defined(CONFIG_MADVISE)
> > >              if (qemu_ram_is_shared(rb) && rb->fd < 0) {
> > > -                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> > > +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
> > >              } else {
> > > -                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> > > +                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
> >
> > posix_madvise(QEMU_MADV_DONTNEED) has completely different semantics
> > then madvise() -- it's not a discard that we need here.
> >
> > So ram_block_discard_range() would now succeed in environments (BSD?)
> > where it's supposed to fail.
> >
> > So AFAIKs this isn't sane.
> 
> But CONFIG_MADVISE just means "host has madvise()"; it doesn't imply
> "this is a Linux madvise() with MADV_DONTNEED". Solaris madvise()
> doesn't seem to have  MADV_DONTNEED at all; a quick look at the
> FreeBSD manpage suggests its madvise MADV_DONTNEED is identical
> to its posix_madvise MADV_DONTNEED.
> 
> If we need "specifically Linux MADV_DONTNEED semantics" maybe we
> should define a QEMU_MADV_LINUX_DONTNEED which either (a) does the
> right thing or (b) fails, and use qemu_madvise() regardless.
> 
> Certainly the current code is pretty fragile to being changed by
> people who don't understand the undocumented subtlety behind
> the use of a direct madvise() call here.

Yeh and I'm not sure I can remembe rall the subtleties; there's a big
hairy set of ifdef's in include/qemu/madvise.h that makes
sure we always have the definition of QEMU_MADV_REMOVE/DONTNEED
even on platforms that might not define it themselves.

But I think this code is used for things with different degrees
of care about the semantics; e.g. 'balloon' just cares that
it frees memory up and doesn't care about the detailed semantics
that much; so it's probably fine with that.
Postcopy is much more touchy, but then it's only going to be
calling this on Linux anyway (because of the userfault dependency).

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


