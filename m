Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990C369504
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 16:44:47 +0200 (CEST)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZx2x-0006JB-7Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 10:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZx2A-0005gG-VU
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZx28-0003Ur-5i
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 10:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619189031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K6KE3/0KnUbn738NGUpgX9Vf7aV7k0xs3SsrgDjFx1o=;
 b=GQ1LatQCLIl4FYjwXfS23SclNEwhh/RW0ZQYU5uC3bLjtklLnWq5Ne+acKjMdoyiqJ6UBV
 DpwRkRvR7vUWU+ZtcTs0pYWbIEgFG7+uhcpe+v/CS2v95swfgel5g4um9JZDp2t/FXbN1d
 QmcdugtYRKSUeKTL/j/3NWmbO493wfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-wuD_DdyNNTKaTNssQVB1qA-1; Fri, 23 Apr 2021 10:43:47 -0400
X-MC-Unique: wuD_DdyNNTKaTNssQVB1qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 715F5343A6;
 Fri, 23 Apr 2021 14:43:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D45219D9B;
 Fri, 23 Apr 2021 14:43:41 +0000 (UTC)
Date: Fri, 23 Apr 2021 16:43:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 08/36] util: add transactions.c
Message-ID: <YILdHIn+hFg8YPeN@merkur.fritz.box>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-9-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210317143529.615584-9-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add simple transaction API to use in further update of block graph
> operations.
> 
> Supposed usage is:
> 
> - "prepare" is main function of the action and it should make the main
>   effect of the action to be visible for the following actions, keeping
>   possibility of roll-back, saving necessary things in action state,
>   which is prepended to the action list (to do that, prepare func
>   should call tran_add()). So, driver struct doesn't include "prepare"
>   field, as it is supposed to be called directly.
> 
> - commit/rollback is supposed to be called for the list of action
>   states, to commit/rollback all the actions in reverse order
> 
> - When possible "commit" should not make visible effect for other
>   actions, which make possible transparent logical interaction between
>   actions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/qemu/transactions.h | 63 ++++++++++++++++++++++++
>  util/transactions.c         | 96 +++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |  6 +++
>  util/meson.build            |  1 +
>  4 files changed, 166 insertions(+)
>  create mode 100644 include/qemu/transactions.h
>  create mode 100644 util/transactions.c
> 
> diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
> new file mode 100644
> index 0000000000..e7add9637f
> --- /dev/null
> +++ b/include/qemu/transactions.h
> @@ -0,0 +1,63 @@
> +/*
> + * Simple transactions API
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
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
> + *
> + *
> + * = Generic transaction API =
> + *
> + * The intended usage is the following: you create "prepare" functions, which
> + * represents the actions. They will usually have Transaction* argument, and
> + * call tran_add() to register finalization callbacks. For finalization
> + * callbacks, prepare corresponding TransactionActionDrv structures.
> + *
> + * Than, when you need to make a transaction, create an empty Transaction by

Then

> + * tran_create(), call your "prepare" functions on it, and finally call
> + * tran_abort() or tran_commit() to finalize the transaction by corresponding
> + * finalization actions in reverse order.
> + */
> +
> +#ifndef QEMU_TRANSACTIONS_H
> +#define QEMU_TRANSACTIONS_H
> +
> +#include <gmodule.h>
> +
> +typedef struct TransactionActionDrv {
> +    void (*abort)(void *opaque);
> +    void (*commit)(void *opaque);
> +    void (*clean)(void *opaque);
> +} TransactionActionDrv;
> +
> +typedef struct Transaction Transaction;
> +
> +Transaction *tran_new(void);
> +void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque);
> +void tran_abort(Transaction *tran);
> +void tran_commit(Transaction *tran);
> +
> +static inline void tran_finalize(Transaction *tran, int ret)
> +{
> +    if (ret < 0) {
> +        tran_abort(tran);
> +    } else {
> +        tran_commit(tran);
> +    }
> +}
> +
> +#endif /* QEMU_TRANSACTIONS_H */
> diff --git a/util/transactions.c b/util/transactions.c
> new file mode 100644
> index 0000000000..d0bc9a3e73
> --- /dev/null
> +++ b/util/transactions.c
> @@ -0,0 +1,96 @@
> +/*
> + * Simple transactions API
> + *
> + * Copyright (c) 2021 Virtuozzo International GmbH.
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
> +#include "qemu/queue.h"
> +
> +typedef struct TransactionAction {
> +    TransactionActionDrv *drv;
> +    void *opaque;
> +    QSLIST_ENTRY(TransactionAction) entry;

"next" is a bit more conventional as a name, but by far not as much as I
thought, so no objection.

With the than/then typo fixed:
Reviewed-by: Kevin Wolf <kwolf@redhat.com>


