Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBD6EC65A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 08:35:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqpm6-0004LB-7L; Mon, 24 Apr 2023 02:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqplz-0004Kn-BI
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 02:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqplw-00083q-Ig
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 02:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682318038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jM6H79oAYXSME1BF5rEyQ2Zvvey8XqxmUvJ0VqBP1JM=;
 b=eIQpFNvxLcpHIZubYh0eAUdYh2ttrNYTg/zAOaCVF88dyJXdDF2CfwbfIktcTbU+9tL3qb
 WmV56kA4ox0FG2hqJpGxEYQdPa4EB60tzptvjlD8TMFAzH8u4DTlWeAe/H4tLznymu5yXF
 eLjNmCdDktfxTC1cMNaaztBQpT2beU8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-H1vl9227M2ehpR9OYVy3tg-1; Mon, 24 Apr 2023 02:33:57 -0400
X-MC-Unique: H1vl9227M2ehpR9OYVy3tg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f171d38db3so23091525e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 23:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682318036; x=1684910036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jM6H79oAYXSME1BF5rEyQ2Zvvey8XqxmUvJ0VqBP1JM=;
 b=b3RdVgWQW3/x5LLnyZIX3vzX2NhK8Q0Kr3kRulfvRSdqXnqyvAn7qVzr6BX8qqtxL/
 tPRJQNBVCcvT9D2jOEevZohcgStxZAPhUnYc5/X8VdJHyxD5tPHhkMzQqPlMpyBuT/vM
 AoA73yRYR0Bey+CyqHWxKotM9HjakFQ6hp8oxau9tAlCjnMcj90nl7lU2GHUy7TP6eTl
 XUkKiPVJaywdBa/72fzniMTi+8hB9vqZnu3q422wUccHtjBzLVJ8FoK9vTTLH+FgIMV0
 MjWNehAIyZzrVy+mH6ExxpQTJH1+Fk3fG173oAEsgXmez7bOtTf/O4ifayAfXGHHw4KW
 CoiA==
X-Gm-Message-State: AAQBX9f9+2XRFuuvkzS/4JDsuBUBt+RK+riQ+MTtVFwILR4b1rGEctpQ
 i3+5yWfvBAKVUYFBbaW7PPwU+VNewQQNMOYrpauCU1aui1t6Iuj9fG7IoSTqJbQA2GtYPwtei5I
 VME9D5Y9gDowd4Yc=
X-Received: by 2002:adf:dcc5:0:b0:2f6:620f:92ca with SMTP id
 x5-20020adfdcc5000000b002f6620f92camr9383360wrm.23.1682318036148; 
 Sun, 23 Apr 2023 23:33:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bpKScgKdftqyXLx+h1szVuMI+7n4X4LwIV48j2fhTA5cJnk8z0835fwsrq7dw/VoRH/3hfkQ==
X-Received: by 2002:adf:dcc5:0:b0:2f6:620f:92ca with SMTP id
 x5-20020adfdcc5000000b002f6620f92camr9383343wrm.23.1682318035829; 
 Sun, 23 Apr 2023 23:33:55 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600011c100b002cff06039d7sm10002182wrx.39.2023.04.23.23.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 23:33:55 -0700 (PDT)
Message-ID: <9f03827f-f425-e4e3-d6df-3c6549886e35@redhat.com>
Date: Mon, 24 Apr 2023 08:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230420202939.1982044-1-clg@kaod.org>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230420202939.1982044-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 20/04/2023 22.29, Cédric Le Goater wrote:
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
>   util/async.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..856e1a8a33 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
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
> +#pragma GCC diagnostic ignored "-Wpragmas"

Why do we need to ignore -Wpragmas here?

> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
> +#endif
>       QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +#if !defined(__clang__)
> +#pragma GCC diagnostic pop
> +#endif
>   
>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>           QEMUBH *bh;

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


