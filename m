Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A8508729
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:37:21 +0200 (CEST)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8e8-0005yd-LH
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8cN-0004zU-8y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8cJ-0000kH-Do
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650454525;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oo0MvSOKkM9C1dXPgPEFOwK4gd11Pmo4nHd8TiPri3Y=;
 b=aiXsje0ph/06CHi2aN94Xr4d/NKmaFv7fdcnN4Bb+kkvyIicCezl79wlrQeSfl9MNne5qL
 Ng2aN2uDxO9B+3oRxP/xiRL0CJKt7gkm5zuAQ3yrzmf1WFUQI7uoEftbl1wZGNT0V0iPmC
 g4C/nFUCx5fflq9dhaf5Fwupr7exUd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-f-MT4rFyPVSUYh0xv9BUyg-1; Wed, 20 Apr 2022 07:35:24 -0400
X-MC-Unique: f-MT4rFyPVSUYh0xv9BUyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4632C185A7BA
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:35:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5783540D1B9B;
 Wed, 20 Apr 2022 11:35:23 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:35:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 16/19] migration: Enable TLS for preempt channel
Message-ID: <Yl/v+eFKjvlSajmA@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-17-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-17-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:54AM -0400, Peter Xu wrote:
> This patch is based on the async preempt channel creation.  It continues
> wiring up the new channel with TLS handshake to destionation when enabled.
> 
> Note that only the src QEMU needs such operation; the dest QEMU does not
> need any change for TLS support due to the fact that all channels are
> established synchronously there, so all the TLS magic is already properly
> handled by migration_tls_channel_process_incoming().
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/postcopy-ram.c | 60 +++++++++++++++++++++++++++++++++++-----
>  migration/trace-events   |  1 +
>  2 files changed, 54 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index ab2a50cf45..f5ba176862 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -36,6 +36,7 @@
>  #include "socket.h"
>  #include "qemu-file-channel.h"
>  #include "yank_functions.h"
> +#include "tls.h"
>  
>  /* Arbitrary limit on size of each discard command,
>   * keeps them around ~200 bytes
> @@ -1552,15 +1553,15 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
>      return true;
>  }
>  
> +/*
> + * Setup the postcopy preempt channel with the IOC.  If ERROR is specified,
> + * setup the error instead.  This helper will free the ERROR if specified.
> + */
>  static void
> -postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
> +postcopy_preempt_send_channel_done(MigrationState *s,
> +                                   QIOChannel *ioc, Error *local_err)
>  {
> -    MigrationState *s = opaque;
> -    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
> -    Error *local_err = NULL;
> -
> -    if (qio_task_propagate_error(task, &local_err)) {
> -        /* Something wrong happened.. */
> +    if (local_err) {
>          migrate_set_error(s, local_err);
>          error_free(local_err);
>      } else {
> @@ -1574,6 +1575,51 @@ postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
>       * postcopy_qemufile_src to know whether it failed or not.
>       */
>      qemu_sem_post(&s->postcopy_qemufile_src_sem);
> +}
> +
> +static void
> +postcopy_preempt_tls_handshake(QIOTask *task, gpointer opaque)
> +{
> +    MigrationState *s = opaque;
> +    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));

If using g_autoptr(QIOChannel) ioc = ...

> +    Error *err = NULL;

local_err is normal naming 

> +
> +    qio_task_propagate_error(task, &err);
> +    postcopy_preempt_send_channel_done(s, ioc, err);
> +    object_unref(OBJECT(ioc));

...not needed with g_autoptr

> +}
> +
> +static void
> +postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
> +{
> +    MigrationState *s = opaque;
> +    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));

If you use g_autoptr(QIOChannel)

> +    QIOChannelTLS *tioc;
> +    Error *local_err = NULL;
> +
> +    if (qio_task_propagate_error(task, &local_err)) {
> +        assert(local_err);

I don't think we really need to add these asserts everywhere we
handle a failure path do we ?

> +        goto out;
> +    }
> +
> +    if (migrate_channel_requires_tls(ioc)) {
> +        tioc = migration_tls_client_create(s, ioc, s->hostname, &local_err);
> +        if (!tioc) {
> +            assert(local_err);
> +            goto out;
> +        }
> +        trace_postcopy_preempt_tls_handshake();
> +        qio_channel_set_name(QIO_CHANNEL(tioc), "migration-tls-preempt");
> +        qio_channel_tls_handshake(tioc, postcopy_preempt_tls_handshake,
> +                                  s, NULL, NULL);
> +        /* Setup the channel until TLS handshake finished */
> +        object_unref(OBJECT(ioc));

...not needed with g_autoptr

> +        return;
> +    }
> +
> +out:
> +    /* This handles both good and error cases */
> +    postcopy_preempt_send_channel_done(s, ioc, local_err);
>      object_unref(OBJECT(ioc));

...also not needed with g_autoptr

>  }
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index b21d5f371f..00ab2e1b96 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -287,6 +287,7 @@ postcopy_request_shared_page(const char *sharer, const char *rb, uint64_t rb_off
>  postcopy_request_shared_page_present(const char *sharer, const char *rb, uint64_t rb_offset) "%s already %s offset 0x%"PRIx64
>  postcopy_wake_shared(uint64_t client_addr, const char *rb) "at 0x%"PRIx64" in %s"
>  postcopy_page_req_del(void *addr, int count) "resolved page req %p total %d"
> +postcopy_preempt_tls_handshake(void) ""
>  postcopy_preempt_new_channel(void) ""
>  postcopy_preempt_thread_entry(void) ""
>  postcopy_preempt_thread_exit(void) ""
> -- 
> 2.32.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


