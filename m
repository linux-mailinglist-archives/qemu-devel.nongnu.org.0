Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD45F5AC4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 21:58:33 +0200 (CEST)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogAXG-0007P1-Oz
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 15:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogANm-0007io-QJ
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 15:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogANj-0001dh-5z
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 15:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664999314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wFsmPOKPS3njX/TqndsDGT3O9I+Lfc3ck8p74cgzPLk=;
 b=K8A7LN6WuV4IwH2VN8QRQxbQfpiZz2VYYmAtgmddPIwkv1k5O+ypU7iMdhayVoJEvznX9T
 ZbyqTXsnjIMFn8cTydC2n+kHma7CJqV9z8Juqi2nDT4KY4KsCHDbIy+3vo6DipRi3kjOtR
 lghNcUY1izfKWi0dxk1on03hfdhp8Lc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-F7-ZRIobMVuiAfekUvCyMQ-1; Wed, 05 Oct 2022 15:48:33 -0400
X-MC-Unique: F7-ZRIobMVuiAfekUvCyMQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 g6-20020ac84b66000000b0035cf832dec9so11777317qts.6
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 12:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=wFsmPOKPS3njX/TqndsDGT3O9I+Lfc3ck8p74cgzPLk=;
 b=5fNuUR2pCkynF5gk5IdJe23JOw9MyU2ExgwTCt2tG03Sq/lpd+4hMQNQOZ66mdU03e
 EjeaCoj3tsZws8ZphMSLKxIFPMcdv1Qxg6qBUulx12VFPU0qrYYjIoSbYP/06AR+5y91
 34nCLiaqecoouKxitywRY3ExeV8pRqmzF0qQ/0N9SKGMqGIWTmo3pZZtjR9qXqSoKwg+
 JJGQMJ67uI4f1jYk2Bx5b6cUQhg9BeSGciBYikgXYo4pgYyaawHvb2pjr4zSEqjhEOoq
 zHbn2bMv+pO3rbkO0ujuVqC/PmB2on2adv0wOX+dRf7UjN+nXI5bLqlCmkPDQazlASXa
 hPYQ==
X-Gm-Message-State: ACrzQf2Ty2QiNEO5kxPQViMcLz4V0ZRSYO38dZwi5n7/vwsgrSD72IB1
 BIIv4RCEE+9b5R8+OupZWQBCIC3QX0LtUJ/GDwPCfXRxbw8Kvues1MYIj4Kd8XuxWXRssxbWjhw
 Rzt1EUeflIxxeyAY=
X-Received: by 2002:a37:8205:0:b0:6e4:3d36:10a4 with SMTP id
 e5-20020a378205000000b006e43d3610a4mr800533qkd.783.1664999312991; 
 Wed, 05 Oct 2022 12:48:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM44WalaRgqeqWSMf94cq4nzH/uRqznR+/m61n0SEDo6HWAb4rNxrI6fpb+KYVQOiNy75PHAkg==
X-Received: by 2002:a37:8205:0:b0:6e4:3d36:10a4 with SMTP id
 e5-20020a378205000000b006e43d3610a4mr800509qkd.783.1664999312665; 
 Wed, 05 Oct 2022 12:48:32 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 v1-20020a05620a0f0100b006bb8b5b79efsm19281127qkl.129.2022.10.05.12.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 12:48:32 -0700 (PDT)
Date: Wed, 5 Oct 2022 15:48:30 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 05/14] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Yz3fjhBSNRuq/PjS@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225210.48732-1-peterx@redhat.com>
 <Yzw7Po4Qg/0WJNke@work-vm> <YzyF741irw/UEFCf@x1n>
 <Yz1n6JOdz1+QT2ei@work-vm> <Yz2JZT55uhTdP7+m@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yz2JZT55uhTdP7+m@x1n>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Wed, Oct 05, 2022 at 09:40:53AM -0400, Peter Xu wrote:
