Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6763DDC97
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 17:37:32 +0200 (CEST)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAa0N-0005Nl-OA
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mAZyr-0004b6-DR
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mAZyp-0003PJ-Fg
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627918550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+UQIyBoELMXcEZ1/SOC1FrAiBMV2MDkOFN45xkhkLEg=;
 b=UwMrRHeYU080+eRvNSrQBYaFf2DGmiNG3FGNBxJa7yXT8+bUpHgFaMDpZ+diaSqB7YCERN
 FeMPeY39/ViPoaoaz86Wh2bup3lgwbtfFHn6kLKNoWhv3HBk0yLbQeiBh3aTF1ICY/CVq1
 4+iD1IuxQfLpImSxcPKBBV4Yg5wyiK0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-mIysjS1OPSCBCWWvJ_jgsw-1; Mon, 02 Aug 2021 11:35:25 -0400
X-MC-Unique: mIysjS1OPSCBCWWvJ_jgsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s22-20020adf97960000b02901535eae4100so6615550wrb.14
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 08:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+UQIyBoELMXcEZ1/SOC1FrAiBMV2MDkOFN45xkhkLEg=;
 b=m+l/mjWhC4mOhhLNUsgFmNMtEm38czLVQ8QoA43MeIXhGYDuyNsGOp1FLa4oYwsGZs
 D8+kGJ7pQ9Aa03y5jcOOAJa8JEbi6D4YMgRMlERByXSj/UyA4/mbSxIt9m8NHy3FS9z0
 VK4zGon/ja0aGyhRoeB+xxm98W5U4kxGjUrIu4yfGabFvXC/4Yyr8mrcJl0+rNTbsOi+
 MullBtlVy0EUyMLoKfHZRwIQ0jfNvcaot+p48BwIsir6jFuMyAiztv3xHIJZKIB+rNp4
 OC9Wfm7b2a6wcpdazkeyJw7vou46qjrsIxgHBqqpp5wXh/b/NncglaEFEpSphyoPa+2X
 nMvA==
X-Gm-Message-State: AOAM533xq9eA13ZqgpQFEqbwPfBv3LnwjSCNxt9uKUxmsIaoUubLN8TO
 zSqIEoW8RF+mk4Q9BAdfWH9dFVR+ywb81c0mlhOTmbqreGeic5c8LKfPEl5eglNxY88AnVUQ3f6
 zegqP2ADfLutH8TI=
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr17604487wmm.171.1627918524001; 
 Mon, 02 Aug 2021 08:35:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtwZy6upZ1KKkAeH/3tkmvrn266KE96RAAMpfVvkz1Iv/9u6y37QZtwOH4MDrvlJ2qjCLzpQ==
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr17604460wmm.171.1627918523724; 
 Mon, 02 Aug 2021 08:35:23 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id u11sm11308405wrp.26.2021.08.02.08.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:35:23 -0700 (PDT)
Date: Mon, 2 Aug 2021 16:35:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH 1/1] migration: Terminate multifd threads on yank
Message-ID: <YQgQuCdc8jBKRyLc@work-vm>
References: <20210730074043.54260-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730074043.54260-1-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Li Xiaohui <xiaohli@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Leonardo Bras (leobras@redhat.com) wrote:
> From source host viewpoint, losing a connection during migration will
> cause the sockets to get stuck in sendmsg() syscall, waiting for
> the receiving side to reply.
> 
> In migration, yank works by shutting-down the migration QIOChannel fd.
> This causes a failure in the next sendmsg() for that fd, and the whole
> migration gets cancelled.
> 
> In multifd, due to having multiple sockets in multiple threads,
> on a connection loss there will be extra sockets stuck in sendmsg(),
> and because they will be holding their own mutex, there is good chance
> the main migration thread can get stuck in multifd_send_pages()
> waiting for one of those mutexes.
> 
> While it's waiting, the main migration thread can't run sendmsg() on
> it's fd, and therefore can't cause the migration to be cancelled, thus
> causing yank not to work.
> 
> Fixes this by shutting down all migration fds (including multifd ones),
> so no thread get's stuck in sendmsg() while holding a lock, and thus
> allowing the main migration thread to properly cancel migration when
> yank is used.
> 
> There is no need to do the same procedure to yank to work in the
> receiving host since ops->recv_pages() is kept outside the mutex protected
> code in multifd_recv_thread().
> 
> Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=1970337
> Reported-by: Li Xiaohui <xiaohli@redhat.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.c        | 11 +++++++++++
>  migration/multifd.h        |  1 +
>  migration/yank_functions.c |  2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 377da78f5b..744a180dfe 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1040,6 +1040,17 @@ void multifd_recv_sync_main(void)
>      trace_multifd_recv_sync_main(multifd_recv_state->packet_num);
>  }
>  
> +void multifd_shutdown(void)
> +{
> +    if (!migrate_use_multifd()) {
> +        return;
> +    }
> +
> +    if (multifd_send_state) {
> +        multifd_send_terminate_threads(NULL);
> +    }

That calls :
    for (i = 0; i < migrate_multifd_channels(); i++) {
        MultiFDSendParams *p = &multifd_send_state->params[i];

        qemu_mutex_lock(&p->mutex);
        p->quit = true;
        qemu_sem_post(&p->sem);
        qemu_mutex_unlock(&p->mutex);
    }

so why doesn't this also get stuck in the same mutex you're trying to
fix?

Does the qio_channel_shutdown actually cause a shutdown on all fd's
for the multifd?

(I've just seen the multifd/cancel test fail stuck in multifd_send_sync_main
waiting on one of the locks).

Dave

> +}
> +
>  static void *multifd_recv_thread(void *opaque)
>  {
>      MultiFDRecvParams *p = opaque;
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 8d6751f5ed..0517213bdf 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -22,6 +22,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
>  void multifd_recv_sync_main(void);
>  void multifd_send_sync_main(QEMUFile *f);
>  int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
> +void multifd_shutdown(void);
>  
>  /* Multifd Compression flags */
>  #define MULTIFD_FLAG_SYNC (1 << 0)
> diff --git a/migration/yank_functions.c b/migration/yank_functions.c
> index 8c08aef14a..9335a64f00 100644
> --- a/migration/yank_functions.c
> +++ b/migration/yank_functions.c
> @@ -15,12 +15,14 @@
>  #include "io/channel-socket.h"
>  #include "io/channel-tls.h"
>  #include "qemu-file.h"
> +#include "multifd.h"
>  
>  void migration_yank_iochannel(void *opaque)
>  {
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>  
>      qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +    multifd_shutdown();
>  }
>  
>  /* Return whether yank is supported on this ioc */
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


