Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8B35DE1E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:55:50 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHe1-0001f5-0t
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lWHc3-0000kT-G3
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:53:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lWHc0-0005kq-Qv
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618314822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQvGVDijJ+YppuEhb9VuGiseHxG6npgOgv0LU/nsEZw=;
 b=YSFI+tVZiSXO8HqxstmnleIi8cIQ5kl5qVep0JT3nPKwwHfMDwwNURSf2+8E6iWVmJopnW
 nIBrX7QGyrZcrBWh03MoYXm4cB5NihPVf3EN6KTfqciApVMoEbTMdit4UYgB5C7kFd+7UV
 HANSRxJFf66seEfxS6tdyeegVzKh5Wc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-Q2QmWS9KPsaGiKAgKcSZkg-1; Tue, 13 Apr 2021 07:53:40 -0400
X-MC-Unique: Q2QmWS9KPsaGiKAgKcSZkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A716E801814;
 Tue, 13 Apr 2021 11:53:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-55.ams2.redhat.com
 [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F5CF5D76F;
 Tue, 13 Apr 2021 11:53:37 +0000 (UTC)
Subject: Re: [PATCH for-6.0] block/nbd: fix possible use after free of
 s->connect_thread
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <eb293b4a-6335-5788-5cf8-7f98d04ccfba@redhat.com>
Date: Tue, 13 Apr 2021 13:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210406155114.1057355-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, rvkagan@yandex-team.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.21 17:51, Vladimir Sementsov-Ogievskiy wrote:
> If on nbd_close() we detach the thread (in
> nbd_co_establish_connection_cancel() thr->state becomes
> CONNECT_THREAD_RUNNING_DETACHED), after that point we should not use
> s->connect_thread (which is set to NULL), as running thread may free it
> at any time.
> 
> Still nbd_co_establish_connection() does exactly this: it saves
> s->connect_thread to local variable (just for better code style) and
> use it even after yield point, when thread may be already detached.
> 
> Fix that. Also check thr to be non-NULL on
> nbd_co_establish_connection() start for safety.
> 
> After this patch "case CONNECT_THREAD_RUNNING_DETACHED" becomes
> impossible in the second switch in nbd_co_establish_connection().
> Still, don't add extra abort() just before the release. If it somehow
> possible to reach this "case:" it won't hurt. Anyway, good refactoring
> of all this reconnect mess will come soon.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all! I faced a crash, just running 277 iotest in a loop. I can't
> reproduce it on master, it reproduces only on my branch with nbd
> reconnect refactorings.
> 
> Still, it seems very possible that it may crash under some conditions.
> So I propose this patch for 6.0. It's written so that it's obvious that
> it will not hurt:
> 
>   pre-patch, on first hunk we'll just crash if thr is NULL,
>   on second hunk it's safe to return -1, and using thr when
>   s->connect_thread is already zeroed is obviously wrong.
> 
>   block/nbd.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index c26dc5a54f..1d4668d42d 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -443,6 +443,11 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
>       BDRVNBDState *s = bs->opaque;
>       NBDConnectThread *thr = s->connect_thread;
>   
> +    if (!thr) {
> +        /* detached */
> +        return -1;
> +    }
> +
>       qemu_mutex_lock(&thr->mutex);
>   
>       switch (thr->state) {

First, it is a bit strange not to set *errp in these cases.  I don’t 
think it’d make a difference anyway, but now that I look into it...  The 
error would be propagated to s->connect_err, but that isn’t used 
anywhere, so...  What’s the point?

Anyway.  What I really wanted to ask is: nbd_co_establish_connection() 
may create a thread, which accesses the thread.  Is that a problem? 
Like, can this happen:

- nbd_co_establish_connection(): thr->state := THREAD_RUNNING
- nbd_co_establish_connection(): thread is created
- nbd_co_establish_connection(): thr->mutex unlocked
- connect_thread_func(): thr->mutex locked
- connect_thread_func(): thr->state := something else
- connect_thread_func(): thr->mutex unlocked
- nbd_co_establish_connection(): yields
- (As I understood it, this yield leads to
    nbd_co_establish_connection_cancel() continuing)
- nbd_co_EC_cancel(): thr->mutex locked
- nbd_co_EC_cancel(): do_free true
- nbd_co_EC_cancel(): nbd_free_connect_thread()
- connect_thread_func(): nbd_free_connect_thread()

?

Max


