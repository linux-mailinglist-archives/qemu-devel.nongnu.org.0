Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3455F55EF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 15:56:03 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og4sT-0007r7-Es
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 09:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1og4dz-0004Ab-FC
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1og4dw-0007JY-Tb
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664977259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CglflOJvLY03vvs+xvhWYiqLorwjqEe+RepI6FHopfc=;
 b=gcPQbOj78PRqcE3QVvRRMneUs34KrhwZsevE1Do4SF3W8OOAE5cJUU2lXD7GO135wowKzr
 yppvupJZhZ5fCYlnZRJYKCWwNc+saAfuvQV1V6BRF1s+nWnDzNOQznjiMJuxjJwEyyBVtn
 wxgP0zGYOV2Rc8brR5lvrAJeGDqZjMo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-tXWEZHYrPNSaN6rsR7rHPA-1; Wed, 05 Oct 2022 09:40:56 -0400
X-MC-Unique: tXWEZHYrPNSaN6rsR7rHPA-1
Received: by mail-qt1-f197.google.com with SMTP id
 fy20-20020a05622a5a1400b0035bef08641dso11252467qtb.18
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 06:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=CglflOJvLY03vvs+xvhWYiqLorwjqEe+RepI6FHopfc=;
 b=d1lKHP9gAUdtb94Apywd2KBmfYB+XGj6EOqttz9KFekY8BHYCKqpHXA/u82n4eh2Gx
 G3ni9cXMC2iv8ac06y+viQElvOl6Zl4EBFbxOoDAl17gLMH8LUuZi8Z2RnKD337Vv+YN
 fw+3PT9DqhOp3Is2GZI6tyCFuZGlkv6gNfIWUbZ3hrkFqvGfwpSvmOdPE8zzW6qgCjo7
 oNYVNhzajgd66oYJXmYXiEd9VRIP5hP672vXMWkQnr9KuEsv/veJ+cM5p8Wsco+irUri
 zAJ0jJ6OJmZH+FuEWD+h30jDWjl4GrjisZu6Yfwa2MP/uLnqVwXMGkPlj+4mPn9hXZVM
 mzpw==
X-Gm-Message-State: ACrzQf3hPyUPc7X9ks3X6kQAHyPyS4Mc28QO1oGaHq7XRPlYynoLh92d
 drbBODoOdeHdyqv6Ln01CNG+UPTTgB8+0G7FEHdGSqwTCUEWp2NcrzeTJwMKZvmGN8tsDQEOAm2
 zXnfhxKqWdi3Tp3s=
X-Received: by 2002:ac8:7c4c:0:b0:35c:fa89:5a30 with SMTP id
 o12-20020ac87c4c000000b0035cfa895a30mr23742989qtv.359.1664977255728; 
 Wed, 05 Oct 2022 06:40:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qUCcWz6/of6Xn01+lbU0JI4764TzNuIwEuREK56J/+NlSxShm9a86PZhvhNMEvAKZX3AHiw==
X-Received: by 2002:ac8:7c4c:0:b0:35c:fa89:5a30 with SMTP id
 o12-20020ac87c4c000000b0035cfa895a30mr23742974qtv.359.1664977255468; 
 Wed, 05 Oct 2022 06:40:55 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05620a241300b006ce9e880c6fsm17322703qkn.111.2022.10.05.06.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 06:40:54 -0700 (PDT)
Date: Wed, 5 Oct 2022 09:40:53 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 05/14] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Yz2JZT55uhTdP7+m@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225210.48732-1-peterx@redhat.com>
 <Yzw7Po4Qg/0WJNke@work-vm> <YzyF741irw/UEFCf@x1n>
 <Yz1n6JOdz1+QT2ei@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yz1n6JOdz1+QT2ei@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 05, 2022 at 12:18:00PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Oct 04, 2022 at 02:55:10PM +0100, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > Don't take the bitmap mutex when sending pages, or when being throttled by
> > > > migration_rate_limit() (which is a bit tricky to call it here in ram code,
> > > > but seems still helpful).
> > > > 
> > > > It prepares for the possibility of concurrently sending pages in >1 threads
> > > > using the function ram_save_host_page() because all threads may need the
> > > > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> > > > qemu_sem_wait() blocking for one thread will not block the other from
> > > > progressing.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > I generally dont like taking locks conditionally; but this kind of looks
> > > OK; I think it needs a big comment on the start of the function saying
> > > that it's called and left with the lock held but that it might drop it
> > > temporarily.
> > 
> > Right, the code is slightly hard to read, I just didn't yet see a good and
> > easy solution for it yet.  It's just that we may still want to keep the
> > lock as long as possible for precopy in one shot.
> > 
> > > 
> > > > ---
> > > >  migration/ram.c | 42 +++++++++++++++++++++++++++++++-----------
> > > >  1 file changed, 31 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > index 8303252b6d..6e7de6087a 100644
> > > > --- a/migration/ram.c
> > > > +++ b/migration/ram.c
> > > > @@ -2463,6 +2463,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
> > > >   */
> > > >  static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> > > >  {
> > > > +    bool page_dirty, release_lock = postcopy_preempt_active();
> > > 
> > > Could you rename that to something like 'drop_lock' - you are taking the
> > > lock at the end even when you have 'release_lock' set - which is a bit
> > > strange naming.
> > 
> > Is there any difference on "drop" or "release"?  I'll change the name
> > anyway since I definitely trust you on any English comments, but please
> > still let me know - I love to learn more on those! :)
> 
> I'm not sure 'drop' is much better either; I was struggling to find a
> good nam.

I can also call it "preempt_enabled".

Actually I can directly replace it with calling postcopy_preempt_active()
always but I just want to make it crystal clear that the value is not
changing and lock & unlock are always paired - in our case I think it is
not changing, but the var helps to be 100% sure there'll be no possible bug
on e.g. deadlock caused by state changing.

> 
> > > 
> > > >      int tmppages, pages = 0;
> > > >      size_t pagesize_bits =
> > > >          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> > > > @@ -2486,22 +2487,41 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> > > >              break;
> > > >          }
> > > >  
> > > > +        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
> > > > +        /*
> > > > +         * Properly yield the lock only in postcopy preempt mode because
> > > > +         * both migration thread and rp-return thread can operate on the
> > > > +         * bitmaps.
> > > > +         */
> > > > +        if (release_lock) {
> > > > +            qemu_mutex_unlock(&rs->bitmap_mutex);
> > > > +        }
> > > 
> > > Shouldn't the unlock/lock move inside the 'if (page_dirty) {' ?
> > 
> > I think we can move into it, but it may not be as optimal as keeping it
> > as-is.
> > 
> > Consider a case where we've got the bitmap with continous zero bits.
> > During postcopy, the migration thread could be spinning here with the lock
> > held even if it doesn't send a thing.  It could still block the other
> > return path thread on sending urgent pages which may be outside the zero
> > zones.
> 
> OK, that reason needs commenting then - you're going to do a lot of
> release/take pairs in that case which is going to show up as very hot;
> so hmm, if ti was just for that type of 'yield' behaviour you wouldn't
> normally do it for each bit.

Hold on.. I think my assumption won't easily trigger, because at the end of
the loop we'll try to look for the next "dirty" page.  So continuously
clean pages are unlikely, or I even think it's impossible because we're
holding the mutex during scanning and clear-dirty, so no one will be able
to flip the bit.

So yeah I think it's okay to move it into "page_dirty", but since we'll
mostly always go into dirty maybe it's just that it won't help a lot
either, because it'll be mostly the same as keeping it outside?

-- 
Peter Xu


