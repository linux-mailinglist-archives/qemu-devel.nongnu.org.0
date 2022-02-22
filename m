Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A7E4BF74A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 12:34:40 +0100 (CET)
Received: from localhost ([::1]:54506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMTRH-0004EQ-KE
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 06:34:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMTP2-0003UM-2x
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:32:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMTOz-00011L-H5
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645529536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2iIT98npAuxytjZA9j77ZtZLSIkV7TOH49wlkU/Tt4E=;
 b=dHAycjLllRATKu61FeqXcoCU8tD6zXMrc+ob3CznAWrWqItZ5P8+V7ee1EU6GtIIO9/wnl
 cYdpVZ6T6xhPPcCUVabSfzS43491oS8Bar+oJy0+qjBSwR0Bf1XZOSh4eCl+3xJj4GlSh+
 VtEzCJDA6NvHu6mvy6VnRbboS05AFrY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-wKROoTi6Na2i0dGlveCcpQ-1; Tue, 22 Feb 2022 06:32:15 -0500
X-MC-Unique: wKROoTi6Na2i0dGlveCcpQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i188-20020a1c3bc5000000b0037bb9f6feeeso735514wma.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 03:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2iIT98npAuxytjZA9j77ZtZLSIkV7TOH49wlkU/Tt4E=;
 b=O6EwbzkZyF5Ux/xVk34LNTf4XJNTLkRSCMlx66wmNmEAXcJ4regDw6hi1k5ompbYhP
 B5lnXZVpAvIz0fN8Ru7FOH7wpRFKJQHQ9HunZANmroSJVckWxV1s+XO1aXe+XGyo9qWM
 QOjVCKXJzA6bg0Nt0T/r5FIOHZrSFavgdKTVHSWDt3MWOSRWz6RoTZt22SXC26V3n0+a
 xbP5z5/3cSN/Ni2rhZKn3nC8HdmdDHRzmSOYhTLwFaF+7MYqMPBcCCBlwj/0JTspSh7u
 U8+oFjqtTWTV09TloTgHkHMDRBZIZQag2W5JGLViA496/CDTA1Oq3soEyezDFaYmNF+m
 7aaw==
X-Gm-Message-State: AOAM5328JAjxJrKPFJJu0Kz766RSVUytECf+VYfTw8lAhsfmZCBsOLda
 fNozV559YnAkA2kzpbGzngbHLpBG6Zx9W0MqWXKmfpF6MiXzTX0zmNwBksytp5lylaTbDXQNOlI
 gIH1/yQoBijsI9vc=
X-Received: by 2002:a05:6000:1684:b0:1ea:8af9:e5bb with SMTP id
 y4-20020a056000168400b001ea8af9e5bbmr2349733wrd.683.1645529533950; 
 Tue, 22 Feb 2022 03:32:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvFCu/pvK/yBKi2uA5aknvE0otaUbofJOm4qsEwc+AuUOA6FN0uHwi/spNUUgmXF/nUDV2iQ==
X-Received: by 2002:a05:6000:1684:b0:1ea:8af9:e5bb with SMTP id
 y4-20020a056000168400b001ea8af9e5bbmr2349713wrd.683.1645529533658; 
 Tue, 22 Feb 2022 03:32:13 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b0037bea2f9775sm2286073wmq.25.2022.02.22.03.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:32:12 -0800 (PST)
Date: Tue, 22 Feb 2022 11:32:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 19/20] migration: Postcopy recover with preempt enabled
Message-ID: <YhTJuvhEvdxnINPu@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-20-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-20-peterx@redhat.com>
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
> To allow postcopy recovery, the ram fast load (preempt-only) dest QEMU thread
> needs similar handling on fault tolerance.  When ram_load_postcopy() fails,
> instead of stopping the thread it halts with a semaphore, preparing to be
> kicked again when recovery is detected.
> 
> A mutex is introduced to make sure there's no concurrent operation upon the
> socket.  To make it simple, the fast ram load thread will take the mutex during
> its whole procedure, and only release it if it's paused.  The fast-path socket
> will be properly released by the main loading thread safely when there's
> network failures during postcopy with that mutex held.

I *think* this is mostly OK; but I worry I don't understand all the
cases; e.g.
  a) If the postcopy channel errors first
  b) If the main channel errors first

Can you add some docs to walk through those and explain the locking ?

Dave

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c    | 17 +++++++++++++++--
>  migration/migration.h    |  3 +++
>  migration/postcopy-ram.c | 24 ++++++++++++++++++++++--
>  migration/savevm.c       | 17 +++++++++++++++++
>  migration/trace-events   |  2 ++
>  5 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index d20db04097..c68a281406 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -215,9 +215,11 @@ void migration_object_init(void)
>      current_incoming->postcopy_remote_fds =
>          g_array_new(FALSE, TRUE, sizeof(struct PostCopyFD));
>      qemu_mutex_init(&current_incoming->rp_mutex);
> +    qemu_mutex_init(&current_incoming->postcopy_prio_thread_mutex);
>      qemu_event_init(&current_incoming->main_thread_load_event, false);
>      qemu_sem_init(&current_incoming->postcopy_pause_sem_dst, 0);
>      qemu_sem_init(&current_incoming->postcopy_pause_sem_fault, 0);
> +    qemu_sem_init(&current_incoming->postcopy_pause_sem_fast_load, 0);
>      qemu_mutex_init(&current_incoming->page_request_mutex);
>      current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
>  
> @@ -697,9 +699,9 @@ static bool postcopy_try_recover(void)
>  
>          /*
>           * Here, we only wake up the main loading thread (while the
> -         * fault thread will still be waiting), so that we can receive
> +         * rest threads will still be waiting), so that we can receive
>           * commands from source now, and answer it if needed. The
> -         * fault thread will be woken up afterwards until we are sure
> +         * rest threads will be woken up afterwards until we are sure
>           * that source is ready to reply to page requests.
>           */
>          qemu_sem_post(&mis->postcopy_pause_sem_dst);
> @@ -3466,6 +3468,17 @@ static MigThrError postcopy_pause(MigrationState *s)
>          qemu_file_shutdown(file);
>          qemu_fclose(file);
>  
> +        /*
> +         * Do the same to postcopy fast path socket too if there is.  No
> +         * locking needed because no racer as long as we do this before setting
> +         * status to paused.
> +         */
> +        if (s->postcopy_qemufile_src) {
> +            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);

