Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7330465E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 19:35:25 +0100 (CET)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4TBT-00056v-LG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 13:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l4TA7-00048W-V4
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:33:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l4TA6-0000xH-0v
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611686037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TgpmBkWBVNoIZ892ZJzFn4RzfUEPBIT2DlJa+TfByXo=;
 b=L+G7BvlNhUNraENWUZROpTQkxCLMFodHnufdtu2ewhxX5uPxLhbkyF4uC2u677c8KaHswE
 ANyzRsbaPCp5FKKL6YDVtpOgSMnorIB9ZCMUiEh8ri4zUK6fHGOZZi5HVbc11kJpQvJ+DJ
 fMdU7fXVjOtsIcCSxDa4grVEOTvlpZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-qEQgX7auMUqqeVqdQDrIVA-1; Tue, 26 Jan 2021 13:33:55 -0500
X-MC-Unique: qEQgX7auMUqqeVqdQDrIVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15345801AA3;
 Tue, 26 Jan 2021 18:33:54 +0000 (UTC)
Received: from horse.redhat.com (ovpn-118-68.rdu2.redhat.com [10.10.118.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 820B260C47;
 Tue, 26 Jan 2021 18:33:42 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id F2ADF220BCF; Tue, 26 Jan 2021 13:33:36 -0500 (EST)
Date: Tue, 26 Jan 2021 13:33:36 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/6] virtiofsd: Drop ->vu_dispatch_rwlock while waiting
 for thread to exit
Message-ID: <20210126183336.GB3239@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-2-vgoyal@redhat.com>
 <20210126165600.7bbe369d@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210126165600.7bbe369d@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 04:56:00PM +0100, Greg Kurz wrote:
> On Mon, 25 Jan 2021 13:01:10 -0500
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > When we are shutting down virtqueues, virtio_loop() receives a message
> > VHOST_USER_GET_VRING_BASE from master. We acquire ->vu_dispatch_rwlock
> > and get into the process of shutting down virtqueue. In one of the
> > final steps, we are waiting for fv_queue_thread() to exit/finish and
> > wait with ->vu_dispatch_rwlock held.
> > 
> > But it is possible that fv_queue_thread() itself is waiting to get
> > ->vu_dispatch_rwlock (With --thread-pool=0 option). If requests
> > are being processed by fv_queue_worker(), then fv_queue_worker()
> > can wait for the ->vu_dispatch_rwlock, and fv_queue_thread() will
> > wait for fv_queue_worker() before thread pool can be stopped.
> > 
> > IOW, if guest is shutdown uncleanly (some sort of emergency reboot),
> > it is possible that virtiofsd is processing a fs request and
> > qemu initiates device shutdown sequence. In that case there seem
> > to be two options. Either abort the existing request completely or
> > let existing request finish.
> > 
> > This patch is taking second approach. That is drop the ->vu_dispatch_rwlock
> > temporarily so that fv_queue_thread() can finish and deadlock does not
> > happen.
> > 
> > ->vu_dispatch_rwlock provides mutual exclusion between virtio_loop()
> > (handling vhost-user protocol messages) and fv_queue_thread() (handling
> > fuse filesystem requests). Rational seems to be that protocol message
> > might change queue memory mappings, so we don't want both to proceed
> > at the same time.
> > 
> > In this case queue is shutting down, so I hope it is fine for fv_queue_thread() to send response back while virtio_loop() is still waiting (and not handling
> 
> It looks this lacks a \n after "fine for"

Hi Greg,

Will fix.

> 
> > any further vho-user protocol messages).
> > 
> > IOW, assumption here is that while virto_loop is blocked processing
> > VHOST_USER_GET_VRING_BASE message, it is still ok to send back the
> > response on vq by fv_queue_thread().
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  tools/virtiofsd/fuse_virtio.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index 9577eaa68d..6805d8ba01 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -813,11 +813,20 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
> >          fuse_log(FUSE_LOG_ERR, "Eventfd_write for queue %d: %s\n",
> >                   qidx, strerror(errno));
> >      }
> > +
> > +    /*
> > +     * Drop ->vu_dispath_rwlock and reacquire. We are about to wait for
> > +     * for fv_queue_thread() and that might require ->vu_dispatch_rwlock
> > +     * to finish.
> > +     */
> > +    pthread_rwlock_unlock(&vud->vu_dispatch_rwlock);
> >      ret = pthread_join(ourqi->thread, NULL);
> >      if (ret) {
> >          fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err %d\n",
> >                   __func__, qidx, ret);
> >      }
> > +    pthread_rwlock_wrlock(&vud->vu_dispatch_rwlock);
> > +
> 
> So this is assuming that fv_queue_cleanup_thread() is called with
> vu_dispatch_rwlock already taken for writing, but there are no
> clear evidence in the code why it should care for the locking at
> all in the first place.
> 
> On the contrary, one of its two callers is a vhost-user callback,
> in which we can reasonably have this assumption, while we can
> have the opposite assumption for the other one in virtio_loop().
> 
> This makes me think that the drop/reacquire trick should only
> be done in fv_queue_set_started(), instead of...

I think this sounds reasonable. I will drop lock/re-acquire in
fv_queue_set_started() around the call to fv_queue_cleanup_thread().

> 
> >      pthread_mutex_destroy(&ourqi->vq_lock);
> >      close(ourqi->kill_fd);
> >      ourqi->kick_fd = -1;
> > @@ -952,7 +961,11 @@ int virtio_loop(struct fuse_session *se)
> >      /*
> >       * Make sure all fv_queue_thread()s quit on exit, as we're about to
> >       * free virtio dev and fuse session, no one should access them anymore.
> > +     * Hold ->vu_dispatch_rwlock in write mode as fv_queue_cleanup_thread()
> > +     * assumes mutex is locked and unlocks/re-locks it.
> >       */
> > +
> > +    pthread_rwlock_wrlock(&se->virtio_dev->vu_dispatch_rwlock);
> 
> 
> ... artificially introducing another critical section here.
> 
> The issue isn't even specific to vu_dispatch_rwlock actually :
> fv_queue_cleanup_thread() shouldn't be called with any lock
> held because it might sleep in pthread_join() and cause a
> deadlock all the same. So I'd rather document that instead :
> drop all locks before calling fv_queue_cleanup_thread().

Sounds good. Will do.

> 
> Also, since pthread_rwlock_wrlock() can fail, I think we should
> always check it's return value, at least with an assert() like
> already done elsewhere.

Will check return code of pthread_rwlock_wrlock() and probably use
assert().

Vivek

> 
> >      for (int i = 0; i < se->virtio_dev->nqueues; i++) {
> >          if (!se->virtio_dev->qi[i]) {
> >              continue;
> > @@ -961,6 +974,7 @@ int virtio_loop(struct fuse_session *se)
> >          fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
> >          fv_queue_cleanup_thread(se->virtio_dev, i);
> >      }
> > +    pthread_rwlock_unlock(&se->virtio_dev->vu_dispatch_rwlock);
> >  
> >      fuse_log(FUSE_LOG_INFO, "%s: Exit\n", __func__);
> >  
> 


