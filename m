Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E35F6D8E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:33:02 +0200 (CEST)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVg5-0003hW-QA
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogV79-0007Fu-Ml
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:56:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogV77-0005bH-7Z
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665079012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXkt6oFeyafnx7ZPneX+A1oH/wQ0cAqJEc5xvQymSuE=;
 b=P+cdLLT3BMbmGJ32eGp9NUcdo8fCiPcJLzio78QqtTWANG4JIVGAgLq2ZKap+oqqSPjqMJ
 Ss43XMdsrd6I4cFZHNl68ScFTm1Dw5TT1RNPEsFFshHeHG54VB5dVhZLSuOCVgYYd54Ui/
 oZyRz7tO/uPe4T5eGXvbSeyQMpl/EpM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-r0zu3ORJO2ezh2hMBqhYFA-1; Thu, 06 Oct 2022 13:56:51 -0400
X-MC-Unique: r0zu3ORJO2ezh2hMBqhYFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso826183wmh.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 10:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bXkt6oFeyafnx7ZPneX+A1oH/wQ0cAqJEc5xvQymSuE=;
 b=fthuOuRyT0uI1E+NvYv32KS5wi4X27YclOFAnKUjQmNP8PU+CoVe9SzqcMr68IZeNI
 noZb88j7Uz31lsMmmuLC9meRgw3XW7WUtbmPRciwYBqIUuGKHU+3VyKk9/xO0sLyYgVV
 LX9+CFpiKgWkHzAF4xv1FrpQBK6g/F5ES67rwJvehz75jeuEasaACG5DkRnJIA1vNg35
 mf1zxJ1o3Gc6MdYAQJHIn4UnHbE3TuJvu67i1wEPV7XX2NgsfdTxmNq0yc538qZ172Kh
 GZgfFEHM4JVFsDiYceCjeb0i7FZ/o6GhgTd267Zw1Y0rPCyMOy9yyFqj8j9WhvcCcMxY
 TwiA==
X-Gm-Message-State: ACrzQf26yb/LLnKLT3fOdsOS/se0s9ATdrgBn9MCqSrwK3N5PTKVULRl
 3HG26xw/g4M+OxdfheYaa1czYVRT31Vo3H94/+Uv2/KDE3zCWwsI7bSQNly8mL99B5CMAOF8W1C
 7wExnLTVlP0M/wLE=
X-Received: by 2002:adf:ecc9:0:b0:22e:2e94:bdef with SMTP id
 s9-20020adfecc9000000b0022e2e94bdefmr725586wro.689.1665079009914; 
 Thu, 06 Oct 2022 10:56:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VDlDp1ZHrsMzhtfXi3439+LSfvrA0gVJ1jfyJu4vGlPeLX3l0IrLSwmqppvG3t1b3144ApQ==
X-Received: by 2002:adf:ecc9:0:b0:22e:2e94:bdef with SMTP id
 s9-20020adfecc9000000b0022e2e94bdefmr725568wro.689.1665079009651; 
 Thu, 06 Oct 2022 10:56:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 c66-20020a1c3545000000b003bdb2c7f3d1sm5844057wma.32.2022.10.06.10.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 10:56:49 -0700 (PDT)
Date: Thu, 6 Oct 2022 18:56:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 13/14] migration: Remove old preempt code around state
 maintainance
Message-ID: <Yz8W38K9iyd1Uz8M@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225227.49158-1-peterx@redhat.com>
 <YypfGODnHAc8oJsW@xz-m1.local> <YysXn4YwarhEvBC3@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YysXn4YwarhEvBC3@xz-m1.local>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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

For the set of 3:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

