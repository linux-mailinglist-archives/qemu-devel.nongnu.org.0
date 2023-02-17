Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778269AAAB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 12:45:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSzAG-0004cC-Mn; Fri, 17 Feb 2023 06:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSzAE-0004bk-AG
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:44:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSzAC-00030r-Qn
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 06:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676634267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ae880lvNDNx2lWZuHQTbxG+B9c6oktdwkhkF/DpMkM4=;
 b=eE7Jnh72vDKAosIiKnN9ojU8+hdj5sLwmqrz5Zw8ummk02AQvHDix70QQCSMlhOn8TgQ9+
 SyvC1Lct3qlkjeLCeUvmEJIPgn26BoD+lG4O8Rd4969pfCZLg1Vw7690QsMTxhcwBIguQO
 qPGj3pS5PvGU5LhXLQdB0otwxMVXjyQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-VpFnpFamPLyjaiLQMKWfnA-1; Fri, 17 Feb 2023 06:44:26 -0500
X-MC-Unique: VpFnpFamPLyjaiLQMKWfnA-1
Received: by mail-qt1-f198.google.com with SMTP id
 p18-20020ac84612000000b003ba3c280fabso158834qtn.2
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 03:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ae880lvNDNx2lWZuHQTbxG+B9c6oktdwkhkF/DpMkM4=;
 b=QjjUG4Fk2OmFD30NLJ3cEuDvMhwVEEBG5dLN/J9Aj3cFq1L4H+HLEQF64crFVqDgJo
 VNp+gJJgEriKnlTt/IhpiQDWMdG4KqBlWsBk7XSyEUzRVYQir7absyOkmWIekDqIhYRQ
 GwxlyYG2XU/P8xIG8mj296SXnk7sRfY7oAU5pPOtLt3kDO6jYhtYvjDezEh4yGTvwDAG
 ENobpPzzcvWNhnlurqp6imM4cUrv5U2vX0k15l9B0sQRisIsfJWGTJjIBSzzw06wIfQj
 tHU9MytyUcTatytRhj4uYI5ffoEYICNiSVADTo+d/vUBBvi0RkMGJsU3l4BbczuBJeZe
 6Qrw==
X-Gm-Message-State: AO0yUKUGBigqXVxUojtU9iCDx+6DjowPhNDqcb5ITAFWPsX/aLmk4uAS
 5GeecolVYiPPbkHsmx79VntvMDge9C3EwGGaev/xoqZRzDJyZld5yscXQPy6hpRhwkYJbKn9zD0
 40LY67uVlKy/OyHI=
X-Received: by 2002:a05:622a:548:b0:3bd:16cf:2f10 with SMTP id
 m8-20020a05622a054800b003bd16cf2f10mr5176211qtx.35.1676634265989; 
 Fri, 17 Feb 2023 03:44:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9zGhj1ltp6eOfpz1VZFE9vKm6QrlS82btTdVbb8kCWFhPhrKwAdRIXr8fptd8LsgxZpFGmvg==
X-Received: by 2002:a05:622a:548:b0:3bd:16cf:2f10 with SMTP id
 m8-20020a05622a054800b003bd16cf2f10mr5176188qtx.35.1676634265656; 
 Fri, 17 Feb 2023 03:44:25 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 z20-20020ac84314000000b003b630456b8fsm3030287qtm.89.2023.02.17.03.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 03:44:25 -0800 (PST)
Message-ID: <728ea0a5-0bf6-4cb9-4597-55d53f531420@redhat.com>
Date: Fri, 17 Feb 2023 12:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] vhost: svq: fix uninitialized variable
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230217104219.1675667-1-lvivier@redhat.com>
 <CAJaqyWfvL0vNu6nT6sKHLATdW7QBwZ6NdW2t4RiVBtiVBARiuA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAJaqyWfvL0vNu6nT6sKHLATdW7QBwZ6NdW2t4RiVBtiVBARiuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/17/23 12:24, Eugenio Perez Martin wrote:
> On Fri, Feb 17, 2023 at 11:42 AM Laurent Vivier <lvivier@redhat.com> wrote:
>>
>> The problem has been reported by gcc with CFLAGS=-O3:
>>
>> .../hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_svq_poll’:
>> .../hw/virtio/vhost-shadow-virtqueue.c:538:12:
>> error: ‘len’ may be used uninitialized [-Werror=maybe-uninitialized]
>>    538 |     return len;
>>        |            ^~~
>>
>> vhost_svq_get_buf() returns NULL if SVQ is empty but doesn't set len to 0,
>> and vhost_svq_poll() returns len without checking the return of
>> vhost_svq_get_buf(). So if the SVQ is empty vhost_svq_poll() can return
>> an random value.
>>
> 
> s/an random/a random/.
> 
> I think this solves the same as
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg939383.html ?

Yes, exactly.

Thanks,
Laurent

> 
> Thanks!
> 
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   hw/virtio/vhost-shadow-virtqueue.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>> index 430729635815..31cf642db267 100644
>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>> @@ -420,6 +420,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>>       vring_used_elem_t used_elem;
>>       uint16_t last_used, last_used_chain, num;
>>
>> +    *len = 0;
>>       if (!vhost_svq_more_used(svq)) {
>>           return NULL;
>>       }
>> --
>> 2.39.1
>>
> 


