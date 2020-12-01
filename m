Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C069C2CA59D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:29:27 +0100 (CET)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6ek-0008RG-T0
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6dd-0007kL-My
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:28:17 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6da-0002Kr-Lt
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:28:17 -0500
Received: by mail-oi1-x241.google.com with SMTP id k26so1933972oiw.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=P59Kz+sWZm3rrMVCm32uNTfSuUsgx2YktNh0BZnYIiE=;
 b=OiVpzzAPx4pN0oIFEPeNYsgIt8V+uYpnnsR05+RTgPia9aEhyxY5Zq/irm3ECzVmNb
 /kl3X9h2VBL2KZQ5hjsqok7xlM2eMOFrkZ/KD/wGjs4t4IOqaPuSSKbJzUVPKlg8x5Et
 Qd+9rDlcVOMOZdAW6IMpCRklzh4UmtXEVlEqjf3Kz5j9Gh+wtyIwmELKWmdpBc6fWH/p
 7q4Qez2oVMN+agItiojep9dmbEZbEhhSGFbnVjVYdFk/3yOb/kJzoj9zUwhLgWjWczoU
 IG5CYBNxsXoyWiwdi/2lT7sBkXD7NyEqQmGBEMvVL4yiDe/QtnLrjhi7efo9lKOFEYw3
 mR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P59Kz+sWZm3rrMVCm32uNTfSuUsgx2YktNh0BZnYIiE=;
 b=fwPIIPNPhcp8RdQR2j0jT9nj4CLlL1cPMpoAsPsj/DOD5KjyfiFRkZFTyzBFRxgOtc
 a1PC41jBLcaH0CEQxzRjMqvZ4B/rC+8db4xVvG46HPIAu4ZG/GGmv77zM6Bg2SxoiKh2
 cGfixdF/C7Z/RIcK1IV1weJrEkWlehg5xj1UQrYCKl5ryYkLkR2ercuCiZAE5Qz4nn31
 Mlx41H42bg6VTKRGuU73aaTIxA4U623mTQ3OUpiE8LRWiHU0M5OF65YAf4q2XU9H97is
 Z6Bmr7MYz9p8DRSTFl1rIQbQES/3QqtArTRXGTV1ZuS1h2KHfGPum7Ramx/nikTL0Osb
 Pkog==
X-Gm-Message-State: AOAM530k/dFt+OORRGYCJQUeqKXFivVDoNSfEMg5LWsNpdR5ZUmpSDi/
 XIhIFBDoT+RCfbw1UOED4+q2v1tgm3KFGoc9
X-Google-Smtp-Source: ABdhPJzMe5ls3yijAjy4arA5xUXiIYrHGWVQEYERzwSN3ZaM95MBsmMoX47Z1HbrvTfO8aUkYudfdQ==
X-Received: by 2002:aca:dec2:: with SMTP id v185mr1859061oig.6.1606832892768; 
 Tue, 01 Dec 2020 06:28:12 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j126sm424998oib.13.2020.12.01.06.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:28:12 -0800 (PST)
Subject: Re: [PATCH v2 15/28] hw/intc/armv7m_nvic: Update FPDSCR masking for
 v8.1M
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52768558-ed95-8c00-47f3-6800e3e3e705@linaro.org>
Date: Tue, 1 Dec 2020 08:28:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> The FPDSCR register has a similar layout to the FPSCR.  In v8.1M it
> gains new fields FZ16 (if half-precision floating point is supported)
> and LTPSIZE (always reads as 4).  Update the reset value and the code
> that handles writes to this register accordingly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 5 +++++
>  hw/intc/armv7m_nvic.c | 9 ++++++++-
>  target/arm/cpu.c      | 3 +++
>  3 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


