Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB9E67FBED
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 01:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLvDU-0005EF-7z; Sat, 28 Jan 2023 19:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvDR-0005Dk-KT
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 19:06:37 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLvDP-0000bQ-Ts
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 19:06:37 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b10so8107058pjo.1
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=22dmW1rM1iGIgMpX3VyBLcUPIVpOPLoCDG0Drd4wkbg=;
 b=oFyj+ViY59sAHh0fYfDWzZ7U9e4hmXGyvknBzqgUfFqbw86JoE+eNYExxwHvWaj77p
 dTTs9XDoCu1qOKJcW9YhGVZdbdbXhdH2mPDIRtGkAPwTaSQhZbAYVqPyYzfHnv6hcaAp
 b/lczdbkYsY35h72HpZUdV67OXBAxHI+WDQ5YC1zeIYtdATdY40GBV76VGexwp3kwFJR
 X2ULcX1vcHzzacapBecHjisI8wJBvLHQcYqtKg1Q+aaty0fk08A3IdZGvgz4JFbXBrCg
 0IucSseQfRH0rAYdEENfljqYAB2BrkdMEbPEqjyGGP8/r5sZnIGojwi5W6Px5qrjbNub
 Uvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=22dmW1rM1iGIgMpX3VyBLcUPIVpOPLoCDG0Drd4wkbg=;
 b=WK6snkmMDc+B7Gfp3aCZHSplzjgT7aO8Lch5Oh6s+T4rA3eh2d7F7rSi6sJ9IOIPLk
 yEXkVhLGotOPN+ahiMZ6EgyN7Cm7WLw6TbKYp1Ub+1ECw4zEBwGqLT412PCxyfkC7/ci
 U0TpM26pWyGDIdOvkL8nV2tBVUmV8XHkoemOcXcPO+8qPJtmr5XMtKJf1NSB0rwtaChD
 mPVGAEMeS0R65/FF/7dAO0WlnJouqQK2+YOLxeM9PQDchfZtF+VR7WogKi91hVYCEd0H
 pvuCdualdEFbr5fSlCwViKKa/8ibnXRHlpj1vi+sYxo2kfa1Ji0uNxeOpU1wt2UhSP8f
 xXvg==
X-Gm-Message-State: AFqh2kqfTGn3GMKGslTLj2TxiVwsUPGgGEd5jN9BR9b7ptvrUM9S9mS3
 pRV96mYQ9/gJiTd56jRoupv15Q==
X-Google-Smtp-Source: AMrXdXuCmdlBjbHfOPOjm1b0To/EJPPaz0f+7TXnuJTBl8kTsLtjh9D74D3xAwlA/GwhBFsKJ/wgOg==
X-Received: by 2002:a05:6a21:6daa:b0:b8:2c67:8f7f with SMTP id
 wl42-20020a056a216daa00b000b82c678f7fmr60542714pzb.47.1674950794211; 
 Sat, 28 Jan 2023 16:06:34 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 6-20020a630106000000b004784cdc196dsm4358246pgb.24.2023.01.28.16.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 16:06:33 -0800 (PST)
Message-ID: <191c2049-0cda-8517-659d-f1f1473fffc4@linaro.org>
Date: Sat, 28 Jan 2023 14:06:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 22/23] target/arm: Implement MDCR_EL2.TDCC and
 MDCR_EL3.TDCC traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/27/23 07:55, Peter Maydell wrote:
> FEAT_FGT also implements an extra trap bit in the MDCR_EL2 and
> MDCR_EL3 registers: bit TDCC enables trapping of use of the Debug
> Comms Channel registers OSDTRRX_EL1, OSDTRTX_EL1, MDCCSR_EL0,
> MDCCINT_EL0, DBGDTR_EL0, DBGDTRRX_EL0 and DBGDTRTX_EL0 (and their
> AArch32 equivalents).  This trapping is independent of whether
> fine-grained traps are enabled or not.
> 
> Implement these extra traps.  (We don't implement DBGDTR_EL0,
> DBGDTRRX_EL0 and DBGDTRTX_EL0.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/debug_helper.c | 35 +++++++++++++++++++++++++++++++----
>   1 file changed, 31 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

