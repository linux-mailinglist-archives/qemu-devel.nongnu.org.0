Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29815036C3
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 15:38:41 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfidM-0005xq-E1
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 09:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nficB-0005I1-Fe
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 09:37:27 -0400
Received: from smtp58.i.mail.ru ([217.69.128.38]:51464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfic7-0003zs-Tt
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 09:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Ky5nriuFWnY0L8rqkjd0A5Hcl1x/CCsMEPqXd3Eq6b4=; 
 t=1650116243;x=1650721643; 
 b=gDu+p6iTOR6MrmnLZlgZxtez0qbhKBkR96nJVSEZYqHQJ6kxSDhTt/9ySiGBBlf7e+M+8MSjwD3cKM3pc8gynWWnfhaHimBaDZN/YMpfgbVNgW4pp75aW+z7w8UI46WdgNB4kWYX4aE2KO7G6R0w/gonmutTzmBj53IMCiay88poquarExJ4/T+gTULhsTw+5PZBfMMRnifrUdcy/B8Q8gUySNpzeu3sLEeX2PjXvvQsZKcFjF1nvGPcDEZyEIQ6PQ6KZuzjDiYPniA5z7K56ibCLrfcG9sZ9BWz0UoNG+OKVIII1baoIX1jgMnB/zGsX7I91l3r7SX8t+TsdxVWcQ==;
Received: by smtp58.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfic3-0004Ia-NZ; Sat, 16 Apr 2022 16:37:20 +0300
Message-ID: <45b8dbdf-c34e-1861-534b-9dfe28bb1d5f@mail.ru>
Date: Sat, 16 Apr 2022 16:37:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 7/9] nbd: move s->state under requests_lock
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-8-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp58.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95A798FEA17BE68F0750D514B51AA9BD1D5B6D06565E552D9182A05F5380850404C228DA9ACA6FE27857642C496D97592E3CF03E4F4542F63452B0AB18AD96FAE87A69468FD5EFA96
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B264C8851FD8E810EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D07BBD2EBFB7BF888638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8231FD0AF354C64DED6895087FA8218EA6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74F330F0740BBDD1F9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC52D365B5EB63BCD33AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006372EAFB35C18708B4CD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FD2A95C73FD1EFF4535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5A5B3834F2F7EF9A987B6980BB98EA2398285AC8ED6A73EA5D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D340A4C04F5DECA7EE92E8D325A76738EA93B5169666FF7AB8C1CAF16496A17EFE1E50498E465E62D111D7E09C32AA3244C9FAB9BDE8EC306DC39462BE4B75ED83E63871F383B54D9B3FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOmri57mKkPCK9kKsCN8pow==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913FD13C95DEC633B71772F569894653E4BD778111D28507BBDE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.38;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp58.i.mail.ru
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
> Remove the confusing, and most likely wrong, atomics.  The only function
> that used to be somewhat in a hot path was nbd_client_connected(),
> but it is not anymore after the previous patches.
> 
> The same logic is used both to check if a request had to be reissued
> and also in nbd_reconnecting_attempt().  The former cases are outside
> requests_lock, while nbd_reconnecting_attempt() does have the lock,
> therefore the two have been separated in the previous commit.
> nbd_client_will_reconnect() can simply take s->requests_lock, while
> nbd_reconnecting_attempt() can inline the access now that no
> complicated atomics are involved.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

