Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BFB6AF6CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZe3h-0001Jy-VX; Tue, 07 Mar 2023 15:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe3g-0001JP-4O
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:37:16 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe3e-0004Nr-52
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:37:15 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so1391251wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678221432;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UUhAZ4qWyNqklvt2BQc2vvnMENLQHt/1SGuCOBIvGXg=;
 b=ACRfF2Hvufrd4LALSX+5wsN0roTQ1jPJI/TbJSSb+iXBpUSwyHJpahBFH4TUwKqy7Y
 HNWvcp2cozvAi++JbBFDUWZdeJ4GOfM6vUgeFZ4dBfA+0OI1Y5Cqa68PTLSLGLOzP+8T
 vBN4b50M+tq7rUxR3Nro5/ilkBL66Wa0RZNkd4vXOPEi7nMbWiRlK/FAphht8Z6UIvQ9
 f49jknSWzWhV3l7JTm4olZ46IpeyhPKg1yxVpSmmgbGpjb8NXpumcevgQzMJroc5KhTX
 Gv6v1TOh/4GSESp2CJYsKwi5BcjBwoKXBAFPEU2xfHsVAK1xEW4BxM7ZC+jJz3YbcSkk
 EvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678221432;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UUhAZ4qWyNqklvt2BQc2vvnMENLQHt/1SGuCOBIvGXg=;
 b=8MAOD3AJQY83Eb9s1olfgWdIZLBBg5Zs8RPDSasEIqwNjX0bxapjIGzvwl4QBIWFeb
 a/N+gBHgMurraI1JGzq9zaE+5i0tku2nnjb2BdUiUmj02Z8FapVAGFxqgklJ7ijHYN2q
 TU9a2F3+UOvWA0CBRUyljtejqHKla86weoCQoVPSbPmL3+UScCfwNh7rNeBYl06V2Oj7
 zjZUalz0J20HBrnaXkSqCO57w21r/mP7tVIXSrGmst5hPDcMKqHnQrzK3LgS2vaqwjJE
 24mnbT9Y9254FF+11EsnR7t7KBBenUvXyQCWgPOJcCthsSV70ZUDjFoRDgoJLIQ7V+qD
 b8gg==
X-Gm-Message-State: AO0yUKXe/tErc9dhtxZdxqiWifzyQ2mydt35a7LT6vzlgTkQidfmhd+M
 vJl/O8c1JQV0UqdIhNY47s04+Q==
X-Google-Smtp-Source: AK7set+H2jXKEGG/+M9vKUOj7BiNRLlh7GlWw2PnBxQC/iq/UirN9RaDoFuzI+aqskGou7FruVR20A==
X-Received: by 2002:a05:600c:3510:b0:3ea:d620:579b with SMTP id
 h16-20020a05600c351000b003ead620579bmr13548754wmq.0.1678221432346; 
 Tue, 07 Mar 2023 12:37:12 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 f32-20020a05600c492000b003eaf666cbe0sm13726738wmp.27.2023.03.07.12.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:37:11 -0800 (PST)
Message-ID: <aba2c65b-1694-bd83-9338-d7a53510f30b@linaro.org>
Date: Tue, 7 Mar 2023 21:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] block: convert blk_exp_close_all_type() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301205801.2453491-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> There is no change in behavior. Switch to AIO_WAIT_WHILE_UNLOCKED()
> instead of AIO_WAIT_WHILE() to document that this code has already been
> audited and converted. The AioContext argument is already NULL so
> aio_context_release() is never called anyway.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/export/export.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>



