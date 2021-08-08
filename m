Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08513E3909
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:25:46 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbJh-0000bl-18
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbIo-0008M7-Sj
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:24:50 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbIn-0008LG-9t
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:24:50 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c16so12873023plh.7
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZVXJPa/g+HLM1pGZQn7cm6/ijGs4rGT5u9PtcwnwktU=;
 b=eSxrknMMXeEQe1gqlN9+TMO7ZiamtGXkg7Gsd8WyXjXV0LLL1T9aHegLyj0yokBVmQ
 +cXrKwA2khnaOOfOiQ/IHj0w02g0FwVZ8cb5ws8L0Mkyzg0gGgiLCPQp1bBElhV8otna
 9vgTefEQn8MSjbD0Y3XeKzVS2CPdMJwxxgqDIXFY+VovN2y5osPkARv0VNiYaDQeHLwT
 qzARM++b6CV0gdEKkRoysHeDnFgEqqnXWAy8W84SsZfDIU6KJaIud6rFTeQNIjlEymXs
 7udezU2/fE8VKwAYLha/HZ1Mjud6uAF4qchz1IM4PJeMGr0iWleRzniPH1/jDL76P+P/
 v90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZVXJPa/g+HLM1pGZQn7cm6/ijGs4rGT5u9PtcwnwktU=;
 b=SPnu65/wOMtIUHEBnQNMvh5Yd4jfvYbWatex/OCWTRr35K4RT9+2bcxKvyPUHH69fR
 unQr7TukBYJClwAG8DfxZwt/yDQH+7kWDIu4mCRfOiGxToS6d+qWqnBEG11wQiTXygU5
 JS0V9QuDkjG+pjOSmHaHN1n/MjdowZF+1Ohzi7ve+slgnoL3Jw7O56/+Mrq+qVwQ73yD
 WF44khkYaLm06jWoWkz/ISfgJuU5f3ibCmJo/yaiwoO/3Ku3xt3FQbQPLLzzECRzVUjh
 aW+hKVrwDqI4vbUniXMlthWZLkd4mwwH4zxEXKa2KKnkrXTgkQB153pcB5gsGr2CajGc
 h2CA==
X-Gm-Message-State: AOAM5337pSJdO6/Waf0vbskb78MhCAazWQoWf4VGZKjjdqQu2awcJV0e
 uZ79JPoMcw6Nkaqjmt7E13aD5w==
X-Google-Smtp-Source: ABdhPJzz96fFScTazWHQ3o0WmVpWgRb+DMg2Y29U5f1uDq/5BXeLusPBTBrK7oSHFyfqohq4+qWtgg==
X-Received: by 2002:a63:510f:: with SMTP id f15mr113361pgb.222.1628400287595; 
 Sat, 07 Aug 2021 22:24:47 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id m4sm3905967pjl.6.2021.08.07.22.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:24:47 -0700 (PDT)
Subject: Re: [PATCH for 6.2 20/49] bsd-user: save the path the qemu emulator
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-21-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb6879c2-441b-dde6-2768-47963bbb60fa@linaro.org>
Date: Sat, 7 Aug 2021 19:24:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-21-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Save the path to the qemu emulator. This will be used later when we have
> a more complete implementation of exec.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/main.c | 21 +++++++++++++++++++++
>   bsd-user/qemu.h |  1 +
>   2 files changed, 22 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

> +char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
...
> +    len = PATH_MAX;

Maybe better with sizeof?


r~

