Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07294227C8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:28:25 +0200 (CEST)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkUa-00045q-FQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXkSs-0002xN-9s
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXkSn-0003w4-LT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633440391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kHzaR/31M+Zj7RReyuyicYqWAB3CisgeWbu98qxzIGw=;
 b=RwjcLUQHPgC2Ds3Cjdz53TyX75/dajZG5eam51wGnkyD7BuBz3i809PhTQa0uhiSrpa/PM
 UeoBAd/gnAblrKE0NjvwKOlgDd5184RXMLgJScf7xqlxdiwPG5/SvbgXiSWCBLUP18U6PP
 /zkncx1UXdvSv+wj7HgtcDPpQmgjm8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-P9I_xAK-Og6ZT5Ab5mrcxA-1; Tue, 05 Oct 2021 09:26:30 -0400
X-MC-Unique: P9I_xAK-Og6ZT5Ab5mrcxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F8A19253C0;
 Tue,  5 Oct 2021 13:26:29 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C90121042AA1;
 Tue,  5 Oct 2021 13:26:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 642C6220BDB; Tue,  5 Oct 2021 09:26:14 -0400 (EDT)
Date: Tue, 5 Oct 2021 09:26:14 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 12/13] virtiofsd: Implement blocking posix locks
Message-ID: <YVxSdmNsNXm4DU1z@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-13-vgoyal@redhat.com>
 <YVsYmHhbjPs/LEUc@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVsYmHhbjPs/LEUc@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
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

On Mon, Oct 04, 2021 at 04:07:04PM +0100, Stefan Hajnoczi wrote:
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
> 
> s/notificaiton/notification/

Will fix. I have made too many spelling mistakes. :-(

> 
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
> 
> Please fully initialize all fuse_out_header fields so it's obvious that
> there is no accidental information leak from virtiofsd to the guest:
> 
>   struct fuse_out_header out = {
>       .error = notify_code,
>   };
> 
> The host must not expose uninitialized memory to the guest (just like
> the kernel vs userspace). fuse_send_msg() initializes out.len later, but
> to be on the safe side I think we should be explicit here.

Agreed. Its better to be explicit here and initialize fuse_out_header
fully. Will do.

Vivek


