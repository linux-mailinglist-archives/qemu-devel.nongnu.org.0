Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D574457E32
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 13:34:41 +0100 (CET)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moPZo-0004YZ-Gq
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 07:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPX5-0002jM-DK
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:31:52 -0500
Received: from [2a00:1450:4864:20::32d] (port=37629
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPX3-0001FL-7c
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:31:50 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso12591446wms.2
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 04:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPAKNIt0YbPjlsIzKjszUGjgdSYBWb6HzDIOIeCXyI4=;
 b=zxKS9kZeA3N/Dz9rnYZfpvfCjv38HZwlcRd79hYUx5w92e7ZcAITldQly4hhdGCIi1
 9PziBYgrUoKIbUagYphp3UZ+hKf4PYabQ/DqpuWSRs8BW8tbGUBd+onEB2YnkyxQV448
 rwsA2MbVg6x5Km/8EnNxZoV//p2xJoxXoJjVazF3xX/pF3zfwQ+B5auidq08R2pWqbLE
 IfrpPB9DIcZl2Ogq/JHjQlR7DEqn0PWe56Tx5aWtBtNDzEysNgfp1MtiiWKR1YzD0bx+
 U4R0WMzzhT9fiGrpGQG1Q+mWLtPO8bMYbyvdxVodPoLRYvDehI9yYa5MbvqtzgQEKAg6
 nsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPAKNIt0YbPjlsIzKjszUGjgdSYBWb6HzDIOIeCXyI4=;
 b=5T4bLpS1JOCNHJOHvRWVG7yOXAT7rjZqMYfcMcPGT1FAWCLIYtgJYcTKur7FILLl/g
 xTdhZ8CoNduZ6x8yogKhaAJCtZCPPRcf8oiVwJT1r7R0FXPLopGFI8DHZR3KkMIjxVdG
 CSyqmmpE8nl4RICuuRzWFBKFFYtv7ptTEZP5Ury2NATZBCM6w14EjFm3omyVpb39Vg3a
 4zA0PZ+MO9/myuQqjbxva92BkwJhFq8chMWuExA2sBxMwSg+YfqlvnX4XpNGgPvii+x3
 pDKfIcyTFsoq7u7S3ebDvyhNjpJ6RrRVj+RLoy+O6vkPY3HAmr6JHL0YGQxJ/oyMeKNc
 srrA==
X-Gm-Message-State: AOAM532ihXGTKgt3Xj+BjvWLGw0mbDefwllE5gky87MZdYdcRQ26mstz
 vaNKXx1ulpsneng6OBpUyF8yWQ==
X-Google-Smtp-Source: ABdhPJxedwPA0lj6Zp97K+6PAXCwkxfw8CzALkRbFXUMBeF09LSLfOaoJ4eAlmFnokVtGxNL+A8Sbw==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr9361826wmq.16.1637411507391; 
 Sat, 20 Nov 2021 04:31:47 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id l124sm15781872wml.8.2021.11.20.04.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 04:31:46 -0800 (PST)
Subject: Re: [PATCH 06/11] migration: Move iov from pages to params
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211119165903.18813-1-quintela@redhat.com>
 <20211119165903.18813-7-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6977e283-a5d8-75b6-a0a1-c51e0d3b75e0@linaro.org>
Date: Sat, 20 Nov 2021 13:31:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119165903.18813-7-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 5:58 PM, Juan Quintela wrote:
>   static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
>                                  Error **errp)
>   {
> +    MultiFDPages_t *pages = p->pages;
> +
> +    for (int i = 0; i < used; i++) {
> +        p->iov[p->iovs_used].iov_base = pages->block->host + pages->offset[i];
> +        p->iov[p->iovs_used].iov_len = qemu_target_page_size();
> +        p->iovs_used++;
> +    }
> +
>       p->next_packet_size = used * qemu_target_page_size();

Compute qemu_target_page_size once in the function.
Hoist p->iovs_used to a local variable around the loop.

> @@ -154,7 +162,11 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
>                      p->id, flags, MULTIFD_FLAG_NOCOMP);
>           return -1;
>       }
> -    return qio_channel_readv_all(p->c, p->pages->iov, used, errp);
> +    for (int i = 0; i < p->pages->used; i++) {
> +        p->iov[i].iov_base = p->pages->block->host + p->pages->offset[i];
> +        p->iov[i].iov_len = qemu_target_page_size();
> +    }

Similarly.


r~

