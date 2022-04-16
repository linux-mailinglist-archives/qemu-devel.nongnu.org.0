Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CDB503690
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 14:21:01 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfhQC-0004lU-FL
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 08:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfhNu-0003bp-Tt
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 08:18:39 -0400
Received: from smtp17.mail.ru ([94.100.176.154]:52238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfhNs-0007fe-Ds
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 08:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=JmEuTHDddtfr0G8M8xUA9QJqy/wZaojfCIPEohFQKQk=; 
 t=1650111516;x=1650716916; 
 b=LUDtxsCzikeDJ1neKy/YVHV24XkH/RwbD84vDf1X6HBQ+9/a1JmQrEb2lJkE+gp4BInHZTEcv21y00VsMsC7bqlLAM3I+/5VQIJIZHWmzPWe8w8YNSE6G1/YIf86uxPHIbq+PP/zaLTeRRfJlrSia4BcMEPH50suwsdhL6Ca8V3D58JT43FMrfGGrGvMb1pOeKrk09D8ZqRcrNlcNTuJ9IsFYSPpNDLxLDbhn/lScDN5NhTYmqbZZTLfpB4vbZi7Z1mVRGWSCI/a6wo2c1pCv5WwIPoQPcnOlWd/IQLspMmZP3p+bfdTo069dOESBcCdlzQjpuBUfkWTehlE6Ezcyg==;
Received: by smtp17.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfhNn-0007WB-VN; Sat, 16 Apr 2022 15:18:32 +0300
Message-ID: <995e87bd-f0f9-3ff9-32b0-19c02c29cf89@mail.ru>
Date: Sat, 16 Apr 2022 15:18:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 5/9] nbd: use a QemuMutex to synchronize
 yanking, reconnection and coroutines
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-6-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp17.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD916C41472748AFA044802A7C8EAC3687C03551E4DDAECA58400894C459B0CD1B983083A3B8A790FFA1F86922D173DF8856EFFD99B36EB5CC262FD7B6C194EAF12
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E2D36A15E1833D8EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063795AFAF91F541EBCE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D898D85CD0565ED8039356847F683CDEB66F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE729FBA39629FC1B7C9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E57F4578A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCE6A2F950A10922ED3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637FB8025AFA01CA121D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD9D78FC3670308535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5E543D03E8EE568096FF1E03AEF4D0582AA5E6C8F4EBE98CBD59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D4E96E2A5B1100E033965A1BB445D6EDD4DDB34EC4B614FFB6D663D13D041992877377F66D5B3EFA1D7E09C32AA3244CB93937217A846B69CBCD1A4FC13DDD5469B6CAE0477E908DFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOmri57mKkPCBPPLdF9w0Ww==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913B356E969FF6A906A0F4C1DE072915D03ED0389503CE99B38E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.176.154;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp17.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.04.2022 20:57, Paolo Bonzini wrote:
> The condition for waiting on the s->free_sema queue depends on
> both s->in_flight and s->state.  The latter is currently using
> atomics, but this is quite dubious and probably wrong.
> 
> Because s->state is written in the main thread too, for example by
> the yank callback, it cannot be protected by a CoMutex.  Introduce a
> separate lock that can be used by nbd_co_send_request(); later on this
> lock will also be used for s->state.  There will not be any contention
> on the lock unless there is a yank or reconnect, so this is not
> performance sensitive.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/nbd.c | 46 +++++++++++++++++++++++++++-------------------
>   1 file changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 62dd338ef3..a2414566d1 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -71,17 +71,22 @@ typedef struct BDRVNBDState {
>       QIOChannel *ioc; /* The current I/O channel */
>       NBDExportInfo info;
>   
> -    CoMutex send_mutex;
> +    /*
> +     * Protects free_sema, in_flight, requests[].coroutine,
> +     * reconnect_delay_timer.
> +     */

requests[].coroutine is read without mutex in nbd_receive_replies

reconnect_delay_timer_del() is called without mutex in nbd_cancel_in_flight() and in reconnect_delay_timer_cb()..

Is it OK? Worth improving the comment?

> +    QemuMutex requests_lock;
>       CoQueue free_sema;
> -
> -    CoMutex receive_mutex;
>       int in_flight;
> +    NBDClientRequest requests[MAX_NBD_REQUESTS];
> +    QEMUTimer *reconnect_delay_timer;
> +
> +    CoMutex send_mutex;
> +    CoMutex receive_mutex;
>       NBDClientState state;
>   
> -    QEMUTimer *reconnect_delay_timer;
>       QEMUTimer *open_timer;
>   
> -    NBDClientRequest requests[MAX_NBD_REQUESTS];
>       NBDReply reply;
>       BlockDriverState *bs;
>   
> @@ -350,7 +355,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>       return 0;
>   }
>   
> -/* called under s->send_mutex */
> +/* Called with s->requests_lock taken.  */
>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>   {
>       bool blocking = nbd_client_connecting_wait(s);
> @@ -382,9 +387,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>           s->ioc = NULL;
>       }
>   
> -    qemu_co_mutex_unlock(&s->send_mutex);
> +    qemu_mutex_unlock(&s->requests_lock);
>       nbd_co_do_establish_connection(s->bs, blocking, NULL);
> -    qemu_co_mutex_lock(&s->send_mutex);
> +    qemu_mutex_lock(&s->requests_lock);
>   
>       /*
>        * The reconnect attempt is done (maybe successfully, maybe not), so
> @@ -466,11 +471,10 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>       int rc, i = -1;
>   
> -    qemu_co_mutex_lock(&s->send_mutex);
> -
> +    qemu_mutex_lock(&s->requests_lock);
>       while (s->in_flight == MAX_NBD_REQUESTS ||
>              (!nbd_client_connected(s) && s->in_flight > 0)) {
> -        qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
> +        qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
>       }
>   
>       s->in_flight++;
> @@ -491,13 +495,13 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,

Prior to this patch, if request sending fails, we'll not send further requests. After the patch, we can send more requests after failure on unlocking send_mutex.

May be that's not bad..

What's wrong if we keep send_mutex critical section as is and just lock requests_lock additionally inside send_mutex-critical-section?


>           }
>       }
>   
> -    g_assert(qemu_in_coroutine());
>       assert(i < MAX_NBD_REQUESTS);
> -
>       s->requests[i].coroutine = qemu_coroutine_self();
>       s->requests[i].offset = request->from;
>       s->requests[i].receiving = false;
> +    qemu_mutex_unlock(&s->requests_lock);
>   
> +    qemu_co_mutex_lock(&s->send_mutex);
>       request->handle = INDEX_TO_HANDLE(s, i);
>   
>       assert(s->ioc);
> @@ -517,17 +521,19 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>       } else {
>           rc = nbd_send_request(s->ioc, request);
>       }
> +    qemu_co_mutex_unlock(&s->send_mutex);
>   
> -err:
>       if (rc < 0) {
> +        qemu_mutex_lock(&s->requests_lock);
> +err:
>           nbd_channel_error(s, rc);
>           if (i != -1) {
>               s->requests[i].coroutine = NULL;
>           }
>           s->in_flight--;
>           qemu_co_queue_next(&s->free_sema);
> +        qemu_mutex_unlock(&s->requests_lock);
>       }
> -    qemu_co_mutex_unlock(&s->send_mutex);
>       return rc;
>   }
>   
> @@ -1017,12 +1023,11 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
>       return true;
>   
>   break_loop:
> +    qemu_mutex_lock(&s->requests_lock);
>       s->requests[HANDLE_TO_INDEX(s, handle)].coroutine = NULL;
> -
> -    qemu_co_mutex_lock(&s->send_mutex);
>       s->in_flight--;
>       qemu_co_queue_next(&s->free_sema);
> -    qemu_co_mutex_unlock(&s->send_mutex);
> +    qemu_mutex_unlock(&s->requests_lock);
>   
>       return false;
>   }
> @@ -1855,8 +1860,9 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>   
>       s->bs = bs;
> -    qemu_co_mutex_init(&s->send_mutex);
> +    qemu_mutex_init(&s->requests_lock);
>       qemu_co_queue_init(&s->free_sema);
> +    qemu_co_mutex_init(&s->send_mutex);
>       qemu_co_mutex_init(&s->receive_mutex);
>   
>       if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
> @@ -2044,9 +2050,11 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
>   
>       reconnect_delay_timer_del(s);
>   
> +    qemu_mutex_lock(&s->requests_lock);
>       if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
>           s->state = NBD_CLIENT_CONNECTING_NOWAIT;
>       }
> +    qemu_mutex_unlock(&s->requests_lock);
>   
>       nbd_co_establish_connection_cancel(s->conn);
>   }


-- 
Best regards,
Vladimir

