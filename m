Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A204C1B34
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:56:21 +0100 (CET)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMwoG-0000zR-Qx
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMwlU-0006zp-3b
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMwlP-0000jf-NW
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:53:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645642402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RZa1m5PRAN8sDEsfonQPuvQ43N8TAJT/vxQiILKmMcA=;
 b=ens9QzeWQi3TZI8gTcFkuE0yEuGRRz/vxDJIYyZaKyIWuUa5HaTPlVJV1HemutwT2b65TQ
 ZjxE0Ta4m66ohGAZk4ihBZ4n0gr4GPxop8SvWcVCl8F5xDC+kfyRBe8fGl8AgwbU7xtIyG
 YE3l9YWnGMfb0IfzaiQFPWG5DdX/zgY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-9EDpc1qWPoaQ5JsntVZ0jA-1; Wed, 23 Feb 2022 13:53:20 -0500
X-MC-Unique: 9EDpc1qWPoaQ5JsntVZ0jA-1
Received: by mail-wm1-f69.google.com with SMTP id
 q17-20020a1ca711000000b0037be98d03a1so1517201wme.0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 10:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RZa1m5PRAN8sDEsfonQPuvQ43N8TAJT/vxQiILKmMcA=;
 b=a2obCMjbmsXXQa8vqKZ0Kzu/K0/dQOuhvqNsUGlw6hQn4d6Ch3xylCRBSFlPCNY+3V
 OL8udLHotoORrlTJbh76SOenyKQdosh/XZ4EIfaa6RDmFrePBSnPFpgoPeziuXVNaOjE
 nrtH/OO2MrkY80jHdKkDO+96YBsdDlAYhKXyKqs/fe89Gl2aHcZspNEgNAXCSpM3viN9
 p7vkvqk5rgoNDi+jjpHJjouQSO5CMYDz26qenvyEQMrfecf80VIgzGOIS/KZqNGpLXh2
 UnLFTlO8S2iQZ8s4ER3OgE4/mwjLFOq6+0t/YLWzmXICzD7vC2JeUaQGoQyi3uxq2V3J
 c1xg==
X-Gm-Message-State: AOAM533I4+qXVf19luPReifjLmfZY0amyWa2IihdYMaLqLsJS9BaVxkO
 Ayi8Z9Jle0G1NLNphy50UD1avh5VkO37NssHx4cayseFgspZSnT8yY08qBX3wq0aBdVFpWcMc8y
 RM2LibUDvF55/MZc=
X-Received: by 2002:a7b:c3d6:0:b0:380:e3af:7f72 with SMTP id
 t22-20020a7bc3d6000000b00380e3af7f72mr5947410wmj.163.1645642399610; 
 Wed, 23 Feb 2022 10:53:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTetM5maBKElWPfNX5TjMt5QZRC7rPeXw/GmXx2e9/GjchlS7rFnZh1cxZd7nn/P8dtkz+Sg==
X-Received: by 2002:a7b:c3d6:0:b0:380:e3af:7f72 with SMTP id
 t22-20020a7bc3d6000000b00380e3af7f72mr5947393wmj.163.1645642399284; 
 Wed, 23 Feb 2022 10:53:19 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id d1sm350685wmq.8.2022.02.23.10.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 10:53:18 -0800 (PST)
Date: Wed, 23 Feb 2022 18:53:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 19/20] migration: Postcopy recover with preempt enabled
Message-ID: <YhaCndY58Xlt7OFN@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-20-peterx@redhat.com>
 <YhTJuvhEvdxnINPu@work-vm> <YhXmIBwbZoTErHSR@xz-m1.local>
 <YhYDyAf7+khF8Fkv@work-vm> <YhYzN3upm62HEnTm@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YhYzN3upm62HEnTm@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Feb 23, 2022 at 09:52:08AM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > On Tue, Feb 22, 2022 at 11:32:10AM +0000, Dr. David Alan Gilbert wrote:
