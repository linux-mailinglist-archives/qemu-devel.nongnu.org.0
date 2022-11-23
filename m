Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481386366B4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 18:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxtGA-0005eC-Qq; Wed, 23 Nov 2022 12:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxtG8-0005df-Ls
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxtG7-00038U-6H
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 12:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669223402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xc3cVG9mKPsffYFNsAt0IPCnmc0YnlGjXga+cA7xzyQ=;
 b=bWGkppNAGzE8EYLf6kwHnP90wXkXpBBHgDSj0zZwDtQSS7M6N5Y71KEBFwh7bsyg5Zdedd
 OTZzIeJt8aMtwoEXWVvhRxJKwhJ3kebG9XF9l4uFCbYzMMklg/XEMjPAg2UXry9z3KY5Rn
 SG1RlNZMDe3oog0oEGVmEaaIluPA18w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-K4KmWdbmMfGwBom4fgWwRQ-1; Wed, 23 Nov 2022 12:09:58 -0500
X-MC-Unique: K4KmWdbmMfGwBom4fgWwRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E97B2932482;
 Wed, 23 Nov 2022 17:09:57 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C9540C83BB;
 Wed, 23 Nov 2022 17:09:55 +0000 (UTC)
Date: Wed, 23 Nov 2022 18:09:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 12/15] block-coroutine-wrapper.py: default to main
 loop aiocontext if function does not have a BlockDriverState parameter
Message-ID: <Y35T4IIKcBF8Xi1c@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
 <20221123114227.85757-13-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123114227.85757-13-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Am 23.11.2022 um 12:42 hat Emanuele Giuseppe Esposito geschrieben:
> Right now, we take the first parameter of the function to get the
> BlockDriverState to pass to bdrv_poll_co(), that internally calls
> functions that figure in which aiocontext the coroutine should run.
> 
> However, it is useless to pass a bs just to get its own AioContext,
> so instead pass it directly, and default to the main loop if no
> BlockDriverState is passed as parameter.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Patch 10 and 11 have the same subject line. Did you intend them to be
squashed together?

> diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
> index 7e8f2da84b..1d552cb734 100644
> --- a/scripts/block-coroutine-wrapper.py
> +++ b/scripts/block-coroutine-wrapper.py
> @@ -78,14 +78,14 @@ def __init__(self, return_type: str, name: str, args: str,
>  
>          t = self.args[0].type
>          if t == 'BlockDriverState *':
> -            bs = 'bs'
> +            ctx = 'bdrv_get_aio_context(bs)'
>          elif t == 'BdrvChild *':
> -            bs = 'child->bs'
> +            ctx = 'bdrv_get_aio_context(child->bs)'
>          elif t == 'BlockBackend *':
> -            bs = 'blk_bs(blk)'
> +            ctx = 'bdrv_get_aio_context(blk_bs(blk))'

This should use blk_get_aio_context(). If a BlockBackend has no root
attached, i.e. blk_bs(blk) == NULL, it can still be in a non-mainloop
AioContext.

Kevin


