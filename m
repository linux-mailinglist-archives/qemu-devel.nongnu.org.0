Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B6663382A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:18:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPOL-0004LY-D4; Tue, 22 Nov 2022 04:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxPOJ-0004KR-Da
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxPOH-0006Pw-19
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669108588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sxQpkVENMdB7ldlKzUEgPBiyomsSTOIj/gRjJP0KRKQ=;
 b=aXIvdlBJDZ3DeFC6QrD5Zo8hie0jGn0xCNJ+SOgVK1W8QEQI3PVuAZJUf4VEKVvOrwvTNb
 62LPAdI4FYRvYlufI91t5zVFhxxuOLXf0EJymaefZTD80ujjtPHzkxztIFctgfSqn6vdmE
 GvrM0mPTKg9fSF80vKVpQvCCCvCkReM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-pvl_hjwbPhCFKirfYwIHVw-1; Tue, 22 Nov 2022 04:16:24 -0500
X-MC-Unique: pvl_hjwbPhCFKirfYwIHVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 902B88027F5;
 Tue, 22 Nov 2022 09:16:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 333FB17595;
 Tue, 22 Nov 2022 09:16:22 +0000 (UTC)
Date: Tue, 22 Nov 2022 10:16:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 10/11] block: convert bdrv_create to
 generated_co_wrapper_simple
Message-ID: <Y3yTYxW1qlJkFxaL@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-11-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-11-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> This function is never called in coroutine context, therefore
> instead of manually creating a new coroutine, delegate it to the
> block-coroutine-wrapper script, defining it as g_c_w_simple.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

At first I thought that "never called in coroutine context" was not
entirely true because of paths like this:

qcow2_co_create() -> bdrv_open_blockdev_ref() -> bdrv_open_inherit() ->
bdrv_append_temp_snapshot() -> bdrv_create().

The only reason why it doesn't happen is that with a BlockdevRef, it's
impossible to get BDRV_O_SNAPSHOT set, so bdrv_append_temp_snapshot()
can't actually be called when you come from bdrv_open_blockdev_ref().

Of course, opening images in a coroutine is likely to already do similar
things. We should probably drop out of coroutine context for bdrv_open
to be safe. In practice, I suspect it might work anyway because nothing
is going to wait on the current coroutine, but maybe better not to rely
on it.

Anyway, not a problem of your patch, it's just something it made me
think of.

> diff --git a/block.c b/block.c
> index 7a4c3eb540..d3e168408a 100644
> --- a/block.c
> +++ b/block.c
> @@ -528,7 +528,7 @@ typedef struct CreateCo {
>      Error *err;
>  } CreateCo;
>  
> -static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
> +int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
>                                         QemuOpts *opts, Error **errp)

The indentation is off now. With this fixed:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


