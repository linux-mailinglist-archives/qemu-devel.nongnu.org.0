Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1EB5254AC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:23:29 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDTD-0006bo-Nv
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npCj8-00029I-6j
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npCj5-0006ex-90
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZwF0RYzESP/DjA26q986qTdg/5FlT6tTnJLxuExewKk=;
 b=FxZCSOLh2JGPB+SYWctbZ2b6O9CD6SxNSO92YHuWu/3wyQXI+Yaxj4dDz+MR5DerJlKhRF
 +QcFKG1N3aWEIGyKSbzWCVm1UcpBFFpMtpto0h+8E7+WSqK99i2syaww7UeaPVZc/yDR72
 VPZcTXs/gO6Bl7ssSQ3DApuNhX1hgz8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-55fg4VT4OdanLK813JUbnA-1; Thu, 12 May 2022 13:35:44 -0400
X-MC-Unique: 55fg4VT4OdanLK813JUbnA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i18-20020a1c5412000000b0039491a8298cso1936346wmb.5
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZwF0RYzESP/DjA26q986qTdg/5FlT6tTnJLxuExewKk=;
 b=A65m3tB4xvfGcOh0rYh0gF238GMGMjQY7h5EvtscydEPeL3JkuSBuEJ0uQbZxyZIBm
 vSOHt6JCABLidAVoMWgCfNoGgO0yDEc7H45rrWg+cQmISLuBUAW8vs8Fowf6DxH3hf7m
 N4cjqvq59aOiuxBYCzW3qkltyw00A3sV7GiYuoGizdhphguDeDscV6t2zeZtwekdltod
 clySkbu137gYUXfG3xxklKq5QDJZTgQqxIggdpKXcRtgvrqPW2WSjapH9pyzc8EBHC+8
 qj4KEDxBrMieZryG0GZ2DpFJ91zU2Z0wCWmiBf8Ofshn8zp3XsedIcb6vuIHfM8hB4RX
 dG2Q==
X-Gm-Message-State: AOAM532GWWPsJeY+BaDtbYlQYaqNBp0AlJ85rmhm5FDRqe6o6Eb1WxAH
 omltHKIhMglgJ2vXRBPeCluDz8TeDAp7E7UYLnj78534FgyRd1eEPaX7ln98BCjlA2CtOICgB3q
 CduyFpjPOCFZ8QGE=
X-Received: by 2002:a7b:c114:0:b0:394:47d3:693f with SMTP id
 w20-20020a7bc114000000b0039447d3693fmr11711852wmi.42.1652376943671; 
 Thu, 12 May 2022 10:35:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTU3/Y9bqziP/eYwdfOpCC5upUU32qa4q3fkl2dsLsAlsVduoFm4xb0oFV+OLfoEf/R2m62A==
X-Received: by 2002:a7b:c114:0:b0:394:47d3:693f with SMTP id
 w20-20020a7bc114000000b0039447d3693fmr11711833wmi.42.1652376943306; 
 Thu, 12 May 2022 10:35:43 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x13-20020a7bc20d000000b0039429bfebebsm3339364wmi.3.2022.05.12.10.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:35:42 -0700 (PDT)
Date: Thu, 12 May 2022 18:35:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v5 14/21] migration: Create the postcopy preempt channel
 asynchronously
