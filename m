Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57930EA9B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:03:52 +0100 (CET)
Received: from localhost ([::1]:48880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uvv-000547-9c
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UVv-0006Sp-Ld
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:36:59 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UVt-0002O1-Sy
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:36:59 -0500
Received: by mail-pf1-x435.google.com with SMTP id j12so1127024pfj.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6HirYumFWNBmao0JC7NBEaCweVd86AfU2s8IoMJ1svc=;
 b=hYOUtfLc8WUqhk59sNiIromGv2tV8i9CgPJpnskvmkQVvttiolwPd4sGcw61X1K8kX
 iRp+7NOV0TztxYFJLXYCxR4vtX0JAxspaaDnS5yI4F10HkHTrXgm9cVZlRRbgzuRfsji
 tmkcQ3bdZM02gP/Ak1B9A5vwvf/5DilZcmvw1pllCZAMrxdgppBouP+91D4wIxgv5n9X
 z1pMcGap3wyFKaFLacnAS3dFAUoW2eAWWez+YRyHOQGNz5ZowDdNDwukqh6byctrMlfX
 0ZuiI4SpJb923zxewb+337MvTcdivMHO6CEMIp3UBkaDPOqzFpHOaus0SFt1RHCsCat9
 eDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6HirYumFWNBmao0JC7NBEaCweVd86AfU2s8IoMJ1svc=;
 b=nt+EsmPnGGaDidF3elfg0KlrixpE2iwjBL5AFNm6NUiQMedgQYvxOcIuTbAQMDe/+b
 ixohV5UfXxOJidVpVr7cJ1Yfgrqn7eTg9R7wjPjju4L78ol5DLBEvLs2Gdm6x4dh+2VW
 Uv5NE0+D35Ov0P9a+rIPaNeNedk1QLAAwN9aq/sC84LRS8c7EtCWC0vv0Vk27B445im3
 y9IbV/2AxWErisLwgbalPTYbmk35P50cRQztsrl9I1Z1gfpfkAV1K9+/Px/T93Vj0Xkk
 tl1GtII5WXjV/vi0j1du01kXYp0GrI99X5JU/PRDe9P7JVRcDegv61RFNh5/yaMGIo+S
 ZSRg==
X-Gm-Message-State: AOAM533qyvSeL7xJXkh7EpbV5T0NrmQw2V7fQFED6VYeXC2DZkZxtT3u
 xs8AdAfuBoLPFMfF8JgRt/kNRw==
X-Google-Smtp-Source: ABdhPJwdiOrm0M0BH/RMjTlAyg6HU/5n1vOyiFULtUMW2sQqulsOluzKtJmeqJISVtfLrxk/F7owHQ==
X-Received: by 2002:a62:e906:0:b029:1d0:f7ca:f00e with SMTP id
 j6-20020a62e9060000b02901d0f7caf00emr5770640pfh.81.1612406216308; 
 Wed, 03 Feb 2021 18:36:56 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id f76sm3224019pfa.150.2021.02.03.18.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:36:55 -0800 (PST)
Subject: Re: [PATCH 07/13] target/mips: Let page_table_walk_refill() take
 MMUAccessType argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d8d11d4-fa46-4c2a-3844-531ebeacfe22@linaro.org>
Date: Wed, 3 Feb 2021 16:36:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 4:41 AM, Philippe Mathieu-Daudé wrote:
> -static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
> -        int mmu_idx)
> +static bool page_table_walk_refill(CPUMIPSState *env, vaddr address,
> +                                   MMUAccessType access_type, int mmu_idx)

The parameter name has changed without any other change to the function.  If
this compiles, it surely means that the parameter is unused.


r~

