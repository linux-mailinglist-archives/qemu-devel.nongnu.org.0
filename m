Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D95F7B8D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:34:32 +0200 (CEST)
Received: from localhost ([::1]:37776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqIx-0000OD-Sx
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogpvx-0006mV-ST
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogpvt-0005wV-Du
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665159040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EoXnTMqZIexoxb06RHpGrCYMmI9m0D1+DbL86Revn+M=;
 b=Q4zJGHo4ycz1E02I5/ww2ZzcBbmouTwBqhgG7shpzmty2KG6gP8ziHt1xZXVr21K/papZE
 LDrbFGagjGxPB6ApONUXzfs/DXQJPpxYb60k/mEK828yhkwf2fuq5LN3cQjtebBQa/AkgS
 T8vCLP6CdmVlnFA+JzXJLFo+GzsLk64=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-BYQUebbTP6WvSG1mnCmzhA-1; Fri, 07 Oct 2022 12:10:38 -0400
X-MC-Unique: BYQUebbTP6WvSG1mnCmzhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FDE6384C6C7;
 Fri,  7 Oct 2022 16:10:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16CCE1457F37;
 Fri,  7 Oct 2022 16:10:36 +0000 (UTC)
Date: Fri, 7 Oct 2022 18:10:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 04/11] bdrv_child_try_change_aio_context: add
 transaction parameter
Message-ID: <Y0BPe6+f/db7hvnt@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
 <20220725122120.309236-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725122120.309236-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.07.2022 um 14:21 hat Emanuele Giuseppe Esposito geschrieben:
> This enables the caller to use the same transaction to also
> keep track of aiocontext changes.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

What you're really doing here is factoring out the recursive phase.
However, the factored out function is never used from anywhere else,
so I don't understand the purpose of this patch. It feels like an
unnecessary complication of the code.

The commit message is unclear to me, too: Who is the caller of
bdrv_child_try_change_aio_context() that it mentions, and why does it
make a difference to it how the code is organised internally?

Is this some artifact of changes you made and we don't need it any more
now?

>  block.c                            | 31 ++++++++++++++++++++++++------
>  include/block/block-global-state.h |  5 +++++
>  2 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/block.c b/block.c
> index c02a628336..221bf90268 100644
> --- a/block.c
> +++ b/block.c
> @@ -7643,17 +7643,16 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>   * For the same reason, it temporarily holds also the new AioContext, since
>   * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
>   */
> -int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
> -                                      BdrvChild *ignore_child, Error **errp)
> +int bdrv_child_try_change_aio_context_tran(BlockDriverState *bs,
> +                                           AioContext *ctx,
> +                                           BdrvChild *ignore_child,
> +                                           Transaction *tran,
> +                                           Error **errp)

As mentioned above, this is never used anywhere else than from
bdrv_child_try_change_aio_context(), so if we want to keep the patch, it
should be static at least.

Maybe find a better name, too, because all of the transaction related
operations are in the caller.

The function comment is not accurate any more either because it
described the whole of bdrv_child_try_change_aio_context(), while this
function only contains the recursive part.

Kevin