> On Wed, Oct 05, 2022 at 12:18:00PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > On Tue, Oct 04, 2022 at 02:55:10PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Peter Xu (peterx@redhat.com) wrote:
> > > > > Don't take the bitmap mutex when sending pages, or when being throttled by
> > > > > migration_rate_limit() (which is a bit tricky to call it here in ram code,
> > > > > but seems still helpful).
> > > > > 
> > > > > It prepares for the possibility of concurrently sending pages in >1 threads
> > > > > using the function ram_save_host_page() because all threads may need the
> > > > > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> > > > > qemu_sem_wait() blocking for one thread will not block the other from
> > > > > progressing.
> > > > > 
> > > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > 
> > > > I generally dont like taking locks conditionally; but this kind of looks
> > > > OK; I think it needs a big comment on the start of the function saying
> > > > that it's called and left with the lock held but that it might drop it
> > > > temporarily.
> > > 
> > > Right, the code is slightly hard to read, I just didn't yet see a good and
> > > easy solution for it yet.  It's just that we may still want to keep the
> > > lock as long as possible for precopy in one shot.
> > > 
> > > > 
> > > > > ---
> > > > >  migration/ram.c | 42 +++++++++++++++++++++++++++++++-----------
> > > > >  1 file changed, 31 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > > index 8303252b6d..6e7de6087a 100644
> > > > > --- a/migration/ram.c
> > > > > +++ b/migration/ram.c
> > > > > @@ -2463,6 +2463,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
> > > > >   */
> > > > >  static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> > > > >  {
> > > > > +    bool page_dirty, release_lock = postcopy_preempt_active();
> > > > 
> > > > Could you rename that to something like 'drop_lock' - you are taking the
> > > > lock at the end even when you have 'release_lock' set - which is a bit
> > > > strange naming.
> > > 
> > > Is there any difference on "drop" or "release"?  I'll change the name
> > > anyway since I definitely trust you on any English comments, but please
> > > still let me know - I love to learn more on those! :)
> > 
> > I'm not sure 'drop' is much better either; I was struggling to find a
> > good nam.
> 
> I can also call it "preempt_enabled".
> 
> Actually I can directly replace it with calling postcopy_preempt_active()
> always but I just want to make it crystal clear that the value is not
> changing and lock & unlock are always paired - in our case I think it is
> not changing, but the var helps to be 100% sure there'll be no possible bug
> on e.g. deadlock caused by state changing.
> 
> > 
> > > > 
> > > > >      int tmppages, pages = 0;
> > > > >      size_t pagesize_bits =
> > > > >          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> > > > > @@ -2486,22 +2487,41 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> > > > >              break;
> > > > >          }
> > > > >  
> > > > > +        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
> > > > > +        /*
> > > > > +         * Properly yield the lock only in postcopy preempt mode because
> > > > > +         * both migration thread and rp-return thread can operate on the
> > > > > +         * bitmaps.
> > > > > +         */
> > > > > +        if (release_lock) {
> > > > > +            qemu_mutex_unlock(&rs->bitmap_mutex);
> > > > > +        }
> > > > 
> > > > Shouldn't the unlock/lock move inside the 'if (page_dirty) {' ?
> > > 
> > > I think we can move into it, but it may not be as optimal as keeping it
> > > as-is.
> > > 
> > > Consider a case where we've got the bitmap with continous zero bits.
> > > During postcopy, the migration thread could be spinning here with the lock
> > > held even if it doesn't send a thing.  It could still block the other
> > > return path thread on sending urgent pages which may be outside the zero
> > > zones.
> > 
> > OK, that reason needs commenting then - you're going to do a lot of
> > release/take pairs in that case which is going to show up as very hot;
> > so hmm, if ti was just for that type of 'yield' behaviour you wouldn't
> > normally do it for each bit.
> 
> Hold on.. I think my assumption won't easily trigger, because at the end of
> the loop we'll try to look for the next "dirty" page.  So continuously
> clean pages are unlikely, or I even think it's impossible because we're
> holding the mutex during scanning and clear-dirty, so no one will be able
> to flip the bit.
> 
> So yeah I think it's okay to move it into "page_dirty", but since we'll
> mostly always go into dirty maybe it's just that it won't help a lot
> either, because it'll be mostly the same as keeping it outside?

IOW, maybe I should drop page_dirty directly and replace it with a check,
failing migration if migration_bitmap_clear_dirty() returned false?

-- 
Peter Xu


