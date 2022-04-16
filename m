Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4525036E4
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 15:56:11 +0200 (CEST)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfiuI-000550-8c
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 09:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfisR-0003zi-L4
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 09:54:15 -0400
Received: from smtp34.i.mail.ru ([94.100.177.94]:51628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfisO-0006Wd-SY
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 09:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=n/BzREOrA/VNTDNINX0q+x2Zj7UpkWogWKXIwUwjt78=; 
 t=1650117252;x=1650722652; 
 b=JwYnoioT3bsBRr/hDMU6fqd91BC4im0P2at4vwwc+tto3QiheSAVYFw/k6g8/S1awhU2sB96HSyf/lLsAS5YtcsXThCcqEoackLq+dPNbtrCem/ok9ak3cIWRL0ctPL+XOWzny5QpOMREw3UqXhl/ZOUCAgKmT8sCodKQMEBJxdsOE4eehCDLY6uC+niqfbD3VXlU1T3VIZUzy3INzWg9pVGwZnpPYP9wrwghON/Hn1HKeS0Hm5c3T8LwkCjmAyOoN4CmT0dKJRq7cvF9W7yfI4vjJdl9mSxcZZvhZTBz1I8Cowx/0FDicANwhoJrvxbbqYE5JJzTlrUmSxHbatRyQ==;
Received: by smtp34.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfisK-0005Ou-Vf; Sat, 16 Apr 2022 16:54:09 +0300
Message-ID: <01877ebd-5b8b-eac2-fe4e-3e9fe888dfe1@mail.ru>
Date: Sat, 16 Apr 2022 16:54:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 8/9] nbd: take receive_mutex when reading
 requests[].receiving
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-9-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp34.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD916C41472748AFA04EBDE724ED28760BCE1E77EE8C88B302900894C459B0CD1B926A0789B1610AF3519B8DBFA6E7FF55CD9E1F4ACA6CDFCB20E5F34248A8274CD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C6068CE86C2B75F5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637160171C9EBC7AFE48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F8DDACB270C62868444C34CA1123E68B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7302A6E9DBA3751109FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD186FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEA77C8EAE1CE44B0A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC2CE340A784E694483AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006372EAFB35C18708B4CD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FC0F9454058DFE53CCE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5F19AEAC5ECBD05BE52D458B0DB962FCCF70843D95D77C983D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34682FD2D2951524C51022F516E8C51AF391C843378060401087B045D02C89D1495010C2A602370CEE1D7E09C32AA3244C7967D4EE4F561D11C1E03DBFE93BDB4A1DD47778AE04E04DFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOmri57mKkPAwij4lI2WoKw==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913AAD79B0F1648A3B6920B6E92549A35ED7D716BD2B5F77E38E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.94;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp34.i.mail.ru
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
> requests[].receiving is set by nbd_receive_replies() under the receive_mutex;
> Read it under the same mutex as well.  Waking up receivers on errors happens
> after each reply finishes processing, in nbd_co_receive_one_chunk().
> If there is no currently-active reply, there are two cases:
> 
> * either there is no active request at all, in which case no
> element of request[] can have .receiving = true
> 
> * or nbd_receive_replies() must be running and owns receive_mutex;
> in that case it will get back to nbd_co_receive_one_chunk() because
> the socket has been shutdown, and all waiting coroutines will wake up
> in turn.
> 

Seems that removing "nbd_recv_coroutines_wake(s, true);" from nbd_channel_error_locked() could be a separate preparing patch. It's a separate thing:
no sense to wake all receving coroutines on error, if they will wake each-other in a chain anyway..

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

> ---
>   block/nbd.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index b5aac2548c..31c684772e 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -131,6 +131,7 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
>       s->x_dirty_bitmap = NULL;
>   }
>   
> +/* Called with s->receive_mutex taken.  */
>   static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
>   {
>       if (req->receiving) {
> @@ -142,12 +143,13 @@ static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
>       return false;
>   }
>   
> -static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
> +static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s)
>   {
>       int i;
>   
> +    QEMU_LOCK_GUARD(&s->receive_mutex);
>       for (i = 0; i < MAX_NBD_REQUESTS; i++) {
> -        if (nbd_recv_coroutine_wake_one(&s->requests[i]) && !all) {
> +        if (nbd_recv_coroutine_wake_one(&s->requests[i])) {
>               return;
>           }
>       }
> @@ -168,8 +170,6 @@ static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
>       } else {
>           s->state = NBD_CLIENT_QUIT;
>       }
> -
> -    nbd_recv_coroutines_wake(s, true);
>   }
>   
>   static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
> @@ -432,11 +432,10 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
>   
>               qemu_coroutine_yield();
>               /*
> -             * We may be woken for 3 reasons:
> +             * We may be woken for 2 reasons:
>                * 1. From this function, executing in parallel coroutine, when our
>                *    handle is received.
> -             * 2. From nbd_channel_error(), when connection is lost.
> -             * 3. From nbd_co_receive_one_chunk(), when previous request is
> +             * 2. From nbd_co_receive_one_chunk(), when previous request is
>                *    finished and s->reply.handle set to 0.
>                * Anyway, it's OK to lock the mutex and go to the next iteration.
>                */
> @@ -928,7 +927,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
>       }
>       s->reply.handle = 0;
>   
> -    nbd_recv_coroutines_wake(s, false);
> +    nbd_recv_coroutines_wake(s);
>   
>       return ret;
>   }


-- 
Best regards,
Vladimir

