Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E295394D6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 18:15:46 +0200 (CEST)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw4X2-000727-Ps
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 12:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw4MR-0002Qu-Uc
 for qemu-devel@nongnu.org; Tue, 31 May 2022 12:04:47 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw4MQ-0001g6-1f
 for qemu-devel@nongnu.org; Tue, 31 May 2022 12:04:47 -0400
Received: by mail-pg1-x530.google.com with SMTP id g184so13267232pgc.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 09:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=quiY50YXVS+133Jq7H4cy4RVjGdlaxQTTPKj8A1nTZ0=;
 b=PrlC7igfKEUZWazijzjlQNaZ44N8HF9sOnQcV7mMtkQ5tk7Oa4TxWtCf4bgIhjkqij
 2zn285rZk0MJIuFOmVXyhJbMtF/Us1RDT72Hq5JjjLX5b1Zxuy/d4o2qEgpLkaRfn33T
 97I1TF7ewJlzFqQeYoNxUOqA6/YAeFk4z4tzNDPG5CrnLWMm3qA9K6Ty71+NntHnTG4e
 I3iA01pFRwWRsTKKIHMeuBu0T7k7xXdZUeBrxCYU+DEmUPsSzppfr1lVMjSkHGWBIJE6
 lnn2vIvuYFLMwuj3zOev+ky8s7806yXxet7o/GHqNgM3OxKNGNHvuVwMaKEbJrrHMxYI
 A77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=quiY50YXVS+133Jq7H4cy4RVjGdlaxQTTPKj8A1nTZ0=;
 b=ajQyp+BLTt+t6d+4lbMoLAPbl65+9AbR4XdDoTiTb+yk72Kg/4+bbAp1WST8KO+3QE
 GuIj2FCfi2ZwlJoyCBY4zM4NK3RilwR+17vqZtnD/8AFfDGHMNjXOHFfr2FUMJOX5yK4
 e2Fc8eOHjGAP8rkvNxB0N3cpJKsXm57qqgyIUhsSLRYAzH3llv+1gB2dQXbgUwAobLbI
 znNEMEINljkHiICtBLy1GJnK5+seH2FfqKrXreu83o+0IDWh8Pj5GE9E1SqrirzD4dIP
 EQkAjKR+giQgHDzAFs0bUk3Dng4YlGHLb3yXeCe4sGvz1yK19cEQWbDwZWZj29MxCgYF
 2uFw==
X-Gm-Message-State: AOAM531Zux1r8GyASEuoH/wCdm41m+cuptuYO6sO/7ZmzTKo/Ybxsh6F
 5mjiPAf3cUQ9y+W6HlMzItwRnA==
X-Google-Smtp-Source: ABdhPJztaRH18tE6dUNX7OrQdHsImpXC/WXMiP58Cty7S9uhcTwKZMvgOueetzxhAMH5q6be4ugVIQ==
X-Received: by 2002:a05:6a00:2310:b0:505:a8ac:40e7 with SMTP id
 h16-20020a056a00231000b00505a8ac40e7mr62780452pfh.11.1654013083839; 
 Tue, 31 May 2022 09:04:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 a31-20020a631a1f000000b003db072fd9adsm10690789pga.74.2022.05.31.09.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 09:04:43 -0700 (PDT)
Message-ID: <28df077d-ba3d-6f37-04c8-e03e2e61fac8@linaro.org>
Date: Tue, 31 May 2022 09:04:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Implement FEAT_DoubleFault
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220531151431.949322-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220531151431.949322-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/22 08:14, Peter Maydell wrote:
> The FEAT_DoubleFault extension adds the following:
> 
>   * All external aborts on instruction fetches and translation table
>     walks for instruction fetches must be synchronous.  For QEMU this
>     is already true.
> 
>   * SCR_EL3 has a new bit NMEA which disables the masking of SError
>     interrupts by PSTATE.A when the SError interrupt is taken to EL3.
>     For QEMU we only need to make the bit writable, because we have no
>     sources of SError interrupts.
> 
>   * SCR_EL3 has a new bit EASE which causes synchronous external
>     aborts taken to EL3 to be taken at the same entry point as SError.
>     (Note that this does not mean that they are SErrors for purposes
>     of PSTATE.A masking or that the syndrome register reports them as
>     SErrors: it just means that the vector offset is different.)
> 
>   * The existing SCTLR_EL3.IESB has an effective value of 1 when
>     SCR_EL3.NMEA is 1.  For QEMU this is a no-op because we don't need
>     different behaviour based on IESB (we don't need to do anything to
>     ensure that error exceptions are synchronized).
> 
> So for QEMU the things we need to change are:
>   * Make SCR_EL3.{NMEA,EASE} writable
>   * When taking a synchronous external abort at EL3, adjust the
>     vector entry point if SCR_EL3.EASE is set
>   * Advertise the feature in the ID registers
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Based-on:<20220531114258.855804-1-peter.maydell@linaro.org>
> ("target/arm: Declare support for FEAT_RASv1p1")
> 
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu.h              |  5 +++++
>   target/arm/cpu64.c            |  4 ++--
>   target/arm/helper.c           | 36 +++++++++++++++++++++++++++++++++++
>   4 files changed, 44 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

