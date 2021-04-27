Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7A36C493
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:04:09 +0200 (CEST)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLVg-0001N9-By
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbLT9-0008TM-QL
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbLT6-0000DE-RR
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 07:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619521287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yk5pgK4gQAumDyzp2iUiAd59gHn63Ff/HSoVDI4pRVE=;
 b=QAG8/O/jZ2Wn9lxqBPASCnPyfG1ouhBrpNa5OOLdmZwyIxolS8WYmXja8M6igLhHBdEfy0
 qtxdgnxPiMkBA8dmACc42rGlHM6zeiQRmG+zrHRmKKXE3PYQdd5bd0B8DHpAp/Z6R+g9Bw
 qbj6vhw0W++LBfCeOWXUmpcOso/vpHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-cffizDNrNfmOQnFgzxNEUg-1; Tue, 27 Apr 2021 07:01:24 -0400
X-MC-Unique: cffizDNrNfmOQnFgzxNEUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2A46501F0;
 Tue, 27 Apr 2021 11:01:23 +0000 (UTC)
Received: from work-vm (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C085E101E663;
 Tue, 27 Apr 2021 11:01:11 +0000 (UTC)
Date: Tue, 27 Apr 2021 12:01:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v2 2/7] virtiofds: Changed allocations of iovec to GLib's
 functions
Message-ID: <YIfu9eV41U6vT6iP@work-vm>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
 <20210420154643.58439-3-ma.mandourr@gmail.com>
 <YIfmaleNOwhLLD9W@work-vm>
 <CAD-LL6gvoz0t4UND-CNdazciFoFE6ZVJ8ncZbfM3b37c8ECzbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD-LL6gvoz0t4UND-CNdazciFoFE6ZVJ8ncZbfM3b37c8ECzbw@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "open list:virtiofs" <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> On Tue, Apr 27, 2021 at 12:25 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
