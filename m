Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399074A5C64
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:37:17 +0100 (CET)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEsPM-0004wQ-Bj
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nErID-0003rb-FU
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:25:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nErI4-0005Ng-33
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643714707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yeoTE7DRRP+904UfCSw9t1HmXEzGAfQTzmr+WKBHC+s=;
 b=fosBeVMGhf/T1sKhXf9bARQfeLqX2K7USs7ug+QO23hWQuvKQrySLDcIyrEGTCrm4m6RVf
 Vt3v1CTSCt9Il5dMKxA7zav4TiSMMKwR7KnPOGQjp+qfA0Ak2kZWXQy/KTS4qI8Z1pjibd
 UcFUUFvw32mFdtw+iCdahoJMYAQ80io=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-1SSP4M_eNGOa3z54PlZuLw-1; Tue, 01 Feb 2022 06:25:05 -0500
X-MC-Unique: 1SSP4M_eNGOa3z54PlZuLw-1
Received: by mail-ed1-f70.google.com with SMTP id
 a18-20020aa7d752000000b00403d18712beso8511220eds.17
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yeoTE7DRRP+904UfCSw9t1HmXEzGAfQTzmr+WKBHC+s=;
 b=SyOnPmMKY7fpPWxgs8HrrnhhvMgp7F48GYTHc2nxZQjgTXzESrRTCsy/vMNn9dPrRh
 CX2rTTdUDzRka9l4oA/l7qQJb2u5H0th/5H4TUs5A5unp0iZH2SQxC8aKYeAzCP+gB35
 93h90tLNxyRNZV68zE5lyGXE4f4dz51nLhBSS7Zg2PUl7SMSYzU/HxxLmqHaU7fQEDlU
 UcNMpAHBYpRiOGrRK8beHdIyN5eGUoEuxkfegEvaILxndXyCFAqNuSZjrvwolgUm3fZY
 /uEUbPCoxEqJrCT5Hutk8JZZ9BnKabqmfKARnh8DYX7THMaLGvxTQ+tm9MnHKBMtphqq
 sQfA==
X-Gm-Message-State: AOAM533XIZGfFeNgkNaB9TCN9E4g/ZTrb0LcHuK77HAAAAuxY0pCHpHf
 ZBpI6Wq8Ym8sQ2Nf6p82JwCJMlj8bSrBuCugv+/xQrHjKEZ7qPf0sRX7TEHTp5LzAAbp+Yk4GYh
 hevPTjATxI7GS0Cs=
X-Received: by 2002:a17:907:97cd:: with SMTP id
 js13mr20461221ejc.365.1643714704815; 
 Tue, 01 Feb 2022 03:25:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5nxDBZLV26XzR06dvETybyHOIC+/Bxi8i443/ld0QPKT/s3S96lg/rmyNdEARDUJJ0It7WQ==
X-Received: by 2002:a17:907:97cd:: with SMTP id
 js13mr20461210ejc.365.1643714704549; 
 Tue, 01 Feb 2022 03:25:04 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a25sm4079639ejs.149.2022.02.01.03.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:25:04 -0800 (PST)
Message-ID: <a26290d8-558c-ba85-ccf9-b56051a6dd75@redhat.com>
Date: Tue, 1 Feb 2022 12:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/curl.c: Check error return from curl_easy_setopt()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220128165535.2550899-1-peter.maydell@linaro.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220128165535.2550899-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.01.22 17:55, Peter Maydell wrote:
> Coverity points out that we aren't checking the return value
> from curl_easy_setopt() for any of the calls to it we make
> in block/curl.c.
>
> Fixes: Coverity CID 1459336, 1459482, 1460331
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Big fat disclaimer: tested only with 'make check', which I suspect
> may not be exercising this block backend. Hints on how to test
> more thoroughly are welcome.
>
>   block/curl.c | 90 +++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 58 insertions(+), 32 deletions(-)

One problem I see in general is that most of the setopt functions are 
(indirectly) called from `curl_open()`, which is supposed to return an 
error message.  Its `out` label seems to expect some error description 
in `state->errmsg`.  The error handling here doesn’t set such a description.

Then again, there are enough existing error paths that don’t set this 
description either, so it isn’t quite this patch’s duty to fix that 
situation.  I guess it would be nice if we had a wrapper for 
`curl_easy_setopt()` with an `Error **` parameter, so we could easily 
generate error messages that describe key and value (and then 
`curl_init_state()` should have an `Error **` parameter, too).

But this patch doesn’t make anything worse than it already is, so that’d 
rather be an idea for future clean-up.

> diff --git a/block/curl.c b/block/curl.c
> index 6a6cd729758..aaee1b17bef 100644
> --- a/block/curl.c
> +++ b/block/curl.c

[...]

> @@ -879,7 +902,10 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>   
>       snprintf(state->range, 127, "%" PRIu64 "-%" PRIu64, start, end);
>       trace_curl_setup_preadv(acb->bytes, start, state->range);
> -    curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
> +    if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range)) {
> +        curl_clean_state(state);
> +        goto out;

I think we need to mark the request as failed by setting `acb->ret` to a 
negative value (and probably also clear `state->acb[0]` like the error 
path below does).

Hanna

> +    }
>   
>       if (curl_multi_add_handle(s->multi, state->curl) != CURLM_OK) {
>           state->acb[0] = NULL;


