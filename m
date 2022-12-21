Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EDA652D22
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7t6m-0001MF-V0; Wed, 21 Dec 2022 02:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7t6h-0001Lo-0R
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:01:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7t6e-0005sg-Pq
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671606094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QH8kTt48tL40e2bivFN5xXhHcTr5cGLbosVfvGgn1gs=;
 b=ViI1zy/VZ3YBh1yczmDprvbvY4ZgqmiHh8qMX/HKH6L70L8PLmfssPg2UfhW5pGj07atUl
 wHb7nMfCuHtM+6RGJo4MExq4WLqd1mIRQEFDK9zR4GAscIJ7XucTysAS1oaybi+pz+zbqz
 sXX8Gidfh3pwdW/tTsWWsChXpqtm8ck=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-QHJ-nixlOg6YyHyPHR7nYw-1; Wed, 21 Dec 2022 02:01:33 -0500
X-MC-Unique: QHJ-nixlOg6YyHyPHR7nYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C73A32802E40
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 07:01:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AB0A2026D4B;
 Wed, 21 Dec 2022 07:01:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2DEDE21E691D; Wed, 21 Dec 2022 08:01:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,  kwolf@redhat.com,  pbonzini@redhat.com
Subject: Re: [PATCH v2 4/5] coroutine: Split qemu/coroutine-core.h off
 qemu/coroutine.h
References: <20221220154944.3611845-1-armbru@redhat.com>
 <20221220154944.3611845-5-armbru@redhat.com>
Date: Wed, 21 Dec 2022 08:01:31 +0100
In-Reply-To: <20221220154944.3611845-5-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 20 Dec 2022 16:49:43 +0100")
Message-ID: <87bknxkzp0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Markus Armbruster <armbru@redhat.com> writes:

> qemu/coroutine.h and qemu/lockable.h include each other.
>
> They need each other only in macro expansions, so we could simply drop
> both inclusions to break the loop, and add suitable includes to files
> that expand the macros.
>
> Instead, move a part of qemu/coroutine.h to new qemu/coroutine-core.h
> so that qemu/coroutine-core.h doesn't need qemu/lockable.h, and
> qemu/lockable.h only needs qemu/coroutine-core.h.  Result:
> qemu/coroutine.h includes qemu/lockable.h includes
> qemu/coroutine-core.h.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

[...]

> diff --git a/block.c b/block.c
> index 9c2ac757e4..be78be95f9 100644
> --- a/block.c
> +++ b/block.c
> @@ -44,7 +44,7 @@
>  #include "sysemu/block-backend.h"
>  #include "qemu/notify.h"
>  #include "qemu/option.h"
> -#include "qemu/coroutine.h"
> +#include "qemu/coroutine-core.h"
>  #include "block/qapi.h"
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"

Err, the include is useless before and after the patch: we get
coroutine.h from headers.  I'll drop the hunk to reduce churn.

Same for

    block/block-copy.c block/io_uring.c block/linux-aio.c block/mirror.c
    block/vdi.c chardev/char.c hw/9pfs/coth.c hw/block/virtio-blk.c
    migration/rdma.c net/colo-compare.c qapi/qmp-dispatch.c
    util/thread-pool.c

[...]


