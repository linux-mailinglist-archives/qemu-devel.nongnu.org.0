Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B753D6E9
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 14:59:55 +0200 (CEST)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxTNh-00038q-Oj
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 08:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1nxTKn-00029N-JB; Sat, 04 Jun 2022 08:56:53 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:54254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1nxTKj-0008El-MQ; Sat, 04 Jun 2022 08:56:52 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 5AE432E1E74;
 Sat,  4 Jun 2022 15:51:07 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 rC8NJUagyh-p5JqpQuD; Sat, 04 Jun 2022 15:51:07 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654347067; bh=1o5hsWy6+km8+653mLdRHmWSnn2Gj17JyFXAts9eUl4=;
 h=In-Reply-To:Subject:Cc:Date:References:To:From:Message-ID;
 b=i26Hq9sUqafS3HF/XhahweRjdD9qsaUv2+dAfTOR1u6UfcoayUkhfS6w8DNZju84V
 2/JkpVBIc5477EpoMvYavhewPvTxy0rw7XKzardKTYeINJp9/tJtEcKDZpnGgzAzy9
 Ch3LinbjcLnxd4QcBW7Gf17fNeh2LsE08IiGnI9Y=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb (unknown [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 lAAKWAqlOs-p5MO2MVT; Sat, 04 Jun 2022 15:51:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Sat, 4 Jun 2022 15:51:04 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] aio_wait_kick: add missing memory barrier
Message-ID: <YptVOJ7CGZW1MvrW@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
References: <20220524173054.12651-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524173054.12651-1-eesposit@redhat.com>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 24, 2022 at 01:30:54PM -0400, Emanuele Giuseppe Esposito wrote:
> It seems that aio_wait_kick always required a memory barrier
> or atomic operation in the caller, but nobody actually
> took care of doing it.
> 
> Let's put the barrier in the function instead, and pair it
> with another one in AIO_WAIT_WHILE. Read aio_wait_kick()
> comment for further explanation.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/aio-wait.h |  2 ++
>  util/aio-wait.c          | 16 +++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index b39eefb38d..54840f8622 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -81,6 +81,8 @@ extern AioWait global_aio_wait;
>      AioContext *ctx_ = (ctx);                                      \
>      /* Increment wait_->num_waiters before evaluating cond. */     \
>      qatomic_inc(&wait_->num_waiters);                              \
> +    /* Paired with smp_mb in aio_wait_kick(). */                   \
> +    smp_mb();                                                      \

IIRC qatomic_inc() ensures sequential consistency, isn't it enough here?

>      if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
>          while ((cond)) {                                           \
>              aio_poll(ctx_, true);                                  \

Roman.

