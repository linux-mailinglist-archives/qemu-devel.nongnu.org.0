Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D4464B3C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 11:09:03 +0100 (CET)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msMXt-0007ad-GK
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 05:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1msMW3-00055M-B6
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1msMVz-0005ix-8O
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638353219;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ES2cGSBQ8PcBHRs5Ab7+fEhM0cgYzcFU6VZ4fGJqSGo=;
 b=aguhycfXh7iLaJoQj9qVEYjGQ4G0TJGwV4WW04LjjxqdsYP0reW7aF9up/dYPAsLZiogb5
 oDFPBGn+ULn/E4Gym170W2lw8xe+Y5YcTo2acVCH7hw4DKgjr7SmwVZdqqQBGH5dIvFcQ0
 qX2+ZB8lboVIHOFlEY1CKyg4tci5k/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-6iQwc7jRP6iWD10VzA9vFw-1; Wed, 01 Dec 2021 05:06:37 -0500
X-MC-Unique: 6iQwc7jRP6iWD10VzA9vFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4BC4104446E;
 Wed,  1 Dec 2021 10:06:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC1445C23A;
 Wed,  1 Dec 2021 10:06:29 +0000 (UTC)
Date: Wed, 1 Dec 2021 10:06:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO
 exits cleanly in some corner case
Message-ID: <YadJI0B4YrZTs3/m@redhat.com>
References: <20211201075427.155702-1-lei.rao@intel.com>
 <Yac8B76dAulyx+2T@redhat.com>
 <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "vsementsov@virtuozzo.com" <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 01, 2021 at 09:48:31AM +0000, Rao, Lei wrote:
> 
> 
> -----Original Message-----
> From: Daniel P. Berrangé <berrange@redhat.com> 
> Sent: Wednesday, December 1, 2021 5:11 PM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
> 
> > 
> > Signed-off-by: Lei Rao <lei.rao@intel.com>
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  block/nbd.c          |  5 +++++
> >  include/io/channel.h | 19 +++++++++++++++++++
> >  io/channel.c         | 22 ++++++++++++++++++++++
> >  3 files changed, 46 insertions(+)
> > 
> > diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57 
> > 100644
> > --- a/block/nbd.c
> > +++ b/block/nbd.c
> > @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
> >      assert(!s->in_flight);
> >  
> >      if (s->ioc) {
> > +        qio_channel_set_force_quit(s->ioc, true);
> > +        qio_channel_coroutines_wake(s->ioc);
> >          qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, 
> > NULL);
> 
> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
> poll() loop. We shouldn't need to add a second way to break out of the poll().
> 
> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.

That's a bug in the NBD code then. NBD must not be freeing the IO channel
object while it is performing read/write API calls on it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


