Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D22A369EF1
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 07:24:25 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laAmF-0000h6-VJ
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 01:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laAlT-0000AZ-A3
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 01:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laAlQ-00028q-8I
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 01:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619241809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kV71YwiwJ3EjCQage/gXSCp1WRbjSrpOGKhhNAi0UwA=;
 b=Va9JAOQHGWZ34VLVC2H38/ycv+t7MJLIhuCRxlkmxXvfb0Al+HGHj8/aK6DdnqKXUvcfJW
 d1832GuDs8NgcHa+HRtlXNkA87zAdKywiGnLVC1GME+MUKb/wJcSrS2ea48yYLmBI35QXe
 BvqcP3qTWsPNvjotKgJQTWWP2/lD1DM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-rtU8JsdlPJSyuZgSi8fFLQ-1; Sat, 24 Apr 2021 01:23:27 -0400
X-MC-Unique: rtU8JsdlPJSyuZgSi8fFLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E05918397A9;
 Sat, 24 Apr 2021 05:23:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23D2860BE5;
 Sat, 24 Apr 2021 05:23:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8EB62113525D; Sat, 24 Apr 2021 07:23:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 03/11] block/block-gen.h: bind monitor
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
 <20210423214033.474034-4-vsementsov@virtuozzo.com>
Date: Sat, 24 Apr 2021 07:23:23 +0200
In-Reply-To: <20210423214033.474034-4-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Sat, 24 Apr 2021 00:40:25 +0300")
Message-ID: <87mttob6ic.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> If we have current monitor, let's bind it to wrapper coroutine too.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/block-gen.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/block/block-gen.h b/block/block-gen.h
> index c1fd3f40de..61f055a8cc 100644
> --- a/block/block-gen.h
> +++ b/block/block-gen.h
> @@ -27,6 +27,7 @@
>  #define BLOCK_BLOCK_GEN_H
>  
>  #include "block/block_int.h"
> +#include "monitor/monitor.h"
>  
>  /* Base structure for argument packing structures */
>  typedef struct AioPollCo {
> @@ -38,11 +39,20 @@ typedef struct AioPollCo {
>  
>  static inline int aio_poll_co(AioPollCo *s)
>  {
> +    Monitor *mon = monitor_cur();

This gets the currently executing coroutine's monitor from the hash
table.

>      assert(!qemu_in_coroutine());
>  
> +    if (mon) {
> +        monitor_set_cur(s->co, mon);

This writes it back.  No-op, since the coroutine hasn't changed.  Why?

> +    }
> +
>      aio_co_enter(s->ctx, s->co);
>      AIO_WAIT_WHILE(s->ctx, s->in_progress);
>  
> +    if (mon) {
> +        monitor_set_cur(s->co, NULL);

This removes s->co's monitor from the hash table.  Why?

> +    }
> +
>      return s->ret;
>  }


