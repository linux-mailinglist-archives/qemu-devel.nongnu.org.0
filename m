Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE85FD86E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:33:06 +0200 (CEST)
Received: from localhost ([::1]:44598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiwSX-000291-AN
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oivth-0008Ls-NH
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oivtd-0003pv-Fh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665658621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JHeIV9Mez/95v8LfzaiN63tK2XSDkfvc73zytfx43yE=;
 b=RQL4XDBxWWMJl76e9mdZWrDCFZQplyl+VtNu8IUaBIYGOGzxkNxs5az71R53TRDmpxK5zh
 vVTQuWc8XjjbUhk8zzIf8dnaANlvUOeAplEeY6YENqQtQpT4LDsmeGcmOUQSTVO+01wsu0
 7I+Gy9NmdN24mTq0X1qSvJUlBZ8Nebc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-FsKGztH_PHOFdqomWwJKBA-1; Thu, 13 Oct 2022 06:56:57 -0400
X-MC-Unique: FsKGztH_PHOFdqomWwJKBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5589B101AA64;
 Thu, 13 Oct 2022 10:56:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB760C2DF65;
 Thu, 13 Oct 2022 10:56:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81A7621E691D; Thu, 13 Oct 2022 12:56:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  qemu-block@nongnu.org
Subject: Re: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
References: <20221013093523.586361-1-pbonzini@redhat.com>
Date: Thu, 13 Oct 2022 12:56:48 +0200
In-Reply-To: <20221013093523.586361-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 13 Oct 2022 11:35:23 +0200")
Message-ID: <87a660yosv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> blkdebug events can be called from either non-coroutine or coroutine
> contexts.  However, some actions (specifically suspend actions and
> errors reported with immediately=off) only make sense from within
> a coroutine.
>
> Currently, using those action would lead to an abort() in
> qemu_coroutine_yield() ("Co-routine is yielding to no one").
> Catch them and print an error instead.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/blkdebug.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index bbf2948703..bf0aedb17d 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -31,6 +31,7 @@
>  #include "block/qdict.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
> +#include "qemu/error-report.h"
>  #include "qapi/qapi-visit-block-core.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qlist.h"
> @@ -623,8 +624,13 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>  
>      qemu_mutex_unlock(&s->lock);
>      if (!immediately) {
> -        aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
> -        qemu_coroutine_yield();
> +        if (qemu_in_coroutine()) {
> +            aio_co_schedule(qemu_get_current_aio_context(), qemu_coroutine_self());
> +            qemu_coroutine_yield();
> +        } else {
> +            error_report("Non-coroutine event %s needs immediately = off\n",
> +                         BlkdebugEvent_lookup.array[rule->event]);

rule_check() is called from blkdebug_co_preadv(), blkdebug_co_pwritev(),
blkdebug_co_pwrite_zeroes(), blkdebug_co_pdiscard(),
blkdebug_co_block_status() (all marked coroutine_fn), and
blkdebug_co_flush() (which looks like it should be marked coroutine_fn).

Ignorant question: how could it be called outside coroutine context?

Also, code smell: reporting an error without taking an error path.  But
let's worry about that only after I understand the problem you're trying
to fix.

> +        }
>      }
>  
>      return -error;
> @@ -858,7 +864,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>      }
>  
>      while (actions_count[ACTION_SUSPEND] > 0) {
> -        qemu_coroutine_yield();
> +        if (qemu_in_coroutine()) {
> +            qemu_coroutine_yield();
> +        } else {
> +            error_report("Non-coroutine event %s cannot suspend\n",
> +                         BlkdebugEvent_lookup.array[event]);
> +        }
>          actions_count[ACTION_SUSPEND]--;
>      }
>  }


