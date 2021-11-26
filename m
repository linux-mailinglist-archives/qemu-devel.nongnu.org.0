Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0145F201
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:35:30 +0100 (CET)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeC9-00011C-3E
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:35:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqeAm-00084b-53
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:34:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mqeAk-0003cA-2f
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637944441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qR/fm602x24+O0EJ8E7U+7hcqOjVXddLCJ/PSwfCMTM=;
 b=eVshk6QTsUxZL2ouwXzrooP/nOAZNSoz3GbK++kyNsG98oU6voiQxbEI+p0xX2ZKsn6Vud
 1urvLAokL2nbkZ3f8cRCGgiSYolbHEDs79Q55MXCxoyyeHLg08ADnM2g4KkVoSvN25uhOs
 zMsECq0a8Uu0tfm1/y4QtjzxtUBFzew=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-gyl89Mq9M6CuE0V5V-XmDA-1; Fri, 26 Nov 2021 11:34:00 -0500
X-MC-Unique: gyl89Mq9M6CuE0V5V-XmDA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c8-20020a7bc848000000b0033bf856f0easo7140824wml.1
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 08:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=qR/fm602x24+O0EJ8E7U+7hcqOjVXddLCJ/PSwfCMTM=;
 b=POBHql6sz5tOrJvfkDur+DICEnNXhqMnZ8Lq8CO7dwalsZ8ns/Acowa+Tpq4rKQGQt
 nFOivQ10nrMe4xRD6A8jEP4Fn6nlMB6198B5UNvKrMYj5KbrqUlgXgho0CuHNqdZ1O1X
 kZ0R4pburRAkAtQzPF6NA0s1qEQ69V5bpqYFOPU4OYM0O9AZ0vPtK/mz1DZYhuOU990w
 rX8hH4PzhnkaXWq0jtSveLjp9s6V0gUNTY3jo/KtJSSiPv7wnFlrY/55OyTM9qmOl4P3
 Cr6+p1vpUmHlofypTeS4IYnHQn7uM99YtmMiUcxEy75UhnwFob/PYxbMhbhb+JZk8UPB
 bLNA==
X-Gm-Message-State: AOAM531TGKJyWOp/9Y7vxB1ANydaRGOg5X9HTg7UB8HKYkjdFl1GOWuF
 wPyXdK43xTkgAvzSUhYp7bBRasYfW8UKfhG6Wj6nCyvCLOBIlgKSLP1yOcCOOgubIImgKrcYQa7
 5f+awVErnhVP47lU=
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr16934106wmq.195.1637944438053; 
 Fri, 26 Nov 2021 08:33:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD1UzJj2Ptv502GWtvRyZOqKBONJIJvyERYxfaHoohxIOYTUIdx0zwmmRMd780JyvTrLwWGA==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr16934071wmq.195.1637944437796; 
 Fri, 26 Nov 2021 08:33:57 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id a1sm8120418wri.89.2021.11.26.08.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:33:57 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
In-Reply-To: <20211126153154.25424-2-lizhang@suse.de> (Li Zhang's message of
 "Fri, 26 Nov 2021 16:31:53 +0100")
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 26 Nov 2021 17:33:56 +0100
Message-ID: <87ee72g9l7.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <lizhang@suse.de> wrote:
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
> At receiver's side:
> Several receive threads are not created successfully and the receive threads
> which have been created are blocked on qemu_sem_wait. No semaphores are posted
> because migration is not started if not all the receive threads are created
> successfully and multifd_recv_sync_main is not called which posts the semaphore
> to receive threads. So the receive threads are waiting on the semaphore and
> never return. It shouldn't wait for the semaphore forever.
> Use qemu_sem_timedwait to wait for a while, then return and close the channels.
> So the guest doesn't hang anymore.
>
> (gdb) bt
> 0  0x00007fd61c43f064 in do_futex_wait.constprop () at /lib64/libpthread.so.0
> 1  0x00007fd61c43f158 in __new_sem_wait_slow.constprop.0 () at /lib64/libpthread.so.0
> 2  0x000056075916014a in qemu_sem_wait (sem=0x56075b6515f0) at ../util/qemu-thread-posix.c:358
> 3  0x0000560758b56643 in multifd_recv_thread (opaque=0x56075b651550) at ../migration/multifd.c:1112
> 4  0x0000560759160598 in qemu_thread_start (args=0x56075befad00) at ../util/qemu-thread-posix.c:556
> 5  0x00007fd61c43594a in start_thread () at /lib64/libpthread.so.0
> 6  0x00007fd61c158d0f in clone () at /lib64/libc.so.6
>
> Signed-off-by: Li Zhang <lizhang@suse.de>
> ---
>  migration/multifd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7c9deb1921..656239ca2a 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1109,7 +1109,7 @@ static void *multifd_recv_thread(void *opaque)
>  
>          if (flags & MULTIFD_FLAG_SYNC) {
>              qemu_sem_post(&multifd_recv_state->sem_sync);
> -            qemu_sem_wait(&p->sem_sync);
> +            qemu_sem_timedwait(&p->sem_sync, 1000);
>          }
>      }

Problem happens here, but I think that the solution is not worng.  We
are returning from the semaphore without given a single error message.

Later, Juan.


