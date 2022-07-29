Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9433585022
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 14:39:13 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHPGq-0001Jv-DE
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 08:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oHPB7-0003kO-SS
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 08:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oHPB3-0001G9-I2
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 08:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659097992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hyXMn/FJChEvHaA3lvxq58JcQAoB1gdGMsxNsSQzUvs=;
 b=U9iJR7ieBo1VDpAL7YwZBy4jDYnqe8t/H9E3DygzEbtiqpCwXTtHTUXzgQUo7JIgXVXeY2
 E9tFbxb8YpjbFOKJCW62gdKlPXxTafiU5PX3q5EyszAgtniCqO9msixxQ1i6bsdmXzI1+K
 kbgk2pVfrZmNMLCD4PpY81GNRH4eg2Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-syg5IKeqM42slK4FEekQvQ-1; Fri, 29 Jul 2022 08:33:08 -0400
X-MC-Unique: syg5IKeqM42slK4FEekQvQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0174D185A7A4;
 Fri, 29 Jul 2022 12:33:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26575492C3B;
 Fri, 29 Jul 2022 12:33:06 +0000 (UTC)
Date: Fri, 29 Jul 2022 14:33:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 04/21] aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
Message-ID: <YuPTgKjmzs8z6vUK@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> Same as AIO_WAIT_WHILE macro, but if we are in the Main loop
> do not release and then acquire ctx_ 's aiocontext.
> 
> Once all Aiocontext locks go away, this macro will replace
> AIO_WAIT_WHILE.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  include/block/aio-wait.h | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index 54840f8622..a61f82c617 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -59,10 +59,13 @@ typedef struct {
>  extern AioWait global_aio_wait;
>  
>  /**
> - * AIO_WAIT_WHILE:
> + * _AIO_WAIT_WHILE:
>   * @ctx: the aio context, or NULL if multiple aio contexts (for which the
>   *       caller does not hold a lock) are involved in the polling condition.
>   * @cond: wait while this conditional expression is true
> + * @unlock: whether to unlock and then lock again @ctx. This apples
> + * only when waiting for another AioContext from the main loop.
> + * Otherwise it's ignored.
>   *
>   * Wait while a condition is true.  Use this to implement synchronous
>   * operations that require event loop activity.
> @@ -75,7 +78,7 @@ extern AioWait global_aio_wait;
>   * wait on conditions between two IOThreads since that could lead to deadlock,
>   * go via the main loop instead.
>   */
> -#define AIO_WAIT_WHILE(ctx, cond) ({                               \
> +#define _AIO_WAIT_WHILE(ctx, cond, unlock) ({                      \

"All identifiers that begin with an underscore and either an uppercase
letter or another underscore are always reserved for any use." (C11,
7.1.3)

Kevin


