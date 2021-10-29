Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B63944039E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:54:38 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXxV-0005pX-Al
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXpJ-0004kC-27
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:46:10 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXpG-0000WR-HU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:46:08 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so4575854pjc.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jWW8RWw5IFzXL/nnF83RZpPgO0yS+wUneF5Zmn2QcoI=;
 b=YZO3ynfsMqBidPkXf8gb/6Y2lf8PnJKr2AyL5uDKYowNmGmsktciP15dm5OQxlPIfH
 NKfKGsr5sTGvIPo3G0lxhof30pK+V7fEWlMnIbzgG6hXQqnMTiJyH6X4MN8drAIORha+
 7qyC+M1CY2sH/A0uhNRIC4Zoctoj+j4SAjpsivHTSjfCYmrtzYnnPW7jRl/q8f1p8/g+
 zCs2z9XxLmB4uN+KiAjfEiEJT7RIfes+skLW9eyclQ27v8gxNF+Zmu2QEphXYXq1WDQ9
 e9Ttqcw5N6/IDGnDqeHEm5wRaf/Ge0DdpJwVNMo88fOcGeZWmyZR/H0a0kgFen2h4nmY
 1PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jWW8RWw5IFzXL/nnF83RZpPgO0yS+wUneF5Zmn2QcoI=;
 b=FRaOy1TlM4jTMV15cVPC22X/er/4so6e/xPmf/e0S+Z1XhAmMjJwK3lKda+YP1uao4
 AwdquRlSbwCieMNv+Lf+ZvdggCAjDuc2m+Z6JWZm2vDMNnKC/EbfZwVyZYnTJTWvtDs4
 L3y7JVuKYt9/pYzvjqT4a8vLsJcvP/JjYUJCJCuPlXnSMuNdEVn7kBvCyD/swsCG5FWx
 yS/gBCL3hNwzi5B77FoF63MB7gq0keovQiO4iiVG3r7cm8UaH8cxyMWAkALihN9YpbjZ
 HAzMwZ/NqnDQ8tWJV7V3MrFuRCio1gwlgE7DIXqJ9Qp+t/bukUCVSNvP/zT2m5BM6nV/
 FfRQ==
X-Gm-Message-State: AOAM530ttBkvKfW1wlDLEi6YUPk0zn5f5qX15cM1uz6TAHvxaTRTYTz+
 X7tj4UJ856droNfkIJ1EO5YiVQ==
X-Google-Smtp-Source: ABdhPJxSUYDBKuU2xt0Wfl3rQ5eUDCvIbv8W9LPj29nWyKOMyLr+2D2Ui7Gcrhsy7FJs6PgffadbFQ==
X-Received: by 2002:a17:90b:1a85:: with SMTP id
 ng5mr22234721pjb.43.1635536765147; 
 Fri, 29 Oct 2021 12:46:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s2sm7175243pfe.215.2021.10.29.12.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:46:04 -0700 (PDT)
Subject: Re: [PATCH v9 04/76] target/riscv: rvv-1.0: set mstatus.SD bit if
 mstatus.VS is dirty
To: frank.chang@sifive.com, qemu-devel@nongnu.org
References: <20211029085922.255197-1-frank.chang@sifive.com>
 <20211029085922.255197-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2175694-2f00-ecc2-046d-0f754113d720@linaro.org>
Date: Fri, 29 Oct 2021 12:46:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029085922.255197-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:58 AM, frank.chang@sifive.com wrote:
> From: Frank Chang<frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/csr.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

