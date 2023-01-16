Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F766C4BB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRrM-0001b6-J2; Mon, 16 Jan 2023 10:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHRrK-0001aa-59
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:57:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pHRrI-0004ay-Mp
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673884634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sxj+dL2dOvFjOWqoGO6mjospFfJjWDnfPtyWOpB79YQ=;
 b=KbfZaZjdYCaGF6KK4t6JLh598K7S/0ymoCKzotECbMD2UQgfo2yR+XAjuQ6FbgZzLOprVJ
 y70lTG9/mtX4YW7pjRXOh2IrMdeezU3rvzV9C57/oQyk8ULSsxCENpbny7FUEKxnrjPm12
 69egJxjk/OgCBdlwAVqaQEC2HlBIRew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-aLO1HYwSMU22O3fFMZl61g-1; Mon, 16 Jan 2023 10:57:13 -0500
X-MC-Unique: aLO1HYwSMU22O3fFMZl61g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 939C6101A521;
 Mon, 16 Jan 2023 15:57:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2D6D2166B26;
 Mon, 16 Jan 2023 15:57:11 +0000 (UTC)
Date: Mon, 16 Jan 2023 16:57:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eesposit@redhat.com
Subject: Re: [PATCH 07/15] block-backend: enter aio coroutine only after drain
Message-ID: <Y8Vz1pgvIHt769c4@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
 <20221212125920.248567-8-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212125920.248567-8-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 12.12.2022 um 13:59 hat Paolo Bonzini geschrieben:
> When called from within (another) coroutine, aio_co_enter will not
> enter a coroutine immediately; instead the new coroutine is scheduled
> to run after qemu_coroutine_yield().  This however might cause the
> currently-running coroutine to yield without having raised blk->in_flight.

I assume you're talking about the blk_aio_prwv() path here. However,
calling blk_inc_in_flight() is the very first thing it does (before even
calling bdrv_coroutine_enter -> aio_co_enter), so I don't understand how
it could happen that it yields before increasing the counter.

> If it was a ->drained_begin() callback who scheduled the coroutine,

Which one? The one that executes blk_aio_prwv()?

> bdrv_drained_begin() might exit without waiting for the I/O operation
> to finish.  Right now, this is masked by unnecessary polling done by
> bdrv_drained_begin() after the callbacks return, but it is wrong and
> a latent bug.
> 
> So, ensure that blk_inc_in_flight() and blk_wait_while_drained()
> are called before aio_co_enter().  To do so, pull the call to
> blk_wait_while_drained() out of the blk_co_do_* functions, which are
> called from the AIO coroutines, and place them separately in the public
> blk_co_* functions and in blk_aio_prwv.

You can't call blk_wait_while_drained() in blk_aio_prwv() because the
latter isn't a coroutine_fn.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

Kevin


