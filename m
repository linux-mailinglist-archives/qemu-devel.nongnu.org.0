Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40447438C24
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:30:09 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mel4C-0006N4-Cd
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel25-0005H8-QB
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:27:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel23-0006O0-6z
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:27:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c4so2651750plg.13
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gEWWtpacZ4yjLeph+JVikg9SqbSH0QFN3bljD72SogQ=;
 b=iRG9RllhwjRn/6zWsNiW1WMQ9gW15EzS3P9nAldjEUVAUyL6fFrcfVzs0FcdTJWNAN
 dJriS8T0hspNVgComPGaeyFn7/bNgXPmJ5L08xWzfWEa/Y0t2jkn2t57SRs/6VoKp4Ht
 WTCKkkY6d6u/RI73L4MqsCYK7bgC7jxlUiFKAqTh1FAK/rswLMgIkkZLLhod875VfvQz
 jiKK0/4c2Q0/r8juaFQvIhWVtlRBRNUMnNshdJZY9agpkboc737nIuo0hLBbU59hrJH7
 0/j3i0YhGa+dmSts1YbnQrQUrIYG2UNli5cFGGEOaaNByEaYYqp1FS7cZZc6MOHLDEdj
 I/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gEWWtpacZ4yjLeph+JVikg9SqbSH0QFN3bljD72SogQ=;
 b=n74AFwGOAP2XS5FhV6AnBodihthcmzy6vjfjhCW/2VtmGUuLXPvkFrO516osAmSC4Q
 q0GNP/aLoXZr81ULuF9bNfIREs1+MX+DtJU3yrB6+E2UmL49x345OZm0vm0cLnEct9sE
 +zYjvLi1Q92+SqKMs0EHfoY4Lze7N3rs31DvwMqhYYK91IV0EsIPNqAQGdIGDM0tKr5M
 iQWP5TxDfaiDEkNy10UxBOyUhUm3t6DVIoNBXtwcgVoT3vyJHUB4rdq9d1fpagCYcw8c
 1mmRWBi6+aN5RwLugG+C+0VLB0+wetIztAIHlfrgtoRZngUVg9+CPk2Nx9b+pCcL0WTl
 8xVQ==
X-Gm-Message-State: AOAM532ZB/YOrADrv2aLshUv+Po8/cUeSHbWhm2oMFdkugufZmQ8DaUy
 pIHFNPNxMEOVFF8m+QGA3wtfoev/pFJYvA==
X-Google-Smtp-Source: ABdhPJw2QDKeZYyPYRkpozf4yrTuqB9x3NCm3uKb+ctZ/bhlUdiEm5lGkUJsoo7688bKjd4S6KjdMA==
X-Received: by 2002:a17:90b:4c47:: with SMTP id
 np7mr15917655pjb.22.1635110873862; 
 Sun, 24 Oct 2021 14:27:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h1sm9786304pfh.118.2021.10.24.14.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:27:53 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/ppc: Use tcg_constant_i32() in gen_ld/st()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47754d7c-7a1e-1465-294d-b408ff44cbf8@linaro.org>
Date: Sun, 24 Oct 2021 14:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024161619.325903-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 9:16 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving the MemOp index
> to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/translate.c | 29 +++++++++++++----------------
>   1 file changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