> wrote:
> 
> > * Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> > > Replaced the calls to malloc()/calloc() and their respective
> > > calls to free() of iovec structs with GLib's allocation and
> > > deallocation functions.
> > >
> > > Also, in one instance, used g_new0() instead of a calloc() call plus
> > > a null-checking assertion.
> > >
> > > iovec structs were created locally and freed as the function
> > > ends. Hence, I used g_autofree and removed the respective calls to
> > > free().
> > >
> > > In one instance, a struct fuse_ioctl_iovec pointer is returned from a
> > > function, namely, fuse_ioctl_iovec_copy. There, I used g_steal_pointer()
> > > in conjunction with g_autofree, this gives the ownership of the pointer
> > > to the calling function and still auto-frees the memory when the calling
> > > function finishes (maintaining the symantics of previous code).
> > >
> > > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  tools/virtiofsd/fuse_lowlevel.c | 19 +++++++------------
> > >  tools/virtiofsd/fuse_virtio.c   |  6 +-----
> > >  2 files changed, 8 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/tools/virtiofsd/fuse_lowlevel.c
> > b/tools/virtiofsd/fuse_lowlevel.c
> > > index 812cef6ef6..f965299ad9 100644
> > > --- a/tools/virtiofsd/fuse_lowlevel.c
> > > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > > @@ -217,9 +217,9 @@ static int send_reply(fuse_req_t req, int error,
> > const void *arg,
> > >  int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
> > >  {
> > >      int res;
> > > -    struct iovec *padded_iov;
> > > +    g_autofree struct iovec *padded_iov;
> > >
> > > -    padded_iov = malloc((count + 1) * sizeof(struct iovec));
> > > +    padded_iov = g_try_new(struct iovec, count + 1);
> > >      if (padded_iov == NULL) {
> > >          return fuse_reply_err(req, ENOMEM);
> > >      }
> > > @@ -228,7 +228,6 @@ int fuse_reply_iov(fuse_req_t req, const struct
> > iovec *iov, int count)
> > >      count++;
> > >
> > >      res = send_reply_iov(req, 0, padded_iov, count);
> > > -    free(padded_iov);
> > >
> > >      return res;
> > >  }
> >
> > OK.
> >
> > > @@ -565,10 +564,10 @@ int fuse_reply_bmap(fuse_req_t req, uint64_t idx)
> > >  static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct
> > iovec *iov,
> > >                                                        size_t count)
> > >  {
> > > -    struct fuse_ioctl_iovec *fiov;
> > > +    g_autofree struct fuse_ioctl_iovec *fiov;
> > >      size_t i;
> > >
> > > -    fiov = malloc(sizeof(fiov[0]) * count);
> > > +    fiov = g_try_new(fuse_ioctl_iovec, count);
> > >      if (!fiov) {
> > >          return NULL;
> > >      }
> > > @@ -578,7 +577,7 @@ static struct fuse_ioctl_iovec
> > *fuse_ioctl_iovec_copy(const struct iovec *iov,
> > >          fiov[i].len = iov[i].iov_len;
> > >      }
> > >
> > > -    return fiov;
> > > +    return g_steal_pointer(&fiov);
> > >  }
> >
> > This is OK, but doesn't gain anything - marking it as g_autofree'ing and
> > always stealing is no benefit.
> >
> > >
> > >  int fuse_reply_ioctl_retry(fuse_req_t req, const struct iovec *in_iov,
> > > @@ -629,9 +628,6 @@ int fuse_reply_ioctl_retry(fuse_req_t req, const
> > struct iovec *in_iov,
> > >
> > >      res = send_reply_iov(req, 0, iov, count);
> > >  out:
> > > -    free(in_fiov);
> > > -    free(out_fiov);
> > > -
> >
> > I don't think you can do that - I think you're relying here on the
> > g_autofree from fuse_ioclt_iovec_copy - but my understanding is that
> > doesn't work; g_autofree is scoped, so it's designed to free at the end
> > of fuse_ioctl_iovec_copy, fuse_reply_ioctl_retry doesn't know that the
> > ion_fiov were allocated that way, so it won't get autocleaned up.
> >
> >
> In GLib's documentation, it is clarified (w.r.t. g_autoptr but I think
> similar logic applies to g_autofree)
> that g_steal_pointer() "This can be very useful when combined with
> g_autoptr() to prevent
> the return value of a function from being automatically freed."
> I think, but not 100% clear of course, that this means that the
> g_autoptr-annotated memory
> does not get freed at the end of the current scope, and  its "scope" is
> migrated to the calling
> function(to be honest I don't know how would they implement that but maybe
> this is the case).
> Otherwise why bother with g_autoptr'ing memory that we don't want to free
> automatically and
> would like to return to the calling function?
> 
> The first example in Memory Allocation: GLib Reference Manual (gnome.org)
> <https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html#g-steal-pointer>
> does
> annotate
> the memory as g_autoptr and then returns it through g_steal_pointer. With
> your logic, I think that
> this example would be wrong(?)

The example is correct but not quite the case you have;  the
g_steal_pointer stops the g_autoptr freeing it at the end of the current
scope; but it doesn't cause it to be free'd later - the caller can't
tell that the function that did the allocation had a g_autofree in it;
once you get outside of the function, the pointer is just a normal
pointer that needs free or g_free on.


> Mr. Hajnoczi already reviewed this patch  Re: [PATCH 2/8] virtiofds:
> Changed allocations of iovec to GLib's functi
> <https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08459.html>
> in a previous version and this v2 patch series is supposed to only contain
> already-reviewed patches and
> remove bad ones

But he didn't spot this particular problem.

Dave

> 
> > >      return res;
> > >
> > >  enomem:
> > > @@ -663,11 +659,11 @@ int fuse_reply_ioctl(fuse_req_t req, int result,
> > const void *buf, size_t size)
> > >  int fuse_reply_ioctl_iov(fuse_req_t req, int result, const struct iovec
> > *iov,
> > >                           int count)
> > >  {
> > > -    struct iovec *padded_iov;
> > > +    g_autofree struct iovec *padded_iov;
> > >      struct fuse_ioctl_out arg;
> > >      int res;
> > >
> > > -    padded_iov = malloc((count + 2) * sizeof(struct iovec));
> > > +    padded_iov = g_try_new(struct iovec, count + 2);
> > >      if (padded_iov == NULL) {
> > >          return fuse_reply_err(req, ENOMEM);
> > >      }
> > > @@ -680,7 +676,6 @@ int fuse_reply_ioctl_iov(fuse_req_t req, int result,
> > const struct iovec *iov,
> > >      memcpy(&padded_iov[2], iov, count * sizeof(struct iovec));
> > >
> > >      res = send_reply_iov(req, 0, padded_iov, count + 2);
> > > -    free(padded_iov);
> > >
> > >      return res;
> > >  }
> >
> > OK
> >
> > > diff --git a/tools/virtiofsd/fuse_virtio.c
> > b/tools/virtiofsd/fuse_virtio.c
> > > index 3e13997406..07e5d91a9f 100644
> > > --- a/tools/virtiofsd/fuse_virtio.c
> > > +++ b/tools/virtiofsd/fuse_virtio.c
> > > @@ -347,8 +347,7 @@ int virtio_send_data_iov(struct fuse_session *se,
> > struct fuse_chan *ch,
> > >       * Build a copy of the the in_sg iov so we can skip bits in it,
> > >       * including changing the offsets
> > >       */
> > > -    struct iovec *in_sg_cpy = calloc(sizeof(struct iovec), in_num);
> > > -    assert(in_sg_cpy);
> > > +    g_autofree struct iovec *in_sg_cpy = g_new0(struct iovec, in_num);
> > >      memcpy(in_sg_cpy, in_sg, sizeof(struct iovec) * in_num);
> > >      /* These get updated as we skip */
> > >      struct iovec *in_sg_ptr = in_sg_cpy;
> > > @@ -386,7 +385,6 @@ int virtio_send_data_iov(struct fuse_session *se,
> > struct fuse_chan *ch,
> > >              ret = errno;
> > >              fuse_log(FUSE_LOG_DEBUG, "%s: preadv failed (%m) len=%zd\n",
> > >                       __func__, len);
> > > -            free(in_sg_cpy);
> > >              goto err;
> > >          }
> > >          fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n",
> > __func__,
> > > @@ -410,13 +408,11 @@ int virtio_send_data_iov(struct fuse_session *se,
> > struct fuse_chan *ch,
> > >          if (ret != len) {
> > >              fuse_log(FUSE_LOG_DEBUG, "%s: ret!=len\n", __func__);
> > >              ret = EIO;
> > > -            free(in_sg_cpy);
> > >              goto err;
> > >          }
> > >          in_sg_left -= ret;
> > >          len -= ret;
> > >      } while (in_sg_left);
> > > -    free(in_sg_cpy);
> >
> > Yes, this is where the autofree really helps; getting rid of a few
> > free's.
> >
> > Dave
> >
> > >      /* Need to fix out->len on EOF */
> > >      if (len) {
> > > --
> > > 2.25.1
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> >
> Thanks,
> Mahmoud
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


