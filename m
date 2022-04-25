Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E294050E4CC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 17:52:43 +0200 (CEST)
Received: from localhost ([::1]:57988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj10y-00078Y-0N
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 11:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj0z7-0006I0-T7
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 11:50:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj0z5-0002U8-LX
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 11:50:44 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 u6-20020a17090a1f0600b001d86bd69427so329511pja.5
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 08:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gmzw72hcCpmOKX8Mmf9RjSiYR5Q6J36sxGXGRRs1ZaU=;
 b=vaiyRHJgG4aFgnbBY4nKGwJRFT/yrSRo8MVZIA7vDs2yeUWDTYNSiX6tZoPKHQZHJR
 6rVU8Pl6nNxc/mSOKTn2gtWM4Wtv6oavXQS1sYOP9E8JFCnCh0CuZq2+9t2kvnWE34lC
 84RUJBt/rH42PsEpF5gCWY05eeRFZ/RSDXpHFUIlK1j8VI4KgjbQrT7J2ncGL6BwHfWx
 wrib92xNw7/U1AIHDI+B5kP20XquKQQpnjzHR5yHhxGTShRqecCj4uHsUAkGr6e4ZCZZ
 qcthoIxgdXsEKu7XeywNya6uqb7zHll+ejc71gUi/4w5vicc0ZM184JEFPJ0sNhbdsiL
 GGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gmzw72hcCpmOKX8Mmf9RjSiYR5Q6J36sxGXGRRs1ZaU=;
 b=GmwGK+q51bcUQo/3CwsLmM3E+b0y09ptzfmxUfVIANF2lRApWA+DZTqJBqyqTqtCBI
 kPxsWOSbVlplyj09VpMSAshpuiXhx8MrvX4aV8l28nYfZbhCKP6JEoi2UUwc8FAnLxYe
 Kb/+QM4epHTCt7C/a5OYe4+HiVb6WBncCjGBtg+2XdjZ9RJF1WZP/Ri8KBXUEtzS+T8N
 /i1nI8EfXhOlaKPyA10YyOGPGw+aEhPxbX4KUwOL12bO0osAGRYszrDRTfgCrrG9U3u6
 0NWuCAD3z+ES/qCud06GuX5FMU75ARoteY2Kg+/4Cnmo5pSN3l/wDvTYwax91GHTVx4O
 JwHw==
X-Gm-Message-State: AOAM532q6UkWa3fwh2IPL2+l61CeVyrKKOFAPSHVb0GPcPyreo+phbj1
 n6Qhigi65VQJPZZMY9+Do2HQ6A==
X-Google-Smtp-Source: ABdhPJzyoIksiT2Jc2HMHGLfAJ9E82f1kahnbBqSDisUfmXRlbXqAhOeepTg7YnBH/w50G/BmB3qpA==
X-Received: by 2002:a17:90a:e7c3:b0:1d7:4c75:3a58 with SMTP id
 kb3-20020a17090ae7c300b001d74c753a58mr21342213pjb.185.1650901839917; 
 Mon, 25 Apr 2022 08:50:39 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d3:42c2:3923:dfa6:d849:4ed9?
 ([2607:fb90:27d3:42c2:3923:dfa6:d849:4ed9])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090aa38200b001cb6527ca39sm16190590pjp.0.2022.04.25.08.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 08:50:39 -0700 (PDT)
Message-ID: <cc5c739c-44d5-1153-81ca-d18de78ea957@linaro.org>
Date: Mon, 25 Apr 2022 08:50:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 01/42] i386: pcmpestr 64-bit sign extension bug
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-2-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-2-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 15:01, Paul Brook wrote:
> The abs1 function in ops_sse.h only works sorrectly when the result fits
> in a signed int. This is fine most of the time because we're only dealing
> with byte sized values.
> 
> However pcmp_elen helper function uses abs1 to calculate the absolute value
> of a cpu register. This incorrectly truncates to 32 bits, and will give
> the wrong anser for the most negative value.
> 
> Fix by open coding the saturation check before taking the absolute value.
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> ---
>   target/i386/ops_sse.h | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)

This works, since the bound comes first, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    if ((val > limit) || (val < -limit)) {
> +        return limit;
> +    }
> +    return abs1(val);

But you could also have used uabs64() for one fewer compare.


r~

