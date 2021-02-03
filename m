Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C351630DFE8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:42:00 +0100 (CET)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LE7-0008KW-PH
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l7L1x-0004tj-Fj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:29:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l7L1v-0003RT-Fj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gZvaZGyMsAdRlQYagAIbZ4mbbCF0fkX5zslSmVG60hU=;
 b=EPVBdUYJBRZEZs1k4UIFA9lOvgSBKIHOIxjzgFtUvD1ZOu1YUgxvCJlOVP2cUaM4GRlt+y
 mwvDt/dVXDrJYorvSa1aNuvakmBGwp1NRB8nAz8VNwFMAg8CWeTEilEmhLTt1s4lmvnrnW
 bJNJcHBvbS3dVfxNgQa6MNAxBeeUnXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-7kAQ09EQP-SNhkpIExQ-mQ-1; Wed, 03 Feb 2021 11:29:21 -0500
X-MC-Unique: 7kAQ09EQP-SNhkpIExQ-mQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31F17107ACE3;
 Wed,  3 Feb 2021 16:29:20 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-88.rdu2.redhat.com [10.10.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E74125885D;
 Wed,  3 Feb 2021 16:29:15 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7F62222054F; Wed,  3 Feb 2021 11:29:15 -0500 (EST)
Date: Wed, 3 Feb 2021 11:29:15 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: vu_dispatch locking should never fail
Message-ID: <20210203162915.GD3307@redhat.com>
References: <20210129155312.595980-1-groug@kaod.org>
 <20210203155934.GB3307@redhat.com>
 <20210203170857.626224b0@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210203170857.626224b0@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 05:08:57PM +0100, Greg Kurz wrote:
> On Wed, 3 Feb 2021 10:59:34 -0500
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > On Fri, Jan 29, 2021 at 04:53:12PM +0100, Greg Kurz wrote:
> > > pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
> > > deadlock condition is detected or the current thread already owns
> > > the lock. They can also fail, like pthread_rwlock_unlock(), if the
> > > mutex wasn't properly initialized. None of these are ever expected
> > > to happen with fv_VuDev::vu_dispatch_rwlock.
> > > 
> > > Some users already check the return value and assert, some others
> > > don't. Introduce rdlock/wrlock/unlock wrappers that just do the
> > > former and use them everywhere.
> > > 
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >  tools/virtiofsd/fuse_virtio.c | 42 +++++++++++++++++++++++------------
> > >  1 file changed, 28 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > > index ddcefee4272f..7ea269c4b65d 100644
> > > --- a/tools/virtiofsd/fuse_virtio.c
> > > +++ b/tools/virtiofsd/fuse_virtio.c
> > > @@ -187,6 +187,24 @@ static void copy_iov(struct iovec *src_iov, int src_count,
> > >      }
> > >  }
> > >  
> > > +/*
> > > + * pthread_rwlock_rdlock() and pthread_rwlock_wrlock can fail if
> > > + * a deadlock condition is detected or the current thread already
> > > + * owns the lock. They can also fail, like pthread_rwlock_unlock(),
> > > + * if the mutex wasn't properly initialized. None of these are ever
> > > + * expected to happen.
> > > + */
> > > +#define VU_DISPATCH_LOCK_OP(op)                              \
> > > +static inline void vu_dispatch_##op(struct fv_VuDev *vud)    \
> > > +{                                                            \
> > > +    int ret = pthread_rwlock_##op(&vud->vu_dispatch_rwlock); \
> > > +    assert(ret == 0);                                        \
> > > +}
> > > +
> > > +VU_DISPATCH_LOCK_OP(rdlock);
> > > +VU_DISPATCH_LOCK_OP(wrlock);
> > > +VU_DISPATCH_LOCK_OP(unlock);
> > > +
> > 
> > I generally do not prefer using macros to define functions as searching
> > to functions declarations/definitions becomes harder. But I see lot
> > of people prefer that because they can reduce number of lines of code.
> > 
> 
> Well, I must admit I hesitated since this doesn't gain much in
> terms of LoC compared to the expanded version. I'm perfectly
> fine with dropping the macro in my v2 if this looks better
> to you.

If you are posting V2 anyway, so lets do it. Agreed, we are not saving
many lines where so why to use macros to define functions.

Vivek

