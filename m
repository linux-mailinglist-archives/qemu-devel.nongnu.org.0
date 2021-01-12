Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6E2F2351
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:25:41 +0100 (CET)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7VE-0002UO-1W
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Po-0007Iu-NB
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:20:04 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Pl-00064o-OK
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:20:04 -0500
Received: by mail-pj1-x102c.google.com with SMTP id m5so550417pjv.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DNp5GAfjGCpmYqnBW3PDn1/z8JA2tW0PufcKIWKap/c=;
 b=YuxZN00mLa7r7vPsBADODzzyQ/dkFUvezQpPQc/6IFPygR4gToDDopz64AW5twVqQh
 XfuMc8tDesUFhzX1jwexJ2PrYvAc52aR10db0WuOx+GEn2oms94XVD7e9o1ebTroIhdG
 Og4J/RMq2lRCYLfs3Kd3vY74cyAStRNaizEwEjWqsi517nR9mQAK5DME4ONOlep/vcRV
 arbKmbeITrT2eHAjCQFAUybpuHpxy5yGJPG1pIPUBLGP6S9eu1OVFrlPRYg28hEfbzSS
 Bs1B9iX/n7bVrqLDt9jRpKsrf7umc3ULFt9fKvrKWiz/2KH3wsJOVMZGfbE9enclPpXR
 Zl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DNp5GAfjGCpmYqnBW3PDn1/z8JA2tW0PufcKIWKap/c=;
 b=en519Josg1tbbbbIB/329SE1nPT/f899f7E1J7ODCxk96upuUyqA5grPch2i0YvvgE
 xM+nW9KgXIuT0daJKBnf2L6NbcX67oOH98LEadtTW1fwTzflAl044yzvWGtVPlsgGYtt
 zOdCEcqCI3jbtaxWL7d2z8PtShDw71dzr7mQFwXn4ph0Yu6mj8YjUK4CWe8r67/A4088
 OSmK7RCBdQOdcGU7piKwH9Alp7r4jTgzTbJkPz3hGIIxwYrwG8/AC1qe4sBWEZ20yj3B
 WgRlcObHbaYfSa2ftLOS6SnTtI8iGXNOL6rOsOOglDFBA43gOw69bIfjmR+eYWLNvd4r
 UiUQ==
X-Gm-Message-State: AOAM531Pr86doMSVILy70YE+d/n796A1uMmhynYTiQI8hZGVAXgCknKl
 gcUCBdY6DTznKqELrl01J9/WaLOKHD6a2Q==
X-Google-Smtp-Source: ABdhPJz4sswzpkJ+dKFF3nqnfquZYFHOCSXfvPQpCojh2mlgQwwg5mMwUaXDUDL6nPxsb2HXkq3B6Q==
X-Received: by 2002:a17:90a:d806:: with SMTP id
 a6mr1481826pjv.170.1610410799705; 
 Mon, 11 Jan 2021 16:19:59 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id j3sm602656pjs.50.2021.01.11.16.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:19:59 -0800 (PST)
Subject: Re: [PATCH 14/18] target/arm: secure stage 2 translation regime
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <785079cf-fb1f-a380-00bc-783126090a07@linaro.org>
Date: Mon, 11 Jan 2021 14:19:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-14-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> @@ -11286,8 +11299,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>  
>      ap = extract32(attrs, 4, 2);
>  
> -    if (mmu_idx == ARMMMUIdx_Stage2) {
> -        ns = true;
> +    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
> +        if (mmu_idx == ARMMMUIdx_Stage2) {
> +            ns = true;
> +        }
>          xn = extract32(attrs, 11, 2);

Does this want an unconditional

  ns = mmu_idx == ARMMMUIdx_Stage2;

When can ns be true and mmu_idx == ARMMMUIdx_Stage2_S?

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

