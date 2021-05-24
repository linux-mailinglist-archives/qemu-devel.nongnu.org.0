Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8643038E827
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:57:02 +0200 (CEST)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llB4n-0002AS-Li
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llB3L-0000lv-Ij
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:55:31 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llB3J-00078J-Jv
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:55:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id q25so2849338pfn.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 06:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m4x/folklImijuhs/eH16sRjsuad38nJbmaXMH5O3/Y=;
 b=d6VCHS4lHyC8k+wrJmI6ewVDhDxJOZZjGbao7tjf7lwrA5bFmky+2jmQ50jwISRu30
 NSwqxQdVTr0dgggZDGPQe9pyoLEnZuXTwrgweaecU5SxSv6MBJIWd+rAuGlc7tMGO/Ki
 e6jBDPYucfyE0y2RaWYpkLHR3FB5Odioa9dD2Em0jVaT+S17vP0C77jnKhVWFetEx5Lp
 +DkY5Xj61Eh1FGQgmDjJrsvt+In6aCwvZh4V+Y+01RNS30dqpkSgXhkrrcQ8UkEMH+E5
 P8ExCO6IUlt6HbDmANf1JzQ8S3ASBkjl5c016xFcGkFEXgZxJ7eqVSC22aXHzUN4nqGe
 ILkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m4x/folklImijuhs/eH16sRjsuad38nJbmaXMH5O3/Y=;
 b=T40UkD59KFWoJ12pdU5wHqQP2Q3o0a+IMNsE5U2FdNojUAxUEMMPnD2qqa8QYEJ+yu
 T5URPz5dQ8QKFSriMgTyDGjQol3MMAu+C8jBBaNML3slg1MjTjJDnNUdNYcTh9IHzfhX
 ghb3pMcqjUHHwgJAQVWqeYKBOk6ZKP6QRLrox48POCMP2RdvHKup12nolNwvZQ7tpXvt
 2VQnjDO0SoD87+qjNCjV0AHCXtzMP0mt2ZmSiscgc/AZTZOHWna+tbpq3C4H3zodBpWK
 nT0EH7u0s2qwXS2cbW1DCgJSqNV3C5OsTCrjlZ1LHco8uIqnXyeHLbwCbGPA6cAQhUKr
 5w3A==
X-Gm-Message-State: AOAM532yyhmpUJhrdIobqlvgRAhwRvLh9GsKOT4uGkX8QDi33OB3wezX
 GJo9Zmr9pvsCXqvmfMMwLkDlJA==
X-Google-Smtp-Source: ABdhPJyLWTTAuOi8/h8Kq5fBB4QOiJQQhe7CqerR0g6a3SvKJKRaEsAmTzTZrXEaGUjBKOT2gwMj2A==
X-Received: by 2002:a63:1608:: with SMTP id w8mr13487127pgl.259.1621864528076; 
 Mon, 24 May 2021 06:55:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q12sm8986975pfg.48.2021.05.24.06.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:55:27 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/arm/armsse: Convert armsse_realize() to use
 ERRP_GUARD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e5b3e07-b85d-5c87-8f67-5a62a924527b@linaro.org>
Date: Mon, 24 May 2021 06:55:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 12:08 PM, Peter Maydell wrote:
> Convert armsse_realize() to use ERRP_GUARD(), following
> the rules in include/qapi/error.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> We'll be adding a new error check in the next patch, so
> do this first to avoid adding more uses of legacy
> error_propagate().
> ---
>   hw/arm/armsse.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

