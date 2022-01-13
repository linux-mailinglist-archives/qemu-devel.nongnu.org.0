Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40E48D539
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:09:02 +0100 (CET)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7x2T-0004Jw-MS
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7x0v-0003XH-Rz
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:07:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7x0s-0005PZ-TJ
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642068441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rniRhp3ApiB1mF1xKc8pQtCeKT+Si/qvrRq+vGAz1cY=;
 b=OAqP1qVKoGQLs2ER4jmQYceAZ9Wek+gb9lSX+ZRkHVNp5LYsBVOW8E5dgRdxcrwZotEdnl
 YFXtjJEziu1zIGQyvdsuaG/xS5VeMrfJ+EoVkxm/47U/rNHGrRrLICBxus+HSIIqZMa8AW
 8b0jrEhySrfGTS+VN9jcEgmJgj+7Q8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-6qKkckIcMeS0nK9VCRM77Q-1; Thu, 13 Jan 2022 05:07:03 -0500
X-MC-Unique: 6qKkckIcMeS0nK9VCRM77Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 026B8802926
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 10:07:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEC7670D41;
 Thu, 13 Jan 2022 10:06:16 +0000 (UTC)
Date: Thu, 13 Jan 2022 10:06:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <Yd/5lhcW6IHlVOBz@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <Yd/LLxNCItAIX3eN@xz-m1.local>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> >      }
> >  
> > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > +        sflags = MSG_ZEROCOPY;
> > +    }
> > +
> >   retry:
> > -    ret = sendmsg(sioc->fd, &msg, 0);
> > +    ret = sendmsg(sioc->fd, &msg, sflags);
> >      if (ret <= 0) {
> > -        if (errno == EAGAIN) {
> > +        switch (errno) {
> > +        case EAGAIN:
> >              return QIO_CHANNEL_ERR_BLOCK;
> > -        }
> > -        if (errno == EINTR) {
> > +        case EINTR:
> >              goto retry;
> > +        case ENOBUFS:
> > +            if (sflags & MSG_ZEROCOPY) {
> > +                error_setg_errno(errp, errno,
> > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > +                return -1;
> > +            }
> 
> I have no idea whether it'll make a real differnece, but - should we better add
> a "break" here?  If you agree and with that fixed, feel free to add:
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
> here it's by default unlimited, but just curious when we should keep an eye.

Fedora doesn't allow unlimited locked memory by default

$ grep "locked memory" /proc/self/limits 
Max locked memory         65536                65536                bytes     

And  regardless of Fedora defaults, libvirt will set a limit
for the guest. It will only be unlimited if requiring certain
things like VFIO.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


