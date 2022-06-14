Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E866254ABEF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:40:59 +0200 (CEST)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o126d-00062t-1e
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o122m-00052H-8v
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o122k-0006rE-6a
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655195817;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raV/DSUlxirGo9fUvVdNubFktnHZiumx/P9pa4iatpA=;
 b=M6aj5WcVVuV4olIJE1/yQr5kUxd4b/C2bj9r0xd51YKKwEudvEdHbC7mCgJ15MAGdCANZ3
 J7MI/jPgnOX86j09RNOBKFQY9+Fx/QBJLuHlQnY2frIGI1+YXi8XxivQQJW0uZgY5CiH+F
 pAIElECfNobNsp3ONKGO92Ak+Z+v7Oc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-Q9RQAQstOGm2Coq8sSTe9Q-1; Tue, 14 Jun 2022 04:36:53 -0400
X-MC-Unique: Q9RQAQstOGm2Coq8sSTe9Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53D46299E75A;
 Tue, 14 Jun 2022 08:36:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02A1B492C3B;
 Tue, 14 Jun 2022 08:36:51 +0000 (UTC)
Date: Tue, 14 Jun 2022 09:36:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/2] QIOChannelSocket: Reduce ifdefs to improve
 readability
Message-ID: <YqhIofy4h0hfHPPx@redhat.com>
References: <20220608210403.84006-1-leobras@redhat.com>
 <YqGq0Bw7V26vaNoI@redhat.com>
 <CAJ6HWG41=Wwf5gMY=Q0G2VCKfdNsyDRGDXELwvgRBjXMNB9GKw@mail.gmail.com>
 <YqL/3VTze/b9DKUL@redhat.com>
 <CAJ6HWG5kCiprhCB6578ZibRSWW9ie5kBhbh7DFW-=K1sEnSHWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ6HWG5kCiprhCB6578ZibRSWW9ie5kBhbh7DFW-=K1sEnSHWg@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 06:21:18PM -0300, Leonardo Bras Soares Passos wrote:
> On Fri, Jun 10, 2022 at 5:25 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> 
> [...]
> 
> > Ok, so if it is checked earlier then we merely need an assert.
> >
> >      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> >  #ifdef QEMU_MSG_ZEROCOPY
> >          sflags = MSG_ZEROCOPY;
> >          zero_copy_enabled = true;
> >  #else
> >          g_assert_unreachable();
> >  #endif
> > >     }
> 
> Ok, I will add that in the next version.
> 
> >
> >
> >
> > > > > @@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > > >          case EINTR:
> > > > >              goto retry;
> > > > > -#ifdef QEMU_MSG_ZEROCOPY
> > > > >          case ENOBUFS:
> > > > > -            if (sflags & MSG_ZEROCOPY) {
> > > > > +            if (zero_copy_enabled) {
> > > >
> > > > if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY)
> > > >
> > > > avoids the #ifdef without needing to add yet another
> > > > variable expressing what's already expressed in both
> > > > 'flags' and 'sflags'.
> > >
> > > Yes, it does, but at the cost of not compiling-out the zero-copy part
> > > when it's not supported,
> > > since the QIO_CHANNEL_WRITE_FLAG_ZERO_COPY comes as a parameter. This ends up
> > > meaning there will be at least one extra test for every time this
> > > function is called (the one in the next patch).
> >
> > The cost of a simple bit test is between negligible-and-non-existant
> > with branch prediction. I doubt it would be possible to even measure
> > it.
> 
> Yeah, you are probably right on that.
> So the main learning point here is that it's not worth creating a new
> boolean for compiling-out
> code that should not impact performance ?

As ever "it depends" so there's no hard rule, and sometimes it can
verge on bikeshed colouring :-)

I didn't like the variable in this case, because it introduces a 3rd
variable to the method for representing whether zero copy is need,
which is excessive. I'm not a fan of redundancy as it can often then
lead to inconsistency. So it would need a compelling reason why it is
better, which is difficult for such a simple method. If the code was
more complex, a variable might have benefit of clarity, but in this
case IMHO it was just overkill.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


