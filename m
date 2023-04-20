Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBB6E9BD7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 20:44:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZFa-0002mK-So; Thu, 20 Apr 2023 14:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppZFY-0002lq-MN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 14:43:20 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppZFW-0000vo-EU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 14:43:20 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6a438f0d9c9so1011930a34.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682016197; x=1684608197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kn9/hAwBdBX8Z91axIXVbe5QcjzmpuLoHpuCeIY9WjQ=;
 b=fMMcr8+LFDhq+YpO98/G4vvV0ml8vzIZs0Uzy5zs0u0PEzdl7Nef1BAf+BfCWZzyvA
 Ej09OAV5dHZGlOPhVC6EsmlLJOKLjWR+TSf6div6zj2IxvvOqFUxm+2Gbw/0+Oqny7Wh
 g5kHVh6ZOpLv/B6rYFO0TBnVdc8AYnwqWSiBbWHw/9HnqBPHKlAi9ndV3YTNyh6Yn+FI
 zRBFLAAiq5nQz16L+M9hxpcSPi7aoRGmlRRB6qAnfOq0vOlxtX4QEadEOY0s1A53iZVr
 +mQcg2/h5yBd6+MMgmEK/G+FAQ3wNOJ3eQow7TBQ90DxtymbG4K6kDZffei4/hscPL8u
 BUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682016197; x=1684608197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kn9/hAwBdBX8Z91axIXVbe5QcjzmpuLoHpuCeIY9WjQ=;
 b=Y/1cMnqGfTMBRi30Oo0f8L/ZD/0MKN1V6VMT87jp3A9wkWwFj09yeb+fCoz11EYPSc
 xtyAr+lZwcZ99VM7fotg6C3cFEYwjT102NNkfVoyA5rX/JeQzxV3WVE+ikhhYHeZW7GQ
 v3bBbRO1vWDumrhbWiB/Gw+X48iFUW6YxU9gFl8LvJNkBAx0EOZ622bUeU90mF296hjR
 kUfyxPs2B7Nk8cLt/6eczSylqyxOFoTa2OX9i1TnpZV2ijS8q/24uZNAu1n/41UJdZRY
 sie6OEerLK+N2XFuUdmGpYOvVy11dZPVtymcEldDMfE9Hks00gOH+dXHuujoZTIf4RlG
 3Vfw==
X-Gm-Message-State: AAQBX9crTJEWyEdD6HvbIpc8nVOPVLOAvkMRYNtD4nRkvYr0o4ClYNVa
 QoOdjQt8VANhVAyUKwBRxEiCOQ==
X-Google-Smtp-Source: AKy350YuzA/K7L+ZcvlZWlBVNHzY3TAtA3r7zk4wVqoaA4ykwQHO8xoTsmcqa7P8l1Xcb6OLSKS0CA==
X-Received: by 2002:a05:6830:1e4c:b0:6a6:850:a932 with SMTP id
 e12-20020a0568301e4c00b006a60850a932mr1381740otj.6.1682016196900; 
 Thu, 20 Apr 2023 11:43:16 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a9d65c5000000b006a12509bd94sm1010454oth.13.2023.04.20.11.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 11:43:16 -0700 (PDT)
Message-ID: <0afe1516-09a0-d529-d141-d90016d8e724@ventanamicro.com>
Date: Thu, 20 Apr 2023 15:43:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH for-8.0 v2 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-2-clg@kaod.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230321161609.716474-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi everyone,


Fedora 38 rolled out recently. I did a distro upgrade, and Fedora 38 is now using
GCC 13 ... and now I can't build QEMU without this patch.


I'll use it as is for now. It would be nice to fix this upstream though :D



Thanks,


Daniel


On 3/21/23 13:16, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../util/async.c: In function ‘aio_bh_poll’:
> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>        |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: ‘slice’ declared here
>    161 |     BHListSlice slice;
>        |                 ^~~~~
> ../util/async.c:161:17: note: ‘ctx’ declared here
> 
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add a pragma to silent GCC.
> 
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   util/async.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..de9b431236 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)
>   
>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> +
> +    /*
> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
> +     * list is emptied before this function returns.
> +     */
> +#if !defined(__clang__)
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
> +#endif
>       QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +#if !defined(__clang__)
> +#pragma GCC diagnostic pop
> +#endif
>   
>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>           QEMUBH *bh;

