Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BAD3E826A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:08:32 +0200 (CEST)
Received: from localhost ([::1]:41944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDWAx-0007SY-5C
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW99-0006M1-16
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:06:39 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW94-0005pI-DX
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 14:06:38 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b7so2507139plh.7
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zVferdUADHGH5rU8nL9+HTDGWcpQQUEth7FqcB+1h7k=;
 b=SOOoaQkcgcgtU/lEafCc73s3kNegtcrsuGXRa1lHI3hI08ICt+PRwwOqSMPN+yJ9pU
 Ff1D4nxN/M19OGKwBO0K1M5ih+jzUFw5RTsCjpYvULS5sIcoYZUqpk5amCmGMr5Y4+cW
 9mt0oNEg4daMD90Xk+YVPK+RWqSM4985wBBNuBWD5DqtWazYedJHMZSvgjC+noQ0CZDC
 gPTJRUUqVmaBkiT6gYo2rsqT6a1SazJjUa0FPtrZrzjonkLIpasmUp4v78+v6ATl9TVZ
 cpwZcXvbc0WpHl7ZSmjSE2ASMHnby1HMes7yOrQi98TM8SurEkcfDIc+ccXJgSVYLufa
 i+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zVferdUADHGH5rU8nL9+HTDGWcpQQUEth7FqcB+1h7k=;
 b=HJXzE6iw7ybgGl2L3nkKISA7vXphEYaXozoZ/C2qUqTWq7B+H0XIKGw+gFrpQrLcbN
 odntKtkJOhcquVWWR9Q31evrSw+jGpjHB+E7LOC+lDgs9b3Y1QANOY/caRMyAgFywA8K
 +tKSvdOvTLmo9eLwpZSJi8NnXLM22DdAYQfI5Y/TE+ye8zqYtzBTATaROgY2ZvzhbU1P
 RCH2ZVZERiQJRgf/Kw3xptsfiASAlRdkNC46bZ51QD6MiMT8k76l3ZznlRx/j3ELsRAz
 vhyC/e7H9s1SMPVtW9LNd5CeZzY+1RTL/oO7RmSJgrakvfCzTnbHoMRWNLu+zdGlOSLW
 lj9w==
X-Gm-Message-State: AOAM531gnvtIAzXyTpgNUxeCKdSWdBab+z2c0QxCEC68Yw7yATRau+zw
 pxYv78PsU65b5XBaEzqqZ/B/z1pxavxJAQ==
X-Google-Smtp-Source: ABdhPJwJeeHancJy9Om4vqJk8OkfWB3N74D+0Yaovu7XAV3p8yllbciHYppgh75drIAN8/H8TpvR3Q==
X-Received: by 2002:a63:cd02:: with SMTP id i2mr93473pgg.116.1628618792789;
 Tue, 10 Aug 2021 11:06:32 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b6sm3821447pjl.17.2021.08.10.11.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 11:06:19 -0700 (PDT)
Subject: Re: [PATCH for 6.2 48/49] bsd-user: Implement cpu_copy() helper
 routine
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-49-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ff3bd4a-bea0-3def-ade8-3f2004cc016b@linaro.org>
Date: Tue, 10 Aug 2021 08:06:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-49-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Justin Hibbits <chmeeedalf@gmail.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> cpu_copy shouldbe called when processes are creating new threads. It
> copies the current state of the CPU to a new cpu state needed for the
> new thread.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Signed-off-by: Justin Hibbits<chmeeedalf@gmail.com>
> ---
>   bsd-user/main.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

