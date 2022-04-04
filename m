Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D323C4F1863
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:29:45 +0200 (CEST)
Received: from localhost ([::1]:41522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbOeG-0001IS-Uh
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:29:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbOVk-0000cx-J4
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:20:56 -0400
Received: from [2a00:1450:4864:20::232] (port=34576
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nbOVh-0005A0-RB
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:20:56 -0400
Received: by mail-lj1-x232.google.com with SMTP id 17so13391119lji.1
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HW5UYCE1eIqkL33P5MuBlyMX+K2tV9RAhMRxXGNJ+mQ=;
 b=yB6XiStH+FJj4zE1J+TZhXaMpAC9zHEx/WcGzAp/uiZJHiNY/e+t2MIziduPIDmqLp
 AGdd5Q1EGKnDarJXWeB/YqkW2EAY/obNf9lki33NO4bZ7Yq+m1RoaF5r/OtfkaKXbTgL
 EU9EntFsovVOrZ4saRcspYe4aCNdNyv8CRI6KaNehRKy00FaEexW9QP/tK0jk07h0QbL
 0LFZ3AYMD/S0uXnWIBmvuk1Ey+x5fvIp8mdzZ6JFR54arcJi9im0RdaB1wom62l/uzXU
 sGYkZcdJ93dwwlQioIW3QvIhoCxqKHDRgHfePgFjHXz5qVSq+mbtYVWUAVaHGFzeDSUq
 eCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HW5UYCE1eIqkL33P5MuBlyMX+K2tV9RAhMRxXGNJ+mQ=;
 b=ynI6V1rti9KNc4K03o11h63CpU/iD3Lsxdi1yqZUKJ9aGW2v/tfOs1GRwq3jO02fcy
 B3lo/ouJ6fW+U73HbHAJ5aGsn4u14wcp+qZ81pdAuzd5DXfqVLTZ/rMM1OYz4rZRvjXO
 ODUQ1eywsbxdMOYtSp27LvswZ+nThllkTldpzjdSbiIvW3rjBTQQn5jLRb+T+FtujSSD
 eSpkL/2TEGCXBzthchZ4bq+Ofumr+kF7YvfwHgPszf5IahzGna0KFc73VkE/DdAEIWZd
 4BKuxAt+4PSjgQwLXTF+1RwBGf8tFtL0GpfCYdPnl+DmhnUSY8IWtnTBPkZTOFo8HpuH
 MOrA==
X-Gm-Message-State: AOAM530zLiK0FmpZpqLMrbdUxO0bmCVzWZKQYJw8O2fvSTanvuvE+UWL
 oXpcyAmoQ2knPmGzYQZxP0+wXQ==
X-Google-Smtp-Source: ABdhPJxUCuMIy2ivew50vZ/TqIGbdXektK6qHHTYuO3tRIW8InL550Fxu1TrNaSkmnBUPiFriKdyiw==
X-Received: by 2002:a2e:390c:0:b0:248:1b88:d6c4 with SMTP id
 g12-20020a2e390c000000b002481b88d6c4mr47884lja.49.1649085650731; 
 Mon, 04 Apr 2022 08:20:50 -0700 (PDT)
Received: from [192.168.50.150] ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a0565120b0e00b0044a9b61d2b3sm1163978lfu.221.2022.04.04.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:20:50 -0700 (PDT)
Message-ID: <e25206c3-409d-7124-9a70-3aeab94a1190@openvz.org>
Date: Mon, 4 Apr 2022 18:20:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 7/9] colo-compare: safe finalization
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-8-maxim.davydov@openvz.org>
 <9c5f38c4-d75f-95e0-cabd-3e483c9406ec@mail.ru>
From: Maxim Davydov <maxim.davydov@openvz.org>
In-Reply-To: <9c5f38c4-d75f-95e0-cabd-3e483c9406ec@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, berrange@redhat.com, xiaoguangrong.eric@gmail.com,
 mst@redhat.com, jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org,
 chen.zhang@intel.com, armbru@redhat.com, wangyanan55@huawei.com,
 marcandre.lureau@redhat.com, imammedo@redhat.com, lizhijian@fujitsu.com,
 pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main problem that if we call object_new_with_class() and then 
object_unref(), it fails. First of all, this is due to the fact that 
finalize expects that net/colo-compare.c:colo_compare_complete() has 
been called before.

On 3/30/22 17:54, Vladimir Sementsov-Ogievskiy wrote:
> 29.03.2022 00:15, Maxim Davydov wrote:
>> Fixes some possible issues with finalization. For example, finalization
>> immediately after instance_init fails on the assert.
>>
>> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
>> ---
>>   net/colo-compare.c | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/net/colo-compare.c b/net/colo-compare.c
>> index 62554b5b3c..81d8de0aaa 100644
>> --- a/net/colo-compare.c
>> +++ b/net/colo-compare.c
>> @@ -1426,7 +1426,7 @@ static void colo_compare_finalize(Object *obj)
>>               break;
>>           }
>>       }
>> -    if (QTAILQ_EMPTY(&net_compares)) {
if colo_compare_active == false, event_mtx and event_complete_cond 
didn't inited in colo_compare_complete()
>> +    if (QTAILQ_EMPTY(&net_compares) && colo_compare_active) {
>>           colo_compare_active = false;
>>           qemu_mutex_destroy(&event_mtx);
>>           qemu_cond_destroy(&event_complete_cond);
>> @@ -1442,19 +1442,26 @@ static void colo_compare_finalize(Object *obj)
>>         colo_compare_timer_del(s);
>>   -    qemu_bh_delete(s->event_bh);
s->event_bh wasn't allocated in colo_compare_iothread() in 
colo_compare_complete()
>> +    if (s->event_bh) {
>> +        qemu_bh_delete(s->event_bh);
>> +    }
>>   -    AioContext *ctx = iothread_get_aio_context(s->iothread);
>> -    aio_context_acquire(ctx);
>> -    AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
>> -    if (s->notify_dev) {
>> -        AIO_WAIT_WHILE(ctx, !s->notify_sendco.done);
s->iothread == NULL after .instance_init (it can be detected in 
colo_compare_complete(), if it has been called)
>> +    if (s->iothread) {
>> +        AioContext *ctx = iothread_get_aio_context(s->iothread);
>> +        aio_context_acquire(ctx);
>> +        AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
>> +        if (s->notify_dev) {
>> +            AIO_WAIT_WHILE(ctx, !s->notify_sendco.done);
>> +        }
>> +        aio_context_release(ctx);
>>       }
>> -    aio_context_release(ctx);
>>         /* Release all unhandled packets after compare thead exited */
>>       g_queue_foreach(&s->conn_list, colo_flush_packets, s);
>> -    AIO_WAIT_WHILE(NULL, !s->out_sendco.done);
In normal situation, it flushes all packets and sets s->out_sendco.done 
= true via compare_chr_send (we wait this event). But s->conn_list isn't 
initialized, s->out_sendco.done == false and won't become true. So, it's 
infinite waiting.
>> +    /* Without colo_compare_complete done == false without packets */
>> +    if (!g_queue_is_empty(&s->out_sendco.send_list)) {
>> +        AIO_WAIT_WHILE(NULL, !s->out_sendco.done);
>> +    }
>
> I think, would be good to add more description for this last change. 
> It's not as obvious as previous two changes.
>
>> g_queue_clear(&s->conn_list);
>>       g_queue_clear(&s->out_sendco.send_list);
>
>
-- 
Best regards,
Maxim Davydov


