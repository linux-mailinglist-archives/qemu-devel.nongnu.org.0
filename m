Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C46B53C0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:04:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakqX-0003y3-Co; Fri, 10 Mar 2023 17:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakqV-0003vt-7k
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:04:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakqT-0001n5-Oe
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:04:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o5-20020a05600c510500b003ec0e4ec6deso1020758wms.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 14:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678485852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ta1hfjq80C2WQvyXOX9XoZbZoN82KBcjGPe3iO4Zpgk=;
 b=h0VAJULcBwagulf+aYDhuR6iUjAGze03lbqkYLjm/mwuIjEi5JOs+tN0fpfPBXLQCF
 8Twl2usHApqCTbxb7aS/lf6MkZc+CTF08mKtmCrRuRF5mYZoxlM0mPhK6UdRPDgw8ZEA
 UJvC5zwvxFs31nP+6Ktn0PTH2CWApbOUEGGrKx8/nyfwM6KcDuP2kzWBnLIFXAFQAB1e
 UMqfxsnP7LnOh0eKu2ktpyIuJdbkzhrceVVlzs6GIVvcZC56KerO9N0O9/Ul2AlnltHT
 k/cGaHaAkAVszZ3zyokHCgenqQxkWDjlRcRBx6xeqW5aDBQw+liCnc/AHyvjWaE9J4D1
 zk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678485852;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ta1hfjq80C2WQvyXOX9XoZbZoN82KBcjGPe3iO4Zpgk=;
 b=TyosLTb+zjJCuE4DHQ/kF0/NrgiOkMGdWPSEQtmxqYV2A59ebJw8IkWT8IQSIdPUta
 40pXgW8QaAxjWevSUE0304qVoao3fhmxqWPsMNmPMLSfcgfwoeAkNlHr83jE8brkKNtT
 N0EtNEdix7FYJ8DvWTN7K3PGT4OLXam6TXi6sQQTObvLLaf5ujP4u8U4HL1JX4v6S82Q
 xPZHmMOdG+F1g9N7sqVpVcW94ue5afq+RkqYlD1D/bfVhqj9RU5+XEY4GQ1dMwPPPurI
 kZfphVVdsmrbAVzl3wz+s++5xPuaXFgJpZUz/hoqJJ2p9XlWIcLlEhelNmHBsrYRmZZO
 HLlw==
X-Gm-Message-State: AO0yUKV93jb3snOeKDnGKmLGVKO8cM+PzsUQi47MAA4H/dvXcP4kH6E9
 oPslIPRWtYYh7+Q/rzFzUKgf/w==
X-Google-Smtp-Source: AK7set90tn7eXPtsCq4+3bn3chABXuafP+h7w8gYhdVm2VlWhKC1dN4QImZCxDjDacuHFR1hmkdCig==
X-Received: by 2002:a05:600c:3c83:b0:3ea:ed4d:38eb with SMTP id
 bg3-20020a05600c3c8300b003eaed4d38ebmr4148609wmb.24.1678485852078; 
 Fri, 10 Mar 2023 14:04:12 -0800 (PST)
Received: from [192.168.1.115] (116.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.116]) by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b002c703d59fa7sm787032wrr.12.2023.03.10.14.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 14:04:11 -0800 (PST)
Message-ID: <f6953b6d-989f-8a71-dc08-6da88ee43ffe@linaro.org>
Date: Fri, 10 Mar 2023 23:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/7] include/qemu: Split out plugin-event.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org
References: <20230310195252.210956-1-richard.henderson@linaro.org>
 <20230310195252.210956-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310195252.210956-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 10/3/23 20:52, Richard Henderson wrote:
> The usage in hw/core/cpu.h only requires QEMU_PLUGIN_EV_MAX.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h       |  2 +-
>   include/qemu/plugin-event.h | 26 ++++++++++++++++++++++++++
>   include/qemu/plugin.h       | 17 +----------------
>   3 files changed, 28 insertions(+), 17 deletions(-)
>   create mode 100644 include/qemu/plugin-event.h
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 75689bff02..821e937020 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -30,7 +30,7 @@
>   #include "qemu/rcu_queue.h"
>   #include "qemu/queue.h"
>   #include "qemu/thread.h"
> -#include "qemu/plugin.h"

\o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