Shouldn't this do a qemu_file_shutdown on here first?

> +            qemu_fclose(s->postcopy_qemufile_src);
> +            s->postcopy_qemufile_src = NULL;
> +        }
> +
>          migrate_set_state(&s->state, s->state,
>                            MIGRATION_STATUS_POSTCOPY_PAUSED);
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index b8aacfe3af..945088064a 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -118,6 +118,8 @@ struct MigrationIncomingState {
>      /* Postcopy priority thread is used to receive postcopy requested pages */
>      QemuThread postcopy_prio_thread;
>      bool postcopy_prio_thread_created;
> +    /* Used to sync with the prio thread */
> +    QemuMutex postcopy_prio_thread_mutex;
>      /*
>       * An array of temp host huge pages to be used, one for each postcopy
>       * channel.
> @@ -147,6 +149,7 @@ struct MigrationIncomingState {
>      /* notify PAUSED postcopy incoming migrations to try to continue */
>      QemuSemaphore postcopy_pause_sem_dst;
>      QemuSemaphore postcopy_pause_sem_fault;
> +    QemuSemaphore postcopy_pause_sem_fast_load;
>  
>      /* List of listening socket addresses  */
>      SocketAddressList *socket_address_list;
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 30eddaacd1..b3d23804bc 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1575,6 +1575,15 @@ int postcopy_preempt_setup(MigrationState *s, Error **errp)
>      return 0;
>  }
>  
> +static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
> +{
> +    trace_postcopy_pause_fast_load();
> +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
> +    qemu_sem_wait(&mis->postcopy_pause_sem_fast_load);
> +    qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
> +    trace_postcopy_pause_fast_load_continued();
> +}
> +
>  void *postcopy_preempt_thread(void *opaque)
>  {
>      MigrationIncomingState *mis = opaque;
> @@ -1587,11 +1596,22 @@ void *postcopy_preempt_thread(void *opaque)
>      qemu_sem_post(&mis->thread_sync_sem);
>  
>      /* Sending RAM_SAVE_FLAG_EOS to terminate this thread */
> -    ret = ram_load_postcopy(mis->postcopy_qemufile_dst, RAM_CHANNEL_POSTCOPY);
> +    qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
> +    while (1) {
> +        ret = ram_load_postcopy(mis->postcopy_qemufile_dst, RAM_CHANNEL_POSTCOPY);
> +        /* If error happened, go into recovery routine */
> +        if (ret) {
> +            postcopy_pause_ram_fast_load(mis);
> +        } else {
> +            /* We're done */
> +            break;
> +        }
> +    }
> +    qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
>  
>      rcu_unregister_thread();
>  
>      trace_postcopy_preempt_thread_exit();
>  
> -    return ret == 0 ? NULL : (void *)-1;
> +    return NULL;
>  }
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 254aa78234..2d32340d28 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2152,6 +2152,13 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
>       */
>      qemu_sem_post(&mis->postcopy_pause_sem_fault);
>  
> +    if (migrate_postcopy_preempt()) {
> +        /* The channel should already be setup again; make sure of it */
> +        assert(mis->postcopy_qemufile_dst);
> +        /* Kick the fast ram load thread too */
> +        qemu_sem_post(&mis->postcopy_pause_sem_fast_load);
> +    }
> +
>      return 0;
>  }
>  
> @@ -2607,6 +2614,16 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
>      mis->to_src_file = NULL;
>      qemu_mutex_unlock(&mis->rp_mutex);
>  
> +    if (mis->postcopy_qemufile_dst) {
> +        qemu_file_shutdown(mis->postcopy_qemufile_dst);
> +        /* Take the mutex to make sure the fast ram load thread halted */
> +        qemu_mutex_lock(&mis->postcopy_prio_thread_mutex);
> +        migration_ioc_unregister_yank_from_file(mis->postcopy_qemufile_dst);
> +        qemu_fclose(mis->postcopy_qemufile_dst);
> +        mis->postcopy_qemufile_dst = NULL;
> +        qemu_mutex_unlock(&mis->postcopy_prio_thread_mutex);
> +    }
> +
>      migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>                        MIGRATION_STATUS_POSTCOPY_PAUSED);
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index b1155d9da0..dfe36a3340 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -270,6 +270,8 @@ mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, int cpu, i
>  mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"
>  postcopy_pause_fault_thread(void) ""
>  postcopy_pause_fault_thread_continued(void) ""
> +postcopy_pause_fast_load(void) ""
> +postcopy_pause_fast_load_continued(void) ""
>  postcopy_ram_fault_thread_entry(void) ""
>  postcopy_ram_fault_thread_exit(void) ""
>  postcopy_ram_fault_thread_fds_core(int baseufd, int quitfd) "ufd: %d quitfd: %d"
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


