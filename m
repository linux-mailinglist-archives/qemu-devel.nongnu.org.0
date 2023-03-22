Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0576C487F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:04:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewFz-0008B0-Io; Wed, 22 Mar 2023 07:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pewFq-00089N-Rt
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:03:43 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pewFp-0004wO-0C
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:03:42 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 t17-20020a05600c451100b003edc906aeeaso430437wmo.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679483019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zfycQ24w1qaNQX6mYTGjZFyYzeQSuj5d0Bl+q8qXb00=;
 b=K/8NmqlvAlsRntkQ7eQ26iDgsUqlILApdq4K2ivCLgpChfyh4L6pvhpFdeeGojHHZd
 xFyWIusWz3YCrhijKpLFuwFt7dYO3HSQPjtnEoJZBu9Pl+YK0zYeYrAxXBawK34L7kIW
 s+nl1TESZAzAHG93bAv2sIVoIZGIUNkhsh2LccaUxrKHpzTCva+yzmlZH9AZu1ZvKE6S
 X3+hpXeL4f0YMFYKIWri3mH0m4QFwY2hnpt6orAqAj78C2TtZmDFI1q4Lhuv5qOIb2Ai
 pX4G5lOBZn0CwWsGmogZNTEeGjdJEdoe/WwlsdCwqK1KxSr8VTEkunzJH92YcyH8DF/6
 UiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679483019;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zfycQ24w1qaNQX6mYTGjZFyYzeQSuj5d0Bl+q8qXb00=;
 b=RYgw6MJRYsWFkvSLBaEouFuOms8J93q4pgkEyJ1hRZZrzDDOKVGRfC4hN83Gl5QPe1
 H0heSnA5eJox6XH/8jhcOo+qXNgAQ8AqeODVpTAD/iRCXRMG2e8/zqFFM1f5WLBPal5q
 eDbTGMw9btbLQA/W1ruYME+RyvIBzM7JDw5H+7G/RK/YQcJ95ylHHPq7E5s0Tsim0KNz
 Rr0ib7iaWRgIqTDpx1S6FchOdlDtL956sgMSFG8r9M0oqCAxdQQrt8YYpuDtH8rQARKb
 DyHWNhvcHBmJwnxhua45OusrRY64nUZ/CK5r0oI1zgJ5ipd8vjo3BhxQckzihzRTz+jC
 tbXA==
X-Gm-Message-State: AO0yUKWIE8d3oQTUFlqhMl8kN5qWz0ikCg9Uj9uk7c2aSVPEkGcG5BcU
 dSW+hgvkiTLhiIgEXRNdxbYBFA==
X-Google-Smtp-Source: AK7set+5Ua1isAK5579KI7QOmMRtEWYPu4ID4yWX6UIgPNUDhMY2OXGgBNmWKsQSlXpDitd35yxXDQ==
X-Received: by 2002:a05:600c:2110:b0:3eb:f59f:6daf with SMTP id
 u16-20020a05600c211000b003ebf59f6dafmr5009694wml.34.1679483018955; 
 Wed, 22 Mar 2023 04:03:38 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x6-20020a05600c21c600b003ede3e54ed7sm10024719wmj.6.2023.03.22.04.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 04:03:38 -0700 (PDT)
Message-ID: <f23faa51-0e21-2072-6cc6-08be8ad99492@linaro.org>
Date: Wed, 22 Mar 2023 12:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] ui/spice: fix compilation on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: berrange@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Jintao Yin <nicememory@gmail.com>
References: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 22/3/23 08:52, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> qemu_close_to_socket() renaming left-over.
> 
> Fixes:
> https://gitlab.com/qemu-project/qemu/-/issues/1553
> 

Reported-by: Jintao Yin <nicememory@gmail.com>

> Fixes: commit e40283d9a ("ui/spice: fix SOCKET handling regression")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/spice-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 67cfd3ca9c..52a59386d7 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -149,7 +149,7 @@ static void watch_remove(SpiceWatch *watch)
>       qemu_set_fd_handler(watch->fd, NULL, NULL, NULL);
>   #ifdef WIN32
>       /* SOCKET is owned by spice */
> -    qemu_close_to_socket(watch->fd);
> +    qemu_close_socket_osfhandle(watch->fd);
>   #endif
>       g_free(watch);
>   }


