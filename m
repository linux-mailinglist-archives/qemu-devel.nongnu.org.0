Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA16FDC93
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:22:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwht8-0000ic-1w; Wed, 10 May 2023 07:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwhsv-0000hN-V3
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:21:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwhsu-0002qr-54
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683717686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ADb2QSD71HJCm5BxmFmeC/+8o0A3px9XzvQ1Q4TjYM8=;
 b=Wtm847+PsK47/2DZWfnD/Qwifa9yDwkepIIU+q+Rg7YHNyVCXZtjjAuD/pCAP5T9yKBMgn
 UV/xDqOra3Egc6DImRvDy+is6Ot5jrAsoNrGo+DFgnPJEY1TC6Ezq3TM7siFFfgxsgSsEv
 hOI6hv+1LxtYFyzuHGDxSjINIjnfzbc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-y3o2doMsNsu99GGwXgPLJw-1; Wed, 10 May 2023 07:21:23 -0400
X-MC-Unique: y3o2doMsNsu99GGwXgPLJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC57E3C0F68A;
 Wed, 10 May 2023 11:21:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CB084078906;
 Wed, 10 May 2023 11:21:21 +0000 (UTC)
Date: Wed, 10 May 2023 13:21:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: Re: [PATCH v8 4/5] blockdev: transaction: refactor handling
 transaction properties
Message-ID: <ZFt+LwvfBi15tVZ9@redhat.com>
References: <20230421115327.907104-1-vsementsov@yandex-team.ru>
 <20230421115327.907104-5-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421115327.907104-5-vsementsov@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 21.04.2023 um 13:53 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Only backup supports GROUPED mode. Make this logic more clear. And
> avoid passing extra thing to each action.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  blockdev.c | 92 +++++++++++-------------------------------------------
>  1 file changed, 19 insertions(+), 73 deletions(-)

> @@ -2376,18 +2310,34 @@ void qmp_transaction(TransactionActionList *actions,
>                       Error **errp)
>  {
>      TransactionActionList *act;
> -    bool has_properties = !!properties;
>      JobTxn *block_job_txn = NULL;
>      Error *local_err = NULL;
>      Transaction *tran = tran_new();
> +    ActionCompletionMode comp_mode =
> +        properties ? properties->completion_mode :
> +        ACTION_COMPLETION_MODE_INDIVIDUAL;
>  
>      GLOBAL_STATE_CODE();
>  
>      /* Does this transaction get canceled as a group on failure?
>       * If not, we don't really need to make a JobTxn.
>       */
> -    properties = get_transaction_properties(properties);
> -    if (properties->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
> +    if (comp_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
> +        for (act = actions; act; act = act->next) {
> +            TransactionActionKind type = act->value->type;
> +
> +            if (type != TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP &&
> +                type != TRANSACTION_ACTION_KIND_DRIVE_BACKUP)
> +            {
> +                error_setg(errp,
> +                           "Action '%s' does not support Transaction property "

Should this be lower case "transaction"?

> +                           "completion-mode = %s",
> +                           TransactionActionKind_str(type),
> +                           ActionCompletionMode_str(comp_mode));
> +                return;

This leaks tran.

> +            }
> +        }
> +
>          block_job_txn = job_txn_new();
>      }

Kevin


