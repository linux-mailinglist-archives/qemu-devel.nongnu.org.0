Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384F6EE318
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:31:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIlH-0008Q1-Mq; Tue, 25 Apr 2023 09:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prIl7-0008Pn-Kj
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prIl5-0001i5-ON
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682429463;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1HrAEFtifVPb8JOgDveFB1YDo86Gg4kCbxcsscMJ1s=;
 b=M0ZPhxMr0zSk3PoEV9C0htCy6k/5fzhwGs25PIH7JSRPPN9Nw4TPfXvv8rA0qRKpylF58n
 F3mPSN7sCs0Rv5uehA53Z8CdVSUtli7kqGnwBRB86/uq57c4yKvLWy2zK01GbXYffOFmF0
 ZWM+uMeHEh2DidODPnJUZMkCZcxzcVA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-j6NfOabUPHO2XAhOS-0hcw-1; Tue, 25 Apr 2023 09:30:59 -0400
X-MC-Unique: j6NfOabUPHO2XAhOS-0hcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4930B8EE5BA;
 Tue, 25 Apr 2023 13:30:56 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92702C15BA0;
 Tue, 25 Apr 2023 13:30:52 +0000 (UTC)
Date: Tue, 25 Apr 2023 14:30:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
Message-ID: <ZEfWAciwsB+t7Crk@redhat.com>
References: <20230420202939.1982044-1-clg@kaod.org>
 <87a5ywgkqg.fsf@secure.mitica> <ZEfUq52l/wut8puM@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEfUq52l/wut8puM@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 02:24:59PM +0100, Daniel P. Berrangé wrote:
> On Tue, Apr 25, 2023 at 03:22:15PM +0200, Juan Quintela wrote:
> > Cédric Le Goater <clg@kaod.org> wrote:
> > > From: Cédric Le Goater <clg@redhat.com>
> > >
> > > GCC13 reports an error :
> > >
> > > ../util/async.c: In function ‘aio_bh_poll’:
> > > include/qemu/queue.h:303:22: error: storing the address of local
> > > variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’
> > > [-Werror=dangling-pointer=]
> > >   303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
> > >       |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> > > ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
> > >   169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> > >       |     ^~~~~~~~~~~~~~~~~~~~
> > > ../util/async.c:161:17: note: ‘slice’ declared here
> > >   161 |     BHListSlice slice;
> > >       |                 ^~~~~
> > > ../util/async.c:161:17: note: ‘ctx’ declared here
> > >
> > > But the local variable 'slice' is removed from the global context list
> > > in following loop of the same routine. Add a pragma to silent GCC.
> > >
> > > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: Cédric Le Goater <clg@redhat.com>
> > > ---
> > >  util/async.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/util/async.c b/util/async.c
> > > index 21016a1ac7..856e1a8a33 100644
> > > --- a/util/async.c
> > > +++ b/util/async.c
> > > @@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
> > >  
> > >      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
> > >      QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> > > +
> > > +    /*
> > > +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> > > +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
> > > +     * list is emptied before this function returns.
> > > +     */
> > > +#if !defined(__clang__)
> > > +#pragma GCC diagnostic push
> > > +#pragma GCC diagnostic ignored "-Wpragmas"
> > > +#pragma GCC diagnostic ignored "-Wdangling-pointer="
> > > +#endif
> > >      QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> > > +#if !defined(__clang__)
> > > +#pragma GCC diagnostic pop
> > > +#endif
> > >  
> > >      while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
> > >          QEMUBH *bh;
> > 
> > I know, I know.
> > 
> > I like to make fun of the compiler as the next guy.  But it is not
> > simpler this other change, just put the variable in the heap?
> > 
> > Later, Juan.
> > 
> > 
> > From bb5792a6763a451c72ef5cfd78b09032689f54e5 Mon Sep 17 00:00:00 2001
> > From: Juan Quintela <quintela@redhat.com>
> > Date: Tue, 25 Apr 2023 15:19:11 +0200
> > Subject: [PATCH] Silent GCC13 warning
> > 
> > Gcc complains about putting a local variable on a global list, not
> > noticing that we remove the whole list before leaving the function.
> > 
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > ---
> >  util/async.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/util/async.c b/util/async.c
> > index 21016a1ac7..7a8432e9e9 100644
> > --- a/util/async.c
> > +++ b/util/async.c
> > @@ -158,13 +158,17 @@ void aio_bh_call(QEMUBH *bh)
> >  /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
> >  int aio_bh_poll(AioContext *ctx)
> >  {
> > -    BHListSlice slice;
> > +    /*
> > +     * gcc13 complains about putting a local variable
> > +     * in a global list, so put it on the heap.
> > +     */
> > +    g_autofree BHListSlice *slice = g_new(BHListSlice, 1);
> >      BHListSlice *s;
> >      int ret = 0;
> >  
> >      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
> > -    QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> > -    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> > +    QSLIST_MOVE_ATOMIC(&slice->bh_list, &ctx->bh_list);
> > +    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
> >  
> >      while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
> >          QEMUBH *bh;
> 
> This must be a memory leak since you're adding a g_new but not
> adding any g_free

Sorry, I'm failing to read properly today. It uses g_autofree
so there is no leak.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