> ---
>   block/nbd.c | 78 ++++++++++++++++++++++++++++-------------------------
>   1 file changed, 41 insertions(+), 37 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 37d466e435..b5aac2548c 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -35,7 +35,6 @@
>   #include "qemu/option.h"
>   #include "qemu/cutils.h"
>   #include "qemu/main-loop.h"
> -#include "qemu/atomic.h"
>   
>   #include "qapi/qapi-visit-sockets.h"
>   #include "qapi/qmp/qstring.h"
> @@ -72,10 +71,11 @@ typedef struct BDRVNBDState {
>       NBDExportInfo info;
>   
>       /*
> -     * Protects free_sema, in_flight, requests[].coroutine,
> +     * Protects state, free_sema, in_flight, requests[].coroutine,
>        * reconnect_delay_timer.
>        */
>       QemuMutex requests_lock;
> +    NBDClientState state;
>       CoQueue free_sema;
>       int in_flight;
>       NBDClientRequest requests[MAX_NBD_REQUESTS];
> @@ -83,7 +83,6 @@ typedef struct BDRVNBDState {
>   
>       CoMutex send_mutex;
>       CoMutex receive_mutex;
> -    NBDClientState state;
>   
>       QEMUTimer *open_timer;
>   
> @@ -132,11 +131,6 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
>       s->x_dirty_bitmap = NULL;
>   }
>   
> -static bool nbd_client_connected(BDRVNBDState *s)
> -{
> -    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
> -}
> -
>   static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
>   {
>       if (req->receiving) {
> @@ -159,14 +153,15 @@ static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
>       }
>   }
>   
> -static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
> +/* Called with s->requests_lock held.  */
> +static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
>   {
> -    if (nbd_client_connected(s)) {
> +    if (s->state == NBD_CLIENT_CONNECTED) {
>           qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
>       }
>   Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>       if (ret == -EIO) {
> -        if (nbd_client_connected(s)) {
> +        if (s->state == NBD_CLIENT_CONNECTED) {
>               s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
>                                               NBD_CLIENT_CONNECTING_NOWAIT;
>           }
> @@ -177,6 +172,12 @@ static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
>       nbd_recv_coroutines_wake(s, true);
>   }
>   
> +static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
> +{
> +    QEMU_LOCK_GUARD(&s->requests_lock);
> +    nbd_channel_error_locked(s, ret);
> +}
> +
>   static void reconnect_delay_timer_del(BDRVNBDState *s)
>   {
>       if (s->reconnect_delay_timer) {
> @@ -189,20 +190,18 @@ static void reconnect_delay_timer_cb(void *opaque)
>   {
>       BDRVNBDState *s = opaque;
>   
> -    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
> -        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
> -        nbd_co_establish_connection_cancel(s->conn);
> -    }
> -
>       reconnect_delay_timer_del(s);
> +    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
> +        if (s->state != NBD_CLIENT_CONNECTING_WAIT) {
> +            return;
> +        }
> +        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
> +    }
> +    nbd_co_establish_connection_cancel(s->conn);
>   }
>   
>   static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
>   {
> -    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTING_WAIT) {
> -        return;
> -    }
> -
>       assert(!s->reconnect_delay_timer);
>       s->reconnect_delay_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
>                                                QEMU_CLOCK_REALTIME,
> @@ -225,7 +224,9 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>           s->ioc = NULL;
>       }
>   
> -    s->state = NBD_CLIENT_QUIT;
> +    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
> +        s->state = NBD_CLIENT_QUIT;
> +    }
>   }
>   
>   static void open_timer_del(BDRVNBDState *s)
> @@ -254,15 +255,15 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
>       timer_mod(s->open_timer, expire_time_ns);
>   }
>   
> -static bool nbd_client_connecting_wait(BDRVNBDState *s)
> -{
> -    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
> -}
> -
>   static bool nbd_client_will_reconnect(BDRVNBDState *s)
>   {
> -    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
> +    /*
> +     * Called only after a socket error, so this is not performance sensitive.
> +     */
> +    QEMU_LOCK_GUARD(&s->requests_lock);
> +    return s->state == NBD_CLIENT_CONNECTING_WAIT;
>   }
> +
>   /*
>    * Update @bs with information learned during a completed negotiation process.
>    * Return failure if the server's advertised options are incompatible with the
> @@ -347,22 +348,24 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>       qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
>   
>       /* successfully connected */
> -    s->state = NBD_CLIENT_CONNECTED;
> +    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
> +        s->state = NBD_CLIENT_CONNECTED;
> +    }
>   
>       return 0;
>   }
>   
> +/* Called with s->requests_lock held.  */
>   static bool nbd_client_connecting(BDRVNBDState *s)
>   {
> -    NBDClientState state = qatomic_load_acquire(&s->state);
> -    return state == NBD_CLIENT_CONNECTING_WAIT ||
> -        state == NBD_CLIENT_CONNECTING_NOWAIT;
> +    return s->state == NBD_CLIENT_CONNECTING_WAIT ||
> +        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
>   }
>   
>   /* Called with s->requests_lock taken.  */
>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>   {
> -    bool blocking = nbd_client_connecting_wait(s);
> +    bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
>   
>       /*
>        * Now we are sure that nobody is accessing the channel, and no one will
> @@ -477,17 +480,17 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>   
>       qemu_mutex_lock(&s->requests_lock);
>       while (s->in_flight == MAX_NBD_REQUESTS ||
> -           (!nbd_client_connected(s) && s->in_flight > 0)) {
> +           (s->state != NBD_CLIENT_CONNECTED && s->in_flight > 0)) {
>           qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
>       }
>   
>       s->in_flight++;
> -    if (!nbd_client_connected(s)) {
> +    if (s->state != NBD_CLIENT_CONNECTED) {
>           if (nbd_client_connecting(s)) {
>               nbd_reconnect_attempt(s);
>               qemu_co_queue_restart_all(&s->free_sema);
>           }
> -        if (!nbd_client_connected(s)) {
> +        if (s->state != NBD_CLIENT_CONNECTED) {
>               rc = -EIO;
>               goto err;
>           }
> @@ -530,7 +533,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>       if (rc < 0) {
>           qemu_mutex_lock(&s->requests_lock);
>   err:
> -        nbd_channel_error(s, rc);
> +        nbd_channel_error_locked(s, rc);
>           if (i != -1) {
>               s->requests[i].coroutine = NULL;
>           }
> @@ -1443,8 +1446,9 @@ static void nbd_yank(void *opaque)
>       BlockDriverState *bs = opaque;
>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>   
> -    qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
> +    QEMU_LOCK_GUARD(&s->requests_lock);
>       qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +    s->state = NBD_CLIENT_QUIT;

This last addition looks like a fix, that could be a separate commit.

>   }
>   
>   static void nbd_client_close(BlockDriverState *bs)


-- 
Best regards,
Vladimir

