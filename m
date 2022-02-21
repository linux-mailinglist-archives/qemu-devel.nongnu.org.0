Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E74BDABF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:09:15 +0100 (CET)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMBFS-0007Ug-65
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMB7W-0003FR-JV
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMB7S-00036K-I7
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645459257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kAGOP7/3/BgyPmpDO3gTOEcYLIdBZPPYvaxvzw1CfW0=;
 b=Td3dQRau+GzGniQjHsgXofXBGSmv5rb+99LHG8BeOMSvWfMGo64ooRyQEtPiYqUjadVwy0
 yyE1OT5tSNHpf/pGnQS/Av0xHueaYy1tqDt/ePIHp4MtAHj3023qR9H61EzMSdWYw4O7vt
 leShQqq37gK6ckydPCAZef4WoglHrHI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-bD7oD_M0NI-Opz289Ew8Vw-1; Mon, 21 Feb 2022 11:00:56 -0500
X-MC-Unique: bD7oD_M0NI-Opz289Ew8Vw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i188-20020a1c3bc5000000b0037bb9f6feeeso8196353wma.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kAGOP7/3/BgyPmpDO3gTOEcYLIdBZPPYvaxvzw1CfW0=;
 b=oRdk4uQa+mRDzDuswb/GY1/ZYn+XFH+l2XNMaAjKJf9/PVZKOGLoniFkJ8j9pTCDNW
 Ktllmp8O3RSW7FqF6wRmKfwYYg2FIL4RoAqHKiety/ay5QBDhZ4+s09+56esrGBp465A
 4CKnyJbHCmi7yb9S5j6BufehL6dCtSumdBHDemsU9AvmgOq1t7JuLpzNHcD5xwLEO5XS
 /Lt11YcZMd1tnw24DZCRUqbaW3V9a6VNW1fCjB93mCAc2imyd7LUDy3F/orCeVxyKxz9
 LAHGEv/oSg0zizyL35jxgg+4baJaYcadaEUoZxX3D8ciQsxkzcmozdMHX4p/SqQiiWaD
 tjRw==
X-Gm-Message-State: AOAM533O/3JiiEynVjEc7OdWP+/Mzh+Tpk3UvPDDEt6bbpvYnrWMb9qw
 t568nteVDU/0uddOt1c9gFGuGKGLVUyZZDABrcDWI9SAAgXNmSo2zrrtOTFSxsDSJ+wLxL5y5p6
 +8IaPRBy4llG5sa0=
X-Received: by 2002:a05:6000:1817:b0:1e4:bb97:d844 with SMTP id
 m23-20020a056000181700b001e4bb97d844mr15473992wrh.628.1645459255112; 
 Mon, 21 Feb 2022 08:00:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytgZ7I1YlVtp6ZPtunIVpD8XoZi+dwIgW6Vpbn3xQzJOanZmfBrnnRxL+cXqMbpwinngjeNQ==
X-Received: by 2002:a05:6000:1817:b0:1e4:bb97:d844 with SMTP id
 m23-20020a056000181700b001e4bb97d844mr15473963wrh.628.1645459254815; 
 Mon, 21 Feb 2022 08:00:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m12-20020a7bce0c000000b0037bed2a6fbfsm8024308wmc.37.2022.02.21.08.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:00:54 -0800 (PST)
Date: Mon, 21 Feb 2022 16:00:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 06/20] migration: Add postcopy_thread_create()
Message-ID: <YhO3NBFBwCtV7xNW@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-7-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-7-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Postcopy create threads. A common manner is we init a sem and use it to sync
> with the thread.  Namely, we have fault_thread_sem and listen_thread_sem and
> they're only used for this.
> 
> Make it a shared infrastructure so it's easier to create yet another thread.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.h    |  8 +++++---
>  migration/postcopy-ram.c | 23 +++++++++++++++++------
>  migration/postcopy-ram.h |  4 ++++
>  migration/savevm.c       | 12 +++---------
>  4 files changed, 29 insertions(+), 18 deletions(-)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index 42c7395094..8445e1d14a 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -70,7 +70,11 @@ struct MigrationIncomingState {
>      /* A hook to allow cleanup at the end of incoming migration */
>      void *transport_data;
>      void (*transport_cleanup)(void *data);
> -
> +    /*
> +     * Used to sync thread creations.  Note that we can't create threads in
> +     * parallel with this sem.
> +     */
> +    QemuSemaphore  thread_sync_sem;
>      /*
>       * Free at the start of the main state load, set as the main thread finishes
>       * loading state.
> @@ -83,13 +87,11 @@ struct MigrationIncomingState {
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
> index 315f784965..d3ec22e6de 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -77,6 +77,20 @@ int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
>                                              &pnd);
>  }
>  
> +/*
> + * NOTE: this routine is not thread safe, we can't call it concurrently. But it
> + * should be good enough for migration's purposes.
> + */
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
> @@ -901,7 +915,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
>      trace_postcopy_ram_fault_thread_entry();
>      rcu_register_thread();
>      mis->last_rb = NULL; /* last RAMBlock we sent part of */
> -    qemu_sem_post(&mis->fault_thread_sem);
> +    qemu_sem_post(&mis->thread_sync_sem);
>  
>      struct pollfd *pfd;
>      size_t pfd_len = 2 + mis->postcopy_remote_fds->len;
> @@ -1172,11 +1186,8 @@ int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
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
> index 0ccd7e5e3f..967ff80547 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1863,7 +1863,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
>  
>      migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
>                                     MIGRATION_STATUS_POSTCOPY_ACTIVE);
> -    qemu_sem_post(&mis->listen_thread_sem);
> +    qemu_sem_post(&mis->thread_sync_sem);
>      trace_postcopy_ram_listen_thread_start();
>  
>      rcu_register_thread();
> @@ -1988,14 +1988,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
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


