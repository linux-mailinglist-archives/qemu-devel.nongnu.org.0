Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01353B6539
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:20:58 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxt4D-0000qg-RM
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt32-0008K4-DS
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:19:44 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxt30-0003Ra-S8
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:19:44 -0400
Received: by mail-pf1-x430.google.com with SMTP id d12so6662864pfj.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Kr936up2EFTAZEwd78qSaHC/UDnLrKRYp0F1hReScWM=;
 b=Bq65QqNXjvpzwUb8b0JMIjR32rm5WDBFM3y9QwDEcIC0F6+CpDFi58IayxFgj//+bL
 3H4tV8T6bwfPrg1sMnVukisyvEGoveiFXPtjngB/e5ODm9UYu/+FSTc2lw6xrW0aXKTm
 pBvXus2o7L4Wt7nljgCb9HYponbr1L9rGgwNQR5NX1kpAxpHiqXTfFJ3rW5lO4KbFtPK
 pmXRl2QUJ1iFnP3y1g31kp50AKW5LM+mm4cs1nlYjAdkTXQF+ZS1Vbgx13mflep1boU2
 WccIzOX74SN9HxN0MTNTfQykqvGtFWRiahBYanWqvu8sVtbwNjDuhTC6EwVQGx8aeOzP
 0Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kr936up2EFTAZEwd78qSaHC/UDnLrKRYp0F1hReScWM=;
 b=Um8uOFY64+sVu402Ad+Cs+UOI6fgWTYb5InsHQIg6DGDjBYN6U04AF8MnLIbCo20Qt
 V+Vmgd+BI4vg8RWzUQaizd1sXbX+AxPqICDql+sRagRphFV+Hd5MZ+7zKHcMYRiPovbz
 iMa2eU+gx1IIHyK3UXim9l8dMMWndGdrnzE1uTpZEY0fgtcF6bSTVQONgsuubY0ZSAAv
 fcMeVUb2JTz86hsQt42kdGIKPB/Ohb9awplTCjxqv2yPHS9d2AwWg/DxaQ7h83oH0ggK
 6q8dBt5XX3U7GmTl2EY9kpMVhcf7W4Qsnk6QJkUHVDjYBgW0aN0xW2qjmptTR9bqXypH
 Fxxw==
X-Gm-Message-State: AOAM533FMZ5NhwobnuWCRd3YtT2LYo3J9PyCXQKW7jzQmyFJgop1/S9B
 NLx6U523ReYDn0SJhzpz7FYSR285XCrjQA==
X-Google-Smtp-Source: ABdhPJwS/nTFxO9go38CKYJVcF+vhwMG+Wem207vUAKFzhrdTmitwQjB03TsyZstyGPRc1N1ZsJAaw==
X-Received: by 2002:a63:34a:: with SMTP id 71mr23184177pgd.305.1624893581211; 
 Mon, 28 Jun 2021 08:19:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g10sm14458733pji.10.2021.06.28.08.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:19:40 -0700 (PDT)
Subject: Re: [PATCH 03/18] target/arm: Make asimd_imm_const() public
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85ce78ad-567a-c033-6dd0-542beb27bb5d@linaro.org>
Date: Mon, 28 Jun 2021 08:19:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> The function asimd_imm_const() in translate-neon.c is an
> implementation of the pseudocode AdvSIMDExpandImm(), which we will
> also want for MVE.  Move the implementation to translate.c, with a
> prototype in translate.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.h      | 16 ++++++++++
>   target/arm/translate-neon.c | 63 -------------------------------------
>   target/arm/translate.c      | 57 +++++++++++++++++++++++++++++++++
>   3 files changed, 73 insertions(+), 63 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

