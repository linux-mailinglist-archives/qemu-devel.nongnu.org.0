Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D38365B0E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:19:14 +0200 (CEST)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrDd-0004nr-TO
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYrCE-00044Y-Nj
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:17:46 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYrCC-0005r1-Al
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:17:46 -0400
Received: by mail-pf1-x429.google.com with SMTP id g16so12351150pfq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GUqpQMx8gYPZmgUUwH6Cpr4TuZzba0kWMMNNm/3UWtg=;
 b=OCPpMqpQi3oAtouRzjbyzEY/CEaSCxAk8PIfpPqh0DeAAExWYHo6KqG3RUZJ+JQSWA
 UQHDLHBhvis8+eVno7YNLa1sjH+kxKFuxsuxlpxMTsBacKSCFhszHpgr3FxltLqK+vO9
 6fC6MatHqO1tdn5lOSZEYfOGR7KXAngx1v5+8c1/FKzRQB31D4dr9CZb2WSTR6EdzN3k
 J0iWfuDI/xBlMfTROvRroLjwnzIW5RhXXaf4DKDSGqTasIIQYh8jOE0aRIygl6JqKGup
 saJEL5iblo64yWuRDsA89+gFxrXooZRQaj4aJ9874QWcz2VpBvhKfn7WRF4Yx/BCDi2E
 e/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GUqpQMx8gYPZmgUUwH6Cpr4TuZzba0kWMMNNm/3UWtg=;
 b=K2fE4fbOVZNkkh89gfIKlQsvAVAXj1UazMaPdOIUIoe0T/KkT+DxSdUDJFmAdBBycP
 XHCrzYNHeNdgeuJ92ViE2rRSJraupxu7w/QJQXLb2BdNPBBCVjvtLFIdr/NHe8N9JDC0
 b0L9VYypMiJzk4Mp+mFk444iR6OQdvLfxBnxJ4FVI9Q4TaUEJ3k0K3wobf1FeQYJRagy
 w8TK+Mb02ba+0t/19EST9LnRkHlPXyp2Bw9N2Zwlez64Y2tOKiJmFpg8gwzOCldH8PdS
 ZoOLC/wh1TCwhqNUdqJMewZttUhBtgMyHvAKLzNNFjL/2y5cTlDaaLhnru/xMBkQzpsA
 ilOw==
X-Gm-Message-State: AOAM530Go9UcrWzmwgNWFgDLQWkRU19f8BYSevCT4Yo5tiobqz6o0g7V
 jixYxJYJs2y8ozDxRwQdG/W4Hw==
X-Google-Smtp-Source: ABdhPJzjD1jlx5oREVhPOe10ZPDzVsF9piX6VCejJn2L1UNEgsRrU5cvKZZcfuPClp6rRLWKxpqfeA==
X-Received: by 2002:a62:1d8a:0:b029:24c:4aa1:ad01 with SMTP id
 d132-20020a621d8a0000b029024c4aa1ad01mr24394412pfd.27.1618928262820; 
 Tue, 20 Apr 2021 07:17:42 -0700 (PDT)
Received: from [192.168.64.62] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id j7sm15233254pfd.129.2021.04.20.07.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 07:17:42 -0700 (PDT)
Subject: Re: [PATCH v2] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20210420013150.21992-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <639de1d9-294e-9fd9-14b3-5268d45e71e0@linaro.org>
Date: Tue, 20 Apr 2021 07:17:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420013150.21992-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 6:31 PM, frank.chang@sifive.com wrote:
> From: Frank Chang<frank.chang@sifive.com>
> 
> In IEEE 754-2008 spec:
>    Invalid operation exception is signaled when doing:
>    fusedMultiplyAdd(0, Inf, c) or fusedMultiplyAdd(Inf, 0, c)
>    unless c is a quiet NaN; if c is a quiet NaN then it is
>    implementation defined whether the invalid operation exception
>    is signaled.
> 
> In RISC-V Unprivileged ISA spec:
>    The fused multiply-add instructions must set the invalid
>    operation exception flag when the multiplicands are Inf and
>    zero, even when the addend is a quiet NaN.
> 
> This commit set invalid operation execption flag for RISC-V when
> multiplicands of muladd instructions are Inf and zero.
> 
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   fpu/softfloat-specialize.c.inc | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Alistair, will you take this via your riscv queue?


r~

