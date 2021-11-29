Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD0461A56
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:52:31 +0100 (CET)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mri18-000050-Nv
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrhzK-0006py-SB
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:50:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrhzH-0005NV-35
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638197432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Sd/72eQx7R2KMpi98cAeE99jmGywA4L3qVGT3Ht984=;
 b=A+Q7mcFRS/7ehSjGDnhLUBxYzP8A01x0LFETjMGynOjYtL/mwzBcLq/mwEeDd/z1k2eNyk
 +suXJyt/zMuFetrjUrcpuIl6vePc7h+V0Ik1wV2uLpSAA9cI261PtIxYjyoRahgfoo3CGV
 hPTamB0eCjY2BR57mbGAWlqkeV9IDqw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-179kMn1OPRGYnq-93jLUaw-1; Mon, 29 Nov 2021 09:50:25 -0500
X-MC-Unique: 179kMn1OPRGYnq-93jLUaw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so10966393wms.7
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=7Sd/72eQx7R2KMpi98cAeE99jmGywA4L3qVGT3Ht984=;
 b=xS/CQPUusiAPnu5q/qKHLU3c88ox1EPiBF5qR8P7X0ji5aXE3beRroXGapqG+GHXEw
 kAV72ypjYdDZ+nWIf+i2dxO76/05W5iVl+akixIYz80aeSx55cFxi6SP0FB9IO/7xO1R
 zt1nM/VR4getyPGtDoq1A4Ep8uEHdmPoQ9z4UD5rSSvJhNcTh0GQ0NDZ69cYpFQxUxaB
 YSNcvzt32upV8rNrdpopkmcwbriiUZwXyHFwV/dUYmOYYVAAIMhVToXY9ScH48o1iGe1
 rWYRki/a72vcvXJYpwm7ED/1l6PdwNRborp1GKpckmrQ85Kngg7/i0b7SX1kQJQg8ebc
 WElQ==
X-Gm-Message-State: AOAM533kCkZgd376zqAs7YhJQRuWebWAs3sTHcnd07sBfTny1CiPGwi3
 m9v9eL28CbfSSvbXo4P215vUJvWsQFQybzZ0q/OWNwM3E1vVQW7rWEdYUdgemHW/zK6yueqk+eb
 vmh6LSJSJiM6atoo=
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr37261923wmd.32.1638197424284; 
 Mon, 29 Nov 2021 06:50:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsyeV96tP/M/au906kc7nDK/ajaj97w/vbfOeYLkCl7CPAj1z1cVARuRqkqJdGtmlkc+y6OA==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr37261886wmd.32.1638197423991; 
 Mon, 29 Nov 2021 06:50:23 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id bd18sm14472816wmb.43.2021.11.29.06.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:50:23 -0800 (PST)
Date: Mon, 29 Nov 2021 14:50:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
Message-ID: <YaTorUbhzjFhvBl5@work-vm>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de>
 <YaECIGJAPAtB+n8/@redhat.com> <YaS3aKW6AWH4JAeR@work-vm>
 <50dbb2b9-152e-f97a-d82e-0b6613e54085@suse.de>
MIME-Version: 1.0
In-Reply-To: <50dbb2b9-152e-f97a-d82e-0b6613e54085@suse.de>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhang (lizhang@suse.de) wrote:
> 
> On 11/29/21 12:20 PM, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
> > > > When doing live migration with multifd channels 8, 16 or larger number,
> > > > the guest hangs in the presence of the network errors such as missing TCP ACKs.
> > > > 
> > > > At sender's side:
> > > > The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> > > > is called because one thread fails on qio_channel_write_all when
> > > > the network problem happens and other send threads are blocked on sendmsg.
> > > > They could not be terminated. So the main thread is blocked on qemu_thread_join
> > > > to wait for the threads terminated.
> > > Isn't the right answer here to ensure we've called 'shutdown' on
> > > all the FDs, so that the threads get kicked out of sendmsg, before
> > > trying to join the thread ?
> > I agree a timeout is wrong here; there is no way to get a good timeout
> > value.
> > However, I'm a bit confused - we should be able to try a shutdown on the
> > receive side using the 'yank' command. - that's what it's there for; Li
> > does this solve your problem?
> 
> No, I tried to register 'yank' on the receive side, the receive threads are
> still waiting there.
> 
> It seems that on send side, 'yank' doesn't work either when the send threads
> are blocked.
> 
> This may be not the case to call yank. I am not quite sure about it.

We need to fix that; 'yank' should be able to recover from any network
issue.  If it's not working we need to understand why.

> > 
> > multifd_load_cleanup already kicks sem_sync before trying to do a
> > thread_join - so have we managed to trigger that on the receive side?
> 
> There is no problem with sem_sync in function multifd_load_cleanup.
> 
> But it is not called in my case, because no errors are detected on the
> receive side.

If you're getting TCP errors why aren't you seeing any errors on the
receive side?

> The problem is here:
> 
> void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
> {
>     MigrationIncomingState *mis = migration_incoming_get_current();
>     Error *local_err = NULL;
>     bool start_migration;
> 
>    ...
> 
>     if (!mis->from_src_file) {
> 
>     ...
> 
>      } else {
>         /* Multiple connections */
>         assert(migrate_use_multifd());
>         start_migration = multifd_recv_new_channel(ioc, &local_err);
>         if (local_err) {
>             error_propagate(errp, local_err);
>             return;
>         }
>     }
>    if (start_migration) {
>         migration_incoming_process();
>     }
> }
> 
> start_migration is always 0, and migration is not started because some
> receive threads are not created.
> 
> No errors are detected here and the main process works well but receive
> threads are all waiting for semaphore.
> 
> It's hard to know if the receive threads are not created. If we can find a
> way to check if any receive threads

So is this only a problem for network issues that happen during startup,
before all the threads have been created?

Dave

> are not created, we can kick the sem_sync and do cleanup.
> 
> From the source code, the thread will be created when QIO channel detects
> something by GIO watch if I understand correctly.
> 
> If nothing is detected, socket_accept_icoming_migration won't be called, the
> thread will not be created.
> 
> socket_start_incoming_migration_internal ->
> 
>     qio_net_listener_set_client_func_full(listener,
> socket_accept_incoming_migration,
>                                           NULL, NULL,
> g_main_context_get_thread_default());
> 
>    qio_net_listener_set_client_func_full ->
> 
>                qio_channel_add_watch_source(
>                 QIO_CHANNEL(listener->sioc[i]), G_IO_IN,
>                 qio_net_listener_channel_func,
>                 listener, (GDestroyNotify)object_unref, context);
> 
>   socket_accept_incoming_migration ->
> 
>        migration_channel_process_incoming ->
> 
>                migration_ioc_process_incoming ->
> 
>                      multifd_recv_new_channel ->
> 
>                             qemu_thread_create(&p->thread, p->name,
> multifd_recv_thread, p,
> QEMU_THREAD_JOINABLE);
> 
> > 
> > Dave
> > 
> > > Regards,
> > > Daniel
> > > -- 
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


