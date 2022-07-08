Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E456B5A4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 11:35:12 +0200 (CEST)
Received: from localhost ([::1]:53720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9kOE-0001W4-OF
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 05:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9kMn-00009K-Hv
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9kMl-0001f4-1E
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 05:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657272818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJA0JlvewwhmU6PuTnNG18nB2ZlyHeHVVTvg41sIKEU=;
 b=dsMoProAHZ4a+7nLi+c6dEWzylBvYzJ6l767fZVXWyBzTdTDoITNWbbyNYJ8RMKi1blapr
 7d23dE2FC7/qFXsczTPsJo+4jmO/9tHNHRTkXhusY9boTrQrbEthwXqXto7AM2sEANUN5z
 BwLNaT0q+zmQKvcWwAC2gVz3zZXVS2Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-4aeicvfnMsG5pI2IHp7grw-1; Fri, 08 Jul 2022 05:33:31 -0400
X-MC-Unique: 4aeicvfnMsG5pI2IHp7grw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c126-20020a1c3584000000b003a02fa133ceso5033084wma.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 02:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FJA0JlvewwhmU6PuTnNG18nB2ZlyHeHVVTvg41sIKEU=;
 b=szmWM65KLvWCSEuE8LKVaPaCF53dLtWVKikVo1TaCekq9Ttiaa3aA1H1ug6mjbsvme
 V9xCx17k2QiDs+UjMpAM/PbIXloRcUEf7xn1wjxPxeAj3kusY3bm2bPxIIFM17/dcH1p
 WhNiJQE6STbuYIfrcc+tzS7xksTOG4LDSVqmSL49rn+TQonynGmG1k8D5mUZtFDTusX4
 BQ7uOpQAeivX12G2eex4XxtZZmw53uDw6JJAupOPLaaUrVu7pIdk+0uHSiEF6oCI0i5l
 XMFf6G22VlSr19Cs3ITVicxHLumIhP7o3O2AcvUb2eHbayi2kn+U5pJiaNSEOTi01arT
 aRVg==
X-Gm-Message-State: AJIora9oUHwj4rvzMCc3M2ttF1eoOAUbTi6j36TDe3z39VgUk0ep6n2O
 IY01bRzV4M/b0QKzqfadh2y0hNbPhXbzMw3N0hiMUJb/d20jzYiPKFnSVP8HjR9i0xPMzLJVNOM
 r6agB8mjiY0teTZk=
X-Received: by 2002:a5d:56ca:0:b0:21d:8b21:9fd5 with SMTP id
 m10-20020a5d56ca000000b0021d8b219fd5mr2352094wrw.179.1657272810284; 
 Fri, 08 Jul 2022 02:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tn2I/1suxmJsFUi8e3PfM1w4QexNjB4r3kwMg7nmG6zpwT4ElEwe0+E6uH33i6XurXrN5IPA==
X-Received: by 2002:a5d:56ca:0:b0:21d:8b21:9fd5 with SMTP id
 m10-20020a5d56ca000000b0021d8b219fd5mr2352067wrw.179.1657272809994; 
 Fri, 08 Jul 2022 02:33:29 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4522000000b0021d6ac977fasm12836860wra.69.2022.07.08.02.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 02:33:29 -0700 (PDT)
Message-ID: <2a1e8343-df7d-b98a-1d3b-2bd4345adf3e@redhat.com>
Date: Fri, 8 Jul 2022 11:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 7/8] VirtIOBlock: protect rq with its own lock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-8-eesposit@redhat.com>
 <YsRObmNTP471U9zU@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsRObmNTP471U9zU@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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



Am 05/07/2022 um 16:45 schrieb Stefan Hajnoczi:
> On Thu, Jun 09, 2022 at 10:37:26AM -0400, Emanuele Giuseppe Esposito wrote:
>> @@ -946,17 +955,20 @@ static void virtio_blk_reset(VirtIODevice *vdev)
>>       * stops all Iothreads.
>>       */
>>      blk_drain(s->blk);
>> +    aio_context_release(ctx);
>>  
>>      /* We drop queued requests after blk_drain() because blk_drain() itself can
>>       * produce them. */
>> +    qemu_mutex_lock(&s->req_mutex);
>>      while (s->rq) {
>>          req = s->rq;
>>          s->rq = req->next;
>> +        qemu_mutex_unlock(&s->req_mutex);
>>          virtqueue_detach_element(req->vq, &req->elem, 0);
>>          virtio_blk_free_request(req);
>> +        qemu_mutex_lock(&s->req_mutex);
> 
> Why is req_mutex dropped temporarily? At this point we don't really need
> the req_mutex (all I/O should be stopped and drained), but maybe we
> should do:

Agree that maybe it is not useful to drop the mutex temporarily.

Regarding why req_mutex is not needed, yes I guess it isn't. Should I
get rid of this hunk at all, and maybe leave a comment like "no
synchronization needed, due to drain + ->stop_ioeventfd()"?

> 
>   WITH_QEMU_MUTEX(&s->req_mutex) {
>       req = s->rq;
>       s->rq = NULL;
>   }
> 
>   ...process req list...

Not sure what you mean here, we are looping on s->rq, so do we need to
protect also that? and why setting it to NULL? Sorry I am a little bit
lost here.

Thank you,
Emanuele

> 
> Otherwise:
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 


