Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6397E4ACFCB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:29:49 +0100 (CET)
Received: from localhost ([::1]:44482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHHCO-0004jU-Be
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:29:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHHAa-0003d4-G8
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHHAY-0000yX-Gf
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644290872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIe2X9BuZA+O7RrjQb062pQxnrnFHg45dafv2Hym/tk=;
 b=BP+mB9uT7KWgqedCXtXZivS5cRckbMccrkyaLhfp4cD/ThpP8ZpdsQBQtrHy+G3OYaEFRj
 VXUTYkRJig0KndM3W0AMJVtClugaXkPAR3SP8PDOUqMvkNpAIigUQZFRjpV1mqLMXWKhxl
 eJTqv9njEwmYQysM0W24mos/x4rgKHI=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-PafDCk0NNI2n-DaTkTqT_w-1; Mon, 07 Feb 2022 22:27:50 -0500
X-MC-Unique: PafDCk0NNI2n-DaTkTqT_w-1
Received: by mail-pf1-f200.google.com with SMTP id
 o194-20020a62cdcb000000b004c9d2b4bfd8so8697035pfg.7
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FIe2X9BuZA+O7RrjQb062pQxnrnFHg45dafv2Hym/tk=;
 b=qIHl7YhHw+dolfza22Kz1nUvtGUmU/C6FYhZmFD1diXb2i+E/t/BJP7AmKNVJSY1DP
 /AUlQb1MY4LijiEDOhAcOxnvh+iyYhGfPeHtwd7czRVyd/WAMzFZhoWLJXfJsmwFjjj+
 HZIfjYc0++AzNbSMi7X0n01ViYol53OZNX1jzdpixSGi220rnVFpNtu7KV8TTfC8N7g4
 k9a2Ud7CUTJ/xp4pz+Q00CF7+527ZIrzSRuVEj9q9xHGIwNW4Y8pqx2d4p8nyMwU16DZ
 PbGROhcj5kICQcUaXnuaI379QcJiGRQHxA6f/qrS8ii8AVBnp+GY4Bghfu7Ldd1lMoWT
 Pgww==
X-Gm-Message-State: AOAM530IZGlnYHa0rMmBbywFWhRjhe8pA5UzaqpcdjjLavLBIn6jyjxd
 hx3ZmYuNAI9yBwSkAvx3alo2TUAI0s28o4256+ywYFNRLWMIMSQGpOWOYFNpMrFxn5cd5zLer+X
 9eSEZP56qne2bT6w=
X-Received: by 2002:a63:181:: with SMTP id 123mr1936765pgb.546.1644290868681; 
 Mon, 07 Feb 2022 19:27:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpcXCiEdr05ubsjFBhUOwZms4eIY17VThayhD7aByizkTTWj1Fq0px935nhzvb0k80rxJYWw==
X-Received: by 2002:a63:181:: with SMTP id 123mr1936755pgb.546.1644290868231; 
 Mon, 07 Feb 2022 19:27:48 -0800 (PST)
Received: from xz-m1.local ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id t2sm13451766pfj.211.2022.02.07.19.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 19:27:47 -0800 (PST)
Date: Tue, 8 Feb 2022 11:27:43 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 07/15] migration: Introduce postcopy channels on dest
 node
Message-ID: <YgHjL0VqLCAHxdav@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-8-peterx@redhat.com>
 <Yfvv9zYcgJWg+Yy9@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yfvv9zYcgJWg+Yy9@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 03:08:39PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Postcopy handles huge pages in a special way that currently we can only have
