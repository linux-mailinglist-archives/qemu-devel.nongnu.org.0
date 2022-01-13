Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A848D619
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:51:51 +0100 (CET)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xht-0006eh-SG
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:51:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7xZI-0006cG-Sc
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7xZH-000230-0F
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642070574;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0n6fj4SQG6yHBYZj67phJEWe4m8jbvNtT6UwjHfiNj0=;
 b=VXZC/9urR6vzxhioU1QkNPdBhxAmEevp8sbfCCSxaxcQpqp0yhJjZ2NF92NpPOvhogBWK8
 WiHLWdyIVdysO09pWgGhKWdYLd4A2K76uolLZbPouF5ukT5XOrKpONW4PEImeet3TLPchK
 9Kq7Je62uEefyNUvLJfRsKFoxHBw/ic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-n35BTTOoP_qi2cd-XS0AHg-1; Thu, 13 Jan 2022 05:42:45 -0500
X-MC-Unique: n35BTTOoP_qi2cd-XS0AHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9EE101D617
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 10:42:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7629070D47;
 Thu, 13 Jan 2022 10:42:42 +0000 (UTC)
Date: Thu, 13 Jan 2022 10:42:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YeACHxbPt1SV9cx8@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local> <Yd/5lhcW6IHlVOBz@redhat.com>
 <YeAAJLYeImjPwW0f@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YeAAJLYeImjPwW0f@xz-m1.local>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 06:34:12PM +0800, Peter Xu wrote:
> On Thu, Jan 13, 2022 at 10:06:14AM +0000, Daniel P. Berrangé wrote:
> > On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> > > On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > > > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > > >      }
> > > >  
> > > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > > +        sflags = MSG_ZEROCOPY;
> > > > +    }
> > > > +
> > > >   retry:
> > > > -    ret = sendmsg(sioc->fd, &msg, 0);
> > > > +    ret = sendmsg(sioc->fd, &msg, sflags);
> > > >      if (ret <= 0) {
> > > > -        if (errno == EAGAIN) {
> > > > +        switch (errno) {
> > > > +        case EAGAIN:
> > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > -        }
> > > > -        if (errno == EINTR) {
> > > > +        case EINTR:
> > > >              goto retry;
> > > > +        case ENOBUFS:
> > > > +            if (sflags & MSG_ZEROCOPY) {
> > > > +                error_setg_errno(errp, errno,
> > > > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > > > +                return -1;
> > > > +            }
> > > 
> > > I have no idea whether it'll make a real differnece, but - should we better add
> > > a "break" here?  If you agree and with that fixed, feel free to add:
> > > 
> > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > 
> > > I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
> > > here it's by default unlimited, but just curious when we should keep an eye.
> > 
> > Fedora doesn't allow unlimited locked memory by default
> > 
> > $ grep "locked memory" /proc/self/limits 
> > Max locked memory         65536                65536                bytes     
> > 
> > And  regardless of Fedora defaults, libvirt will set a limit
> > for the guest. It will only be unlimited if requiring certain
> > things like VFIO.
> 
> Thanks, I obviously checked up the wrong host..
> 
> Leo, do you know how much locked memory will be needed by zero copy?  Will
> there be a limit?  Is it linear to the number of sockets/channels?

IIRC we decided it would be limited by the socket send buffer size, rather
than guest RAM, because writes will block once the send buffer is full.

This has a default global setting, with per-socket override. On one box I
have it is 200 Kb. With multifd you'll need  "num-sockets * send buffer".

> It'll be better if we can fail at enabling the feature when we detected that
> the specified locked memory limit may not be suffice.

Checking this value against available locked memory though will always
have an error margin because other things in QEMU can use locked memory
too


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


