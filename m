Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA3330DF3F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:10:41 +0100 (CET)
Received: from localhost ([::1]:54178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Kjo-0001Uu-Vw
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KiO-00006V-6f
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:09:12 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:59211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KiI-0007Ft-7a
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:09:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id B260B88BF978;
 Wed,  3 Feb 2021 17:09:02 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 17:09:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003bcbdfd7f-7ae3-4027-aa48-9e3807e7a170,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 17:08:57 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: vu_dispatch locking should never fail
Message-ID: <20210203170857.626224b0@bahia.lan>
In-Reply-To: <20210203155934.GB3307@redhat.com>
References: <20210129155312.595980-1-groug@kaod.org>
 <20210203155934.GB3307@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0cc127aa-9553-4cc8-bacc-82b1fac181cf
X-Ovh-Tracer-Id: 14600107044152056288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepshhtvghfrghnhhgrsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 10:59:34 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Fri, Jan 29, 2021 at 04:53:12PM +0100, Greg Kurz wrote:
> > pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
> > deadlock condition is detected or the current thread already owns
> > the lock. They can also fail, like pthread_rwlock_unlock(), if the
> > mutex wasn't properly initialized. None of these are ever expected
> > to happen with fv_VuDev::vu_dispatch_rwlock.
> > 
> > Some users already check the return value and assert, some others
> > don't. Introduce rdlock/wrlock/unlock wrappers that just do the
> > former and use them everywhere.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  tools/virtiofsd/fuse_virtio.c | 42 +++++++++++++++++++++++------------
> >  1 file changed, 28 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index ddcefee4272f..7ea269c4b65d 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -187,6 +187,24 @@ static void copy_iov(struct iovec *src_iov, int src_count,
> >      }
> >  }
> >  
> > +/*
> > + * pthread_rwlock_rdlock() and pthread_rwlock_wrlock can fail if
> > + * a deadlock condition is detected or the current thread already
> > + * owns the lock. They can also fail, like pthread_rwlock_unlock(),
> > + * if the mutex wasn't properly initialized. None of these are ever
> > + * expected to happen.
> > + */
> > +#define VU_DISPATCH_LOCK_OP(op)                              \
> > +static inline void vu_dispatch_##op(struct fv_VuDev *vud)    \
> > +{                                                            \
> > +    int ret = pthread_rwlock_##op(&vud->vu_dispatch_rwlock); \
> > +    assert(ret == 0);                                        \
> > +}
> > +
> > +VU_DISPATCH_LOCK_OP(rdlock);
> > +VU_DISPATCH_LOCK_OP(wrlock);
> > +VU_DISPATCH_LOCK_OP(unlock);
> > +
> 
> I generally do not prefer using macros to define functions as searching
> to functions declarations/definitions becomes harder. But I see lot
> of people prefer that because they can reduce number of lines of code.
> 

Well, I must admit I hesitated since this doesn't gain much in
terms of LoC compared to the expanded version. I'm perfectly
fine with dropping the macro in my v2 if this looks better
to you.

> Apart from that one issue of using rdlock in fv_queue_thread(), stefan
> pointed, it looks good to me.
> 
> Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> 
> Vivek
> >  /*
> >   * Called back by ll whenever it wants to send a reply/message back
> >   * The 1st element of the iov starts with the fuse_out_header
> > @@ -240,12 +258,12 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
> >  
> >      copy_iov(iov, count, in_sg, in_num, tosend_len);
> >  
> > -    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > +    vu_dispatch_rdlock(qi->virtio_dev);
> >      pthread_mutex_lock(&qi->vq_lock);
> >      vu_queue_push(dev, q, elem, tosend_len);
> >      vu_queue_notify(dev, q);
> >      pthread_mutex_unlock(&qi->vq_lock);
> > -    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > +    vu_dispatch_unlock(qi->virtio_dev);
> >  
> >      req->reply_sent = true;
> >  
> > @@ -403,12 +421,12 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
> >  
> >      ret = 0;
> >  
> > -    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > +    vu_dispatch_rdlock(qi->virtio_dev);
> >      pthread_mutex_lock(&qi->vq_lock);
> >      vu_queue_push(dev, q, elem, tosend_len);
> >      vu_queue_notify(dev, q);
> >      pthread_mutex_unlock(&qi->vq_lock);
> > -    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > +    vu_dispatch_unlock(qi->virtio_dev);
> >  
> >  err:
> >      if (ret == 0) {
> > @@ -558,12 +576,12 @@ out:
> >          fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n", __func__,
> >                   elem->index);
> >  
> > -        pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > +        vu_dispatch_rdlock(qi->virtio_dev);
> >          pthread_mutex_lock(&qi->vq_lock);
> >          vu_queue_push(dev, q, elem, 0);
> >          vu_queue_notify(dev, q);
> >          pthread_mutex_unlock(&qi->vq_lock);
> > -        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > +        vu_dispatch_unlock(qi->virtio_dev);
> >      }
> >  
> >      pthread_mutex_destroy(&req->ch.lock);
> > @@ -596,7 +614,6 @@ static void *fv_queue_thread(void *opaque)
> >               qi->qidx, qi->kick_fd);
> >      while (1) {
> >          struct pollfd pf[2];
> > -        int ret;
> >  
> >          pf[0].fd = qi->kick_fd;
> >          pf[0].events = POLLIN;
> > @@ -645,8 +662,7 @@ static void *fv_queue_thread(void *opaque)
> >              break;
> >          }
> >          /* Mutual exclusion with virtio_loop() */
> > -        ret = pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > -        assert(ret == 0); /* there is no possible error case */
> > +        vu_dispatch_wrlock(qi->virtio_dev);
> >          pthread_mutex_lock(&qi->vq_lock);
> >          /* out is from guest, in is too guest */
> >          unsigned int in_bytes, out_bytes;
> > @@ -672,7 +688,7 @@ static void *fv_queue_thread(void *opaque)
> >          }
> >  
> >          pthread_mutex_unlock(&qi->vq_lock);
> > -        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > +        vu_dispatch_unlock(qi->virtio_dev);
> >  
> >          /* Process all the requests. */
> >          if (!se->thread_pool_size && req_list != NULL) {
> > @@ -799,7 +815,6 @@ int virtio_loop(struct fuse_session *se)
> >      while (!fuse_session_exited(se)) {
> >          struct pollfd pf[1];
> >          bool ok;
> > -        int ret;
> >          pf[0].fd = se->vu_socketfd;
> >          pf[0].events = POLLIN;
> >          pf[0].revents = 0;
> > @@ -825,12 +840,11 @@ int virtio_loop(struct fuse_session *se)
> >          assert(pf[0].revents & POLLIN);
> >          fuse_log(FUSE_LOG_DEBUG, "%s: Got VU event\n", __func__);
> >          /* Mutual exclusion with fv_queue_thread() */
> > -        ret = pthread_rwlock_wrlock(&se->virtio_dev->vu_dispatch_rwlock);
> > -        assert(ret == 0); /* there is no possible error case */
> > +        vu_dispatch_wrlock(se->virtio_dev);
> >  
> >          ok = vu_dispatch(&se->virtio_dev->dev);
> >  
> > -        pthread_rwlock_unlock(&se->virtio_dev->vu_dispatch_rwlock);
> > +        vu_dispatch_unlock(se->virtio_dev);
> >  
> >          if (!ok) {
> >              fuse_log(FUSE_LOG_ERR, "%s: vu_dispatch failed\n", __func__);
> > -- 
> > 2.26.2
> > 
> 


