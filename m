Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA64A879B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:22:45 +0100 (CET)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdwZ-0000Tb-Iy
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFdu1-0007M7-G2
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFdty-0007Fy-6B
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643901597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gv/CnWm7bcxs/GKEEBM1qYxgLxxmYiDuP64voyATTXw=;
 b=QQtJBzkEn9IPzq9DLoWmPORm0v4S14dClCit6cDKhmemV9Z/LsBvF/NnItQpmOdYDTncPS
 D5H7xEaUTVKlRHOj959+lMUhsv6diAPs6znXpEkEjShMZFXEWv8iO77+s6AcEK3PeYnLuC
 E2qXCeH5hDh5fyPSERxVTHqjSPSbHpg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-9FIw_cDyNZK0xFjnR4cb1w-1; Thu, 03 Feb 2022 10:19:56 -0500
X-MC-Unique: 9FIw_cDyNZK0xFjnR4cb1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a1c440a000000b00355272f7d08so493985wma.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gv/CnWm7bcxs/GKEEBM1qYxgLxxmYiDuP64voyATTXw=;
 b=SpCDuydfITkNp0v8D7X/WKnMFJNdG3xtLwrPK5I6lOZ/6EUkvFB6GHFpdaxVmbvvC/
 QExuHXqzi/YLFafX2n5M8ilf0dlTYR5spz292YFWM9RMhb6wGNDh0qweqxmCIG2QE9Sk
 wyC1n04DLAtVaWhkh5qbgD7Vo9iO/1Hazn9Sl9BujxP0L6tvEhIs2WspRQpL/zPPUm6J
 iDA6iUSfOaqaE2eVv27d6EUtS2P5SXu8ClB4xDMNwOod4Xrz/757b/g24zAzaXHhu6IH
 hdiiJp0/irgkTjGDZSvhjxVm6jLjLPx2YL2JFLjcLXyHG9I5HiYs9ETQGM9l8Xuu7ZvU
 hLLw==
X-Gm-Message-State: AOAM533g6oNLLincVFto1k989eG3NU5oOaKSAdF7r+2Uu+BpVPfvW1wC
 JEFgaqK5s7qGmaUcqfDoRxwDr0AEaYpM1z9T2HNNsf4y00UiiNOWORwVioBLyjC1gMdWGf8rPoT
 GCUf5vMohZkqda/4=
X-Received: by 2002:a5d:64af:: with SMTP id m15mr7800149wrp.478.1643901590965; 
 Thu, 03 Feb 2022 07:19:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAWO3JE5Sw5YXBiiTVo+1arGRxIdgmHyRlyOiobU5lwwQP2s3nRFOe0OXHHxxXOWbpbmQbQw==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr7800134wrp.478.1643901590689; 
 Thu, 03 Feb 2022 07:19:50 -0800 (PST)
Received: from work-vm (82-132-239-190.dab.02.net. [82.132.239.190])
 by smtp.gmail.com with ESMTPSA id f20sm9964935wmg.2.2022.02.03.07.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 07:19:50 -0800 (PST)
Date: Thu, 3 Feb 2022 15:19:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 09/15] migration: Add postcopy_thread_create()
Message-ID: <YfvylA6QEl1YQnKU@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-10-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-10-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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

* Peter Xu (peterx@redhat.com) wrote:
> Postcopy create threads. A common manner is we init a sem and use it to sync
> with the thread.  Namely, we have fault_thread_sem and listen_thread_sem and
> they're only used for this.
> 
> Make it a shared infrastructure so it's easier to create yet another thread.
> 