> > > > * Peter Xu (peterx@redhat.com) wrote:
> > > > > To allow postcopy recovery, the ram fast load (preempt-only) dest QEMU thread
> > > > > needs similar handling on fault tolerance.  When ram_load_postcopy() fails,
> > > > > instead of stopping the thread it halts with a semaphore, preparing to be
> > > > > kicked again when recovery is detected.
> > > > > 
> > > > > A mutex is introduced to make sure there's no concurrent operation upon the
> > > > > socket.  To make it simple, the fast ram load thread will take the mutex during
> > > > > its whole procedure, and only release it if it's paused.  The fast-path socket
> > > > > will be properly released by the main loading thread safely when there's
> > > > > network failures during postcopy with that mutex held.
> > > > 
> > > > I *think* this is mostly OK; but I worry I don't understand all the
> > > > cases; e.g.
> > > >   a) If the postcopy channel errors first
> > > >   b) If the main channel errors first
> > > 
> > > Ah right, I don't think I handled all the cases.  Sorry.
> > > 
> > > We always check the main channel, but if the postcopy channel got faulted,
> > > we may not fall into paused mode as expected.
> > > 
> > > I'll fix that up.
> > 
> > Thanks.
> > 
> > > > 
> > > > Can you add some docs to walk through those and explain the locking ?
> > > 
> > > Sure.
> > > 
> > > The sem is mentioned in the last sentence of paragraph 1, where it's purely
> > > used for a way to yield the fast ram load thread so that when something
> > > wrong happens it can sleep on that semaphore.  Then when we recover we'll
> > > post to the semaphore to kick it up.  We used it like that in many places,
> > > e.g. postcopy_pause_sem_dst to yield the main load thread.
> > > 
> > > The 2nd paragraph above was for explaining why we need the mutex; it's
> > > basically the same as rp_mutex protecting to_src_file, so that we won't
> > > accidentally close() the qemufile during some other thread using it.  So
> > > the fast ram load thread needs to take that new mutex for mostly the whole
> > > lifecycle of itself (because it's loading from that qemufile), meanwhile
> > > only drop the mutex when it prepares to sleep.  Then the main load thread
> > > can recycle the postcopy channel using qemu_fclose() safely.
> > 
> > Yes, that feels like it needs to go in the code somewhere.
> 
> Sure, I'll further squash below comment update into the same patch.  I
> reworded some places but mostly it should be telling the same thing:
> 
> ---8<---
> diff --git a/migration/migration.h b/migration/migration.h
> index 945088064a..91f845e9e4 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -118,7 +118,17 @@ struct MigrationIncomingState {
>      /* Postcopy priority thread is used to receive postcopy requested pages */
>      QemuThread postcopy_prio_thread;
>      bool postcopy_prio_thread_created;
> -    /* Used to sync with the prio thread */
> +    /*
> +     * Used to sync between the ram load main thread and the fast ram load
> +     * thread.  It protects postcopy_qemufile_dst, which is the postcopy
> +     * fast channel.
> +     *
> +     * The ram fast load thread will take it mostly for the whole lifecycle
> +     * because it needs to continuously read data from the channel, and
> +     * it'll only release this mutex if postcopy is interrupted, so that
> +     * the ram load main thread will take this mutex over and properly
> +     * release the broken channel.
> +     */
>      QemuMutex postcopy_prio_thread_mutex;
>      /*
>       * An array of temp host huge pages to be used, one for each postcopy
> @@ -149,6 +159,12 @@ struct MigrationIncomingState {
>      /* notify PAUSED postcopy incoming migrations to try to continue */
>      QemuSemaphore postcopy_pause_sem_dst;
>      QemuSemaphore postcopy_pause_sem_fault;
> +    /*
> +     * This semaphore is used to allow the ram fast load thread (only when
> +     * postcopy preempt is enabled) fall into sleep when there's network
> +     * interruption detected.  When the recovery is done, the main load
> +     * thread will kick the fast ram load thread using this semaphore.
> +     */
>      QemuSemaphore postcopy_pause_sem_fast_load;

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  
>      /* List of listening socket addresses  */
> ---8<---
> 
> > 
> > > [...]
> > > 
> > > > > @@ -3466,6 +3468,17 @@ static MigThrError postcopy_pause(MigrationState *s)
> > > > >          qemu_file_shutdown(file);
> > > > >          qemu_fclose(file);
> > > > >  
> > > > > +        /*
> > > > > +         * Do the same to postcopy fast path socket too if there is.  No
> > > > > +         * locking needed because no racer as long as we do this before setting
> > > > > +         * status to paused.
> > > > > +         */
> > > > > +        if (s->postcopy_qemufile_src) {
> > > > > +            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
> > > > 
> > > > Shouldn't this do a qemu_file_shutdown on here first?
> > > 
> > > Yes I probably should.
> > > 
> > > With all above, I plan to squash below changes into this patch:
> > > 
> > > ---8<---
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index c68a281406..69778cab23 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -3475,6 +3475,7 @@ static MigThrError postcopy_pause(MigrationState *s)
> > >           */
> > >          if (s->postcopy_qemufile_src) {
> > >              migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
> > > +            qemu_file_shutdown(s->postcopy_qemufile_src);
> > >              qemu_fclose(s->postcopy_qemufile_src);
> > >              s->postcopy_qemufile_src = NULL;
> > >          }
> > > @@ -3534,8 +3535,13 @@ static MigThrError migration_detect_error(MigrationState *s)
> > >          return MIG_THR_ERR_FATAL;
> > >      }
> > > 
> > > -    /* Try to detect any file errors */
> > > -    ret = qemu_file_get_error_obj(s->to_dst_file, &local_error);
> > > +    /*
> > > +     * Try to detect any file errors.  Note that postcopy_qemufile_src will
> > > +     * be NULL when postcopy preempt is not enabled.
> > > +     */
> > > +    ret = qemu_file_get_error_obj_any(s->to_dst_file,
> > > +                                      s->postcopy_qemufile_src,
> > > +                                      &local_error);
> > >      if (!ret) {
> > >          /* Everything is fine */
> > >          assert(!local_error);
> > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > > index 1479cddad9..397652f0ba 100644
> > > --- a/migration/qemu-file.c
> > > +++ b/migration/qemu-file.c
> > > @@ -139,6 +139,33 @@ int qemu_file_get_error_obj(QEMUFile *f, Error **errp)
> > >      return f->last_error;
> > >  }
> > > 
> > > +/*
> > > + * Get last error for either stream f1 or f2 with optional Error*.
> > > + * The error returned (non-zero) can be either from f1 or f2.
> > > + *
> > > + * If any of the qemufile* is NULL, then skip the check on that file.
> > > + *
> > > + * When there is no error on both qemufile, zero is returned.
> > > + */
> > > +int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp)
> > > +{
> > > +    int ret = 0;
> > > +
> > > +    if (f1) {
> > > +        ret = qemu_file_get_error_obj(f1, errp);
> > > +        /* If there's already error detected, return */
> > > +        if (ret) {
> > > +            return ret;
> > > +        }
> > > +    }
> > > +
> > > +    if (f2) {
> > > +        ret = qemu_file_get_error_obj(f2, errp);
> > > +    }
> > > +
> > > +    return ret;
> > > +}
> > > +
> > >  /*
> > >   * Set the last error for stream f with optional Error*
> > >   */
> > > diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> > > index 3f36d4dc8c..2564e5e1c7 100644
> > > --- a/migration/qemu-file.h
> > > +++ b/migration/qemu-file.h
> > > @@ -156,6 +156,7 @@ void qemu_file_update_transfer(QEMUFile *f, int64_t len);
> > >  void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
> > >  int64_t qemu_file_get_rate_limit(QEMUFile *f);
> > >  int qemu_file_get_error_obj(QEMUFile *f, Error **errp);
> > > +int qemu_file_get_error_obj_any(QEMUFile *f1, QEMUFile *f2, Error **errp);
> > >  void qemu_file_set_error_obj(QEMUFile *f, int ret, Error *err);
> > >  void qemu_file_set_error(QEMUFile *f, int ret);
> > >  int qemu_file_shutdown(QEMUFile *f);
> > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > index 2d32340d28..24b69a1008 100644
> > > --- a/migration/savevm.c
> > > +++ b/migration/savevm.c
> > > @@ -2651,8 +2651,8 @@ retry:
> > >      while (true) {
> > >          section_type = qemu_get_byte(f);
> > > 
> > > -        if (qemu_file_get_error(f)) {
> > > -            ret = qemu_file_get_error(f);
> > > +        ret = qemu_file_get_error_obj_any(f, mis->postcopy_qemufile_dst, NULL);
> > > +        if (ret) {
> > >              break;
> > >          }
> > > ---8<---
> > > 
> > > Does it look sane?  Let me know if there's still things missing.
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Thanks!
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


