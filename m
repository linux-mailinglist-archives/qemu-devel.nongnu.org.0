Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4483300E87
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:09:15 +0100 (CET)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33gA-00012m-TE
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33eU-00008j-5Z
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:07:30 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33eQ-0003Gw-Rp
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:07:29 -0500
Received: by mail-pf1-x436.google.com with SMTP id i63so4634527pfg.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=16QhzGU0SPN8zTSiM6wnUsJF03wOOJmMeu/qDic83kU=;
 b=ae2TEba54lVkZ9eUi5GcDvgjVtKTIDAUfQx9g3Fw9NoGOwozBAYn06IO69XUqyQ46c
 YXwPjcqmOtMsKlTHNAoDBewwI4johKMqabvBHKoNS34sP9WCeuoNL0wUwCBNr75dJsaI
 2LjVuF0ir9L86lYJTzOMxNf7O0i+G80GTo/nb0LkNdCg91EG0iAngn3tD7FdTOcpauq+
 CWeVTkEtXm099i8yFk+Ch+JJDkLfiQjV0BIHkAJgw1MO8bZOkFuQKaOLZwW3fP5P1UqH
 hQckGCwSA762CTxkh+cdemrUfnSVDkoQNfeYb1432kvaVoOY19DX8y2hTwk/ycmr+WMG
 m8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=16QhzGU0SPN8zTSiM6wnUsJF03wOOJmMeu/qDic83kU=;
 b=MpITUJw2HC4uAag/Lp1+NYGP1ExrfyY6+oCpwKU4ShoISc5Gl6+sfGoi506k2557ul
 R50nLmp4SHuKmEUeUbC5qRJZlqFgEAKp4lFzuf7Q1OS3d6Xcfx/0DwrFYk4/HoJAi5H8
 v1HVAE4HBM9GxyeqZBHUMMDIAFQrc+ygom7jJN1DwDaAoA4e/Rmfh+Fc5JA7a3s3MHYy
 N8NJBL9qKAnIBsqBlrmN7SSyvO5emEUunExfT4vqiou5tZ0x9EWhRTAfAX7MsQ3rPQ3o
 Jddw1qUJvVBwWjp1+JBP5M2YR1KwPfwms+8j7bVTVA8aIC09eBnPqg0uLEMo7KQRRzpB
 K3PA==
X-Gm-Message-State: AOAM530DAkjPbM769Iso1lcVss7+Of1lmM1tT2dxiSotATF5CXumDeZP
 FYyfZeGEokjWsu0k8l+rmGnuOA==
X-Google-Smtp-Source: ABdhPJw/+UYZvGevJu8+l0leqJsHFghkJknpxed2/eig4e/E9Ntdg5oHKQ9ziNmnx8p7zGbARATrzA==
X-Received: by 2002:a63:fd01:: with SMTP id d1mr291012pgh.319.1611349645496;
 Fri, 22 Jan 2021 13:07:25 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id s2sm9746110pfd.203.2021.01.22.13.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 13:07:24 -0800 (PST)
Subject: Re: [PATCH v2 2/3] target/arm: Add support for FEAT_DIT, Data
 Independent Timing
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210122044537.1823-1-rebecca@nuviainc.com>
 <20210122044537.1823-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d8ec61d6-d256-fa7c-e0d7-fabfc6d90d3d@linaro.org>
Date: Fri, 22 Jan 2021 11:07:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122044537.1823-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.221,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 6:45 PM, Rebecca Cran wrote:
> Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
> feature for ARMv8.4. Since virtual machine execution is largely
> nondeterministic and TCG is outside of the security domain, it's
> implemented as a NOP.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu.h           | 12 +++++++++++
>  target/arm/helper.c        | 22 ++++++++++++++++++++
>  target/arm/internals.h     |  6 ++++++
>  target/arm/translate-a64.c | 12 +++++++++++
>  4 files changed, 52 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

