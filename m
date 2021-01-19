Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8F2FBF4E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:44:52 +0100 (CET)
Received: from localhost ([::1]:42604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vzn-0006vl-Re
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1vRT-0004eZ-4t
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1vRN-0006ET-Kq
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2tbpkY0vt/J1aDs2tPVQJBEXeaNX78dFf03kwzy2h+o=;
 b=afd9zwqjmYa0EVECpIa7uCpuSKV+Zy/NRwvJSG7Y01k0PIgGR22D2UF8xfQU4eWtsLoQTu
 GlEbgatL4K0SFsRHOT4wDdIu/JIIsRMel/Pe94+c+lN/zyF5LXShJFoD9InY+nQ8G4rWFI
 kDdwNaLsm1P+pMI+w4NhVkFlJ07s7VY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-JnHFZADoNl6DZfBlTfNoAw-1; Tue, 19 Jan 2021 13:09:13 -0500
X-MC-Unique: JnHFZADoNl6DZfBlTfNoAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A268910054FF;
 Tue, 19 Jan 2021 18:09:12 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-149.ams2.redhat.com [10.36.115.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36FDF19C84;
 Tue, 19 Jan 2021 18:09:10 +0000 (UTC)
Date: Tue, 19 Jan 2021 19:09:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 12/36] block: refactor bdrv_child* permission functions
Message-ID: <20210119180909.GK5012@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-13-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-13-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Split out non-recursive parts, and refactor as block graph transaction
> action.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 59 insertions(+), 20 deletions(-)
> 
> diff --git a/block.c b/block.c
> index a756f3e8ad..7267b4a3e9 100644
> --- a/block.c
> +++ b/block.c
> @@ -48,6 +48,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"
>  #include "qemu/id.h"
> +#include "qemu/transactions.h"
>  #include "block/coroutines.h"
>  
>  #ifdef CONFIG_BSD
> @@ -2033,6 +2034,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
>      }
>  }
>  
> +static void bdrv_child_set_perm_commit(void *opaque)
> +{
> +    BdrvChild *c = opaque;
> +
> +    c->has_backup_perm = false;
> +}
> +
> +static void bdrv_child_set_perm_abort(void *opaque)
> +{
> +    BdrvChild *c = opaque;
> +    /*
> +     * We may have child->has_backup_perm unset at this point, as in case of
> +     * _check_ stage of permission update failure we may _check_ not the whole
> +     * subtree.  Still, _abort_ is called on the whole subtree anyway.
> +     */
> +    if (c->has_backup_perm) {
> +        c->perm = c->backup_perm;
> +        c->shared_perm = c->backup_shared_perm;
> +        c->has_backup_perm = false;
> +    }
> +}
> +
> +static TransactionActionDrv bdrv_child_set_pem_drv = {
> +    .abort = bdrv_child_set_perm_abort,
> +    .commit = bdrv_child_set_perm_commit,
> +};
> +
> +/*
> + * With tran=NULL needs to be followed by direct call to either
> + * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
> + *
> + * With non-NUll tran needs to be followed by tran_abort() or tran_commit()

s/NUll/NULL/

> + * instead.
> + */
> +static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
> +                                     uint64_t shared, GSList **tran)
> +{
> +    if (!c->has_backup_perm) {
> +        c->has_backup_perm = true;
> +        c->backup_perm = c->perm;
> +        c->backup_shared_perm = c->shared_perm;
> +    }

This is the obvious refactoring at this point, and it's fine as such.

However, when you start to actually use tran (and in new places), it
means that I have to check that we can never end up here recursively
with a different tran.

It would probably be much cleaner if the next patch moved the backup
state into the opaque struct for BdrvAction.

Kevin


