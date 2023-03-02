Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB126A8B53
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:57:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqv5-0004z5-75; Thu, 02 Mar 2023 16:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXquz-0004yb-89
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:56:53 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXqux-0006qQ-Mp
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:56:52 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso222541wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677794210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YM0TD7SHRDliLQpEza8HPHiEGPDO9IwOzqmUojFoPBs=;
 b=UkZ2tZOa9DHgZHKKwdIqQZFEblCjwiS8awA3uOMv+tBsvA3cK/1cFJaKaMY76yAocR
 QOgulgtaMtx1FJIKyTgM8MaWK6t6yIPqZL5pQrWQFf3vFWrSNqb6A+q5UkefTPs81Fpt
 YJPYjbrnrFubDmc7BTNEujMtLuBMj8STt1ihUMmlnFq2EvquvIY0cllIjIHC+unbZ5F7
 3NHxiAxElKhVlmYwZrJ9zdRRrVpV8NnT2YUDwEWMWQVhyPgPHh8Xhlz3iNha29eQG5+x
 UJTwF6egESZ9moZw8c0/9GOAnsNnfjUn8tWn0+w34JUi/ooo6esA6cS0g7dQ961AI1D+
 pr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677794210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YM0TD7SHRDliLQpEza8HPHiEGPDO9IwOzqmUojFoPBs=;
 b=7qTB5vML64VH8Rs/uRgOY3XZ9b1pvgPohS57DNaCa6I+FrhL+6v/BbGLuo1Tp4veBx
 xGseu08maVIZIKELnagrbjAUoDJmeSmdQrYyJ4VWY/eEAf464VcfT4OppqzpI4MLuBCR
 1W7eXRa2PwR196nnbRBF9RZVC2nCZ1++oh6qcXwmfFLf+EZ5IFrD9sSDKOV8xMQQwrxB
 dA0ykdbJw5UnzEcjyZngmzmIr4M6ALiOMB4tx8iPJbJJc+emk6JBkPEH3URk8HInQ2ex
 43pWBJoklDb3pju1RVzde++2KoVaYskaRTj8VyyYY1jxL+3HPttlskUzc8Cldrwc9wJp
 N9Yg==
X-Gm-Message-State: AO0yUKVm3C1zL7nOcvQppOzadv1QCIXC6tIjFLKeMds8QleUXcBQon++
 p5X7uCIrB1VKLLoGrwY0rRSURw==
X-Google-Smtp-Source: AK7set+EAXuUcCS/AvU5e5EC/kqODy/Iv5IPIZzuETgpbY+v2ekfy0FT7yrYxnKFm2wLrwHrntzQNQ==
X-Received: by 2002:a05:600c:3555:b0:3ea:f6c4:3060 with SMTP id
 i21-20020a05600c355500b003eaf6c43060mr8760030wmq.18.1677794209806; 
 Thu, 02 Mar 2023 13:56:49 -0800 (PST)
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003e00c453447sm3796859wmc.48.2023.03.02.13.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 13:56:49 -0800 (PST)
Message-ID: <fe4fd820-949b-c609-25e5-d74dbff7a7c5@linaro.org>
Date: Thu, 2 Mar 2023 22:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tcg: Include "qemu/timer.h" for profile_getclock
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
References: <20230302162909.3267074-1-rjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302162909.3267074-1-rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/3/23 17:29, Richard W.M. Jones wrote:
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
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>   tcg/tcg.c | 1 +
>   1 file changed, 1 insertion(+)

These files have the same issue:

- softmmu/runstate.c
- accel/tcg/translate-all.c
- accel/tcg/tcg-accel-ops.c


