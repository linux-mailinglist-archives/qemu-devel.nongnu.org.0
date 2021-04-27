Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773536C218
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:50:53 +0200 (CEST)
Received: from localhost ([::1]:52072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKMm-0001dh-Kt
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbKKj-0000s4-GS
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbKKh-0006ZX-IT
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:48:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619516923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VEy5YvIgV6uiurYOZzKNqrqL+ClT8CY37WewF4EOb8I=;
 b=IVw6o6ciLE82S032ho5vB3jBU1YZs575F1PrTc9hMFV29xrJEIbSM6pJB/j2rV80zvgcHe
 PCG5IIDnlNJ/CrJnLWgC7vH/rErX1UAqLLOF4khFC7LxfAIs+vFqVdBF6JpsOFpZOQSJ+f
 T1Oe9xCD7Io7gln7fuOLBxmlI9JKpB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-k0rWLZ2tMTmjF8tTipz-ww-1; Tue, 27 Apr 2021 05:48:41 -0400
X-MC-Unique: k0rWLZ2tMTmjF8tTipz-ww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50A1C803624;
 Tue, 27 Apr 2021 09:48:40 +0000 (UTC)
Received: from work-vm (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD08B69112;
 Tue, 27 Apr 2021 09:48:32 +0000 (UTC)
Date: Tue, 27 Apr 2021 10:48:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [Virtio-fs] [PATCH v2 1/7] virtiofsd: Changed allocations of
 fuse_req to GLib functions
Message-ID: <YIfd7p/xDy8RqA1M@work-vm>
References: <20210420154643.58439-1-ma.mandourr@gmail.com>
 <20210420154643.58439-2-ma.mandourr@gmail.com>
 <20210420190334.GE1529659@redhat.com>
 <CAD-LL6jeKzfY5ehBU_D6Bnpm53jNneecWLvYs_seGTOmZ=Am6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD-LL6jeKzfY5ehBU_D6Bnpm53jNneecWLvYs_seGTOmZ=Am6Q@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> On Tue, Apr 20, 2021 at 9:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > On Tue, Apr 20, 2021 at 05:46:36PM +0200, Mahmoud Mandour wrote:
> > > Replaced the allocation and deallocation of fuse_req structs
> > > using calloc()/free() call pairs to a GLib's g_try_new0()
> > > and g_free().
> >
> > Hi,
> >
> > What's the context of these patches. I see all of them are switching
> > to glib functions. Why to do that? What's the advantage.
> >
> > Vivek
> >
> > >
> > > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  tools/virtiofsd/fuse_lowlevel.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tools/virtiofsd/fuse_lowlevel.c
> > b/tools/virtiofsd/fuse_lowlevel.c
> > > index 58e32fc963..812cef6ef6 100644
> > > --- a/tools/virtiofsd/fuse_lowlevel.c
> > > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > > @@ -106,7 +106,7 @@ static void list_add_req(struct fuse_req *req,
> > struct fuse_req *next)
> > >  static void destroy_req(fuse_req_t req)
> > >  {
> > >      pthread_mutex_destroy(&req->lock);
> > > -    free(req);
> > > +    g_free(req);
> > >  }
> > >
> > >  void fuse_free_req(fuse_req_t req)
> > > @@ -130,7 +130,7 @@ static struct fuse_req *fuse_ll_alloc_req(struct
> > fuse_session *se)
> > >  {
> > >      struct fuse_req *req;
> > >
> > > -    req = (struct fuse_req *)calloc(1, sizeof(struct fuse_req));
> > > +    req = g_try_new0(struct fuse_req, 1);
> > >      if (req == NULL) {
> > >          fuse_log(FUSE_LOG_ERR, "fuse: failed to allocate request\n");
> > >      } else {
> > > @@ -1684,7 +1684,7 @@ static struct fuse_req *check_interrupt(struct
> > fuse_session *se,
> > >          if (curr->u.i.unique == req->unique) {
> > >              req->interrupted = 1;
> > >              list_del_req(curr);
> > > -            free(curr);
> > > +            g_free(curr);
> > >              return NULL;
> > >          }
> > >      }
> > > --
> > > 2.25.1
> > >
> > > _______________________________________________
> > > Virtio-fs mailing list
> > > Virtio-fs@redhat.com
> > > https://listman.redhat.com/mailman/listinfo/virtio-fs
> >
> >
> Hello Vivek,
> 
> Taken from the Qemu Coding Style document in the documentation:
> "Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign APIs
> is not allowed in the QEMU codebase. Instead of these routines, use the
> GLib memory allocation routines
> g_malloc/g_malloc0/g_new/g_new0/g_realloc/g_free or QEMU’s
> qemu_memalign/qemu_blockalign/qemu_vfree APIs."
> It's also in the bite-sized contributions page as a task.

Yes I think generally that's OK; note that virtiofsd is a little unusual
in that a lot of it is imported from an external library and then
changed; so we've not done a lot of these type of qemu-speicific styles.

Dave

> Thanks,
> Mahmoud

> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


