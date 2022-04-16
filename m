Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE150366B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 13:56:27 +0200 (CEST)
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfh2Q-0005qI-KA
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 07:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfh0w-000556-C1
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 07:54:54 -0400
Received: from smtp63.i.mail.ru ([217.69.128.43]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfh0t-0003iw-AS
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 07:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=nUYYrv4OdTzIe7kbKKOM4avHIUSdlngA6GI1JAVyN/s=; 
 t=1650110091;x=1650715491; 
 b=IIoFl1jyGwOMuqwnAVurDCwWWO5wB9bVWZUGleh3cE9RihutlIFa7wzXq+bHnFpTr1yqCjDFgObvfyrkx5iJAl5Tc5vtso7/obUEdZ0zq74vhxG+Otvuw9nHToqEdfrmxRI5IqfvMDOIURYh5j3jcbpBhJr2OpkhOPxwIuR3vRx+iETROpxa/CK7I1TVLMil8Q3GKVctJk9krVyED88Ch9Om5rrDXONeHRDPwKKc+R1uyF3gI8LtsJHjz7rF0vsDVO/AC6VtuALtKjwpg2CN4SFzLQPMPJ8dOkVXApoMcjgyK+FK5/GUMffjlL1WjxczHpPnfi8i4tX+Xdaqfc6jvA==;
Received: by smtp63.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfh0o-0005yW-IT; Sat, 16 Apr 2022 14:54:47 +0300
Message-ID: <db1afb67-5d7a-5c98-1564-6a3a637d138f@mail.ru>
Date: Sat, 16 Apr 2022 14:54:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 4/9] nbd: keep send_mutex/free_sema handling
 outside nbd_co_do_establish_connection
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-5-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp63.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD916C41472748AFA04013005C0D8F583A6476F10B4B0E16F7500894C459B0CD1B924C3F408CA74267A7A52268C92F281B3FAC865319373CA7168841D2DEA990C46
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F68DA2F3749BB650EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375D54B99ECAFA2F678638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85900AD80198319256D0CE6A06D163DAB6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7302A6E9DBA3751109FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B8C7ADC89C2F0B2A5A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCE6A2F950A10922ED3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637FB8025AFA01CA121D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F72BE6798D60363526D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A51EF5942CD7E1E65C8E0092EA2EED3B9C528E7FA4EA2DABCAD59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34CAFBC0A7A4BEEE01DB945CD3C60CD0C878EE389748A231939E9BFF701CA84FBFB476DCDAE607D4AC1D7E09C32AA3244C6DCB8161C26813D7280E67551112136BF165894D92D62706FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOmri57mKkPCNFLCMyMi+VA==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913BDD3ECAB3E2CC5577BA927FA5E30ACCB0A040B66FB33F51AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.43;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp63.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

14.04.2022 20:57, Paolo Bonzini wrote:
> Elevate s->in_flight early so that other incoming requests will wait
> on the CoQueue in nbd_co_send_request; restart them after getting back
> from nbd_reconnect_attempt.  This could be after the reconnect timer or
> nbd_cancel_in_flight have cancelled the attempt, so there is no
> need anymore to cancel the requests there.
> 
> nbd_co_send_request now handles both stopping and restarting pending
> requests after a successful connection, and there is no need to
> hold send_mutex in nbd_co_do_establish_connection.  The current setup
> is confusing because nbd_co_do_establish_connection is called both with
> send_mutex taken and without it.  Before the patch it uses free_sema which
> (at least in theory...) is protected by send_mutex, after the patch it
> does not anymore.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Seems good to me, still again, hard to imagine, can it lead to some new dead-locks or not. Seems not, at least I don't see the problem. We will see.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

> ---
>   block/coroutines.h |  4 +--
>   block/nbd.c        | 66 ++++++++++++++++++++++------------------------
>   2 files changed, 33 insertions(+), 37 deletions(-)
> 
> diff --git a/block/coroutines.h b/block/coroutines.h
> index b293e943c8..8f6e438ef3 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -59,7 +59,7 @@ int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
>                                           QEMUIOVector *qiov, int64_t pos);
>   
>   int coroutine_fn
> -nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
> +nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
>   
>   
>   int coroutine_fn
> @@ -109,7 +109,7 @@ bdrv_common_block_status_above(BlockDriverState *bs,
>                                  BlockDriverState **file,
>                                  int *depth);
>   int generated_co_wrapper
> -nbd_do_establish_connection(BlockDriverState *bs, Error **errp);
> +nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
>   
>   int generated_co_wrapper
>   blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
> diff --git a/block/nbd.c b/block/nbd.c
> index a30603ce87..62dd338ef3 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -187,9 +187,6 @@ static void reconnect_delay_timer_cb(void *opaque)
>       if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
>           s->state = NBD_CLIENT_CONNECTING_NOWAIT;
>           nbd_co_establish_connection_cancel(s->conn);
> -        while (qemu_co_enter_next(&s->free_sema, NULL)) {
> -            /* Resume all queued requests */
> -        }
>       }
>   
>       reconnect_delay_timer_del(s);

Seems, removing the timer is not needed here too. We do nbd_co_establish_connection_cancel(), and timer will be removed in nbd_reconnect_attempt anyway.

