Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39BC1D4F77
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 15:47:12 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZagB-0000eF-E2
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 09:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jZaeO-00086M-SQ
 for qemu-devel@nongnu.org; Fri, 15 May 2020 09:45:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33742
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jZaeN-0008CX-98
 for qemu-devel@nongnu.org; Fri, 15 May 2020 09:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589550317;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+7Rey89XqCs+1fiKDB1v/djCRCayNz7GzKUiYl9VWw=;
 b=F74XoUbZ15V7B8FWAIL3NrOyZnNqL9oqEMfYqtDK+I+J0DtWnIu3AoCpFrGGLoqcu6/Cpc
 t6hYKqIyCPLVBLsLbOGtxqSH46THRlaFbv8QmgknSPsCpvG9kPSXDrkQs9OcaVsGYZGvaB
 fGn+h656x9cillsQHcPXXsJnyxhiJaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-tpjGlh9dPoeHUeBqqnf2og-1; Fri, 15 May 2020 09:45:16 -0400
X-MC-Unique: tpjGlh9dPoeHUeBqqnf2og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3F56107ACCA;
 Fri, 15 May 2020 13:45:14 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6CB32FC72;
 Fri, 15 May 2020 13:45:08 +0000 (UTC)
Date: Fri, 15 May 2020 14:45:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH 3/5] block/nbd.c: Add yank feature
Message-ID: <20200515134505.GM1300305@redhat.com>
References: <cover.1589193717.git.lukasstraub2@web.de>
 <1e712fa7f08e4772c2a68197a851161bee51610f.1589193717.git.lukasstraub2@web.de>
 <20200511161909.GJ2811@work-vm> <20200511190524.3681e58c@luklap>
 <20200512085458.GE1191162@redhat.com>
 <20200515114818.25d9eb9c@luklap>
 <20200515100413.GG1300305@redhat.com>
 <20200515121447.60bbd80d@luklap>
 <20200515102613.GI1300305@redhat.com>
 <20200515150330.5a6da104@luklap>
MIME-Version: 1.0
In-Reply-To: <20200515150330.5a6da104@luklap>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 15, 2020 at 03:03:30PM +0200, Lukas Straub wrote:
> On Fri, 15 May 2020 11:26:13 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Fri, May 15, 2020 at 12:14:47PM +0200, Lukas Straub wrote:
> > > On Fri, 15 May 2020 11:04:13 +0100
> > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >   
> > > > On Fri, May 15, 2020 at 11:48:18AM +0200, Lukas Straub wrote:  
> > > > > On Tue, 12 May 2020 09:54:58 +0100
> > > > > Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > >     
> > > > > > On Mon, May 11, 2020 at 07:05:24PM +0200, Lukas Straub wrote:    
> > > > > > > On Mon, 11 May 2020 17:19:09 +0100
> > > > > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > > > > >       
> > > > > > > > * Lukas Straub (lukasstraub2@web.de) wrote:      
> > > > > > > > > Add yank option, pass it to the socket-channel and register a yank
> > > > > > > > > function which sets s->state = NBD_CLIENT_QUIT. This is the same
> > > > > > > > > behaviour as if an error occured.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Lukas Straub <lukasstraub2@web.de>        
> > > > > > > >       
> > > > > > > > > +static void nbd_yank(void *opaque)
> > > > > > > > > +{
> > > > > > > > > +    BlockDriverState *bs = opaque;
> > > > > > > > > +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> > > > > > > > > +
> > > > > > > > > +    atomic_set(&s->state, NBD_CLIENT_QUIT);        
> > > > > > > > 
> > > > > > > > I think I was expecting a shutdown on the socket here - why doesn't it
> > > > > > > > have one?      
> > > > > > > 
> > > > > > > For nbd, we register two yank functions: This one and we enable
> > > > > > > the yank feature on the qio channel (see function
> > > > > > > nbd_establish_connection below).      
> > > > > > 
> > > > > > As mentioned on the earlier patch, I don't want to see any yank
> > > > > > code in the QIOChannel object directly. This nbd_yank function
> > > > > > can simply call the qio_channel_shutdown() function directly
> > > > > > and avoid need for modifying the QIOChannel object with yank
> > > > > > support.    
> > > > > 
> > > > > Hi,
> > > > > Looking at it again, the problem is not with registering the yank functions, but with tracking the lifetime of it. Suppose we add qio_channel_shutdown to the yank_nbd function. Then we need to unregister it whenever the QIOChannel object is freed.
> > > > > 
> > > > > In the code that would lead to the following constructs in a lot of places:
> > > > >      if (local_err) {
> > > > >          yank_unregister_function(s->yank_name, yank_nbd, bs);
> > > > >          object_unref(OBJECT(sioc));
> > > > >          error_propagate(errp, local_err);
> > > > >          return NULL;
> > > > >      }    
> > > > 
> > > > The nbd patch here already has a yank_unregister_function() so I'm
> > > > not seeing anything changes in that respect. The "yank_nbd" function
> > > > should check that the I/O channel is non-NULL before calling the
> > > > qio_channel_shutdown method.  
> > > 
> > > Hmm, but if object_unref frees the object, it doesn't set the
> > > pointer to NULL does it?  
> > 
> > So set  "ioc = NULL" after calling object_unref. AFAICT, nbd already
> > does exactly this.
> 
> I see 3 options to do that in a thread-safe manner:
> 1. Introduce a mutex here.
> 2. Use atomics to check for NULL and increase the reference count at the same time in yank_nbd so it isn't freed while calling qio_channel_shutdown on it. (I'm unsure how to do that)
> 3. Do it like it is currently done (but with the new subclass). We get thread safety for free trough the mutex in yank.c.

Oh, so the problem is that  the yank function can be invoked concurrently
with the object being unreffed.

In normal object finalizers, we just have to order things such that
yank_unregister_function() is called before object_unref(ioc) is
called.

The NBD code is slightly harder because we can close & re-open the
IO separately from the finalizer. eg in nbd_reconnect_attempt we
have

    if (s->ioc) {
        nbd_client_detach_aio_context(s->bs);
        object_unref(OBJECT(s->sioc));
        s->sioc = NULL;
        object_unref(OBJECT(s->ioc));
        s->ioc = NULL;
    }

    s->connect_status = nbd_client_connect(s->bs, &local_err);

If the io channel is not open, then we don't need a yank function
registered. So this code would changed to


    if (s->ioc) {
        nbd_client_detach_aio_context(s->bs);
	yank_unregister_function(...);
        object_unref(OBJECT(s->sioc));
        s->sioc = NULL;
        object_unref(OBJECT(s->ioc));
        s->ioc = NULL;
    }

    s->connect_status = nbd_client_connect(s->bs, &local_err);

The locking in yank_unregister_function() should ensure that any
currently executing yank callback has completed before the
yank_unregister_function() call returns. Thus it should be safe
to unref the cannel.

nbd_client_connect() will call yank_register_function() once it
has successfully started a new connection, which your patch already
handles IIUC.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


