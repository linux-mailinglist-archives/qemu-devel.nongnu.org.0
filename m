Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C86033A09A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:49:02 +0100 (CET)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAFw-0005W9-SZ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAEb-0004bH-KQ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:47:37 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAEZ-0006Ma-Sh
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:47:37 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id t5so5945051qvs.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YcP03JwLIdhHiKjIb43zm3DEPRgyzD7Lvg4QH35omPQ=;
 b=pVsDgw2qAi9Z2FG6qMDw709m7udcdTvPawZkOrT8okLt088FRzHSo+97mD45mmzS2h
 HF5TH+0UEDFw+x7IShH/JGS9nsPi1Lh9vSzTrHHbJTqzQJgmJQ3ryV2iLQ8CWGiIhZal
 POZdYetN07lndCp3l91OzefQC5eNP1xVBxK48XydPl2bRpJf2IX1WTWHmhcupa+endWn
 A/bVVBJghM6XOizQYgHcsAuqCTRFgyodyURs2YjNHl4lCrqFalApTnybLXCuO0GCr3bt
 mTpPVpTfo3QuSu/iRxPxSZ1BX/riHnfeVAMuUsMX/W0U/8NKahLt9FC0GsYP9UwCTtaL
 Uamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YcP03JwLIdhHiKjIb43zm3DEPRgyzD7Lvg4QH35omPQ=;
 b=Cbkx4KR9BldLZ2ce336NT2L9KZd2Xp+c3R/OxeC6ARpvDhrxL5cdCKnevTBU8D1d7+
 z+QX42/aAM/ryFGSrRUBMJ7qwrhwQEPAoFXrmwrMSHoOe+DDwGULzwnmvohccXx33mgS
 dI80vwhIpYs6uxcleZzJKkiKD66IGv8WFCp0Dxk7nT1BlOXtGX5rcL5bI/yfX56kX7OB
 mqeXGaywKK8neBLYW2d4npcqFu0Cgk71hsZf+fIafS5iqSC5s0mCCCG64JI4R4Ke73VW
 wLMdjRu/4Whz1+WTtTH3wq+LVDFJrv1M0UbO2ifzYEO+b2r6Niaiz85vY72HAlnjwsVL
 uT2w==
X-Gm-Message-State: AOAM530Cl+mFAYrLELtC3eWE27KqToEPMFT3Zeh+rRfNIF8gOBODuw9P
 yWTd1OBisVSgIoKpsXWKJkwM7g==
X-Google-Smtp-Source: ABdhPJw6yX/C2Q+TJrCS6j6rWaZpj50VEaSPEx1EmZIxwpnX8QFFPFqRMtOw2gAALidGHDSTIShIQA==
X-Received: by 2002:ad4:58cf:: with SMTP id dh15mr3781399qvb.26.1615664854897; 
 Sat, 13 Mar 2021 11:47:34 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u63sm3789606qtd.40.2021.03.13.11.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:47:34 -0800 (PST)
Subject: Re: [PATCH 12/26] tcg: Create tcg_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-13-richard.henderson@linaro.org>
 <8a27a7b2-cc9a-3cf6-e89d-6688d9d41c0c@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c48789c9-2fca-ee04-1ca8-b2947169c34c@linaro.org>
Date: Sat, 13 Mar 2021 13:28:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8a27a7b2-cc9a-3cf6-e89d-6688d9d41c0c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 1:27 PM, Philippe Mathieu-Daudé wrote:
> On 3/11/21 1:21 AM, Richard Henderson wrote:
>> Perform both tcg_context_init and tcg_region_init.
>> Do not leave this split to the caller.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/tcg/tcg.h         | 3 +--
>>   tcg/internal.h            | 1 +
>>   accel/tcg/translate-all.c | 3 +--
>>   tcg/tcg.c                 | 9 ++++++++-
>>   4 files changed, 11 insertions(+), 5 deletions(-)
> 
> What about uninlining in_code_gen_buffer() and restricting
> tcg_init_ctx to tcg/tcg.c?
> 

I have already uninlined in_code_gen_buffer for v2.

I hadn't gotten around to making tcg_init_ctx static yet.  But it was in the 
back of my mind to do so.


r~

