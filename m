Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343FF6E5F44
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:03:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poj6u-0001Jg-M5; Tue, 18 Apr 2023 07:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj6s-0001Iy-1X
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:02:54 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj6q-0002lv-8n
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:02:53 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4ec9c7c6986so2054283e87.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681815770; x=1684407770;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=itWOGl3UDainPTya3AFf8fKWrFJ6z1sGuieA2UOwuOQ=;
 b=fNZMKaJWF8jEm2AgLCAfZSwKtv7yl1hb07GLIK2UqrPYJQ51vFX7DVI+UpzKak4jhR
 z9x+9Up0fyFcBjfgMAQoX7jRLVDveQUxB3pEZGQ/dervp+6DWPdXhIuwf5x6t/pZBR5V
 7vYH18ez2kT1i+RyQO98gQjl6so0R7k8qSNGqshq36BHBtLvVkrRcMcYw1cjGwomVFlO
 tJRPKv0oGGiGeHZZboO7JkvKdhHwWI6wnQADb1DvJTuT8K60rGn874yrqYm/W1IWKkxB
 JS9X7R4mTWTN4MuTJYGEiAtC0kzWSFGW402xK1Va4QKsolMfI1y5KU5FtBzsYvWjF2pu
 3UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815770; x=1684407770;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itWOGl3UDainPTya3AFf8fKWrFJ6z1sGuieA2UOwuOQ=;
 b=Fzlreldhrx8sjK3qWybJ0aV7Pj7eI3eMoO6GdAdwAeJnQxqIXkpzpCyn1ff0R9ksw1
 mK98lsUVmopEFvANnqojwEuq6LTlByD7/e0JvHP9Wbt+v7rwJzb54FDZ2C9SOJ3Z2Wl3
 IW4nGTGXAELq1ywV7h/OkxL/tDgbQQ2Gsm6ijkB6/cNU8X4AkKfHUBWdQ5HvX7TPeEC7
 rOlVYBUmh2T3cDfTavnHBGDT5IlDB2S2juw6TJb8PTiSWhLbnIDl1ah72iv3UPyUsde1
 bKKTXyVTqPfF/r/0s/b3RDSX6BWiR3JIBObgGIipzMHl8NgwZ2RCNYm/1Ix4j4JWa2r1
 YjPw==
X-Gm-Message-State: AAQBX9fVZS5JgzuWbEp42IxNWwxzlEIZI3LbubdtU2BAdiUN1McPqOEU
 mUpHyZ1rwoU8t2PCZejpwBcfGw==
X-Google-Smtp-Source: AKy350aDH5m9VORJrNKJB1e5fRNKES4YZZcdnyNUqqyNYNbty8Cul8lqedZu0l9ebK49xvwDWXccWA==
X-Received: by 2002:a05:6512:94c:b0:4e9:74a8:134c with SMTP id
 u12-20020a056512094c00b004e974a8134cmr2919371lft.43.1681815770401; 
 Tue, 18 Apr 2023 04:02:50 -0700 (PDT)
Received: from [192.168.58.227] ([91.209.212.60])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056512218200b004e7ff3682ecsm2351831lft.181.2023.04.18.04.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 04:02:50 -0700 (PDT)
Message-ID: <5563af6b-fe5f-46c9-0b0a-ddde5b22be09@linaro.org>
Date: Tue, 18 Apr 2023 13:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] target/arm: handle ipa_secure vs s2walk_secure
 correctly
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230414160413.549801-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/14/23 18:04, Peter Maydell wrote:
> In get_phys_addr_twostage() when we set up the stage 2 translation,
> we currently incorrectly set all of in_mmu_idx, in_ptw_idx and
> in_secure based on s2walk_secure.
> 
> Here s2walk_secure is true if we should be doing this stage 2
> walk to physical memory. ipa_secure is true if the intermediate
> physical address we got from stage 1 is secure. The VSTCR_EL2.SW
> and VTCR_EL2.NSW bits allow the guest to configure secure EL2
> so that these two things are different, eg:
>   * a stage 2 walk for an NS IPA done to secure physical memory
>     (where the translation table base address and other parameters
>     for the walk come from the NS control registers VTTBR_EL2
>     and VTCR_EL2)
>   * a stage 2 walk for an S IPA done to non-secure physical memory
>     (where the parameters from the walk come from the S control
>     registers VSTTBR_EL2 and VSTCR_EL2)
> 
> To tell get_phys_addr_lpae() to do this, we need to pass in an
> in_mmu_idx based on ipa_secure, and an in_ptw_idx based on
> s2walk_secure.  The in_secure parameter follows in_mmu_idx, as usual.
> 
> Note that this change relies on fixes in the previous two commits
> ("Don't allow stage 2 page table walks to downgrade to NS" and
> "Set ptw->out_secure correctly for stage 2 translations").
> 
> Cc:qemu-stable@nongnu.org
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1600
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This change also means that v8M, which also uses
> get_phys_addr_twostage(), is no longer using a ptw->in_mmu_idx
> calculated based on s2walk_secure, which was always a little
> strange given that v8M doesn't do any kind of s2 walk, even
> though it didn't produce incorrect behaviour.
> ---
>   target/arm/ptw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

