Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64A46A612
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 20:53:54 +0100 (CET)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muK3c-0006YT-J0
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 14:53:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muK0I-0003OJ-Hu
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:50:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muK0F-0000wg-3X
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638820221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rg27ycbUIPZJ6JuX/QH9pDZOL8kxJGk+TxAWt5hbA8w=;
 b=Lzihv0haCgf9BnJmEqzjsRSGrlLb0E7NQwnI36X8vXrN2kY8bapqvwWV6iE904W4tiO/Iq
 aHAyzYMV29eBNTrRbBzWlaDRWJveX0VY6LY9E3ekJP4T6Dzh2sXn1hk7XbPXScSKOvIffa
 qSFQSJhTbvxVxhTGEnUEptQq/8r4Adk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-7RNv63r_Oiy_l_-KspRksQ-1; Mon, 06 Dec 2021 14:50:20 -0500
X-MC-Unique: 7RNv63r_Oiy_l_-KspRksQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so71560wma.5
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 11:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Rg27ycbUIPZJ6JuX/QH9pDZOL8kxJGk+TxAWt5hbA8w=;
 b=wYR+RQTKFeU+fpfP+bPFWXYKALSAL+H25A1Aa1eLea0DR1gtdT4t0gMr4OYdMulnX8
 Af7oNZD15VnkvOEsZApDc89V3t75MQxZYAYi99/7+Vb5yAY2w6QNXMn7AWzzOGYUyo1X
 gcdxadiuYSJdCZ8tqtKsDqq0kexzpXabc7kcluPccafy5TtfpjBb0cEX8zFPQwpomua3
 2lg43NCqXqHNz9oeYETbt7hwqhYiGAVUOEfKwX7uAJCLTC+Z2YM9SmnBkzcsEnKPAPEC
 ebAorEy2g5mXZ320cGqwF7soYTwYMHFFbRZzXW341PO2YQqh52m4WLXcEFB3O5hZX0wY
 bJAg==
X-Gm-Message-State: AOAM533eY6l8q3PrmFjSzpPT4wAYSI8AkHUbs0m5LcqRy/jrCydT1WD2
 mqM87YPJmWWGO+E8cv+dVK7JE9BC4/IJgCII5vvQJzoh0lx9kKw2H2k3vY3QmzDna+9ht0lbX4q
 nxHqnJtZUZ7t2eZY=
X-Received: by 2002:a5d:4582:: with SMTP id p2mr46441678wrq.364.1638820219079; 
 Mon, 06 Dec 2021 11:50:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh8GTD7+qNEGN1uYjNDJwRuXr0BnvQq/gImQFWMm09h3EIAaluuyWAy7tVO7hmS2qA31WFrw==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr46441655wrq.364.1638820218869; 
 Mon, 06 Dec 2021 11:50:18 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id x4sm326710wmi.3.2021.12.06.11.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:50:18 -0800 (PST)
Date: Mon, 6 Dec 2021 19:50:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v2 1/1] multifd: Shut down the QIO channels to avoid
 blocking the send threads when they are terminated.
Message-ID: <Ya5pd4HcD2/2AfzK@work-vm>
References: <20211203115533.31534-1-lizhang@suse.de>
 <20211203115533.31534-2-lizhang@suse.de>
 <c020b6ee-12e4-9161-9a8d-9090930a4dd0@suse.de>
MIME-Version: 1.0
In-Reply-To: <c020b6ee-12e4-9161-9a8d-9090930a4dd0@suse.de>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: qemu-devel@nongnu.org, berrange@redhat.com, cfontana@suse.de,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhang (lizhang@suse.de) wrote:
> 
> Thanks for Daniel's review.
> 
> Hi David and Juan,
> 
> Any comments for this patch?
> 

Yeh I think that's OK, so

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

I'd have a slight preference for it being before the post I think.

Dave

> 
> Thanks
> 
> Li
> 
> On 12/3/21 12:55 PM, Li Zhang wrote:
> > When doing live migration with multifd channels 8, 16 or larger number,
> > the guest hangs in the presence of the network errors such as missing TCP ACKs.
> > 
> > At sender's side:
> > The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> > is called because one thread fails on qio_channel_write_all when
> > the network problem happens and other send threads are blocked on sendmsg.
> > They could not be terminated. So the main thread is blocked on qemu_thread_join
> > to wait for the threads terminated.
> > 
> > (gdb) bt
> > 0  0x00007f30c8dcffc0 in __pthread_clockjoin_ex () at /lib64/libpthread.so.0
> > 1  0x000055cbb716084b in qemu_thread_join (thread=0x55cbb881f418) at ../util/qemu-thread-posix.c:627
> > 2  0x000055cbb6b54e40 in multifd_save_cleanup () at ../migration/multifd.c:542
> > 3  0x000055cbb6b4de06 in migrate_fd_cleanup (s=0x55cbb8024000) at ../migration/migration.c:1808
> > 4  0x000055cbb6b4dfb4 in migrate_fd_cleanup_bh (opaque=0x55cbb8024000) at ../migration/migration.c:1850
> > 5  0x000055cbb7173ac1 in aio_bh_call (bh=0x55cbb7eb98e0) at ../util/async.c:141
> > 6  0x000055cbb7173bcb in aio_bh_poll (ctx=0x55cbb7ebba80) at ../util/async.c:169
> > 7  0x000055cbb715ba4b in aio_dispatch (ctx=0x55cbb7ebba80) at ../util/aio-posix.c:381
> > 8  0x000055cbb7173ffe in aio_ctx_dispatch (source=0x55cbb7ebba80, callback=0x0, user_data=0x0) at ../util/async.c:311
> > 9  0x00007f30c9c8cdf4 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
> > 10 0x000055cbb71851a2 in glib_pollfds_poll () at ../util/main-loop.c:232
> > 11 0x000055cbb718521c in os_host_main_loop_wait (timeout=42251070366) at ../util/main-loop.c:255
> > 12 0x000055cbb7185321 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> > 13 0x000055cbb6e6ba27 in qemu_main_loop () at ../softmmu/runstate.c:726
> > 14 0x000055cbb6ad6fd7 in main (argc=68, argv=0x7ffc0c578888, envp=0x7ffc0c578ab0) at ../softmmu/main.c:50
> > 
> > To make sure that the send threads could be terminated, IO channels should be
> > shut down to avoid waiting IO.
> > 
> > Signed-off-by: Li Zhang <lizhang@suse.de>
> > ---
> >   migration/multifd.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 7c9deb1921..33f8287969 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -523,6 +523,9 @@ static void multifd_send_terminate_threads(Error *err)
> >           qemu_mutex_lock(&p->mutex);
> >           p->quit = true;
> >           qemu_sem_post(&p->sem);
> > +        if (p->c) {
> > +            qio_channel_shutdown(p->c, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> > +        }
> >           qemu_mutex_unlock(&p->mutex);
> >       }
> >   }
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


