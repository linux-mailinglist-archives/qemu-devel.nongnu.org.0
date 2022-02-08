Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1433A4AD7AE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:40:10 +0100 (CET)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOqv-00074V-2U
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:40:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHOTj-0002WE-2K
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:16:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHOTg-0006bJ-OI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644318968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S4FBEKoYsmhV4x73MOsmtWPZ/jtCaVtpx2qtIQbB284=;
 b=XdV5gFsMpdNLGk8KEbL33lYAWDQ76/NuwFwmxIKrmrlKqxWxudVzuBlfCp0NDHKzZ7iTZS
 2XncFkrxSFEKIPBemi5v+GnBT3WeXB1EcRPJIBn770uOFT5CMomlLbWCYjaADbzdNg7uO5
 5InWbAY+HzuZ9BgjHdQsm3StKyfVHGU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-8Ec-0N3wNzaWnoCC516UAg-1; Tue, 08 Feb 2022 06:16:07 -0500
X-MC-Unique: 8Ec-0N3wNzaWnoCC516UAg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i19-20020adfa513000000b001e33749ed31so832143wrb.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S4FBEKoYsmhV4x73MOsmtWPZ/jtCaVtpx2qtIQbB284=;
 b=DW6MHU/HSXD1PaIo389D3E9VeMSaX2wXy3xhN/NTMeddYnkMxNxJc0onDnVnijJcUP
 CLbU5heUImPvEV2Jag6j71VuE3mikm0AhbLZAbzlyt7Ba3rhsUYE0xP0W6EGVaBgXqUO
 +DkOETra8bOfKq+/r729j3je8DRzL/paM17PEXjpOkAvDK+4YDtVwt/baCtTc2IxWihR
 0DZ11eeSlNPL1wH1MCzPdZ3702OftANpooUAWRqro2DThD3kn7BV2CtfS6GMoXznVd22
 InRK/o8G0GBR1D+rWhuOh7E+zRbJjbRDrfitNXSvE8CjQrbBxHj3/COWjW9AWMkLe9Vt
 2hEQ==
X-Gm-Message-State: AOAM532MYnGtt+HCjgnaAHLDYrUV4WzOUp4bO+y1I4qTfIxtJSjRFTeN
 IbuhDUuICinHVJT060BGpYNbXO9ABbn8CAvlaDWui8r2uI5DMmZaWNBc7y4Ucx/hJNCci2rDwVL
 Cy0GvT0pIfqakLO4=
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr3093768wrw.537.1644318965593; 
 Tue, 08 Feb 2022 03:16:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoOy803KqanVzKovfZTvHNop+q0Kxwigp9VTBDELL6XzzJs1cppordFkMmGrHyed9j+LxoIw==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr3093757wrw.537.1644318965441; 
 Tue, 08 Feb 2022 03:16:05 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t4sm12183736wro.71.2022.02.08.03.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:16:04 -0800 (PST)
Date: Tue, 8 Feb 2022 11:16:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 09/15] migration: Add postcopy_thread_create()
Message-ID: <YgJQ84vcR/53aEw8@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-10-peterx@redhat.com>
 <YfvylA6QEl1YQnKU@work-vm> <YgHlfMEKC+feQgPU@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YgHlfMEKC+feQgPU@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> On Thu, Feb 03, 2022 at 03:19:48PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > Postcopy create threads. A common manner is we init a sem and use it to sync
> > > with the thread.  Namely, we have fault_thread_sem and listen_thread_sem and
> > > they're only used for this.
> > > 
> > > Make it a shared infrastructure so it's easier to create yet another thread.
> > > 
> > 
> > It might be worth a note saying you now share that sem, so you can't
> > start two threads in parallel.
> 
> I'll squash this into the patch:

Thanks

> ---8<---
> diff --git a/migration/migration.h b/migration/migration.h
> index 845be3463c..2a311fd8d6 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -72,7 +72,10 @@ struct MigrationIncomingState {
>      /* A hook to allow cleanup at the end of incoming migration */
>      void *transport_data;
>      void (*transport_cleanup)(void *data);
> -    /* Used to sync thread creations */
> +    /*
> +     * Used to sync thread creations.  Note that we can't create threads in
> +     * parallel with this sem.
> +     */
>      QemuSemaphore  thread_sync_sem;
>      /*
>       * Free at the start of the main state load, set as the main thread finishes
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 099d8ed478..1a3ba1db84 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -79,6 +79,10 @@ int postcopy_notify(enum PostcopyNotifyReason reason, Error **errp)
>                                              &pnd);
>  }
>  
> +/*
> + * NOTE: this routine is not thread safe, we can't call it concurrently. But it
> + * should be good enough for migration's purposes.
> + */
>  void postcopy_thread_create(MigrationIncomingState *mis,
>                              QemuThread *thread, const char *name,
>                              void *(*fn)(void *), int joinable)
> ---8<---
> 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


