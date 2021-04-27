Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294C36C48A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:59:57 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLRc-0007Bb-9F
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lbLPq-0006KG-JU
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lbLPj-0006gL-LU
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619521078;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3NWkd0xm1UDbSc2oTqcqR4850jhi+w4+UE7xaKJdbAU=;
 b=BZwFnN2Y3sX/8CN0hsPew5nf5TqSTfBebll2TVMsj1j6kAFr5hTksSCPS4Qj6TcSnUYQxs
 B9hmeeB5z5mxjdyo3jw8ujuduy9JbL+kl8xM1SG+xkFg78C3gCL/JKb3AKzJUh8TmD5EQj
 58JShIrh+Lzqgv5L2/QuuvCm9z1Yvzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-vkgNVI5gPTGpEiSWRMIuQg-1; Tue, 27 Apr 2021 06:57:52 -0400
X-MC-Unique: vkgNVI5gPTGpEiSWRMIuQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FC21803620;
 Tue, 27 Apr 2021 10:57:51 +0000 (UTC)
Received: from redhat.com (ovpn-113-105.ams2.redhat.com [10.36.113.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE0536064B;
 Tue, 27 Apr 2021 10:57:42 +0000 (UTC)
Date: Tue, 27 Apr 2021 11:57:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 2/7] virtiofds: Changed allocations of iovec to GLib's
 functions
Message-ID: <YIfuInAdhqff2Ddq@redhat.com>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
 <20210420154643.58439-3-ma.mandourr@gmail.com>
 <YIfmaleNOwhLLD9W@work-vm>
MIME-Version: 1.0
In-Reply-To: <YIfmaleNOwhLLD9W@work-vm>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "open list:virtiofs" <virtio-fs@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 11:24:42AM +0100, Dr. David Alan Gilbert wrote:
> * Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> > Replaced the calls to malloc()/calloc() and their respective
> > calls to free() of iovec structs with GLib's allocation and
> > deallocation functions.
> > 
> > Also, in one instance, used g_new0() instead of a calloc() call plus
> > a null-checking assertion.
> > 
> > iovec structs were created locally and freed as the function
> > ends. Hence, I used g_autofree and removed the respective calls to
> > free().
> > 
> > In one instance, a struct fuse_ioctl_iovec pointer is returned from a
> > function, namely, fuse_ioctl_iovec_copy. There, I used g_steal_pointer()
> > in conjunction with g_autofree, this gives the ownership of the pointer
> > to the calling function and still auto-frees the memory when the calling
> > function finishes (maintaining the symantics of previous code).
> > 
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  tools/virtiofsd/fuse_lowlevel.c | 19 +++++++------------
> >  tools/virtiofsd/fuse_virtio.c   |  6 +-----
> >  2 files changed, 8 insertions(+), 17 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > index 812cef6ef6..f965299ad9 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -217,9 +217,9 @@ static int send_reply(fuse_req_t req, int error, const void *arg,
> >  int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
> >  {
> >      int res;
> > -    struct iovec *padded_iov;
> > +    g_autofree struct iovec *padded_iov;
> >  
> > -    padded_iov = malloc((count + 1) * sizeof(struct iovec));
> > +    padded_iov = g_try_new(struct iovec, count + 1);
> >      if (padded_iov == NULL) {
> >          return fuse_reply_err(req, ENOMEM);
> >      }
> > @@ -228,7 +228,6 @@ int fuse_reply_iov(fuse_req_t req, const struct iovec *iov, int count)
> >      count++;
> >  
> >      res = send_reply_iov(req, 0, padded_iov, count);
> > -    free(padded_iov);
> >  
> >      return res;
> >  }
> 
> OK.
> 
> > @@ -565,10 +564,10 @@ int fuse_reply_bmap(fuse_req_t req, uint64_t idx)
> >  static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
> >                                                        size_t count)
> >  {
> > -    struct fuse_ioctl_iovec *fiov;
> > +    g_autofree struct fuse_ioctl_iovec *fiov;
> >      size_t i;
> >  
> > -    fiov = malloc(sizeof(fiov[0]) * count);
> > +    fiov = g_try_new(fuse_ioctl_iovec, count);
> >      if (!fiov) {
> >          return NULL;
> >      }
> > @@ -578,7 +577,7 @@ static struct fuse_ioctl_iovec *fuse_ioctl_iovec_copy(const struct iovec *iov,
> >          fiov[i].len = iov[i].iov_len;
> >      }
> >  
> > -    return fiov;
> > +    return g_steal_pointer(&fiov);
> >  }
> 
> This is OK, but doesn't gain anything - marking it as g_autofree'ing and
> always stealing is no benefit.

Think of it as proactive bug prevention - if someone later inserts a
second "return NULL" error condition somewhere in the middle of the
method, we've safely free the iovec. This method is pretty trivial
so in reality that's not likely to happen, but if we're going to use
g_autofree, it is worth using it universally through a file, so it
sets expectations for future contributors.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


