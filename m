Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D712241D595
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:41:38 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrdJ-0002tW-OA
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrb8-0002DO-5Y
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrb1-00061l-K5
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632991155;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WdSEbn4K5L+2syee7ssjVoIKL4/USXaldiwaGGS4DK0=;
 b=RksBsVuMieduK8q0UUUgi6wiNiKXKuqg2wDcVovRiSjnCpOHI7hN8+psqv2sNBvtaHyl60
 vJTByfEguUy7CcqQRZkRK26KfBayzuQHGduRsXvi4pePfxpuDaE+9ddIfyIXTn9W8MYauI
 Y09s+GKJPVsHrBZ+I1K/8o5yf84nkOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-o9F0fIFpMc-Go8ZQ9zzWtg-1; Thu, 30 Sep 2021 04:39:09 -0400
X-MC-Unique: o9F0fIFpMc-Go8ZQ9zzWtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 177CA1084686
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:39:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30FFB1972D;
 Thu, 30 Sep 2021 08:39:07 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:39:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v3 2/3] QIOChannelSocket: Implement io_async_write &
 io_async_flush
Message-ID: <YVV3p9kksJZ5Wa0G@redhat.com>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-3-leobras@redhat.com>
 <YU4NKmq4KJkbmY97@redhat.com>
 <CAJ6HWG7rWEFwt9zFr3piaCDMBf0sfawdXTqF-03A3SHz-R++sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG7rWEFwt9zFr3piaCDMBf0sfawdXTqF-03A3SHz-R++sg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 04:32:12PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel,
> 
> On Fri, Sep 24, 2021 at 2:38 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> [...]
> > > @@ -154,6 +171,19 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> > >          return -1;
> > >      }
> > >
> > > +#ifdef CONFIG_LINUX
> > > +    if (addr->type != SOCKET_ADDRESS_TYPE_INET) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> > > +    if (ret >= 0) {
> > > +        QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > > +        klass->io_async_writev = qio_channel_socket_async_writev;
> > > +        klass->io_async_flush = qio_channel_socket_async_flush;
> > > +    }
> > > +#endif
> >
> > This is not write - the async APIs should not be tied 1:1 to ZEROCOPY
> > usage - we should have them take a flag to request ZEROCOPY behaviour.
> 
> I agree, but I am not aware of how to do asynchronous send in a socket
> without MSG_ZEROCOPY.
> 
> I mean, I know of the non-blocking send, but I am not sure how it
> checks if everything was sent (i.e. the flush part).
> Would it also be using the ERRQUEUE for that?
> 
> What would you suggest?

Yeah, there isn't any really. I guess I'm anticipating a future that
probably won't exist.  Lets just call the callbacks 'io_write_zerocopy'
and 'io_flush_zerocopy' and ignore the flag.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


