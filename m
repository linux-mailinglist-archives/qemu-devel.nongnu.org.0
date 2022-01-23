Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F994975C3
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 22:43:06 +0100 (CET)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkdd-0000VL-9n
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 16:43:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkZD-0007Ye-PJ
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:38:31 -0500
Received: from [2607:f8b0:4864:20::1036] (port=45604
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkZC-0000Be-BZ
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:38:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 g9-20020a17090a67c900b001b4f1d71e4fso14570628pjm.4
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xEM3dJEa7rHOqHhAdSlhVRXMRxLQsQma9R7gbQeS0IA=;
 b=zFvQ6W/ncqcEk2HF6etcGID1br92Ph05wI0YtHdJ6wdFCQ+4bQXHZL/ti48mKbY03m
 9NbUqwXKTU1yB5UzLCisj4h4eJSCIGRdBZGD4rEzXmWWDEJzjvVqTHCihm39NArEqs57
 slBPlFQKLtLJ0Z4rdshh33gBPSIy5vX7FjAWXfJBsDOneNUD6lBZE7tBc6cLUzEC226u
 4N477NVCa6PGpoOwqWO2h5cjPN26FqBgh29XkpaADEYLqcM2GgF8xJ1YQIiBxVbQmGTc
 ospcpq5VlBjaoKGwYhoQvh5cjCxSR1kxF78yjv35VFXOEYXInku1Gswd9SIReFF74DSh
 1y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xEM3dJEa7rHOqHhAdSlhVRXMRxLQsQma9R7gbQeS0IA=;
 b=KB7innIhmR+64OVSFKIyv6sMdyJQ3zyiJWrwMd5HnJ8VH/hA57DNfNdQGO2fFalcZg
 W18AO0BCvdsgOqWw2yH+La2AvHJL4Xfl0fJ2YZNCCiBZxyDacUKXvZZx1Maybj1yxK1l
 7Kic8FjWv3xHyjr3ZVDFbk7ov20KwMy3r0972WJG2cfZjoRERsrVaDapW+WsEsYI5wbq
 kz4UvJx9t6qxljTD1MAwSJX2Ed5BWiZunC1GUUoIxG+D7A2dbMEJIzFt7MjyNOrz3jJc
 6C7UEXG0E4zefwEggeCFUgABBazVRguxorOzu8Mswooi1GsZDx512v8lAdUCjXhIVX+q
 1Raw==
X-Gm-Message-State: AOAM531Em3kTgV63Jo29yAV2gGnHu8MOJpE69bGZ+5GAEdtVab/ssyM6
 9ZQR1Q1JySKhm8o+jatRiuGMww==
X-Google-Smtp-Source: ABdhPJzRoSrC2jvC3QOKjspBasYMpGniEhh1/nHy4uJ8N+5DaQwq5d7N6Wyx0U/B7DME0r7ojoiJTA==
X-Received: by 2002:a17:902:b181:b0:149:90e2:896a with SMTP id
 s1-20020a170902b18100b0014990e2896amr11901222plr.149.1642973908981; 
 Sun, 23 Jan 2022 13:38:28 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id s1sm5156483pjn.42.2022.01.23.13.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 13:38:28 -0800 (PST)
Subject: Re: [PATCH 03/30] bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d671360d-f6a1-8aeb-417a-ac46e3052c76@linaro.org>
Date: Mon, 24 Jan 2022 08:38:24 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:18 AM, Warner Losh wrote:
> First attempt at implementing cpu_loop_exit_sigsegv, mostly copied from
> linux-user version of this function.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

