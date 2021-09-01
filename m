Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CDB3FE118
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:24:24 +0200 (CEST)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTyJ-0003rr-Ea
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLTwn-0002iQ-Ob; Wed, 01 Sep 2021 13:22:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mLTwj-0005Ve-Ur; Wed, 01 Sep 2021 13:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=x06MbuifD9YiH7vbaMP/vBOclqyGkshSq6R63VLKhx4=; b=v+8hgTyf4ywTlv2kLl+95k5K8f
 cvWs+6hQlYHDxwv2KugOOcSfg82j00RRZKN1hKmQAfZwSjUQHGcgPSo7qSSq7mVTkbbbABfLCaVE1
 JB9hKhXDVEXk3QjUsjwnnI5oeUxw8Pe/G4hGLlydqn03llDy09425sJ2wU3EEbuj2yCX95GbOS6ZK
 7xJ7NLutSj3es2yghDP8jQdvKilAap9FzmfS5iYdI4kul8Ye4FrAMotnzjZtq78R2n5YlCDLZV0SA
 k9Q4AfF0H9wO5ZCTL75HfEOIjpSiMzROmdu3lUdM8RLtt0SC0YrGu6il9KfkAEWwA7Fb8Xy/MRnbq
 Le2JTp6KccascPw4xS3GaT10CTivDC/1EpeBhGbCj/5kPLztYWydBO5nXIuj79B2hht11tgXcmNbz
 5ngmutUYh9CJCM1ccMsLvge3TfoG1ukkd+gFcJWMVEx/AbDMyZ3kFj94i+4DCcnBDcLDIMnhTpTjw
 fDjKX7ZYXmXMKZnmIKzf+ss/j0x4ABGoQJC9ab6aNL5HMkdBQl4n9VPQSkvP0CRNXmPGwkS2Ar5j0
 QtJnhdQfBfm4St17uBJgU05lujRPlaXJ4iY+hPQvUcAKXAVWx7oF6mTANqzZ9GrEhLEapV5J+D+XT
 mB8lSNyY0+lNDB8drm91xKAuu0DAJA7H1wedzAbBo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-stable@nongnu.org
Subject: Re: [PATCH] 9pfs: fix crash in v9fs_walk()
Date: Wed, 01 Sep 2021 19:22:42 +0200
Message-ID: <5081248.r7JVVAaEAC@silver>
In-Reply-To: <20210901184721.57b1f611@bahia.lan>
References: <E1mLTBg-0002Bh-2D@lizzy.crudebyte.com>
 <20210901184721.57b1f611@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 1. September 2021 18:47:21 CEST Greg Kurz wrote:
> On Wed, 1 Sep 2021 18:15:10 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > v9fs_walk() utilizes the v9fs_co_run_in_worker({...}) macro to run the
> > supplied fs driver code block on a background worker thread.
> > 
> > When either the 'Twalk' client request was interrupted or if the client
> > requested fid for that 'Twalk' request caused a stat error then that
> > fs driver code block was left by 'break' keyword, with the intention to
> > 
> > return from worker thread back to main thread as well:
> >     v9fs_co_run_in_worker({
> >     
> >         if (v9fs_request_cancelled(pdu)) {
> >         
> >             err = -EINTR;
> >             break;
> >         
> >         }
> >         err = s->ops->lstat(&s->ctx, &dpath, &fidst);
> >         if (err < 0) {
> >         
> >             err = -errno;
> >             break;
> >         
> >         }
> >         ...
> >     
> >     });
> > 
> > However that 'break;' statement also skipped the v9fs_co_run_in_worker()
> > macro's final and mandatory
> > 
> >     /* re-enter back to qemu thread */
> >     qemu_coroutine_yield();
> > 
> > call and thus caused the rest of v9fs_walk() to be continued being
> > executed on the worker thread instead of main thread, eventually
> > leading to a crash in the transport virtio transport driver.
> > 
> > To fix this issue and to prevent the same error from happening again by
> > other users of v9fs_co_run_in_worker() in future, auto wrap the supplied
> > code block into its own
> > 
> >     do { } while (0);
> > 
> > loop inside the 'v9fs_co_run_in_worker' macro definition.
> > 
> > Full discussion and backtrace:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg05209.html
> > https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00174.html
> > 
> > Fixes: 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Cc: qemu-stable@nongnu.org
> > ---
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

I'll send out a PR tomorrow.

> >  hw/9pfs/coth.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
> > index c51289903d..f83c7dda7b 100644
> > --- a/hw/9pfs/coth.h
> > +++ b/hw/9pfs/coth.h
> > @@ -51,7 +51,9 @@
> > 
> >           */                                                             \
> >          
> >          qemu_coroutine_yield();                                         \
> >          qemu_bh_delete(co_bh);                                          \
> > 
> > -        code_block;                                                     \
> > +        do {                                                            \
> > +            code_block;                                                 \
> > +        } while (0);                                                    \
> > 
> >          /* re-enter back to qemu thread */                              \
> >          qemu_coroutine_yield();                                         \
> >      
> >      } while (0)

Best regards,
Christian Schoenebeck



