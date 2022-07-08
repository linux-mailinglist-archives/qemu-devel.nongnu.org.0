Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C056B86F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:29:01 +0200 (CEST)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9mAO-0007IB-5J
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9m4k-0002g9-P8
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9m4f-0006Cg-2A
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657279384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6DhL9DvWpdPTFh9KbbQdMsfFAIrZRu+L7q2GfDGa74=;
 b=P4uqNyqDoKO1RQOyt1E8dQLZ3y9SAt87IskGB6nt0aij3+EW1q/bL4vVx+v1H/xlKpqmX+
 MZerRKixNvkaPeVa6z/tTplbm8KYBK1dcrDC76rEp0a+sJ3bZmrfx8lo8dqBz/laoCZHAe
 HvIaSRHJfQB+/ZETrfpZ1uciOcipqS4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-AKPqlirNN_-SerNdBRkJxg-1; Fri, 08 Jul 2022 07:23:03 -0400
X-MC-Unique: AKPqlirNN_-SerNdBRkJxg-1
Received: by mail-qt1-f198.google.com with SMTP id
 m4-20020aed27c4000000b0031b0ef018aaso18421553qtg.20
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 04:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Y6DhL9DvWpdPTFh9KbbQdMsfFAIrZRu+L7q2GfDGa74=;
 b=ki17qckpvDp78E1zVB20JnOxlPIhAcBLX2bSBG8rG0iPHhTJ7U0Q/h6sa6SDSihmBa
 fl9urUgHvzaV58qrVpU/OL/cKwhiS2JGxkIVhVsYhG51Up021RcVpkpVM70pSqvR6X7n
 Ak9sO6iKjNsKmrebjfQaeC/WL9JhimSEGppuRwS7kKpKvhoIxtzda6qDazWi98koWJ8I
 m/YklhdrIToiwule7C02hwJ3CyJhFap3d6AL92XGsm+E29SVPX85wUW0oDpYDEfHmT6Y
 DsYUyAVQJgu6VTTHC65aYuym096fJAjoj5mJ4WyWl4o9ai2nrrMwXmCdAvdceKjHRkza
 KNag==
X-Gm-Message-State: AJIora82AeMBi3C7qPFvfuI/DSwofmr0HWmfYUAWLGbQ1mNzSXGOnS6a
 AoWAwghZ2ouBBlVx40RWnse2sB264L2mU359yYIxxFqXhY806E1B+2X+TtxSrzNAsS0eFfGIrj0
 q6yNuAn32SFxOFoE=
X-Received: by 2002:a37:a903:0:b0:6b5:5326:9839 with SMTP id
 s3-20020a37a903000000b006b553269839mr1914229qke.463.1657279382614; 
 Fri, 08 Jul 2022 04:23:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tdI/nfbwqp0AxNu90BbVUbSjc/woYU9Z4Tabn3UX8oUpVfrADi8RnBIzZzEw+IpCim5XY/vA==
X-Received: by 2002:a37:a903:0:b0:6b5:5326:9839 with SMTP id
 s3-20020a37a903000000b006b553269839mr1914207qke.463.1657279382345; 
 Fri, 08 Jul 2022 04:23:02 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a05620a2a0100b006a6f68c8a87sm27265460qkp.126.2022.07.08.04.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 04:23:01 -0700 (PDT)
Message-ID: <1f88322f-00f0-ae1e-2a3e-c7bac034de72@redhat.com>
Date: Fri, 8 Jul 2022 13:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 7/8] VirtIOBlock: protect rq with its own lock
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-8-eesposit@redhat.com>
 <YsRObmNTP471U9zU@stefanha-x1.localdomain>
 <2a1e8343-df7d-b98a-1d3b-2bd4345adf3e@redhat.com>
In-Reply-To: <2a1e8343-df7d-b98a-1d3b-2bd4345adf3e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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



Am 08/07/2022 um 11:33 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 05/07/2022 um 16:45 schrieb Stefan Hajnoczi:
>> On Thu, Jun 09, 2022 at 10:37:26AM -0400, Emanuele Giuseppe Esposito wrote:
>>> @@ -946,17 +955,20 @@ static void virtio_blk_reset(VirtIODevice *vdev)
>>>       * stops all Iothreads.
>>>       */
>>>      blk_drain(s->blk);
>>> +    aio_context_release(ctx);
>>>  
>>>      /* We drop queued requests after blk_drain() because blk_drain() itself can
>>>       * produce them. */
>>> +    qemu_mutex_lock(&s->req_mutex);
>>>      while (s->rq) {
>>>          req = s->rq;
>>>          s->rq = req->next;
>>> +        qemu_mutex_unlock(&s->req_mutex);
>>>          virtqueue_detach_element(req->vq, &req->elem, 0);
>>>          virtio_blk_free_request(req);
>>> +        qemu_mutex_lock(&s->req_mutex);
>>
>> Why is req_mutex dropped temporarily? At this point we don't really need
>> the req_mutex (all I/O should be stopped and drained), but maybe we
>> should do:
> 
> Agree that maybe it is not useful to drop the mutex temporarily.
> 
> Regarding why req_mutex is not needed, yes I guess it isn't. Should I
> get rid of this hunk at all, and maybe leave a comment like "no
> synchronization needed, due to drain + ->stop_ioeventfd()"?

Actually, regarding this, I found why I added the lock:

https://patchew.org/QEMU/20220426085114.199647-1-eesposit@redhat.com/#584d7d1a-94cc-9ebb-363b-2fddb8d79f5b@redhat.com

So maybe it's better to add it.

> 
>>
>>   WITH_QEMU_MUTEX(&s->req_mutex) {
>>       req = s->rq;
>>       s->rq = NULL;
>>   }
>>
>>   ...process req list...
> 
> Not sure what you mean here, we are looping on s->rq, so do we need to
> protect also that? and why setting it to NULL? Sorry I am a little bit
> lost here.
> 
> Thank you,
> Emanuele
> 
>>
>> Otherwise:
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>


