Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB6532AB3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:51:16 +0200 (CEST)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntU0J-0003g8-FD
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTqW-0003Ku-TF
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTqU-0004bR-VR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653396066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jz2qT0jAOd/CR6iTayNYF0uO1CSbV3US76be0rTdQRE=;
 b=DETDlC9M796zodTx2EZY2VBGgs8kFf/Qx707hjtRxf8TDDCmSwkZqg0ciqPzkMaNq67wZD
 N+3ClU8wBJQJRq4LRZLaqovNMBcRwvyM62ydAerWTeo0e7W7evIDQhIs5pi56Qbu71GCez
 YkmtRsXG0l02gnTi56vX3MXjhuuAeyY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-aDq6SL2aP9GO-q_FK8J-Kg-1; Tue, 24 May 2022 08:41:03 -0400
X-MC-Unique: aDq6SL2aP9GO-q_FK8J-Kg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13837185A7A4;
 Tue, 24 May 2022 12:41:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C08A492C3B;
 Tue, 24 May 2022 12:41:01 +0000 (UTC)
Date: Tue, 24 May 2022 14:40:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, hreitz@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: aio_wait_bh_oneshot() thread-safety question
Message-ID: <YozSW5PT4L//qVOk@redhat.com>
References: <5dacced9-5434-5d05-a826-c7acb9fcb2ed@yandex-team.ru>
 <a774787e-46ac-36e0-8573-8adc114df784@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a774787e-46ac-36e0-8573-8adc114df784@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.05.2022 um 09:08 hat Paolo Bonzini geschrieben:
> On 5/23/22 18:04, Vladimir Sementsov-Ogievskiy wrote:
> > 
> > I have a doubt about how aio_wait_bh_oneshot() works. Exactly, I see
> > that data->done is not accessed atomically, and doesn't have any barrier
> > protecting it..
> > 
> > Is following possible:
> > 
> > main-loop                           iothread
> >                                  |
> > aio_wait_bh_oneshot()           |
> >      aio_bh_schedule_oneshot()   |
> >                                  |  handle bh:
> >                                  | 1. set data->done = true
> >                                  | 2. call aio_wait_kick(), inserting the
> >                                  | dummy bh into main context
> >                                  |
> >   ... in AIO_WAIT_WHILE():
> >     handle dummy bh, go to next
> >     iteration, but still read
> >     data->done=false due to some
> >     processor data reordering,
> >     go to next iteration of polling
> >     and hang
> Yes, barriers are missing:
> 
> https://lore.kernel.org/qemu-devel/You6FburTi7gVyxy@stefanha-x1.localdomain/T/#md97146c6eae1fce2ddd687fdc3f2215eee03f6f4
> 
> It seems like the issue was never observed, at least on x86.

Why is the barrier in aio_bh_enqueue() not enough? Is the comment there
wrong?

aio_notify() has another barrier. This is a little bit too late, but if
I misunderstood the aio_bh_enqueue() one, it could explain why it was
never observed.

Kevin


