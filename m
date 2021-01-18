Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2132FA786
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:29:01 +0100 (CET)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YKq-0004FJ-Ta
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1Xjp-0001Hv-OC
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1Xjn-00054i-IY
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610988642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YOQFEg0Z1Ulx8o3UazukZEgRgKPeNWvWFz6E+hw3h3Y=;
 b=gxs+A50XBlNdqRg2r2yhvnP+PfWC+qr66wXXYE70LFfdGz3pd1HfgIrawHWp5l/01mBup4
 Cq8vQCI7qxdJa6zyQieqYFEdHlcVjdIdRg284RwZQvaCh7h6Mgy8ICl4wyrSTPV6+cZ+SS
 VolEZG2d/84etgX9GLYDK8brD+ZVbHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-7pTJeCaKN3qfSToYeOjO0A-1; Mon, 18 Jan 2021 11:50:38 -0500
X-MC-Unique: 7pTJeCaKN3qfSToYeOjO0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D9F910054FF;
 Mon, 18 Jan 2021 16:50:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC11018227;
 Mon, 18 Jan 2021 16:50:35 +0000 (UTC)
Date: Mon, 18 Jan 2021 17:50:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 10/36] util: add transactions.c
Message-ID: <20210118165034.GJ11555@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Add simple transaction API to use in further update of block graph
> operations.
> 
> Supposed usage is:
> 
> - "prepare" is main function of the action and it should make the main
>   effect of the action to be visible for the following actions, keeping
>   possibility of roll-back, saving necessary things in action state,
>   which is prepended to the list. So, driver struct doesn't include
>   "prepare" field, as it is supposed to be called directly.

So the convention is that tran_prepend() should be called by the
function that does the preparation? Or would we call tran_prepend() and
do the actual action in different places?

> - commit/rollback is supposed to be called for the list of action
>   states, to commit/rollback all the actions in reverse order
> 
> - When possible "commit" should not make visible effect for other
>   actions, which make possible transparent logical interaction between
>   actions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qemu/transactions.h | 46 +++++++++++++++++++++
>  util/transactions.c         | 81 +++++++++++++++++++++++++++++++++++++
>  util/meson.build            |  1 +
>  3 files changed, 128 insertions(+)
>  create mode 100644 include/qemu/transactions.h
>  create mode 100644 util/transactions.c
> 
> diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
> new file mode 100644
> index 0000000000..a5b15f46ab
> --- /dev/null
> +++ b/include/qemu/transactions.h
> @@ -0,0 +1,46 @@
> +/*
> + * Simple transactions API
> + *
> + * Copyright (c) 2020 Virtuozzo International GmbH.
> + *
> + * Author:
> + *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef QEMU_TRANSACTIONS_H
> +#define QEMU_TRANSACTIONS_H
> +
> +#include <gmodule.h>
> +
> +typedef struct TransactionActionDrv {
> +    void (*abort)(void *opeque);
> +    void (*commit)(void *opeque);
> +    void (*clean)(void *opeque);
> +} TransactionActionDrv;

s/opeque/opaque/

> +void tran_prepend(GSList **list, TransactionActionDrv *drv, void *opaque);
> +void tran_abort(GSList *backup);
> +void tran_commit(GSList *backup);

I'd add an empty line before a full function definition.

> +static inline void tran_finalize(GSList *backup, int ret)
> +{
> +    if (ret < 0) {
> +        tran_abort(backup);
> +    } else {
> +        tran_commit(backup);
> +    }
> +}

Let's use an opaque struct instead of GSList here and...

> +#endif /* QEMU_TRANSACTIONS_H */
> diff --git a/util/transactions.c b/util/transactions.c
> new file mode 100644
> index 0000000000..ef1b9a36a4
> --- /dev/null
> +++ b/util/transactions.c
> @@ -0,0 +1,81 @@
> +/*
> + * Simple transactions API
> + *
> + * Copyright (c) 2020 Virtuozzo International GmbH.
> + *
> + * Author:
> + *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/transactions.h"
> +
> +typedef struct BdrvAction {
> +    TransactionActionDrv *drv;
> +    void *opaque;
> +} BdrvAction;

...add a QSLIST_ENTRY (or similar) here to make it a type-safe list.

The missing type safety of GSList means that we should avoid it whenever
it's easily possible (i.e. we know the number of lists in which an
element will be). Here, each BdrvAction will only be in a single list,
so typed lists should be simple enough.

Kevin


