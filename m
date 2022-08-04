Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED90589F78
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:40:00 +0200 (CEST)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdt9-0007nS-AT
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJdor-0002OQ-EN
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oJdom-0001Wv-QX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659630927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dTtWroKzbDKO6gxrJvEQolvYUrcePlOkW8eM29nHQLQ=;
 b=RAFODNM049MMjJZU0gZ99J40dJK2vD+tLkWOFzSNn3j12GVuLRaMJL1mtDJ539e9hCkeVL
 6v+LuR+a2VYC/svJEp3B+cpoM75ODV1SSzn3jy9DTLGbyodIdTv3laZRvkLdXqBcIU+rke
 mXFca1oSgD677FI8mJ7C+ea5WU2W5tU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-Hf23NeXKM8uK-AxRGLxJuQ-1; Thu, 04 Aug 2022 12:35:23 -0400
X-MC-Unique: Hf23NeXKM8uK-AxRGLxJuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56302811E75;
 Thu,  4 Aug 2022 16:35:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB13114152E0;
 Thu,  4 Aug 2022 16:35:20 +0000 (UTC)
Date: Thu, 4 Aug 2022 18:35:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH v10 10/21] block/mirror.c: use of job helpers in drivers
 to avoid TOC/TOU
Message-ID: <Yuv1R+l8Ug+ghePC@redhat.com>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-11-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725073855.76049-11-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
> Once job lock is used and aiocontext is removed, mirror has
> to perform job operations under the same critical section,
> using the helpers prepared in previous commit.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Can you explain in the commit message what the TOC/TOU case is that this
patch is addressing? It's not obvious to me why you picked exactly these
places to add locking.

> diff --git a/block/mirror.c b/block/mirror.c
> index d8ecb9efa2..b38676e19d 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -654,9 +654,13 @@ static int mirror_exit_common(Job *job)
>      BlockDriverState *target_bs;
>      BlockDriverState *mirror_top_bs;
>      Error *local_err = NULL;
> -    bool abort = job->ret < 0;
> +    bool abort;
>      int ret = 0;
>  
> +    WITH_JOB_LOCK_GUARD() {
> +        abort = job->ret < 0;
> +    }

This is the most mysterious hunk to me. The only thing that should
modify job->ret is the caller of this function anyway, but let's assume
for a moment that another thread could write to it.

Then why is it only important that we hold the lock when we're reading
the value, but not any more when we are actually using it? And what is
the TOC/TOU that this fixes?

Kevin


