Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7B5F534A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 13:24:18 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og2Va-0006kX-V3
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 07:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og2Pk-0004Ou-RA
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:18:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og2Ph-0001pM-65
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 07:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664968687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iwY7N+w/KOiaO8WIFErS8C+pp6QxQKRk5OJVTadKBLI=;
 b=jQ3qdHPhOn2mcT3bubgBkjzo/feCt4LYNk7Ps6AtjwbgdEkjaN1fnLPu+sxkhaHtdgiQY4
 wmOq6jqASFyqAnjaD+hy5z70SRp9gSIZ+kTNW4MkvV3nW5+paocvP0HcbB/+D9iEHohWUw
 YR4lt25MMzETrcU0PvWs5LEHrdob/r4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-FqMWM54nNsOn0d9yJw9cRw-1; Wed, 05 Oct 2022 07:18:04 -0400
X-MC-Unique: FqMWM54nNsOn0d9yJw9cRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so798138wms.5
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 04:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iwY7N+w/KOiaO8WIFErS8C+pp6QxQKRk5OJVTadKBLI=;
 b=walc7qdwRCgXNI2Gs5EXnnKxSEoaDRpD72TclCyrbAvSS6EYdot6nblyQ6reKJofzl
 2YBMq8adXTpLbdzXGGry3+oxrmICv8qXNQ5gwAlh/2ZNeqWmQe5tUfcytpqDW1HcA3lG
 06CAzDkJUEdjeLrzthID9L5pfzri7wkR1TbDJpYfjSU4A1JlI3FD845G6+XVholAwwnF
 eDYR13jUObSuHLF5QTXgylwp1al4lKVOGG20fqg1AXqEXtRVn+Ns6A3osmiJUKhe6ujJ
 4+yuqyYJeBv+1vMVxnJ5UiJrFMXWSSLv5WoXGPg9LgbFuKPUOFFN1Jw0dajp6Ocq+yKC
 eMSQ==
X-Gm-Message-State: ACrzQf3bhZ7eiB0/WL4MykVJbmUZoFQT/i7XtrKkEtSoZ2i6aXXYQTpM
 wvqAuuhEJoPonluv+sumx9twDgGLeCkGCYU0b3ZPT0oSO1cid4L6S2LgNvhR84Lo+YSb0+BsjzF
 BhgevP3N+Y+s+kgU=
X-Received: by 2002:a5d:6504:0:b0:22e:44b0:4cf5 with SMTP id
 x4-20020a5d6504000000b0022e44b04cf5mr7597389wru.362.1664968683648; 
 Wed, 05 Oct 2022 04:18:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5HToWDPZ/Mvmy6qcJuR9zyhF30qYZQULJoH3Vi6zV94keRZ6YwdPeb9AhU8oO26CCv2L2bYw==
X-Received: by 2002:a5d:6504:0:b0:22e:44b0:4cf5 with SMTP id
 x4-20020a5d6504000000b0022e44b04cf5mr7597365wru.362.1664968683331; 
 Wed, 05 Oct 2022 04:18:03 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j29-20020adfa55d000000b00228d6bc8450sm18982565wrb.108.2022.10.05.04.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 04:18:02 -0700 (PDT)
Date: Wed, 5 Oct 2022 12:18:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 05/14] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Yz1n6JOdz1+QT2ei@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225210.48732-1-peterx@redhat.com>
 <Yzw7Po4Qg/0WJNke@work-vm> <YzyF741irw/UEFCf@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzyF741irw/UEFCf@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Oct 04, 2022 at 02:55:10PM +0100, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > Don't take the bitmap mutex when sending pages, or when being throttled by
> > > migration_rate_limit() (which is a bit tricky to call it here in ram code,
> > > but seems still helpful).
> > > 
> > > It prepares for the possibility of concurrently sending pages in >1 threads
> > > using the function ram_save_host_page() because all threads may need the
> > > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> > > qemu_sem_wait() blocking for one thread will not block the other from
> > > progressing.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > I generally dont like taking locks conditionally; but this kind of looks
> > OK; I think it needs a big comment on the start of the function saying
> > that it's called and left with the lock held but that it might drop it
> > temporarily.
> 
> Right, the code is slightly hard to read, I just didn't yet see a good and
> easy solution for it yet.  It's just that we may still want to keep the
> lock as long as possible for precopy in one shot.
> 
> > 
> > > ---
> > >  migration/ram.c | 42 +++++++++++++++++++++++++++++++-----------
> > >  1 file changed, 31 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index 8303252b6d..6e7de6087a 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -2463,6 +2463,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
> > >   */
> > >  static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> > >  {
> > > +    bool page_dirty, release_lock = postcopy_preempt_active();
> > 
> > Could you rename that to something like 'drop_lock' - you are taking the
> > lock at the end even when you have 'release_lock' set - which is a bit
> > strange naming.
> 
> Is there any difference on "drop" or "release"?  I'll change the name
> anyway since I definitely trust you on any English comments, but please
> still let me know - I love to learn more on those! :)

I'm not sure 'drop' is much better either; I was struggling to find a
good nam.

> > 
> > >      int tmppages, pages = 0;
> > >      size_t pagesize_bits =
> > >          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> > > @@ -2486,22 +2487,41 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> > >              break;
> > >          }
> > >  
> > > +        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
> > > +        /*
> > > +         * Properly yield the lock only in postcopy preempt mode because
> > > +         * both migration thread and rp-return thread can operate on the
> > > +         * bitmaps.
> > > +         */
> > > +        if (release_lock) {
> > > +            qemu_mutex_unlock(&rs->bitmap_mutex);
> > > +        }
> > 
> > Shouldn't the unlock/lock move inside the 'if (page_dirty) {' ?
> 
> I think we can move into it, but it may not be as optimal as keeping it
> as-is.
> 
> Consider a case where we've got the bitmap with continous zero bits.
> During postcopy, the migration thread could be spinning here with the lock
> held even if it doesn't send a thing.  It could still block the other
> return path thread on sending urgent pages which may be outside the zero
> zones.

OK, that reason needs commenting then - you're going to do a lot of
release/take pairs in that case which is going to show up as very hot;
so hmm, if ti was just for that type of 'yield' behaviour you wouldn't
normally do it for each bit.

> > 
> > 
> > >          /* Check the pages is dirty and if it is send it */
> > > -        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> > > +        if (page_dirty) {
> > >              tmppages = ram_save_target_page(rs, pss);
> > > -            if (tmppages < 0) {
> > > -                return tmppages;
> > > +            if (tmppages >= 0) {
> > > +                pages += tmppages;
> > > +                /*
> > > +                 * Allow rate limiting to happen in the middle of huge pages if
> > > +                 * something is sent in the current iteration.
> > > +                 */
> > > +                if (pagesize_bits > 1 && tmppages > 0) {
> > > +                    migration_rate_limit();
> > 
> > This feels interesting, I know it's no change from before, and it's
> > difficult to do here, but it seems odd to hold the lock around the
> > sleeping in the rate limit.
> 
> Good point.. I think I'll leave it there for this patch because it's
> totally irrelevant, but seems proper in the future to do unlocking too for
> normal precopy.
> 
> Maybe I'll just attach a patch at the end of this series when I repost.
> That'll be easier before things got forgotten again.

Dave

> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


