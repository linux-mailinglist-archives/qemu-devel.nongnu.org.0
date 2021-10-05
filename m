Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE3422760
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:07:58 +0200 (CEST)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkAn-00047I-1V
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXk9f-0003PT-ML
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXk9Y-0004Np-Fs
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633439198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K99TBHylgYE+9gr8abVn/wQ8PYE1BluLv4AQlpqbwCY=;
 b=IIj2JXDi0ICMoZLrJMVvRz7V5hWurR4AjeOpYjzya97R5ZIliJNsaLshQE2PdFW7jD38gS
 Avcnr1X4//lFgOdKBNJgIbgj2ObarLcT/5yGayviAhqxQ2gNIj6spwPxearWurREPTU/FU
 X+OFa69X5qAuRdbXD8yw+VxX0Cf7k9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-kD22XSOoOZyfvCtG57nKhA-1; Tue, 05 Oct 2021 09:06:37 -0400
X-MC-Unique: kD22XSOoOZyfvCtG57nKhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C1A100CCC0;
 Tue,  5 Oct 2021 13:06:36 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EBCE5F4EA;
 Tue,  5 Oct 2021 13:06:36 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A8ECC220BDB; Tue,  5 Oct 2021 09:06:35 -0400 (EDT)
Date: Tue, 5 Oct 2021 09:06:35 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 10/13] virtiofsd: Custom threadpool for remote blocking
 posix locks requests
Message-ID: <YVxN21sNt4U8cO64@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-11-vgoyal@redhat.com>
 <YVsVp4rPILhz+/Eh@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVsVp4rPILhz+/Eh@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 03:54:31PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:34AM -0400, Vivek Goyal wrote:
> > Add a new custom threadpool using posix threads that specifically
> > service locking requests.
> > 
> > In the case of a fcntl(SETLKW) request, if the guest is waiting
> > for a lock or locks and issues a hard-reboot through SYSRQ then virtiofsd
> > unblocks the blocked threads by sending a signal to them and waking
> > them up.
> > 
> > The current threadpool (GThreadPool) is not adequate to service the
> > locking requests that result in a thread blocking. That is because
> > GLib does not provide an API to cancel the request while it is
> > serviced by a thread. In addition, a user might be running virtiofsd
> > without a threadpool (--thread-pool-size=0), thus a locking request
> > that blocks, will block the main virtqueue thread that services requests
> > from servicing any other requests.
> > 
> > The only exception occurs when the lock is of type F_UNLCK. In this case
> > the request is serviced by the main virtqueue thread or a GThreadPool
> > thread to avoid a deadlock, when all the threads in the custom threadpool
> > are blocked.
> > 
> > Then virtiofsd proceeds to cleanup the state of the threads, release
> > them back to the system and re-initialize.
> 
> Is there another way to cancel SETLKW without resorting to a new thread
> pool? Since this only matters when shutting down or restarting, can we
> close all plock->fd file descriptors to kick the GThreadPool workers out
> of fnctl()?

I don't think that closing plock->fd will unblock fcntl().  

SYSCALL_DEFINE3(fcntl, unsigned int, fd, unsigned int, cmd, unsigned long, arg)
{
        struct fd f = fdget_raw(fd);
}

IIUC, fdget_raw() will take a reference on associated "struct file" and
after that rest of the code will work with that "struct file".

static int do_lock_file_wait(struct file *filp, unsigned int cmd,
                             struct file_lock *fl)
{
..
..
                error = wait_event_interruptible(fl->fl_wait,
                                        list_empty(&fl->fl_blocked_member));

..
..
}

And this shoudl break upon receiving signal. And man page says the
same thing.

       F_OFD_SETLKW (struct flock *)
              As for F_OFD_SETLK, but if a conflicting lock  is  held  on  the
              file,  then  wait  for that lock to be released.  If a signal is
              caught while waiting, then the call is  interrupted  and  (after
              the  signal  handler has returned) returns immediately (with re‐
              turn value -1 and errno set to EINTR; see signal(7)).

It would be nice if we don't have to implement our own custom threadpool
just for locking. Would have been better if glib thread pool provided
some facility for this.

[..]
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index 3b720c5d4a..c67c2e0e7a 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -20,6 +20,7 @@
> >  #include "fuse_misc.h"
> >  #include "fuse_opt.h"
> >  #include "fuse_virtio.h"
> > +#include "tpool.h"
> >  
> >  #include <sys/eventfd.h>
> >  #include <sys/socket.h>
> > @@ -612,6 +613,60 @@ out:
> >      free(req);
> >  }
> >  
> > +/*
> > + * If the request is a locking request, use a custom locking thread pool.
> > + */
> > +static bool use_lock_tpool(gpointer data, gpointer user_data)
> > +{
> > +    struct fv_QueueInfo *qi = user_data;
> > +    struct fuse_session *se = qi->virtio_dev->se;
> > +    FVRequest *req = data;
> > +    VuVirtqElement *elem = &req->elem;
> > +    struct fuse_buf fbuf = {};
> > +    struct fuse_in_header *inhp;
> > +    struct fuse_lk_in *lkinp;
> > +    size_t lk_req_len;
> > +    /* The 'out' part of the elem is from qemu */
> > +    unsigned int out_num = elem->out_num;
> > +    struct iovec *out_sg = elem->out_sg;
> > +    size_t out_len = iov_size(out_sg, out_num);
> > +    bool use_custom_tpool = false;
> > +
> > +    /*
> > +     * If notifications are not enabled, no point in using cusotm lock
> > +     * thread pool.
> > +     */
> > +    if (!se->notify_enabled) {
> > +        return false;
> > +    }
> > +
> > +    assert(se->bufsize > sizeof(struct fuse_in_header));
> > +    lk_req_len = sizeof(struct fuse_in_header) + sizeof(struct fuse_lk_in);
> > +
> > +    if (out_len < lk_req_len) {
> > +        return false;
> > +    }
> > +
> > +    fbuf.mem = g_malloc(se->bufsize);
> > +    copy_from_iov(&fbuf, out_num, out_sg, lk_req_len);
> 
> This looks inefficient: for every FUSE request we now malloc se->bufsize
> and then copy lk_req_len bytes, only to free the memory again.
> 
> Is it possible to keep lk_req_len bytes on the stack instead?

I guess it should be possible. se->bufsize is variable but lk_req_len
is known at compile time.

lk_req_len = sizeof(struct fuse_in_header) + sizeof(struct fuse_lk_in);

So we should be able to allocate this much space on stack and point
fbuf.mem to it.

char buf[sizeof(struct fuse_in_header) + sizeof(struct fuse_lk_in)];
fbuf.mem = buf;

Will give it a try.

Vivek


