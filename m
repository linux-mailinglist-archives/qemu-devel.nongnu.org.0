Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A072422CBA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:39:46 +0200 (CEST)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmXh-0004MR-MC
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXm9H-0000G6-VB
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXm9D-0001ft-If
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KHkKDb5rexrQsOH8tUHzsfWraXI78tmgoD3et8ZH3LA=;
 b=ZcxA5TgEjBFLf1Ei/IpNXB+L13bqGgxHyxSF+zD3OCkCAjZ1ec3zHHzIuLuuSJPFHAHfWy
 9s+WI1ZPBIRCrbizrrDi1UFBlGQ0jXSJxbxlxpovGT3HDCDK/jrJ2xLbK/bpMrm4GPM+bd
 rogiVALLs6WMe4aEq9xbgynJEWc0gnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-ZbCWtJXbMIml6Tgp1-5XCw-1; Tue, 05 Oct 2021 11:14:24 -0400
X-MC-Unique: ZbCWtJXbMIml6Tgp1-5XCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A32E51054F9A;
 Tue,  5 Oct 2021 15:14:20 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54AE1104326D;
 Tue,  5 Oct 2021 15:14:20 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E278E220BDB; Tue,  5 Oct 2021 11:14:19 -0400 (EDT)
Date: Tue, 5 Oct 2021 11:14:19 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 12/13] virtiofsd: Implement blocking posix locks
Message-ID: <YVxry2jXWs2wj/Ur@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-13-vgoyal@redhat.com>
 <YVxDferEMGA3cE8D@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVxDferEMGA3cE8D@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Tue, Oct 05, 2021 at 01:22:21PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:36AM -0400, Vivek Goyal wrote:
