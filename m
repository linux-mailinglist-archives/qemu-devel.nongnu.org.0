Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23C6AABE1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:25:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWZ7-0003fD-RS; Sat, 04 Mar 2023 13:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWZ3-0003eq-V5
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:25:02 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWZ2-0004Ou-FC
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:25:01 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i3so6083197plg.6
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677954298;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PZ8e9EJHhI8LUundZW4IxdElFAyKjwqGhYUTEE+PeTk=;
 b=N+K/bU1HI9oiUOrm46YdLRn2g2otNTnNqXqQP+tCvYodib9H6Qc+/xBTOCB5lFpppO
 8+xC4RD8YE+49HQlD8jPMz+31/xaA6dhnN0zjz2fXqZQJu1uvHkPPRyWMhwwQflP1Owv
 uMyu0wnFOoObJI7Mqbp6mwGzkfikyb8h+o9xo5zs7PJ5Jy5R6L68rvjclkUbkP7sHCeM
 oQgIBl3XSTm/977nOf1FVFYyl8Po5dqTcQM5TaDnCe9i6ofmqWte4Adkrx1o92L16DVW
 tfWhGqPWuCgfbqyfwltFWoyRtmkdt7jUVyqla19BI65sDiWqEJLxRWCcMEhTpLlIhypu
 r/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677954298;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PZ8e9EJHhI8LUundZW4IxdElFAyKjwqGhYUTEE+PeTk=;
 b=aymwLsiK7lrrS6ML/OakTEX3t8aF6DAQMtyAXHbZZMP7CI0nCxAwv2iuEEIYqtZqVY
 Wlsq8uyueRwUjjnlnLqszxP/Tz2ItUVoI1ZBENSdjfUkeybXWRxgJWduN0qKx0870y+s
 0St6HZWH+tk2JeRiT3c3TueL3ME4J+97cbKc/6ls76dCeVl7Wjt8vybCqvgqIDwZb+b5
 F0Wa8NBnrQQiHpa+YNF/eDXF2sQw4TojzjmA/co/VaPhRftEhqRSNNJPOxwv4O4Zblhl
 zEA+NKjjx3xZLwAzRWn8XfBEbll9/gX84vEUS7XnvTSfHr5G8InEFd5DqlwjFpNkDg3W
 uufA==
X-Gm-Message-State: AO0yUKXpt6r3eduK4W46Gfh/ZAOXgiE1RglN5iGeaPIZKHiIb6rOTG+Y
 JFhU3BgFjJAd+GxQtBaDybgtbA==
X-Google-Smtp-Source: AK7set+xw6QZPBVNq4ljSjDRFGCTn5Gg5h19LFFPDoVLSfT0+UycHFK7V8/szChV6mYCi8C7LK7wDA==
X-Received: by 2002:a17:902:e5c2:b0:19a:a650:ac55 with SMTP id
 u2-20020a170902e5c200b0019aa650ac55mr10418631plf.23.1677954298595; 
 Sat, 04 Mar 2023 10:24:58 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:62b1:64d8:8207:f04e?
 ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902900800b0019ac9c9ce16sm3607795plp.138.2023.03.04.10.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 10:24:58 -0800 (PST)
Message-ID: <afb3cfe5-6b39-3da5-fb94-1f6227486939@linaro.org>
Date: Sat, 4 Mar 2023 10:24:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] tcg: Include "qemu/timer.h" for profile_getclock
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org
References: <20230303084948.3351546-1-rjones@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303084948.3351546-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 3/3/23 00:49, Richard W.M. Jones wrote:
> When CONFIG_PROFILER is set there are various undefined references to
> profile_getclock.  Include the header which defines this function.
> 
> For example:
> 
> ../tcg/tcg.c: In function ‘tcg_gen_code’:
> ../tcg/tcg.c:4905:51: warning: implicit declaration of function ‘profile_getclock’ [-Wimplicit-function-declaration]
>   4905 |     qatomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
>        |                                                   ^~~~~~~~~~~~~~~~
> 
> Thanks: Philippe Mathieu-Daudé
> Signed-off-by: Richard W.M. Jones<rjones@redhat.com>
> ---
>   accel/tcg/tcg-accel-ops.c | 1 +
>   accel/tcg/translate-all.c | 1 +
>   softmmu/runstate.c        | 1 +
>   tcg/tcg.c                 | 1 +
>   4 files changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

And queued to tcg-next.


r~

