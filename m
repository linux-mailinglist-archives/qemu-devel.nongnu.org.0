Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F555F49A8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 21:21:18 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofnTg-000859-Mp
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 15:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofnMn-0003vr-7L
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:14:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofnMh-0006LB-Vc
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664910842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YBvQlf0gDiNLyhJRLZtKDkgq44bRLKo0uC0d3f8FRdA=;
 b=SowJ/D6KTD8ENbwGV3RLRzqa6+fK9NUM8RWWD0TBsth9ymYXXTAhz0eqgSp/xRLhnduBcS
 e+gfcxm6IieQbRhl9jtuAaI4+oOtk3ROC0TRh5KYJV/6ytBYxDcsx/Uxk4zfwgflJzqlrt
 lM0uw4kmdnzOxUDeeUp0zqqVZ6WQP4g=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-vIXEKEa8M4K82_h4xcaufw-1; Tue, 04 Oct 2022 15:13:53 -0400
X-MC-Unique: vIXEKEa8M4K82_h4xcaufw-1
Received: by mail-qv1-f69.google.com with SMTP id
 cy11-20020a05621418cb00b004b17b3cf429so5642049qvb.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=YBvQlf0gDiNLyhJRLZtKDkgq44bRLKo0uC0d3f8FRdA=;
 b=HWWFOVdn5WohMgCsGBXU5RTBBMs33S6M7Cyyfhy7EdpfV11MLCXT7ZRfz4hXGX9k/f
 h6q+fQBh/kpUGf9AgS2lJ9y49xO4+6jq4iAfKANu121sqxDLnyPeF6uHgpX3z+XFY0dK
 8PZtpeCqZARZTWLKzKTgVFJsRegwUilt9OeeT/oQ7DN89rSX96mY7UcPog+fgdOz2Hfw
 yDAxCfEbDKNcX+s913/3wfbbXUTqInW01Rtf0m80AVb/enzqWgGlb0ZUTY9Jl1U6D9K1
 yEjqS08Q57uGNFbbdkkPyhyiP7zMopkPxYG1D7/+pElmqSylhey3sKxV+FWNuzf47/a1
 WBag==
X-Gm-Message-State: ACrzQf2scNcq/6kb06vEBETwdoaS4Sxey8d6yZishDc6HF9EDkJzPbXi
 rBGyhP2pWKDZqIichfpccYOiqYmH02vTwS1WHLK9/aWiYIR7nJsejm6jz5S7NV5OgDv9vIDxsl/
 sgPUGLv8i69OdsYU=
X-Received: by 2002:ac8:5f0a:0:b0:35a:6fa8:23c4 with SMTP id
 x10-20020ac85f0a000000b0035a6fa823c4mr20885644qta.312.1664910833054; 
 Tue, 04 Oct 2022 12:13:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oN78FJh2/JmZTd0nkGwdsFlw7GDK1A8OMn6LZ9MV6RThu6OXoH2aTF68M+JMfTjxYAy+/rQ==
X-Received: by 2002:ac8:5f0a:0:b0:35a:6fa8:23c4 with SMTP id
 x10-20020ac85f0a000000b0035a6fa823c4mr20885621qta.312.1664910832777; 
 Tue, 04 Oct 2022 12:13:52 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 c11-20020ac853cb000000b0035a691cec8esm12104611qtq.29.2022.10.04.12.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:13:52 -0700 (PDT)
Date: Tue, 4 Oct 2022 15:13:51 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 05/14] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <YzyF741irw/UEFCf@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225210.48732-1-peterx@redhat.com>
 <Yzw7Po4Qg/0WJNke@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yzw7Po4Qg/0WJNke@work-vm>
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

On Tue, Oct 04, 2022 at 02:55:10PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Don't take the bitmap mutex when sending pages, or when being throttled by
> > migration_rate_limit() (which is a bit tricky to call it here in ram code,
> > but seems still helpful).
> > 
> > It prepares for the possibility of concurrently sending pages in >1 threads
> > using the function ram_save_host_page() because all threads may need the
> > bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> > qemu_sem_wait() blocking for one thread will not block the other from
> > progressing.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> I generally dont like taking locks conditionally; but this kind of looks
> OK; I think it needs a big comment on the start of the function saying
> that it's called and left with the lock held but that it might drop it
> temporarily.

Right, the code is slightly hard to read, I just didn't yet see a good and
easy solution for it yet.  It's just that we may still want to keep the
lock as long as possible for precopy in one shot.

> 
> > ---
> >  migration/ram.c | 42 +++++++++++++++++++++++++++++++-----------
> >  1 file changed, 31 insertions(+), 11 deletions(-)
> > 
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 8303252b6d..6e7de6087a 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -2463,6 +2463,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
> >   */
> >  static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> >  {
> > +    bool page_dirty, release_lock = postcopy_preempt_active();
> 
> Could you rename that to something like 'drop_lock' - you are taking the
> lock at the end even when you have 'release_lock' set - which is a bit
> strange naming.

Is there any difference on "drop" or "release"?  I'll change the name
anyway since I definitely trust you on any English comments, but please
still let me know - I love to learn more on those! :)

> 
> >      int tmppages, pages = 0;
> >      size_t pagesize_bits =
> >          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> > @@ -2486,22 +2487,41 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
> >              break;
> >          }
> >  
> > +        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
> > +        /*
> > +         * Properly yield the lock only in postcopy preempt mode because
> > +         * both migration thread and rp-return thread can operate on the
> > +         * bitmaps.
> > +         */
> > +        if (release_lock) {
> > +            qemu_mutex_unlock(&rs->bitmap_mutex);
> > +        }
> 
> Shouldn't the unlock/lock move inside the 'if (page_dirty) {' ?

I think we can move into it, but it may not be as optimal as keeping it
as-is.

Consider a case where we've got the bitmap with continous zero bits.
During postcopy, the migration thread could be spinning here with the lock
held even if it doesn't send a thing.  It could still block the other
return path thread on sending urgent pages which may be outside the zero
zones.

> 
> 
> >          /* Check the pages is dirty and if it is send it */
> > -        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> > +        if (page_dirty) {
> >              tmppages = ram_save_target_page(rs, pss);
> > -            if (tmppages < 0) {
> > -                return tmppages;
> > +            if (tmppages >= 0) {
> > +                pages += tmppages;
> > +                /*
> > +                 * Allow rate limiting to happen in the middle of huge pages if
> > +                 * something is sent in the current iteration.
> > +                 */
> > +                if (pagesize_bits > 1 && tmppages > 0) {
> > +                    migration_rate_limit();
> 
> This feels interesting, I know it's no change from before, and it's
> difficult to do here, but it seems odd to hold the lock around the
> sleeping in the rate limit.

Good point.. I think I'll leave it there for this patch because it's
totally irrelevant, but seems proper in the future to do unlocking too for
normal precopy.

Maybe I'll just attach a patch at the end of this series when I repost.
That'll be easier before things got forgotten again.

-- 
Peter Xu