> > As of now we don't support fcntl(F_SETLKW) and if we see one, we return
> > -EOPNOTSUPP.
> > 
> > Change that by accepting these requests and returning a reply
> > immediately asking caller to wait. Once lock is available, send a
> > notification to the waiter indicating lock is available.
> > 
> > In response to lock request, we are returning error value as "1", which
> > signals to client to queue the lock request internally and later client
> > will get a notification which will signal lock is taken (or error). And
> > then fuse client should wake up the guest process.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > Signed-off-by: Ioannis Angelakopoulos <iangelak@redhat.com>
> > ---
> >  tools/virtiofsd/fuse_lowlevel.c  | 37 ++++++++++++++++-
> >  tools/virtiofsd/fuse_lowlevel.h  | 26 ++++++++++++
> >  tools/virtiofsd/fuse_virtio.c    | 50 ++++++++++++++++++++---
> >  tools/virtiofsd/passthrough_ll.c | 70 ++++++++++++++++++++++++++++----
> >  4 files changed, 167 insertions(+), 16 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > index e4679c73ab..2e7f4b786d 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -179,8 +179,8 @@ int fuse_send_reply_iov_nofree(fuse_req_t req, int error, struct iovec *iov,
> >          .unique = req->unique,
> >          .error = error,
> >      };
> > -
> > -    if (error <= -1000 || error > 0) {
> > +    /* error = 1 has been used to signal client to wait for notificaiton */
> > +    if (error <= -1000 || error > 1) {
> >          fuse_log(FUSE_LOG_ERR, "fuse: bad error value: %i\n", error);
> >          out.error = -ERANGE;
> >      }
> > @@ -290,6 +290,11 @@ int fuse_reply_err(fuse_req_t req, int err)
> >      return send_reply(req, -err, NULL, 0);
> >  }
> >  
> > +int fuse_reply_wait(fuse_req_t req)
> > +{
> > +    return send_reply(req, 1, NULL, 0);
> > +}
> > +
> >  void fuse_reply_none(fuse_req_t req)
> >  {
> >      fuse_free_req(req);
> > @@ -2165,6 +2170,34 @@ static void do_destroy(fuse_req_t req, fuse_ino_t nodeid,
> >      send_reply_ok(req, NULL, 0);
> >  }
> >  
> > +static int send_notify_iov(struct fuse_session *se, int notify_code,
> > +                           struct iovec *iov, int count)
> > +{
> > +    struct fuse_out_header out;
> > +    if (!se->got_init) {
> > +        return -ENOTCONN;
> > +    }
> > +    out.unique = 0;
> > +    out.error = notify_code;
> > +    iov[0].iov_base = &out;
> > +    iov[0].iov_len = sizeof(struct fuse_out_header);
> > +    return fuse_send_msg(se, NULL, iov, count);
> > +}
> > +
> > +int fuse_lowlevel_notify_lock(struct fuse_session *se, uint64_t unique,
> > +                  int32_t error)
> > +{
> > +    struct fuse_notify_lock_out outarg = {0};
> > +    struct iovec iov[2];
> > +
> > +    outarg.unique = unique;
> > +    outarg.error = -error;
> > +
> > +    iov[1].iov_base = &outarg;
> > +    iov[1].iov_len = sizeof(outarg);
> > +    return send_notify_iov(se, FUSE_NOTIFY_LOCK, iov, 2);
> > +}
> > +
> >  int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
> >                                 off_t offset, struct fuse_bufvec *bufv)
> >  {
> > diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> > index c55c0ca2fc..64624b48dc 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.h
> > +++ b/tools/virtiofsd/fuse_lowlevel.h
> > @@ -1251,6 +1251,22 @@ struct fuse_lowlevel_ops {
> >   */
> >  int fuse_reply_err(fuse_req_t req, int err);
> >  
> > +/**
> > + * Ask caller to wait for lock.
> > + *
> > + * Possible requests:
> > + *   setlkw
> > + *
> > + * If caller sends a blocking lock request (setlkw), then reply to caller
> > + * that wait for lock to be available. Once lock is available caller will
> 
> I can't parse the first sentence.
> 
> s/that wait for lock to be available/that waiting for the lock is
> necessary/?

Ok, will change it.

> 
> > + * receive a notification with request's unique id. Notification will
> > + * carry info whether lock was successfully obtained or not.
> > + *
> > + * @param req request handle
> > + * @return zero for success, -errno for failure to send reply
> > + */
> > +int fuse_reply_wait(fuse_req_t req);
> > +
> >  /**
> >   * Don't send reply
> >   *
> > @@ -1685,6 +1701,16 @@ int fuse_lowlevel_notify_delete(struct fuse_session *se, fuse_ino_t parent,
> >  int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
> >                                 off_t offset, struct fuse_bufvec *bufv);
> >  
> > +/**
> > + * Notify event related to previous lock request
> > + *
> > + * @param se the session object
> > + * @param unique the unique id of the request which requested setlkw
> > + * @param error zero for success, -errno for the failure
> > + */
> > +int fuse_lowlevel_notify_lock(struct fuse_session *se, uint64_t unique,
> > +                              int32_t error);
> > +
> >  /*
> >   * Utility functions
> >   */
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index a87e88e286..bb2d4456fc 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -273,6 +273,23 @@ static void vq_send_element(struct fv_QueueInfo *qi, VuVirtqElement *elem,
> >      vu_dispatch_unlock(qi->virtio_dev);
> >  }
> >  
> > +/* Returns NULL if queue is empty */
> > +static FVRequest *vq_pop_notify_elem(struct fv_QueueInfo *qi)
> > +{
> > +    struct fuse_session *se = qi->virtio_dev->se;
> > +    VuDev *dev = &se->virtio_dev->dev;
> > +    VuVirtq *q = vu_get_queue(dev, qi->qidx);
> > +    FVRequest *req;
> > +
> > +    vu_dispatch_rdlock(qi->virtio_dev);
> > +    pthread_mutex_lock(&qi->vq_lock);
> > +    /* Pop an element from queue */
> > +    req = vu_queue_pop(dev, q, sizeof(FVRequest));
> > +    pthread_mutex_unlock(&qi->vq_lock);
> > +    vu_dispatch_unlock(qi->virtio_dev);
> > +    return req;
> > +}
> > +
> >  /*
> >   * Called back by ll whenever it wants to send a reply/message back
> >   * The 1st element of the iov starts with the fuse_out_header
> > @@ -281,9 +298,9 @@ static void vq_send_element(struct fv_QueueInfo *qi, VuVirtqElement *elem,
> >  int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
> >                      struct iovec *iov, int count)
> >  {
> > -    FVRequest *req = container_of(ch, FVRequest, ch);
> > -    struct fv_QueueInfo *qi = ch->qi;
> > -    VuVirtqElement *elem = &req->elem;
> > +    FVRequest *req;
> > +    struct fv_QueueInfo *qi;
> > +    VuVirtqElement *elem;
> >      int ret = 0;
> >  
> >      assert(count >= 1);
> > @@ -294,8 +311,30 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
> >  
> >      size_t tosend_len = iov_size(iov, count);
> >  
> > -    /* unique == 0 is notification, which we don't support */
> > -    assert(out->unique);
> > +    /* unique == 0 is notification */
> > +    if (!out->unique) {
> 
> Is a check needed in fuse_session_process_buf_int() to reject requests
> that the driver submitted to the device with req.unique == 0? If we get
> confused about the correct virtqueue to use in virtio_send_msg() then
> there could be bugs.

Ok. Should we abort/exit virtiofsd if fuse_session_process_buf_int()
gets a request with unique=0. If we try to reply to it instead, then
I will have to carve out a separate path which does not interpret
unique=0 as notification request instead.

> 
> > +        if (!se->notify_enabled) {
> > +            return -EOPNOTSUPP;
> > +        }
> > +        /* If notifications are enabled, queue index 1 is notification queue */
> > +        qi = se->virtio_dev->qi[1];
> > +        req = vq_pop_notify_elem(qi);
> 
> Where is req freed?

I think we are not freeing req in case of notification. Good catch.
Will fix it.

> 
> > +        if (!req) {
> > +            /*
> > +             * TODO: Implement some sort of ring buffer and queue notifications
> > +             * on that and send these later when notification queue has space
> > +             * available.
> > +             */
> > +            return -ENOSPC;
> 
> This needs to be addressed before this patch series can be merged. The
> notification vq is kicked by the guest driver when buffers are
> replenished. The vq handler function can wake up waiting threads using a
> condvar.

I have taken care of this using by polling in a loop (with sleep
in between). Just that sleeping on a variable and subsequent wake
up will be more efficient.

> 
> > +        }
> > +        req->reply_sent = false;
> > +    } else {
> > +        assert(ch);
> > +        req = container_of(ch, FVRequest, ch);
> > +        qi = ch->qi;
> > +    }
> > +
> > +    elem = &req->elem;
> >      assert(!req->reply_sent);
> >  
> >      /* The 'in' part of the elem is to qemu */
> > @@ -985,6 +1024,7 @@ static int fv_get_config(VuDev *dev, uint8_t *config, uint32_t len)
> >          struct fuse_notify_delete_out       delete_out;
> >          struct fuse_notify_store_out        store_out;
> >          struct fuse_notify_retrieve_out     retrieve_out;
> > +        struct fuse_notify_lock_out         lock_out;
> >      };
> >  
> >      notify_size = sizeof(struct fuse_out_header) +
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 6928662e22..277f74762b 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -2131,13 +2131,35 @@ out:
> >      }
> >  }
> >  
> > +static void setlk_send_notification(struct fuse_session *se, uint64_t unique,
> > +                                    int saverr)
> > +{
> > +    int ret;
> > +
> > +    do {
> > +        ret = fuse_lowlevel_notify_lock(se, unique, saverr);
> > +        /*
> > +         * Retry sending notification if notification queue does not have
> > +         * free descriptor yet, otherwise break out of loop. Either we
> > +         * successfully sent notifiation or some other error occurred.
> > +         */
> > +        if (ret != -ENOSPC) {
> > +            break;
> > +        }
> > +        usleep(10000);
> > +    } while (1);
> 
> Please use the notification vq handler to wake up blocked threads
> instead of usleep().

Ok, I will look into it. This will be more code. First thing I can
see that I have not started a thread for notification queue. Looks
like I will have to start one so that that thread can see queue
kicks and if qemu is going away. And wake up waiters.

> 
> > +}
> > +
> >  static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
> >                       struct flock *lock, int sleep)
> >  {
> >      struct lo_data *lo = lo_data(req);
> >      struct lo_inode *inode;
> >      struct lo_inode_plock *plock;
> > -    int ret, saverr = 0;
> > +    int ret, saverr = 0, ofd;
> > +    uint64_t unique;
> > +    struct fuse_session *se = req->se;
> > +    bool blocking_lock = false;
> >  
> >      fuse_log(FUSE_LOG_DEBUG,
> >               "lo_setlk(ino=%" PRIu64 ", flags=%d)"
> > @@ -2151,11 +2173,6 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
> >          return;
> >      }
> >  
> > -    if (sleep) {
> > -        fuse_reply_err(req, EOPNOTSUPP);
> > -        return;
> > -    }
> > -
> >      inode = lo_inode(req, ino);
> >      if (!inode) {
> >          fuse_reply_err(req, EBADF);
> > @@ -2168,21 +2185,56 @@ static void lo_setlk(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi,
> >  
> >      if (!plock) {
> >          saverr = ret;
> > +        pthread_mutex_unlock(&inode->plock_mutex);
> >          goto out;
> >      }
> >  
> > +    /*
> > +     * plock is now released when inode is going away. We already have
> > +     * a reference on inode, so it is guaranteed that plock->fd is
> > +     * still around even after dropping inode->plock_mutex lock
> > +     */
> > +    ofd = plock->fd;
> > +    pthread_mutex_unlock(&inode->plock_mutex);
> > +
> > +    /*
> > +     * If this lock request can block, request caller to wait for
> > +     * notification. Do not access req after this. Once lock is
> > +     * available, send a notification instead.
> > +     */
> > +    if (sleep && lock->l_type != F_UNLCK) {
> > +        /*
> > +         * If notification queue is not enabled, can't support async
> > +         * locks.
> > +         */
> > +        if (!se->notify_enabled) {
> > +            saverr = EOPNOTSUPP;
> > +            goto out;
> > +        }
> > +        blocking_lock = true;
> > +        unique = req->unique;
> > +        fuse_reply_wait(req);
> > +    }
> > +
> >      /* TODO: Is it alright to modify flock? */
> >      lock->l_pid = 0;
> > -    ret = fcntl(plock->fd, F_OFD_SETLK, lock);
> > +    if (blocking_lock) {
> > +        ret = fcntl(ofd, F_OFD_SETLKW, lock);
> 
> SETLKW can be interrupted by signals. Should we loop here when errno ==
> EINTR?

So there are two cases. In some cases we want to bail out because
qemu has forced reboot kernel, and we have sent signal to this
thread so that it stops waiting.

Other use case is that some other external entity sends signal to
virtiofsd thread. In that case we are relying sending -EINTR to
client and let client restart the syscall and send request again.

In future probably we can keep track of state whether we want
to return on -EINTR or should call fcntl() again if that helps.

Thanks
Vivek

> 
> > +    } else {
> > +        ret = fcntl(ofd, F_OFD_SETLK, lock);
> > +    }
> >      if (ret == -1) {
> >          saverr = errno;
> >      }
> >  
> >  out:
> > -    pthread_mutex_unlock(&inode->plock_mutex);
> >      lo_inode_put(lo, &inode);
> >  
> > -    fuse_reply_err(req, saverr);
> > +    if (!blocking_lock) {
> > +        fuse_reply_err(req, saverr);
> > +    } else {
> > +        setlk_send_notification(se, unique, saverr);
> > +    }
> >  }
> >  
> >  static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
> > -- 
> > 2.31.1
> > 



