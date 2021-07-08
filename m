Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A63C16EC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:16:11 +0200 (CEST)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wh8-0002Cy-2v
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WCk-0006cK-Qx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:44:47 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1WCj-0007nc-4z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:44:46 -0400
Received: by mail-pl1-x629.google.com with SMTP id x3so3196645pll.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mWpSxWqXaU4VzD6THZWfXECcJOkMolUqhk6+bdyiMac=;
 b=ybdlcXSVxENV3VTvDzgzYAROTi/aATOM63URgetAuSXZ508hLaK+8K/aCUclv7WS8K
 +NvdxI3FABXliMgi0TSPeHSVNBSnRmYxB8ZA6wsIg3lqvQ5GKiB5GTm0OvzMKSeWZVYQ
 9mfKhlFKyZ0/514nfj9Z961jDCPcN22EtXhFL63B0pPAXZJf5rMA8WElo2+ZEtUv5Qp+
 QgN4P0mn/CjQm8LdeDjpIIYMvr4JX8j4482Y0u0O5H6CJTiEav1KiFmv/M2AAiHFA4xv
 KETaL5MzwwSFXEe0SemQMzGcRa1sz2An14rvqo0zSqjZStPBSTp1/6uM5AX4GqUWpsq1
 GMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mWpSxWqXaU4VzD6THZWfXECcJOkMolUqhk6+bdyiMac=;
 b=jaI9qo1hULfSqmcSVl7ZZjd0el19QVohpHUU0E2ODSS0HowZp3VSuqu9xGtvZ5Yozj
 JiTk9+uNC0OPQ9ipyVUqhQtJmQuNgDFIKiCx0iGEvizRZJl6b8EV2Bi7+8NZZVbgjVh+
 Qt8hNupkSrDwN0EfoPKgN8HgamPJXUD4lcK/HviblwcxTpH1mIgO3wZSwN14UaKhrm0Y
 RorZ07ozk+CmdUEojJj8kq48sYKKhe1beVux7ZRzC3fqXPU2IFSL+yzPRp2z+DMjVJNL
 9w75OxZbBjH/SBkSIimOug1XlziJfWF+RYlQxfBVflQsWRGdPKII0EhvAe5iL3jUqLrD
 Sgaw==
X-Gm-Message-State: AOAM532veJOhcHLOd5hUV5QENae3FvKL3HjVrxdoMMKmxR9Ye4pZuDPg
 DTTj20WDrI2sEr032SVyTc1CFg==
X-Google-Smtp-Source: ABdhPJzr4RM/JLybtcH21wAhq25waUqBgZKdaBsW3ySaxAeV3lg1MWdJo6Y+crlm0/EqWpvbg/9F7g==
X-Received: by 2002:a17:90b:3b88:: with SMTP id
 pc8mr5732999pjb.124.1625759083799; 
 Thu, 08 Jul 2021 08:44:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z20sm3913358pgk.36.2021.07.08.08.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:44:43 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] linux-user: Simplify host <-> target errno
 conversion using macros
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea33974f-6c29-3fd4-93d3-dd022c18f8aa@linaro.org>
Date: Thu, 8 Jul 2021 08:44:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 7:11 AM, Philippe Mathieu-Daudé wrote:
> Convert the host_to_target_errno_table[] array to a switch case
> to allow compiler optimizations. Extract the errnos list as to
> a new includible unit, using a generic macro. Remove the code
> related to target_to_host_errno_table[] initialization.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/syscall.c    | 169 +++++-----------------------------------
>   linux-user/errnos.c.inc | 140 +++++++++++++++++++++++++++++++++
>   2 files changed, 161 insertions(+), 148 deletions(-)
>   create mode 100644 linux-user/errnos.c.inc
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 56682b06cbd..8bb528d2cf7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -507,157 +507,37 @@ static inline int next_free_host_timer(void)
>   }
>   #endif
>   
> -#define ERRNO_TABLE_SIZE 1200
> -
>   static inline bool errno_exists(int err)
>   {
> -    return err >= 0 && err < ERRNO_TABLE_SIZE;
> +    switch (err) {
> +#define E(X)  case X: return true;
> +#include "errnos.c.inc"
> +#undef E
> +    default:
> +        return false;
> +    }
>   }

Not true.  As documented, errnos.c.inc only contains those errno values which are 
overridden, not all errno values which are valid.

r~