> > one "channel" to transfer the page.
> > 
> > It's because when we install pages using UFFDIO_COPY, we need to have the whole
> > huge page ready, it also means we need to have a temp huge page when trying to
> > receive the whole content of the page.
> > 
> > Currently all maintainance around this tmp page is global: firstly we'll
> > allocate a temp huge page, then we maintain its status mostly within
> > ram_load_postcopy().
> > 
> > To enable multiple channels for postcopy, the first thing we need to do is to
> > prepare N temp huge pages as caching, one for each channel.
> > 
> > Meanwhile we need to maintain the tmp huge page status per-channel too.
> > 
> > To give some example, some local variables maintained in ram_load_postcopy()
> > are listed; they are responsible for maintaining temp huge page status:
> > 
> >   - all_zero:     this keeps whether this huge page contains all zeros
> >   - target_pages: this counts how many target pages have been copied
> >   - host_page:    this keeps the host ptr for the page to install
> > 
> > Move all these fields to be together with the temp huge pages to form a new
> > structure called PostcopyTmpPage.  Then for each (future) postcopy channel, we
> > need one structure to keep the state around.
> > 
> > For vanilla postcopy, obviously there's only one channel.  It contains both
> > precopy and postcopy pages.
> > 
> > This patch teaches the dest migration node to start realize the possible number
> > of postcopy channels by introducing the "postcopy_channels" variable.  Its
> > value is calculated when setup postcopy on dest node (during POSTCOPY_LISTEN
> > phase).
> > 
> > Vanilla postcopy will have channels=1, but when postcopy-preempt capability is
> > enabled (in the future), we will boost it to 2 because even during partial
> > sending of a precopy huge page we still want to preempt it and start sending
> > the postcopy requested page right away (so we start to keep two temp huge
> > pages; more if we want to enable multifd).  In this patch there's a TODO marked
> > for that; so far the channels is always set to 1.
> > 
> > We need to send one "host huge page" on one channel only and we cannot split
> > them, because otherwise the data upon the same huge page can locate on more
> > than one channel so we need more complicated logic to manage.  One temp host
> > huge page for each channel will be enough for us for now.
> > 
> > Postcopy will still always use the index=0 huge page even after this patch.
> > However it prepares for the latter patches where it can start to use multiple
> > channels (which needs src intervention, because only src knows which channel we
> > should use).
> 
> Generally OK, some minor nits.
> 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/migration.h    | 35 +++++++++++++++++++++++++++-
> >  migration/postcopy-ram.c | 50 +++++++++++++++++++++++++++++-----------
> >  migration/ram.c          | 43 +++++++++++++++++-----------------
> >  3 files changed, 91 insertions(+), 37 deletions(-)
> > 
> > diff --git a/migration/migration.h b/migration/migration.h
> > index 8130b703eb..8bb2931312 100644
> > --- a/migration/migration.h
> > +++ b/migration/migration.h
> > @@ -45,6 +45,24 @@ struct PostcopyBlocktimeContext;
> >   */
> >  #define CLEAR_BITMAP_SHIFT_MAX            31
> >  
> > +/* This is an abstraction of a "temp huge page" for postcopy's purpose */
> > +typedef struct {
> > +    /*
> > +     * This points to a temporary huge page as a buffer for UFFDIO_COPY.  It's
> > +     * mmap()ed and needs to be freed when cleanup.
> > +     */
> > +    void *tmp_huge_page;
> > +    /*
> > +     * This points to the host page we're going to install for this temp page.
> > +     * It tells us after we've received the whole page, where we should put it.
> > +     */
> > +    void *host_addr;
> > +    /* Number of small pages copied (in size of TARGET_PAGE_SIZE) */
> > +    int target_pages;
> 
> Can we take the opportunity to convert this to an unsigned?

Sure.

> 
> > +    /* Whether this page contains all zeros */
> > +    bool all_zero;
> > +} PostcopyTmpPage;
> > +
> >  /* State for the incoming migration */
> >  struct MigrationIncomingState {
> >      QEMUFile *from_src_file;
> > @@ -81,7 +99,22 @@ struct MigrationIncomingState {
> >      QemuMutex rp_mutex;    /* We send replies from multiple threads */
> >      /* RAMBlock of last request sent to source */
> >      RAMBlock *last_rb;
> > -    void     *postcopy_tmp_page;
> > +    /*
> > +     * Number of postcopy channels including the default precopy channel, so
> > +     * vanilla postcopy will only contain one channel which contain both
> > +     * precopy and postcopy streams.
> > +     *
> > +     * This is calculated when the src requests to enable postcopy but before
> > +     * it starts.  Its value can depend on e.g. whether postcopy preemption is
> > +     * enabled.
> > +     */
> > +    int       postcopy_channels;
> 
> Also unsigned?

OK.

> 
> > +    /*
> > +     * An array of temp host huge pages to be used, one for each postcopy
> > +     * channel.
> > +     */
> > +    PostcopyTmpPage *postcopy_tmp_pages;
> > +    /* This is shared for all postcopy channels */
> >      void     *postcopy_tmp_zero_page;
> >      /* PostCopyFD's for external userfaultfds & handlers of shared memory */
> >      GArray   *postcopy_remote_fds;
> > diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> > index e662dd05cc..d78e1b9373 100644
> > --- a/migration/postcopy-ram.c
> > +++ b/migration/postcopy-ram.c
> > @@ -525,9 +525,18 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
> >  
> >  static void postcopy_temp_pages_cleanup(MigrationIncomingState *mis)
> >  {
> > -    if (mis->postcopy_tmp_page) {
> > -        munmap(mis->postcopy_tmp_page, mis->largest_page_size);
> > -        mis->postcopy_tmp_page = NULL;
> > +    int i;
> > +
> > +    if (mis->postcopy_tmp_pages) {
> > +        for (i = 0; i < mis->postcopy_channels; i++) {
> > +            if (mis->postcopy_tmp_pages[i].tmp_huge_page) {
> > +                munmap(mis->postcopy_tmp_pages[i].tmp_huge_page,
> > +                       mis->largest_page_size);
> > +                mis->postcopy_tmp_pages[i].tmp_huge_page = NULL;
> > +            }
> > +        }
> > +        g_free(mis->postcopy_tmp_pages);
> > +        mis->postcopy_tmp_pages = NULL;
> >      }
> >  
> >      if (mis->postcopy_tmp_zero_page) {
> > @@ -1091,17 +1100,30 @@ retry:
> >  
> >  static int postcopy_temp_pages_setup(MigrationIncomingState *mis)
> >  {
> > -    int err;
> > -
> > -    mis->postcopy_tmp_page = mmap(NULL, mis->largest_page_size,
> > -                                  PROT_READ | PROT_WRITE,
> > -                                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > -    if (mis->postcopy_tmp_page == MAP_FAILED) {
> > -        err = errno;
> > -        mis->postcopy_tmp_page = NULL;
> > -        error_report("%s: Failed to map postcopy_tmp_page %s",
> > -                     __func__, strerror(err));
> > -        return -err;
> > +    PostcopyTmpPage *tmp_page;
> > +    int err, i, channels;
> > +    void *temp_page;
> > +
> > +    /* TODO: will be boosted when enable postcopy preemption */
> > +    mis->postcopy_channels = 1;
> > +
> > +    channels = mis->postcopy_channels;
> > +    mis->postcopy_tmp_pages = g_malloc0(sizeof(PostcopyTmpPage) * channels);
> 
> I noticed we've started using g_malloc0_n in a few places

Sure.

> 
> > +    for (i = 0; i < channels; i++) {
> > +        tmp_page = &mis->postcopy_tmp_pages[i];
> > +        temp_page = mmap(NULL, mis->largest_page_size, PROT_READ | PROT_WRITE,
> > +                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +        if (temp_page == MAP_FAILED) {
> > +            err = errno;
> > +            error_report("%s: Failed to map postcopy_tmp_pages[%d]: %s",
> > +                         __func__, i, strerror(err));
> 
> Please call postcopy_temp_pages_cleanup here to cleanup previous pages
> that were succesfully allocated.

It'll be cleaned up later here:

  loadvm_postcopy_handle_listen
    postcopy_ram_incoming_setup
      postcopy_temp_pages_setup
    postcopy_ram_incoming_cleanup  <---------- if fail above, go here
      postcopy_temp_pages_cleanup

Thanks,

-- 
Peter Xu


