Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F06428EA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 14:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2B6a-000845-4t; Mon, 05 Dec 2022 08:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2B6J-0007z6-6H
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 08:01:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2B6D-0001rm-Hp
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 08:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670245289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3pumB7NgUH/GZOgBuVGM786zH6MbSvmE3FxvyMKFPQ=;
 b=gN4sSf4nayq0X4DjqxPoTXUO3cYMvHg6JgMAknkuqhqcz01Zn2/12+ml0ydaRnyHmPbryT
 QSsDAfBiXuwmmO626XvIkx/vrrQn1sAM0PD4iYhVnY80zbOVsl9BTOPHdIq4UhoA7GVamS
 13/RrmRg8b+8RmhXiVuiW4sNxtOIyfE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-0b9wTE81OoCd7K2elEhUVQ-1; Mon, 05 Dec 2022 08:01:27 -0500
X-MC-Unique: 0b9wTE81OoCd7K2elEhUVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 991AB3C0F681;
 Mon,  5 Dec 2022 13:01:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA8D2166B29;
 Mon,  5 Dec 2022 13:01:25 +0000 (UTC)
Date: Mon, 5 Dec 2022 14:01:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Message-ID: <Y43roVjI2RrU1PXq@redhat.com>
References: <20221202132701.531048-1-pbonzini@redhat.com>
 <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
 <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_DOTEDU=1.031 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 02.12.2022 um 18:22 hat Paolo Bonzini geschrieben:
> On 12/2/22 14:42, Emanuele Giuseppe Esposito wrote:
> > 
> > 
> > Am 02/12/2022 um 14:27 schrieb Paolo Bonzini:
> > > Changes to the BlockDriverState graph will have to take the
> > > corresponding lock for writing, and therefore cannot be done
> > > inside a coroutine.  Move them outside the test body.
> > > 
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >   tests/unit/test-bdrv-drain.c | 63 ++++++++++++++++++++++++++----------
> > >   1 file changed, 46 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
> > > index 6ae44116fe79..d85083dd4f9e 100644
> > > --- a/tests/unit/test-bdrv-drain.c
> > > +++ b/tests/unit/test-bdrv-drain.c
> > > @@ -199,25 +199,40 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
> > >       }
> > >   }
> > > +static BlockBackend *blk;
> > > +static BlockDriverState *bs, *backing;
> > > +
> > > +static void test_drv_cb_init(void)
> > > +{
> > > +    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
> > > +    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
> > > +                              &error_abort);
> > > +    blk_insert_bs(blk, bs, &error_abort);
> > > +
> > > +    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
> > > +    bdrv_set_backing_hd(bs, backing, &error_abort);
> > > +}
> > > +
> > > +static void test_drv_cb_fini(void)
> > 
> > fini stands for "finito"? :)
> 
> No, for finish :)
> http://ftp.math.utah.edu/u/ma/hohn/linux/misc/elf/node3.html
> 
> > Anyways, an alternative solution for this is also here (probably coming
> > from you too):
> > https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03517.html
> 
> Much better.  At least patches 7-8 from that series have to be salvaged,
> possibly 10 as well.

I wonder if we need a more general solution for this because this test
is not the only place that calls this kind of functions in a coroutine.
The one I'm aware of in particular is all the .bdrv_co_create
implementations, but I'm almost sure there are more.

Can we use a yield_to_drain()-like mechanism for these functions? Maybe
even something like the opposite of co_wrapper, a no_co_wrapper that
generates a foo_co() variant that drops out of coroutine context before
calling foo()?

Kevin