More over, we don't need to keep timer in the state at all: it should become local thing for nbd_reconnect_attempt. A kind of call nbd_co_do_establish_connection() with timeout. That could be refactored later, using same way as in 4-5 patches of my "[PATCH v4 0/7] copy-before-write: on-cbw-error and cbw-timeout" series.

> @@ -310,11 +307,10 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
>   }
>   
>   int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
> -                                                Error **errp)
> +                                                bool blocking, Error **errp)
>   {
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>       int ret;
> -    bool blocking = nbd_client_connecting_wait(s);
>       IO_CODE();
>   
>       assert(!s->ioc);
> @@ -350,7 +346,6 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>   
>       /* successfully connected */
>       s->state = NBD_CLIENT_CONNECTED;
> -    qemu_co_queue_restart_all(&s->free_sema);
>   
>       return 0;
>   }
> @@ -358,25 +353,25 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>   /* called under s->send_mutex */
>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>   {
> -    assert(nbd_client_connecting(s));
> -    assert(s->in_flight == 0);
> -
> -    if (nbd_client_connecting_wait(s) && s->reconnect_delay &&
> -        !s->reconnect_delay_timer)
> -    {
> -        /*
> -         * It's first reconnect attempt after switching to
> -         * NBD_CLIENT_CONNECTING_WAIT
> -         */
> -        reconnect_delay_timer_init(s,
> -            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> -            s->reconnect_delay * NANOSECONDS_PER_SECOND);
> -    }
> +    bool blocking = nbd_client_connecting_wait(s);
>   
>       /*
>        * Now we are sure that nobody is accessing the channel, and no one will
>        * try until we set the state to CONNECTED.
>        */
> +    assert(nbd_client_connecting(s));
> +    assert(s->in_flight == 1);
> +
> +    if (blocking && !s->reconnect_delay_timer) {
> +        /*
> +         * It's the first reconnect attempt after switching to
> +         * NBD_CLIENT_CONNECTING_WAIT
> +         */
> +        g_assert(s->reconnect_delay);
> +        reconnect_delay_timer_init(s,
> +            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
> +            s->reconnect_delay * NANOSECONDS_PER_SECOND);
> +    }
>   
>       /* Finalize previous connection if any */
>       if (s->ioc) {
> @@ -387,7 +382,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>           s->ioc = NULL;
>       }
>   
> -    nbd_co_do_establish_connection(s->bs, NULL);
> +    qemu_co_mutex_unlock(&s->send_mutex);
> +    nbd_co_do_establish_connection(s->bs, blocking, NULL);
> +    qemu_co_mutex_lock(&s->send_mutex);


Hmm. So, that breaks a critical section.

We can do it because in_flight=1 and we are not connected => all other requests will wait in the queue.

Still. during nbd_co_do_establish_connection() state may become CONNECTED. That theoretically means that parallel requests may start.

Is it bad? Seems not.. Bad thing that comes into my mind is that parallel request fails, and go to reconnect, and start own timer, but we remove it now after locking the mutex back. But that's not possible as parallel request should wait for in-flight=0 to start own reconnect-attempt. And that is not possible, as we keep our in-flight point.


>   
>       /*
>        * The reconnect attempt is done (maybe successfully, maybe not), so
> @@ -472,21 +469,21 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>       qemu_co_mutex_lock(&s->send_mutex);
>   
>       while (s->in_flight == MAX_NBD_REQUESTS ||
> -           (!nbd_client_connected(s) && s->in_flight > 0))
> -    {
> +           (!nbd_client_connected(s) && s->in_flight > 0)) {
>           qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
>       }
>   
> -    if (nbd_client_connecting(s)) {
> -        nbd_reconnect_attempt(s);
> -    }
> -
> -    if (!nbd_client_connected(s)) {
> -        rc = -EIO;
> -        goto err;
> -    }
> -
>       s->in_flight++;

I like how this works.

> +    if (!nbd_client_connected(s)) {
> +        if (nbd_client_connecting(s)) {
> +            nbd_reconnect_attempt(s);
> +            qemu_co_queue_restart_all(&s->free_sema);
> +        }
> +        if (!nbd_client_connected(s)) {
> +            rc = -EIO;
> +            goto err;
> +        }
> +    }
>   
>       for (i = 0; i < MAX_NBD_REQUESTS; i++) {
>           if (s->requests[i].coroutine == NULL) {
> @@ -526,8 +523,8 @@ err:
>           nbd_channel_error(s, rc);
>           if (i != -1) {
>               s->requests[i].coroutine = NULL;
> -            s->in_flight--;
>           }
> +        s->in_flight--;
>           qemu_co_queue_next(&s->free_sema);
>       }
>       qemu_co_mutex_unlock(&s->send_mutex);
> @@ -1883,7 +1880,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>   
>       s->state = NBD_CLIENT_CONNECTING_WAIT;
> -    ret = nbd_do_establish_connection(bs, errp);
> +    ret = nbd_do_establish_connection(bs, true, errp);
>       if (ret < 0) {
>           goto fail;
>       }
> @@ -2049,7 +2046,6 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
>   
>       if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
>           s->state = NBD_CLIENT_CONNECTING_NOWAIT;
> -        qemu_co_queue_restart_all(&s->free_sema);

As I understand, we always have one request running (or no requests at all, but that's OK too) and it will wake all others (altogether, or they will wake each other in a chain). So, we don't need to wake them here.

>       }
>   
>       nbd_co_establish_connection_cancel(s->conn);


-- 
Best regards,
Vladimir

