Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF73306C8B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 06:03:49 +0100 (CET)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zT9-0003QI-U8
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 00:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4zQQ-0002Q9-Fa
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:00:58 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l4zQO-0004Hw-K5
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 00:00:58 -0500
Received: by mail-pl1-x631.google.com with SMTP id b8so2652974plh.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 21:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fU7WhonzE4kqf8xNbIZGbokJSeF5WES0OEDS8hm6GvY=;
 b=LTnRJNbgUsS6xCLgeUv+8IYaWCrzlGTLXxe0iTkIywuSspCyC6Q4HR2G6TgoGadKf4
 Cp3g7+0fnsquM+Mprw4GPvJPtCxt4fXkiXQlE964LnS4cFFIwD8A5JLX3aes8dZIXJCr
 3kgws0fkclFXndyV+T3+tq9ST7v3bBJ5K32bMqA1sKKI4yg/B2g/QwiSuNoVJimwQh2O
 GYSoqUiziK8zlwihUDxhs5BHGpkGlPU/abCblEOwk1ELvLQrE1Qevo32MHIgiq1ptfa2
 8GqcfemGfWsDtMIXTO2+LNYKQ5QcqeLx2eW3v3P0Mlcc4x8EYmxAB2D5cKrsGwvFhiJF
 7q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fU7WhonzE4kqf8xNbIZGbokJSeF5WES0OEDS8hm6GvY=;
 b=CpvyW1FM41LjHD8cf8mSo7hm8xKlWONpwiAuoRh9wLvqcooRI0Sro7usuryPm0PW3/
 XszjALF8KhO89g3aFxHNwsxOfOcHUc2gmTXLhV69LtkUhcfqgp2jvFyuKvJps/3MIM/e
 HewgA1AWfjf5Bd9X24w4zqw9VjP78lq62DOzYmBbIuO/5wdmrSLU+mBaLZ3TGAIrJrIW
 PeIFGGRIRlf7BEtDiTBJ3HcMTC7LzPcG2iWSpkXvxxlMseGGDaUvKADZXZVTSH9AqmWa
 9Qsrrw0WwHCs9Gy2CShKrK4ymoCXBJ0vNwVmuGh4O78+T9Dm3aWnRyTVYsnMmGEuhsRj
 c2yA==
X-Gm-Message-State: AOAM531bCUPX7cZjd55zYKTLnkQpPSM4jUy7NWrUlgxRYqr1+oANl4D9
 JgbH9Uuf1cbzYzbyytrR+ZLvmA==
X-Google-Smtp-Source: ABdhPJxY0BQdeyBuSPWGwPhahJJtMjovDZepb0TRbcbtkuJpeZmHkEVvBhS+vT0ICdM7DAHFZ7MuQg==
X-Received: by 2002:a17:90a:df84:: with SMTP id
 p4mr9200779pjv.81.1611810055074; 
 Wed, 27 Jan 2021 21:00:55 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id e21sm3827685pgv.74.2021.01.27.21.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 21:00:54 -0800 (PST)
Subject: Re: [PATCH v3 1/4] target/arm: Remove PSTATE_SS from cpsr and move it
 into env->pstate.
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210128044529.1403-1-rebecca@nuviainc.com>
 <20210128044529.1403-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5c3e3cb-18ad-4a36-0301-9cf78d85f3cc@linaro.org>
Date: Wed, 27 Jan 2021 19:00:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128044529.1403-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 6:45 PM, Rebecca Cran wrote:
> cpsr has been treated as being the same as spsr, but it isn't.
> Since PSTATE_SS isn't in cpsr, remove it and move it into env->pstate.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/helper-a64.c | 2 +-
>  target/arm/helper.c     | 2 +-
>  target/arm/op_helper.c  | 9 +--------
>  3 files changed, 3 insertions(+), 10 deletions(-)

Missing a change to cpu_get_tb_cpu_state to remove pstate_for_ss and simply use
env->pstate.


r~