> 
> > Apart from that one issue of using rdlock in fv_queue_thread(), stefan
> > pointed, it looks good to me.
> > 
> > Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
> > 
> > Vivek
> > >  /*
> > >   * Called back by ll whenever it wants to send a reply/message back
> > >   * The 1st element of the iov starts with the fuse_out_header
> > > @@ -240,12 +258,12 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
> > >  
> > >      copy_iov(iov, count, in_sg, in_num, tosend_len);
> > >  
> > > -    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > +    vu_dispatch_rdlock(qi->virtio_dev);
> > >      pthread_mutex_lock(&qi->vq_lock);
> > >      vu_queue_push(dev, q, elem, tosend_len);
> > >      vu_queue_notify(dev, q);
> > >      pthread_mutex_unlock(&qi->vq_lock);
> > > -    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > +    vu_dispatch_unlock(qi->virtio_dev);
> > >  
> > >      req->reply_sent = true;
> > >  
> > > @@ -403,12 +421,12 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
> > >  
> > >      ret = 0;
> > >  
> > > -    pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > +    vu_dispatch_rdlock(qi->virtio_dev);
> > >      pthread_mutex_lock(&qi->vq_lock);
> > >      vu_queue_push(dev, q, elem, tosend_len);
> > >      vu_queue_notify(dev, q);
> > >      pthread_mutex_unlock(&qi->vq_lock);
> > > -    pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > +    vu_dispatch_unlock(qi->virtio_dev);
> > >  
> > >  err:
> > >      if (ret == 0) {
> > > @@ -558,12 +576,12 @@ out:
> > >          fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n", __func__,
> > >                   elem->index);
> > >  
> > > -        pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > +        vu_dispatch_rdlock(qi->virtio_dev);
> > >          pthread_mutex_lock(&qi->vq_lock);
> > >          vu_queue_push(dev, q, elem, 0);
> > >          vu_queue_notify(dev, q);
> > >          pthread_mutex_unlock(&qi->vq_lock);
> > > -        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > +        vu_dispatch_unlock(qi->virtio_dev);
> > >      }
> > >  
> > >      pthread_mutex_destroy(&req->ch.lock);
> > > @@ -596,7 +614,6 @@ static void *fv_queue_thread(void *opaque)
> > >               qi->qidx, qi->kick_fd);
> > >      while (1) {
> > >          struct pollfd pf[2];
> > > -        int ret;
> > >  
> > >          pf[0].fd = qi->kick_fd;
> > >          pf[0].events = POLLIN;
> > > @@ -645,8 +662,7 @@ static void *fv_queue_thread(void *opaque)
> > >              break;
> > >          }
> > >          /* Mutual exclusion with virtio_loop() */
> > > -        ret = pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > -        assert(ret == 0); /* there is no possible error case */
> > > +        vu_dispatch_wrlock(qi->virtio_dev);
> > >          pthread_mutex_lock(&qi->vq_lock);
> > >          /* out is from guest, in is too guest */
> > >          unsigned int in_bytes, out_bytes;
> > > @@ -672,7 +688,7 @@ static void *fv_queue_thread(void *opaque)
> > >          }
> > >  
> > >          pthread_mutex_unlock(&qi->vq_lock);
> > > -        pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
> > > +        vu_dispatch_unlock(qi->virtio_dev);
> > >  
> > >          /* Process all the requests. */
> > >          if (!se->thread_pool_size && req_list != NULL) {
> > > @@ -799,7 +815,6 @@ int virtio_loop(struct fuse_session *se)
> > >      while (!fuse_session_exited(se)) {
> > >          struct pollfd pf[1];
> > >          bool ok;
> > > -        int ret;
> > >          pf[0].fd = se->vu_socketfd;
> > >          pf[0].events = POLLIN;
> > >          pf[0].revents = 0;
> > > @@ -825,12 +840,11 @@ int virtio_loop(struct fuse_session *se)
> > >          assert(pf[0].revents & POLLIN);
> > >          fuse_log(FUSE_LOG_DEBUG, "%s: Got VU event\n", __func__);
> > >          /* Mutual exclusion with fv_queue_thread() */
> > > -        ret = pthread_rwlock_wrlock(&se->virtio_dev->vu_dispatch_rwlock);
> > > -        assert(ret == 0); /* there is no possible error case */
> > > +        vu_dispatch_wrlock(se->virtio_dev);
> > >  
> > >          ok = vu_dispatch(&se->virtio_dev->dev);
> > >  
> > > -        pthread_rwlock_unlock(&se->virtio_dev->vu_dispatch_rwlock);
> > > +        vu_dispatch_unlock(se->virtio_dev);
> > >  
> > >          if (!ok) {
> > >              fuse_log(FUSE_LOG_ERR, "%s: vu_dispatch failed\n", __func__);
> > > -- 
> > > 2.26.2
> > > 
> > 
> 