Message-ID: <Yn1FbGSEq2kHrKna@work-vm>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-15-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425233847.10393-15-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> This patch allows the postcopy preempt channel to be created
> asynchronously.  The benefit is that when the connection is slow, we won't
> take the BQL (and potentially block all things like QMP) for a long time
> without releasing.
> 
> A function postcopy_preempt_wait_channel() is introduced, allowing the
> migration thread to be able to wait on the channel creation.  The channel
> is always created by the main thread, in which we'll kick a new semaphore
> to tell the migration thread that the channel has created.
> 
> We'll need to wait for the new channel in two places: (1) when there's a
> new postcopy migration that is starting, or (2) when there's a postcopy
> migration to resume.
> 
> For the start of migration, we don't need to wait for this channel until
> when we want to start postcopy, aka, postcopy_start().  We'll fail the
> migration if we found that the channel creation failed (which should
> probably not happen at all in 99% of the cases, because the main channel is
> using the same network topology).
> 
> For a postcopy recovery, we'll need to wait in postcopy_pause().  In that
> case if the channel creation failed, we can't fail the migration or we'll
> crash the VM, instead we keep in PAUSED state, waiting for yet another
> recovery.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c    | 16 ++++++++++++
>  migration/migration.h    |  7 +++++
>  migration/postcopy-ram.c | 56 +++++++++++++++++++++++++++++++---------
>  migration/postcopy-ram.h |  1 +
>  4 files changed, 68 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index a0db5de685..cce741e20e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3020,6 +3020,12 @@ static int postcopy_start(MigrationState *ms)
>      int64_t bandwidth = migrate_max_postcopy_bandwidth();
>      bool restart_block = false;
>      int cur_state = MIGRATION_STATUS_ACTIVE;
> +
> +    if (postcopy_preempt_wait_channel(ms)) {
> +        migrate_set_state(&ms->state, ms->state, MIGRATION_STATUS_FAILED);
> +        return -1;
> +    }
> +
>      if (!migrate_pause_before_switchover()) {
>          migrate_set_state(&ms->state, MIGRATION_STATUS_ACTIVE,
>                            MIGRATION_STATUS_POSTCOPY_ACTIVE);
> @@ -3501,6 +3507,14 @@ static MigThrError postcopy_pause(MigrationState *s)
>          if (s->state == MIGRATION_STATUS_POSTCOPY_RECOVER) {
>              /* Woken up by a recover procedure. Give it a shot */
>  
> +            if (postcopy_preempt_wait_channel(s)) {
> +                /*
> +                 * Preempt enabled, and new channel create failed; loop
> +                 * back to wait for another recovery.
> +                 */
> +                continue;
> +            }
> +
>              /*
>               * Firstly, let's wake up the return path now, with a new
>               * return path channel.
> @@ -4360,6 +4374,7 @@ static void migration_instance_finalize(Object *obj)
>      qemu_sem_destroy(&ms->postcopy_pause_sem);
>      qemu_sem_destroy(&ms->postcopy_pause_rp_sem);
>      qemu_sem_destroy(&ms->rp_state.rp_sem);
> +    qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
>      error_free(ms->error);
>  }
>  
> @@ -4406,6 +4421,7 @@ static void migration_instance_init(Object *obj)
>      qemu_sem_init(&ms->rp_state.rp_sem, 0);
>      qemu_sem_init(&ms->rate_limit_sem, 0);
>      qemu_sem_init(&ms->wait_unplug_sem, 0);
> +    qemu_sem_init(&ms->postcopy_qemufile_src_sem, 0);
>      qemu_mutex_init(&ms->qemu_file_lock);
>  }
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index 91f845e9e4..f898b8547a 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -219,6 +219,13 @@ struct MigrationState {
>      QEMUFile *to_dst_file;
>      /* Postcopy specific transfer channel */
>      QEMUFile *postcopy_qemufile_src;
> +    /*
> +     * It is posted when the preempt channel is established.  Note: this is
> +     * used for both the start or recover of a postcopy migration.  We'll
> +     * post to this sem every time a new preempt channel is created in the
> +     * main thread, and we keep post() and wait() in pair.
> +     */
> +    QemuSemaphore postcopy_qemufile_src_sem;
>      QIOChannelBuffer *bioc;
>      /*
>       * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b3c81b46f6..1bb603051a 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1552,10 +1552,50 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>      return true;
>  }
>  
> -int postcopy_preempt_setup(MigrationState *s, Error **errp)
> +static void
> +postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
>  {
> -    QIOChannel *ioc;
> +    MigrationState *s = opaque;
> +    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
> +    Error *local_err = NULL;
> +
> +    if (qio_task_propagate_error(task, &local_err)) {
> +        /* Something wrong happened.. */
> +        migrate_set_error(s, local_err);
> +        error_free(local_err);
> +    } else {
> +        migration_ioc_register_yank(ioc);
> +        s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
> +        trace_postcopy_preempt_new_channel();
> +    }
> +
> +    /*
> +     * Kick the waiter in all cases.  The waiter should check upon
> +     * postcopy_qemufile_src to know whether it failed or not.
> +     */
> +    qemu_sem_post(&s->postcopy_qemufile_src_sem);
> +    object_unref(OBJECT(ioc));
> +}
>  
> +/* Returns 0 if channel established, -1 for error. */
> +int postcopy_preempt_wait_channel(MigrationState *s)
> +{
> +    /* If preempt not enabled, no need to wait */
> +    if (!migrate_postcopy_preempt()) {
> +        return 0;
> +    }
> +
> +    /*
> +     * We need the postcopy preempt channel to be established before
> +     * starting doing anything.
> +     */
> +    qemu_sem_wait(&s->postcopy_qemufile_src_sem);
> +
> +    return s->postcopy_qemufile_src ? 0 : -1;
> +}
> +
> +int postcopy_preempt_setup(MigrationState *s, Error **errp)
> +{
>      if (!migrate_postcopy_preempt()) {
>          return 0;
>      }
> @@ -1566,16 +1606,8 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
>          return -1;
>      }
>  
> -    ioc = socket_send_channel_create_sync(errp);
> -
> -    if (ioc == NULL) {
> -        return -1;
> -    }
> -
> -    migration_ioc_register_yank(ioc);
> -    s->postcopy_qemufile_src = qemu_fopen_channel_output(ioc);
> -
> -    trace_postcopy_preempt_new_channel();
> +    /* Kick an async task to connect */
> +    socket_send_channel_create(postcopy_preempt_send_channel_new, s);
>  
>      return 0;
>  }
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 34b1080cde..6147bf7d1d 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -192,5 +192,6 @@ enum PostcopyChannels {
>  
>  bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
>  int postcopy_preempt_setup(MigrationState *s, Error **errp);
> +int postcopy_preempt_wait_channel(MigrationState *s);
>  
>  #endif
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


