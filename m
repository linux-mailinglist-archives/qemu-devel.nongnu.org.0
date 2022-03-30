Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575334EC782
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:55:59 +0200 (CEST)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZjq-0006Gn-3F
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:55:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZZic-0005bF-9h
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:54:42 -0400
Received: from smtp42.i.mail.ru ([94.100.177.102]:39966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZZiW-000356-RT
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=wN+ufpCwdDgz8VC1hUu4pTcPmltdeS/afu9VcXlPy2U=; 
 t=1648652076;x=1649257476; 
 b=h1NW1VqMsCeYeKTHKJqCUpuiNGQVDyDzKB/MCXleuu3vL2tfOGgM73Vl9bjW1pwQ/eUq2Qv50XsKY7FpJkFfGBOsWcWreccl8ha28cG20qWTS31RQgWW2qClnyqQSsiMLXdGbUTHRc+plxHT5QL6/dSZyVSr8D4qyuWs81ESl1B7W7N304gjkl81lSLHb0VU0f6alf+shQjhD9qqiFcUcIHmWtCLRRLvApfTibYisPsasVKNZYZ+29e3NPjPtKc+IAF6kIvMQYaYevcUG6zYQuk+LWgB4Nkd+skUfPcJPyoLc19Om4H0TFIzg0OdExNWO6O55+qOgTyaXbDhhImvGg==;
Received: by smtp42.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZZiQ-0001XY-Bu; Wed, 30 Mar 2022 17:54:31 +0300
Message-ID: <9c5f38c4-d75f-95e0-cabd-3e483c9406ec@mail.ru>
Date: Wed, 30 Mar 2022 17:54:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 7/9] colo-compare: safe finalization
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-8-maxim.davydov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220328211539.90170-8-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp42.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE6427D5C075F9E61C41307589F8F117601A182A05F5380850404C228DA9ACA6FE27622F56EC3934334E5B267C5358F4086F83B77A786F13C172BCF985C6500642D4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE712EB008F780777E9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063764BF1E09E94CC6278638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8772BBEC979996D14D28A0B4AD7D2933A6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7655D724DF6BFD6619FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAE9A1BBD95851C5BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCBCF4FD0AB353E61B3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006378351E72014A3C708D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FAE2BFB9A60527F4F6D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A521903B9543D15F93940CA7DAFCA65F0B6EA062132BD1E161D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342833AC5E8E9ACF1CAFCBEA723FC998943227820350BEAB5BCCC34BB98D440280A0186E36118E54BE1D7E09C32AA3244C86496C0F9426A5618B12C496B4F02C568A6D4CC6FBFAC2514A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+U6dBaT1luoNQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE6E60BB05DA1D770F7F53F2569601ADBBFDF93A8370D74BA0E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.102;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp42.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

29.03.2022 00:15, Maxim Davydov wrote:
> Fixes some possible issues with finalization. For example, finalization
> immediately after instance_init fails on the assert.
> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>   net/colo-compare.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 62554b5b3c..81d8de0aaa 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -1426,7 +1426,7 @@ static void colo_compare_finalize(Object *obj)
>               break;
>           }
>       }
> -    if (QTAILQ_EMPTY(&net_compares)) {
> +    if (QTAILQ_EMPTY(&net_compares) && colo_compare_active) {
>           colo_compare_active = false;
>           qemu_mutex_destroy(&event_mtx);
>           qemu_cond_destroy(&event_complete_cond);
> @@ -1442,19 +1442,26 @@ static void colo_compare_finalize(Object *obj)
>   
>       colo_compare_timer_del(s);
>   
> -    qemu_bh_delete(s->event_bh);
> +    if (s->event_bh) {
> +        qemu_bh_delete(s->event_bh);
> +    }
>   
> -    AioContext *ctx = iothread_get_aio_context(s->iothread);
> -    aio_context_acquire(ctx);
> -    AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
> -    if (s->notify_dev) {
> -        AIO_WAIT_WHILE(ctx, !s->notify_sendco.done);
> +    if (s->iothread) {
> +        AioContext *ctx = iothread_get_aio_context(s->iothread);
> +        aio_context_acquire(ctx);
> +        AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
> +        if (s->notify_dev) {
> +            AIO_WAIT_WHILE(ctx, !s->notify_sendco.done);
> +        }
> +        aio_context_release(ctx);
>       }
> -    aio_context_release(ctx);
>   
>       /* Release all unhandled packets after compare thead exited */
>       g_queue_foreach(&s->conn_list, colo_flush_packets, s);
> -    AIO_WAIT_WHILE(NULL, !s->out_sendco.done);
> +    /* Without colo_compare_complete done == false without packets */
> +    if (!g_queue_is_empty(&s->out_sendco.send_list)) {
> +        AIO_WAIT_WHILE(NULL, !s->out_sendco.done);
> +    }

I think, would be good to add more description for this last change. It's not as obvious as previous two changes.

>   
>       g_queue_clear(&s->conn_list);
>       g_queue_clear(&s->out_sendco.send_list);


-- 
Best regards,
Vladimir

