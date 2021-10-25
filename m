Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB3439734
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:08:25 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meziC-00060Y-Gf
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mezYh-0003RI-5m
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mezYf-0003DB-07
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635166711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LkJauOp5MRCzZA1aNMyyxci6VK6ZsABfKRSGEkw4H4=;
 b=XeOG1E5LNUiSG8d9CVsBJSSIKL4aTR73hrAW37AdSpRPh8+so3VtMwLZLyRfgjyCveDMBR
 zW8iSlbsCcKLV5RjE4sdRYOt5h0FGNHDTkpYqLDYxRSDeM47sq0dqKzFdUHKkhzCfYuTZG
 uW6yOg0sMAvfmxOTAZu/TF50+Ui7M5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-UQ_9pii2OcKMHnqTijKlBg-1; Mon, 25 Oct 2021 08:58:30 -0400
X-MC-Unique: UQ_9pii2OcKMHnqTijKlBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10E798018AC;
 Mon, 25 Oct 2021 12:58:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 239D861064;
 Mon, 25 Oct 2021 12:58:26 +0000 (UTC)
Date: Mon, 25 Oct 2021 14:58:25 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH v5 0/6] block/rbd: migrate to coroutines and add write
 zeroes support
Message-ID: <YXap8SAOT5Kb41E2@redhat.com>
References: <YObtGbd5jlQNUbn0@redhat.com>
 <77F23D4A-18B3-4367-9D4E-9710FA6269B2@kamp.de>
 <YOgjFRNxUH2GUXyN@redhat.com>
 <2f156d36-52f0-a375-cfe7-f17164b306ad@kamp.de>
 <32b18db2-0a39-2945-1d06-e189273062c2@kamp.de>
MIME-Version: 1.0
In-Reply-To: <32b18db2-0a39-2945-1d06-e189273062c2@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.10.2021 um 13:39 hat Peter Lieven geschrieben:
> Am 16.09.21 um 14:34 schrieb Peter Lieven:
> > Am 09.07.21 um 12:21 schrieb Kevin Wolf:
> > > Am 08.07.2021 um 20:23 hat Peter Lieven geschrieben:
> > > > Am 08.07.2021 um 14:18 schrieb Kevin Wolf <kwolf@redhat.com>:
> > > > > Am 07.07.2021 um 20:13 hat Peter Lieven geschrieben:
> > > > > > > Am 06.07.2021 um 17:25 schrieb Kevin Wolf <kwolf@redhat.com>:
> > > > > > > Am 06.07.2021 um 16:55 hat Peter Lieven geschrieben:
> > > > > > > > I will have a decent look after my vacation.
> > > > > > > Sounds good, thanks. Enjoy your vacation!
> > > > > > As I had to fire up my laptop to look into another issue anyway, I
> > > > > > have sent two patches for updating MAINTAINERS and to fix the int vs.
> > > > > > bool mix for task->complete.
> > > > > I think you need to reevaluate your definition of vacation. ;-)
> > > > Lets talk about this when the kids are grown up. Sometimes sending
> > > > patches can be quite relaxing :-)
> > > Heh, fair enough. :-)
> > > 
> > > > > But thanks anyway.
> > > > > 
> > > > > > As Paolos fix (5f50be9b5) is relatively new and there are maybe other
> > > > > > non obvious problems when removing the BH indirection and we are close
> > > > > > to soft freeze I would leave the BH removal change for 6.2.
> > > > > Sure, code cleanups aren't urgent.
> > > > Isn’t the indirection also a slight performance drop?
> > > Yeah, I guess technically it is, though I doubt it's measurable.
> > 
> > 
> > As promised I was trying to remove the indirection through the BH after Qemu 6.1 release.
> > 
> > However, if I remove the BH I run into the following assertion while running some fio tests:
> > 
> > 
> > qemu-system-x86_64: ../block/block-backend.c:1197: blk_wait_while_drained: Assertion `blk->in_flight > 0' failed.
> > 
> > 
> > Any idea?
> > 
> > 
> > This is what I changed:
> > 
> > 
> > diff --git a/block/rbd.c b/block/rbd.c
> > index 3cb24f9981..bc1dbc20f7 100644
> > --- a/block/rbd.c
> > +++ b/block/rbd.c
> > @@ -1063,13 +1063,6 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
> >      return 0;
> >  }
> > 
> > -static void qemu_rbd_finish_bh(void *opaque)
> > -{
> > -    RBDTask *task = opaque;
> > -    task->complete = true;
> > -    aio_co_wake(task->co);
> > -}
> > -
> >  /*
> >   * This is the completion callback function for all rbd aio calls
> >   * started from qemu_rbd_start_co().
> > @@ -1083,8 +1076,8 @@ static void qemu_rbd_completion_cb(rbd_completion_t c, RBDTask *task)
> >  {
> >      task->ret = rbd_aio_get_return_value(c);
> >      rbd_aio_release(c);
> > -    aio_bh_schedule_oneshot(bdrv_get_aio_context(task->bs),
> > -                            qemu_rbd_finish_bh, task);
> > +    task->complete = true;
> > +    aio_co_wake(task->co);
> >  }
> 
> Kevin, Paolo, any idea?

Not really, I don't see the connection between both places.

Do you have a stack trace for the crash?

Kevin


