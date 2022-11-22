Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15E633720
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:29:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOd1-00016O-OE; Tue, 22 Nov 2022 03:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxOcz-00014j-3U
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:27:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxOcq-0006hQ-Ln
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669105646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z1+VoMbRwJUhVx2cy98mfok/xOY5hcXHUh/fr9PRrVw=;
 b=PFSi1AN4UXuYlIlR0lm1LieKD5XxOk0rdgtL0rkxwJQChUZS3xSpE7Ve/AT9GiN1SJZCwF
 kcF98mUFLeQJuxVp3MokUuJQVL6SKMuT/vxl8AuHCamlxMptvm/C1/+zFtHUmDZGIF1vEh
 YqNqJGw0LGcclfa669LWtd6Z1zZq6C8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-iH3_jn3uPlm8zfrpnMfEvQ-1; Tue, 22 Nov 2022 03:27:24 -0500
X-MC-Unique: iH3_jn3uPlm8zfrpnMfEvQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C535C101A56C;
 Tue, 22 Nov 2022 08:27:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89297492B17;
 Tue, 22 Nov 2022 08:27:21 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:27:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 05/11] block-coroutine-wrapper.py: default to main
 loop aiocontext if function does not have a BlockDriverState parameter
Message-ID: <Y3yH5jdIr+TF0TTZ@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-6-eesposit@redhat.com>
 <Y3uZfAWotAr9IMGe@redhat.com>
 <6660171f-2d66-7985-d545-cac1f2ef1267@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6660171f-2d66-7985-d545-cac1f2ef1267@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 21.11.2022 um 16:52 hat Emanuele Giuseppe Esposito geschrieben:
> Am 21/11/2022 um 16:30 schrieb Kevin Wolf:
> > Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> >> Basically BdrvPollCo->bs is only used by bdrv_poll_co(), and the
> >> functions that it uses are both using bdrv_get_aio_context, that
> >> defaults to qemu_get_aio_context() if bs is NULL.
> >>
> >> Therefore pass NULL to BdrvPollCo to automatically generate a function
> >> that create and runs a coroutine in the main loop.
> >>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > 
> > It happens to work, but it's kind of ugly to call bdrv_coroutine_enter()
> > and BDRV_POLL_WHILE() with a NULL bs.
> > 
> > How hard would it be to generate code that doesn't use these functions,
> > but directly aio_co_enter() and AIO_WAIT_WHILE() for wrappers that are
> > not related to a BDS?
> > 
> 
> At this point, I would get rid of s->poll_state.bs and instead use
> s->poll_state.aio_context. Then call directly aio_co_enter and
> AIO_WAIT_WHILE, as you suggested but just everywhere, without
> differentiating the cases.

Oh, yes, that's better.

> Then we would have something similar to what it is currently done with bs:
> 
> if t == 'BlockDriverState *':
>             bs = 'bdrv_get_aio_context(bs)'
>         elif t == 'BdrvChild *':
>             bs = 'bdrv_get_aio_context(child->bs)'
>         elif t == 'BlockBackend *':
>             bs = 'bdrv_get_aio_context(blk_bs(blk))'

blk_get_aio_context(blk) seems more correct.

>         else:
>             bs = 'qemu_get_aio_context()'
> 
> I haven't tried it yet, but it should work.

Kevin


