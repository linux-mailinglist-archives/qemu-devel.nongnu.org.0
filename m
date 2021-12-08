Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073746D7EF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 17:18:11 +0100 (CET)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muzdx-0007xd-O1
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 11:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muzbm-0006NJ-D9
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:15:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muzbj-00068H-PL
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638980150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVSX6hZgnLnub9Pd89X3VFGvQqcvH/qugPF+xG8eqlw=;
 b=LyDf4PwJTcf76BlPcJeitjETCwtOYaZTHYLHT4ArFUyvV3W/MuesE7KiD0XMKH0AXZWniH
 BADaquIF89JV11ANi/qSPPScc1W2m/01vbnV8yBnyq2KSB4yIUHBaVrPuEeX3h0DH61I74
 W4bRvEjS3dq8O6vWa7n9f8oM6WI0HQY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-teQNg8WvM0CNt-H63YxR-g-1; Wed, 08 Dec 2021 11:15:48 -0500
X-MC-Unique: teQNg8WvM0CNt-H63YxR-g-1
Received: by mail-wr1-f72.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so538183wrc.17
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 08:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TVSX6hZgnLnub9Pd89X3VFGvQqcvH/qugPF+xG8eqlw=;
 b=6TA78pzrmhZ/kEu0yNU55zC6a12SbFYbdg0fAZapqHdY0QX+woHBmYVgNyw4gw8Uex
 xjCyJNk7SZSr/wBK1ETLTlYg/jxEzzW46S3t9FqaKfd4Gg9qx+y454Nb2tQWgNE92kDo
 ibqbXtzNE6auG3/0ESIi/7rnhO8hy4uR5if8ILOraZLAP7vlBPLd6sXo9xnDxi9yT6Mz
 QI1D23H5594D/ak8TECTRXyXdhaX46VqRAL6zmNHuOmUfg5zhFnoC/fyNW+bMOYjfvOm
 TLd/FERrjouvRsVAhS0YlGR/LogSoZsNqAy45rOrKTKfJ2XQrgxjsV9H1gan6P9OIKzV
 d23Q==
X-Gm-Message-State: AOAM5322e0nPuC7vxrc3mmI7mzRnll07mgqqOZhvLyag0aEA0yaWffjD
 br33WmSg3yGBkV2dam4aueC+KO5fd9Pmfdt1Pf69CAKN01/i81T//DmmUCLgv0LV68S7z8iHr2G
 LidNDiZEyNOEuLLo=
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr58120318wrx.378.1638980147150; 
 Wed, 08 Dec 2021 08:15:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrrDBJyiCEvDdLoUNF7CkEVb265e+fcrB9CIpHjZ34lN0IngWtRtN0eCM4EC5q7yAEwfOuOw==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr58120278wrx.378.1638980146808; 
 Wed, 08 Dec 2021 08:15:46 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m125sm6021597wmm.39.2021.12.08.08.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 08:15:46 -0800 (PST)
Message-ID: <21c4a702-85c3-00c6-9cb7-a354b50eb9da@redhat.com>
Date: Wed, 8 Dec 2021 17:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] block/nvme: fix infinite loop in nvme_free_req_queue_cb()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20211208152246.244585-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211208152246.244585-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 16:22, Stefan Hajnoczi wrote:
> When the request free list is exhausted the coroutine waits on
> q->free_req_queue for the next free request. Whenever a request is
> completed a BH is scheduled to invoke nvme_free_req_queue_cb() and wake
> up waiting coroutines.
> 
> 1. nvme_get_free_req() waits for a free request:
> 
>     while (q->free_req_head == -1) {
>         ...
>             trace_nvme_free_req_queue_wait(q->s, q->index);
>             qemu_co_queue_wait(&q->free_req_queue, &q->lock);
>         ...
>     }
> 
> 2. nvme_free_req_queue_cb() wakes up the coroutine:
> 
>     while (qemu_co_enter_next(&q->free_req_queue, &q->lock)) {
>        ^--- infinite loop when free_req_head == -1

Ouch.

>     }
> 
> nvme_free_req_queue_cb() and the coroutine form an infinite loop when
> q->free_req_head == -1. Fix this by checking q->free_req_head in
> nvme_free_req_queue_cb(). If the free request list is exhausted, don't
> wake waiting coroutines. Eventually an in-flight request will complete
> and the BH will be scheduled again, guaranteeing forward progress.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/nvme.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index e4f336d79c..fa360b9b3c 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -206,8 +206,9 @@ static void nvme_free_req_queue_cb(void *opaque)
>      NVMeQueuePair *q = opaque;
>  
>      qemu_mutex_lock(&q->lock);
> -    while (qemu_co_enter_next(&q->free_req_queue, &q->lock)) {
> -        /* Retry all pending requests */
> +    while (q->free_req_head != -1 &&
> +           qemu_co_enter_next(&q->free_req_queue, &q->lock)) {
> +        /* Retry waiting requests */

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      }
>      qemu_mutex_unlock(&q->lock);
>  }
> 


