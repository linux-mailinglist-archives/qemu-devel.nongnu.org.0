Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076776A7FDC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:20:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXg2X-0006vT-RI; Thu, 02 Mar 2023 05:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXg2R-0006nk-1U
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:19:51 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXg2O-00017x-C7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:19:50 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so1796350wms.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677752387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=icT5lQj3fAqDqePRpww5IRHzGOvaVPjl+8NGhBL2aFE=;
 b=CQYYWRPbMnJZy4Iyq/GQL5Sw0UbQkPxB7GkGzjfIVODzi0gtitt8cGAKGBlNHezV/T
 gvi4pmrgVZkNySX8FBwS0zBYOLjtg8LLQpSNEFDp/RELjm+N33kjCO1xMMKX7eOuy5TS
 /OI+ULWH40XcBf1gEEVu9NfWqyyPWYZFeQcmjmRQrvlkyqCPwyg99tdcKDvCSnKzRoJ1
 S4Vjp1K8mT2EWWK3NCdQoEJkGPjHWJYD1d0lLFl0IskEQPp2ZEtlmBlLxNguS8lHV2jS
 keU3f7OGB7bPbdnL5XvNV6CT6tSaBMNeFMBR2IGV1ean1Y0AHxc4+IwHiunblrRZzc6O
 vFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677752387;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=icT5lQj3fAqDqePRpww5IRHzGOvaVPjl+8NGhBL2aFE=;
 b=8O77LaF0TMiwUk1k49yLcndG1xlSPbZI7OoEV+gY2MsmisVP5q5FQMB4UO0+uf8e0c
 RQ4f1OQRVp3A34XHSIIC7RdczOuR1eUuo1ZC8TJuwAyJw7YoHflUC4jTlZP7dWtbeCLM
 eHMNiHfhoRD6pwi52l/dzEwCRRpHyQc4nx+qZtdUsGx4EV/QrTd8GbtccaApS0ZfYTnK
 bZzd61i/ewyWzS2JjcTNGtwQz2z8MhxThEF9l+u4ERIKJmbr9dEymZgYFb7ezfxMGdqG
 FL35UK25/T5xXZ1Q4ViZJbWQ/OBeo6oU/4HwV456rXUq2Eedy7+nE4zDPMZ0TeHhwsSN
 dZVA==
X-Gm-Message-State: AO0yUKWtjGTpGcp8tH5MV2ndh1rvzQET7fJhW3DOu+u97zYhgcZnef/M
 qi/wC+0ORJgulIsjrpIXcbpdqQ==
X-Google-Smtp-Source: AK7set/kOXr+ImS8CTW/8o9HQMjnnZXgVMgoMYB91ysyvE2sybeFMrj9/HXcyzzXaATaaKft+33jMA==
X-Received: by 2002:a05:600c:4f01:b0:3eb:39e7:3604 with SMTP id
 l1-20020a05600c4f0100b003eb39e73604mr8050985wmq.5.1677752386851; 
 Thu, 02 Mar 2023 02:19:46 -0800 (PST)
Received: from [192.168.74.175] (89.red-88-28-21.dynamicip.rima-tde.net.
 [88.28.21.89]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm15031830wrv.10.2023.03.02.02.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 02:19:46 -0800 (PST)
Message-ID: <5b5cc9c3-7768-f4a7-c188-90de98053db7@linaro.org>
Date: Thu, 2 Mar 2023 11:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/6] block: convert bdrv_graph_wrlock() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301205801.2453491-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/3/23 21:57, Stefan Hajnoczi wrote:
> The following conversion is safe and does not change behavior:
> 
>       GLOBAL_STATE_CODE();
>       ...
>    -  AIO_WAIT_WHILE(qemu_get_aio_context(), ...);
>    +  AIO_WAIT_WHILE_UNLOCKED(NULL, ...);
> 
> Since we're in GLOBAL_STATE_CODE(), qemu_get_aio_context() is our home
> thread's AioContext. Thus AIO_WAIT_WHILE() does not unlock the
> AioContext:
> 
>    if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
>        while ((cond)) {                                           \
>            aio_poll(ctx_, true);                                  \
>            waited_ = true;                                        \
>        }                                                          \
> 
> And that means AIO_WAIT_WHILE_UNLOCKED(NULL, ...) can be substituted.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/graph-lock.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


