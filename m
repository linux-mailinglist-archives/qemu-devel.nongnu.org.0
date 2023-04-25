Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB266EE2EA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:26:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIg6-0004ro-3S; Tue, 25 Apr 2023 09:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prIfp-0004qb-CJ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prIfj-0000fn-Rj
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682429115;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MXX7ydxgtDbY3IayNPaReslEhc7zlsaNL65ZApCetA=;
 b=F/lObcLiJhJOYn7FAnhHqTS4RZKMV2/fAaAHwoVrUHjQvra96JcegmjAT/6H3tLwDQ21OF
 bw+EYS/XVkPuhqaJTkb1M/mYiqHzvWXtgAyx0+u38b9W4Eg6D9Xu21W5AfOXB+yRAvUaL1
 ikbRqWFNuTjizw2xQq1yT5VhYpk9Ois=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-Kl3nT5QCPzimeZCgvk9bFg-1; Tue, 25 Apr 2023 09:25:14 -0400
X-MC-Unique: Kl3nT5QCPzimeZCgvk9bFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0400858F09;
 Tue, 25 Apr 2023 13:25:13 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC0A9C15BA0;
 Tue, 25 Apr 2023 13:25:02 +0000 (UTC)
Date: Tue, 25 Apr 2023 14:24:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
Message-ID: <ZEfUq52l/wut8puM@redhat.com>
References: <20230420202939.1982044-1-clg@kaod.org>
 <87a5ywgkqg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5ywgkqg.fsf@secure.mitica>
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

On Tue, Apr 25, 2023 at 03:22:15PM +0200, Juan Quintela wrote:
> Cédric Le Goater <clg@kaod.org> wrote:
> > From: Cédric Le Goater <clg@redhat.com>
> >
> > GCC13 reports an error :
> >
> > ../util/async.c: In function ‘aio_bh_poll’:
> > include/qemu/queue.h:303:22: error: storing the address of local
> > variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’
> > [-Werror=dangling-pointer=]
> >   303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
> >       |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> > ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
> >   169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> >       |     ^~~~~~~~~~~~~~~~~~~~
> > ../util/async.c:161:17: note: ‘slice’ declared here
> >   161 |     BHListSlice slice;
> >       |                 ^~~~~
> > ../util/async.c:161:17: note: ‘ctx’ declared here
> >
> > But the local variable 'slice' is removed from the global context list
> > in following loop of the same routine. Add a pragma to silent GCC.
> >
> > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Cédric Le Goater <clg@redhat.com>
> > ---
> >  util/async.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/util/async.c b/util/async.c
> > index 21016a1ac7..856e1a8a33 100644
> > --- a/util/async.c
> > +++ b/util/async.c
> > @@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
> >  
> >      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
> >      QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> > +
> > +    /*
> > +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> > +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
> > +     * list is emptied before this function returns.
> > +     */
> > +#if !defined(__clang__)
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Wpragmas"
> > +#pragma GCC diagnostic ignored "-Wdangling-pointer="
> > +#endif
> >      QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> > +#if !defined(__clang__)
> > +#pragma GCC diagnostic pop
> > +#endif
> >  
> >      while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
> >          QEMUBH *bh;
> 
> I know, I know.
> 
> I like to make fun of the compiler as the next guy.  But it is not
> simpler this other change, just put the variable in the heap?
> 
> Later, Juan.
> 
> 
> From bb5792a6763a451c72ef5cfd78b09032689f54e5 Mon Sep 17 00:00:00 2001
> From: Juan Quintela <quintela@redhat.com>
> Date: Tue, 25 Apr 2023 15:19:11 +0200
> Subject: [PATCH] Silent GCC13 warning
> 
> Gcc complains about putting a local variable on a global list, not
> noticing that we remove the whole list before leaving the function.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  util/async.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..7a8432e9e9 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -158,13 +158,17 @@ void aio_bh_call(QEMUBH *bh)
>  /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
>  int aio_bh_poll(AioContext *ctx)
>  {
> -    BHListSlice slice;
> +    /*
> +     * gcc13 complains about putting a local variable
> +     * in a global list, so put it on the heap.
> +     */
> +    g_autofree BHListSlice *slice = g_new(BHListSlice, 1);
>      BHListSlice *s;
>      int ret = 0;
>  
>      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
> -    QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> -    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +    QSLIST_MOVE_ATOMIC(&slice->bh_list, &ctx->bh_list);
> +    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
>  
>      while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>          QEMUBH *bh;

This must be a memory leak since you're adding a g_new but not
adding any g_free

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


