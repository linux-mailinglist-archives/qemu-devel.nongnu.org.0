Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599324673DF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:21:16 +0100 (CET)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4kl-0005Qy-D2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mt4hp-0002lF-Vw
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mt4hm-0007Ls-Mx
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638523086;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXO+RXPzKn3WdOuuHimxllpZmboa9RU0QavFH/9U4K8=;
 b=afakTlfVtvZIEmhWoo3KGf7w7iccXYG9P+NirH2FbSJYqs4ajlR3bkT01nkjqewShaySqC
 TPxkb/UvzAKb/FtgfweVSCCDu/s5KPGkFOA0j2PFUeFtDwR3SUdcJGTLalfvafPZuwoA40
 3MmQyR3GX1sdObDTukBF00LfjQ0O6VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-SOjqwzrdMeawCRqscITaTg-1; Fri, 03 Dec 2021 04:18:03 -0500
X-MC-Unique: SOjqwzrdMeawCRqscITaTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66DFD100D682
 for <qemu-devel@nongnu.org>; Fri,  3 Dec 2021 09:18:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 215435D9D5;
 Fri,  3 Dec 2021 09:17:52 +0000 (UTC)
Date: Fri, 3 Dec 2021 09:17:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
Message-ID: <YangvtnXSwge0R0U@redhat.com>
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-4-leobras@redhat.com>
 <YY5H2ixqGpfbo5jI@redhat.com>
 <CAJ6HWG6TczHZC6EFcicG8irVb3XKdhB05bcyOb0ANAZKmRWqZg@mail.gmail.com>
 <YZy6qifB8JNwYEkp@redhat.com>
 <CAJ6HWG5e5VGW0pt_ek+jMZi+oz4uDOLnC0dHczkqMBBspdLf5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG5e5VGW0pt_ek+jMZi+oz4uDOLnC0dHczkqMBBspdLf5A@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 02:42:19AM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> 
> On Tue, Nov 23, 2021 at 6:56 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Nov 23, 2021 at 01:46:44AM -0300, Leonardo Bras Soares Passos wrote:
> > > Hello Daniel,
> > >
> > > On Fri, Nov 12, 2021 at 7:54 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > +
> > > > > +#ifdef CONFIG_LINUX
> > > > > +
> > > > > +static int qio_channel_socket_poll(QIOChannelSocket *sioc, bool zerocopy,
> > > > > +                                   Error **errp)
> > > >
> > > > There's only one caller and it always passes zerocopy=true,
> > > > so this parmeter looks pointless.
> > >
> > > I did that for possible reuse of this function in the future:
> > > - As of today, this is certainly compiled out, but if at some point
> > > someone wants to use poll for something other
> > > than the reading of an zerocopy errqueue, it could be reused.
> > >
> > > But sure, if that's not desirable, I can remove the parameter (and the
> > > if clause for !zerocopy).
> > >
> > > >
> > > > > +{
> > > > > +    struct pollfd pfd;
> > > > > +    int ret;
> > > > > +
> > > > > +    pfd.fd = sioc->fd;
> > > > > +    pfd.events = 0;
> > > > > +
> > > > > + retry:
> > > > > +    ret = poll(&pfd, 1, -1);
> > > > > +    if (ret < 0) {
> > > > > +        switch (errno) {
> > > > > +        case EAGAIN:
> > > > > +        case EINTR:
> > > > > +            goto retry;
> > > > > +        default:
> > > > > +            error_setg_errno(errp, errno,
> > > > > +                             "Poll error");
> > > > > +            return ret;
> > > >
> > > >        return -1;
> > > >
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    if (pfd.revents & (POLLHUP | POLLNVAL)) {
> > > > > +        error_setg(errp, "Poll error: Invalid or disconnected fd");
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    if (!zerocopy && (pfd.revents & POLLERR)) {
> > > > > +        error_setg(errp, "Poll error: Errors present in errqueue");
> > > > > +        return -1;
> > > > > +    }
> > > >
> > > > > +
> > > > > +    return ret;
> > > >
> > > >   return 0;
> > >
> > > In the idea of future reuse I spoke above, returning zero here would
> > > make this function always look like the poll timed out. Some future
> > > users may want to repeat the waiting if poll() timed out, or if
> > > (return > 0) stop polling.
> >
> > Now that I'm looking again, we should not really use poll() at all,
> > as GLib provides us higher level APIs. We in fact already have the
> > qio_channel_wait() method as a general purpose helper for waiting
> > for an I/O condition to occur.;
> >
> 
> So you suggest using
> qio_channel_wait(sioc, G_IO_IN);
> instead of creating the new qio_channel_socket_poll().
> 
> Is the above correct? I mean, is it as simple as that?

Yes, hopefully it is that simple.

> > > I understand the idea of testing SO_EE_CODE_ZEROCOPY_COPIED to be able
> > > to tell whenever zerocopy fell back to copying for some reason, but I
> > > don't see how this can be helpful here.
> > >
> > > Other than that I would do rv++ instead of rv=1 here, if I want to
> > > keep track of how many buffers were sent with zerocopy and how many
> > > ended up being copied.
> >
> > Sure, we could do   "ret > 0 == number of buffers that were copied"
> > as the API contract, rather than just treating it as a boolean.
> 
> Ok, then you suggest the responsibility of checking the number of
> writes with SO_EE_CODE_ZEROCOPY_COPIED, comparing with the total
> number of writes,  and deciding whether to disable or not zerocopy
> should be on the caller.

Yep, its a usage policy so nicer to allow caller to decide the
policy.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