* Peter Xu (peterx@redhat.com) wrote:
> On Tue, Sep 20, 2022 at 08:47:20PM -0400, Peter Xu wrote:
> > On Tue, Sep 20, 2022 at 06:52:27PM -0400, Peter Xu wrote:
> > > With the new code to send pages in rp-return thread, there's little help to
> > > keep lots of the old code on maintaining the preempt state in migration
> > > thread, because the new way should always be faster..
> > > 
> > > Then if we'll always send pages in the rp-return thread anyway, we don't
> > > need those logic to maintain preempt state anymore because now we serialize
> > > things using the mutex directly instead of using those fields.
> > > 
> > > It's very unfortunate to have those code for a short period, but that's
> > > still one intermediate step that we noticed the next bottleneck on the
> > > migration thread.  Now what we can do best is to drop unnecessary code as
> > > long as the new code is stable to reduce the burden.  It's actually a good
> > > thing because the new "sending page in rp-return thread" model is (IMHO)
> > > even cleaner and with better performance.
> > > 
> > > Remove the old code that was responsible for maintaining preempt states, at
> > > the meantime also remove x-postcopy-preempt-break-huge parameter because
> > > with concurrent sender threads we don't really need to break-huge anymore.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  migration/migration.c |   2 -
> > >  migration/ram.c       | 258 +-----------------------------------------
> > >  2 files changed, 3 insertions(+), 257 deletions(-)
> > > 
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index fae8fd378b..698fd94591 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -4399,8 +4399,6 @@ static Property migration_properties[] = {
> > >      DEFINE_PROP_SIZE("announce-step", MigrationState,
> > >                        parameters.announce_step,
> > >                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
> > > -    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
> > > -                      postcopy_preempt_break_huge, true),
> > 
> > Forgot to drop the variable altogether:
> > 
> > diff --git a/migration/migration.h b/migration/migration.h
> > index cdad8aceaa..ae4ffd3454 100644
> > --- a/migration/migration.h
> > +++ b/migration/migration.h
> > @@ -340,13 +340,6 @@ struct MigrationState {
> >      bool send_configuration;
> >      /* Whether we send section footer during migration */
> >      bool send_section_footer;
> > -    /*
> > -     * Whether we allow break sending huge pages when postcopy preempt is
> > -     * enabled.  When disabled, we won't interrupt precopy within sending a
> > -     * host huge page, which is the old behavior of vanilla postcopy.
> > -     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
> > -     */
> > -    bool postcopy_preempt_break_huge;
> >  
> >      /* Needed by postcopy-pause state */
> >      QemuSemaphore postcopy_pause_sem;
> > 
> > Will squash this in in next version.
> 
> Two more varialbes to drop, as attached..
> 
> 
> -- 
> Peter Xu

> From b3308e34398e21c19bd36ec21aae9c7f9f623d75 Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Wed, 21 Sep 2022 09:51:55 -0400
> Subject: [PATCH] fixup! migration: Remove old preempt code around state
>  maintainance
> Content-type: text/plain
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/ram.c | 33 ---------------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 03bf2324ab..2599eee070 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -97,28 +97,6 @@ struct PageSearchStatus {
>      unsigned long page;
>      /* Set once we wrap around */
>      bool         complete_round;
> -    /*
> -     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
> -     * postcopy.  When set, the request is "urgent" because the dest QEMU
> -     * threads are waiting for us.
> -     */
> -    bool         postcopy_requested;
> -    /*
> -     * [POSTCOPY-ONLY] The target channel to use to send current page.
> -     *
> -     * Note: This may _not_ match with the value in postcopy_requested
> -     * above. Let's imagine the case where the postcopy request is exactly
> -     * the page that we're sending in progress during precopy. In this case
> -     * we'll have postcopy_requested set to true but the target channel
> -     * will be the precopy channel (so that we don't split brain on that
> -     * specific page since the precopy channel already contains partial of
> -     * that page data).
> -     *
> -     * Besides that specific use case, postcopy_target_channel should
> -     * always be equal to postcopy_requested, because by default we send
> -     * postcopy pages via postcopy preempt channel.
> -     */
> -    bool         postcopy_target_channel;
>      /* Whether we're sending a host page */
>      bool          host_page_sending;
>      /* The start/end of current host page.  Invalid if host_page_sending==false */
> @@ -1573,13 +1551,6 @@ retry:
>   */
>  static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>  {
> -    /*
> -     * This is not a postcopy requested page, mark it "not urgent", and use
> -     * precopy channel to send it.
> -     */
> -    pss->postcopy_requested = false;
> -    pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
> -
>      /* Update pss->page for the next dirty bit in ramblock */
>      pss_find_next_dirty(pss);
>  
> @@ -2091,9 +2062,6 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>           * really rare.
>           */
>          pss->complete_round = false;
> -        /* Mark it an urgent request, meanwhile using POSTCOPY channel */
> -        pss->postcopy_requested = true;
> -        pss->postcopy_target_channel = RAM_CHANNEL_POSTCOPY;
>      }
>  
>      return !!block;
> @@ -2190,7 +2158,6 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
>           * we should be the only one who operates on the qemufile
>           */
>          pss->pss_channel = migrate_get_current()->postcopy_qemufile_src;
> -        pss->postcopy_requested = true;
>          assert(pss->pss_channel);
>  
>          /*
> -- 
> 2.32.0
> 

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


