Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E7467902
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:02:47 +0100 (CET)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt99B-0006Wp-QB
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mt97a-0005Rb-Tn
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mt97O-0008LO-L2
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638540051;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzwGy81mfESFphtsbFQRCeApxdrL0bc7YWnd+1fQnHE=;
 b=Vqx7Q+N1/91hpfg6N78JphJK253sBOmravyXvA7z/VPZoV5S9lsDSeweBMldKLfDM2vVf4
 oBlyqakRN7R0fmD28LABpOan0YfUdr0zfrWyARcs9JRMd33UTFO/tmKxeaEO0ZG2Ey1cJe
 3kJqjvMZ2v8i4CWMBuI0O9x2yzzwqRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-kM-3ZePZOGWz6ggIztc3mw-1; Fri, 03 Dec 2021 09:00:46 -0500
X-MC-Unique: kM-3ZePZOGWz6ggIztc3mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EE0083DD24;
 Fri,  3 Dec 2021 14:00:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A7E25F4E0;
 Fri,  3 Dec 2021 14:00:41 +0000 (UTC)
Date: Fri, 3 Dec 2021 14:00:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v2 1/1] multifd: Shut down the QIO channels to avoid
 blocking the send threads when they are terminated.
Message-ID: <YaojB8Hl0JZZ7uip@redhat.com>
References: <20211203115533.31534-1-lizhang@suse.de>
 <20211203115533.31534-2-lizhang@suse.de>
MIME-Version: 1.0
In-Reply-To: <20211203115533.31534-2-lizhang@suse.de>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 12:55:33PM +0100, Li Zhang wrote:
> When doing live migration with multifd channels 8, 16 or larger number,
> the guest hangs in the presence of the network errors such as missing TCP ACKs.
> 
> At sender's side:
> The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> is called because one thread fails on qio_channel_write_all when
> the network problem happens and other send threads are blocked on sendmsg.
> They could not be terminated. So the main thread is blocked on qemu_thread_join
> to wait for the threads terminated.
> 
> (gdb) bt
> 0  0x00007f30c8dcffc0 in __pthread_clockjoin_ex () at /lib64/libpthread.so.0
> 1  0x000055cbb716084b in qemu_thread_join (thread=0x55cbb881f418) at ../util/qemu-thread-posix.c:627
> 2  0x000055cbb6b54e40 in multifd_save_cleanup () at ../migration/multifd.c:542
> 3  0x000055cbb6b4de06 in migrate_fd_cleanup (s=0x55cbb8024000) at ../migration/migration.c:1808
> 4  0x000055cbb6b4dfb4 in migrate_fd_cleanup_bh (opaque=0x55cbb8024000) at ../migration/migration.c:1850
> 5  0x000055cbb7173ac1 in aio_bh_call (bh=0x55cbb7eb98e0) at ../util/async.c:141
> 6  0x000055cbb7173bcb in aio_bh_poll (ctx=0x55cbb7ebba80) at ../util/async.c:169
> 7  0x000055cbb715ba4b in aio_dispatch (ctx=0x55cbb7ebba80) at ../util/aio-posix.c:381
> 8  0x000055cbb7173ffe in aio_ctx_dispatch (source=0x55cbb7ebba80, callback=0x0, user_data=0x0) at ../util/async.c:311
> 9  0x00007f30c9c8cdf4 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
> 10 0x000055cbb71851a2 in glib_pollfds_poll () at ../util/main-loop.c:232
> 11 0x000055cbb718521c in os_host_main_loop_wait (timeout=42251070366) at ../util/main-loop.c:255
> 12 0x000055cbb7185321 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> 13 0x000055cbb6e6ba27 in qemu_main_loop () at ../softmmu/runstate.c:726
> 14 0x000055cbb6ad6fd7 in main (argc=68, argv=0x7ffc0c578888, envp=0x7ffc0c578ab0) at ../softmmu/main.c:50
> 
> To make sure that the send threads could be terminated, IO channels should be
> shut down to avoid waiting IO.
> 
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>  migration/multifd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7c9deb1921..33f8287969 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -523,6 +523,9 @@ static void multifd_send_terminate_threads(Error *err)
>          qemu_mutex_lock(&p->mutex);
>          p->quit = true;
>          qemu_sem_post(&p->sem);
> +        if (p->c) {
> +            qio_channel_shutdown(p->c, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +        }
>          qemu_mutex_unlock(&p->mutex);
>      }
>  }

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