It might be worth a note saying you now share that sem, so you can't
start two threads in parallel.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.h    |  5 ++---
>  migration/postcopy-ram.c | 19 +++++++++++++------
>  migration/postcopy-ram.h |  4 ++++
>  migration/savevm.c       | 12 +++---------
>  4 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index 8bb2931312..35e7f7babe 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -70,7 +70,8 @@ struct MigrationIncomingState {
>      /* A hook to allow cleanup at the end of incoming migration */
>      void *transport_data;
>      void (*transport_cleanup)(void *data);
> -
> +    /* Used to sync thread creations */
> +    QemuSemaphore  thread_sync_sem;
>      /*
>       * Free at the start of the main state load, set as the main thread finishes
>       * loading state.
> @@ -83,13 +84,11 @@ struct MigrationIncomingState {
>      size_t         largest_page_size;
>      bool           have_fault_thread;
>      QemuThread     fault_thread;
> -    QemuSemaphore  fault_thread_sem;
>      /* Set this when we want the fault thread to quit */
>      bool           fault_thread_quit;
>  
>      bool           have_listen_thread;
>      QemuThread     listen_thread;
> -    QemuSemaphore  listen_thread_sem;
>  
>      /* For the kernel to send us notifications */
>      int       userfault_fd;
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index d78e1b9373..88c832eeba 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -77,6 +77,16 @@ int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
>                                              &pnd);
>  }
>  
> +void postcopy_thread_create(MigrationIncomingState *mis,
> +                            QemuThread *thread, const char *name,
> +                            void *(*fn)(void *), int joinable)
> +{
> +    qemu_sem_init(&mis->thread_sync_sem, 0);
> +    qemu_thread_create(thread, name, fn, mis, joinable);
> +    qemu_sem_wait(&mis->thread_sync_sem);
> +    qemu_sem_destroy(&mis->thread_sync_sem);
> +}
> +
>  /* Postcopy needs to detect accesses to pages that haven't yet been copied
>   * across, and efficiently map new pages in, the techniques for doing this
>   * are target OS specific.
> @@ -901,7 +911,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
>      trace_postcopy_ram_fault_thread_entry();
>      rcu_register_thread();
>      mis->last_rb = NULL; /* last RAMBlock we sent part of */
> -    qemu_sem_post(&mis->fault_thread_sem);
> +    qemu_sem_post(&mis->thread_sync_sem);
>  
>      struct pollfd *pfd;
>      size_t pfd_len = 2 + mis->postcopy_remote_fds->len;
> @@ -1172,11 +1182,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
>          return -1;
>      }
>  
> -    qemu_sem_init(&mis->fault_thread_sem, 0);
> -    qemu_thread_create(&mis->fault_thread, "postcopy/fault",
> -                       postcopy_ram_fault_thread, mis, QEMU_THREAD_JOINABLE);
> -    qemu_sem_wait(&mis->fault_thread_sem);
> -    qemu_sem_destroy(&mis->fault_thread_sem);
> +    postcopy_thread_create(mis, &mis->fault_thread, "postcopy/fault",
> +                           postcopy_ram_fault_thread, QEMU_THREAD_JOINABLE);
>      mis->have_fault_thread = true;
>  
>      /* Mark so that we get notified of accesses to unwritten areas */
> diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
> index 6d2b3cf124..07684c0e1d 100644
> --- a/migration/postcopy-ram.h
> +++ b/migration/postcopy-ram.h
> @@ -135,6 +135,10 @@ void postcopy_remove_notifier(NotifierWithReturn *n);
>  /* Call the notifier list set by postcopy_add_start_notifier */
>  int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp);
>  
> +void postcopy_thread_create(MigrationIncomingState *mis,
> +                            QemuThread *thread, const char *name,
> +                            void *(*fn)(void *), int joinable);
> +
>  struct PostCopyFD;
>  
>  /* ufd is a pointer to the struct uffd_msg *TODO: more Portable! */
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 3b8f565b14..3342b74c24 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1862,7 +1862,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
>  
>      migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
>                                     MIGRATION_STATUS_POSTCOPY_ACTIVE);
> -    qemu_sem_post(&mis->listen_thread_sem);
> +    qemu_sem_post(&mis->thread_sync_sem);
>      trace_postcopy_ram_listen_thread_start();
>  
>      rcu_register_thread();
> @@ -1987,14 +1987,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>      }
>  
>      mis->have_listen_thread = true;
> -    /* Start up the listening thread and wait for it to signal ready */
> -    qemu_sem_init(&mis->listen_thread_sem, 0);
> -    qemu_thread_create(&mis->listen_thread, "postcopy/listen",
> -                       postcopy_ram_listen_thread, NULL,
> -                       QEMU_THREAD_DETACHED);
> -    qemu_sem_wait(&mis->listen_thread_sem);
> -    qemu_sem_destroy(&mis->listen_thread_sem);
> -
> +    postcopy_thread_create(mis, &mis->listen_thread, "postcopy/listen",
> +                           postcopy_ram_listen_thread, QEMU_THREAD_DETACHED);
>      trace_loadvm_postcopy_handle_listen("return");
>  
>      return 0;
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


