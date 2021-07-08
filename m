Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A53BF7E2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:02:34 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QrZ-0003oc-Ft
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1Qpm-0002tY-7T
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1Qpk-0007i8-Kj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625738439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7yxo0F6mB5AC5vdMMbgKkgKUbEkaXLR1/76LS9I2Qac=;
 b=MO5tE7G8mQMU7kPXI9lXYOg8U8/Fvkg7CyPzeCEGM7h4eDySU4e4aVzBJmTv4Du2WYjL5t
 USAmc8NIG1+4/hj8jAz0qS2tGhg55HLL2mWskSb2caSgKXQW5rpAk0G8wZO0yV53SSN1hO
 X9Be4r3exuJcVjR1gpCL3C4TpVVxDhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-3VZtBwYdN3ubCiOclzaP9w-1; Thu, 08 Jul 2021 06:00:38 -0400
X-MC-Unique: 3VZtBwYdN3ubCiOclzaP9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C39D0804140;
 Thu,  8 Jul 2021 10:00:37 +0000 (UTC)
Received: from redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADAB660854;
 Thu,  8 Jul 2021 10:00:31 +0000 (UTC)
Date: Thu, 8 Jul 2021 12:00:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH] block/rbd: fix type of task->complete
Message-ID: <YObMvks6ZY6SwYLf@redhat.com>
References: <20210707180449.32665-1-pl@kamp.de>
 <97a6ebe5-5009-9ba0-5824-348ec9bcfc98@redhat.com>
MIME-Version: 1.0
In-Reply-To: <97a6ebe5-5009-9ba0-5824-348ec9bcfc98@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-block@nongnu.org, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, ct@flyingcircus.io, mreitz@redhat.com,
 pbonzini@redhat.com, idryomov@gmail.com, idryomov@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.07.2021 um 23:51 hat Connor Kuehl geschrieben:
> On 7/7/21 11:04 AM, Peter Lieven wrote:
> > task->complete is a bool not an integer.
> > 
> > Signed-off-by: Peter Lieven <pl@kamp.de>
> > ---
> >  block/rbd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/block/rbd.c b/block/rbd.c
> > index 01a7b94d62..dcf82b15b8 100644
> > --- a/block/rbd.c
> > +++ b/block/rbd.c
> > @@ -1066,7 +1066,7 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
> >  static void qemu_rbd_finish_bh(void *opaque)
> >  {
> >      RBDTask *task = opaque;
> > -    task->complete = 1;
> > +    task->complete = true;
> >      aio_co_wake(task->co);
> >  }
> >  
> > 
> 
> Hi Peter,
> 
> What tree/QEMU git sha does this apply to? I am having trouble
> finding definitions for RBDTask and qemu_rbd_finish_bh; and the
> patch won't apply to my few-minutes-old clone of upstream.

It is on top of:

[PATCH v5 0/6] block/rbd: migrate to coroutines and add write zeroes support
Message-Id: <20210702172356.11574-1-idryomov@gmail.com>

Also, thanks, applied to the block branch.

Kevin


