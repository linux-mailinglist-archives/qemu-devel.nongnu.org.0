Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6116269E61A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWZR-0004DH-MD; Tue, 21 Feb 2023 12:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWZP-0004Cx-S2
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:36:51 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWZL-0002bb-0V
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:36:51 -0500
Received: by mail-pg1-x532.google.com with SMTP id p5so2703580pgh.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BXVCCvhhwyJEOyfV1KO0Sn5do9+TbmvpPP1KRck2Gu4=;
 b=NG4dw9fIAKk+GLxu+zbyJuKmPKsrp4F1/M5oKMH2f0Vh+M0Y0gdiO78lbs9UggqmLo
 EAE8xaRUeQvbHNjpQG6C0C7TBIAaII6shSj5v6OFVLS3Yje42j39KbBQM09qoph7maoq
 Plk03iNMMR2t1fY8sfUpSYXlDmBgLSD7BjS4y/wL0iRTllFzxQ71bAN9ejdxNiAf0k6u
 uXrV6SwdUjh4EOZL6MEuK2k2/Zm1kYN3bP1cdR5TYcLZ2bSxiig7qL5Oe5a9a/WM1wXb
 pLso+2MGwWfchI1RWQBMmLyXd+/yy46ETWdX3rdZfrcjkIWOhopXdaAOdIbU/3W0MpoY
 qoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXVCCvhhwyJEOyfV1KO0Sn5do9+TbmvpPP1KRck2Gu4=;
 b=66tuSsyAxhlANAq5Ww4jEfRbOSBr5MzXvH53iade/b2byWasFK1MRXhZ/Vg249FjzG
 G6iKUfwAjiarBSzgBubCwqkmdoqZwPeIOrxIcwFBD+y6wNk444Lib1aJEK3sxGf0XvQ9
 lTpy9IbY+8gPTlO3txM/1Y1vovaHh24iJIhV+XMldGNMZvGnK88lpYi/UeWtxCoyqckN
 1ePBhVm70nDqMbzTnPgLsN0YwL0ZR/O6/+jQpx9kqmwxD7YyVfl3Xt2QXFBCbgMfqC1t
 53E3AG2CjTXdxd0Ld3iYESocdw3I06IptpIa7Y0k7DsVs2g3Q0R6PWZYL12E5cbVfGH9
 1m1A==
X-Gm-Message-State: AO0yUKWzuAoEaIA24C9P4oA6V5ynPFrg2CPWPBWhUj9S/xWodKRcO4UB
 OsAEzFvfwRgjDRrCJbUbG1DmYFPirj4AImBoNoM=
X-Google-Smtp-Source: AK7set8gTgbpMj7cXzErr6GuE9uFY7BbQ489pG8QBsyVVGjUfmwhb+i2pk365tWwth+xu9iU8FlIkw==
X-Received: by 2002:a62:1686:0:b0:5b4:2:b237 with SMTP id
 128-20020a621686000000b005b40002b237mr3685060pfw.22.1677000997940; 
 Tue, 21 Feb 2023 09:36:37 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y26-20020a62b51a000000b00592417157f2sm10051151pfe.148.2023.02.21.09.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 09:36:37 -0800 (PST)
Message-ID: <d89993f7-002c-9c73-73ca-e66019cdaf86@linaro.org>
Date: Tue, 21 Feb 2023 07:36:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/riscv: Fix checking of whether instruciton at
 'pc_next' spans pages
Content-Language: en-US
To: Shaobo Song <songshaobo@eswincomputing.com>, zhengyu@eswincomputing.com
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com
References: <20230220072732.568-1-songshaobo@eswincomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220072732.568-1-songshaobo@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/19/23 21:27, Shaobo Song wrote:
> This bug has a noticeable behavior of falling back to the main loop and
> respawning a redundant translation block including a single instruction
> when the end address of the compressive instruction is exactly on a page
> boundary, and slows down running system performance.
> 
> Signed-off-by: Shaobo Song<songshaobo@eswincomputing.com>
> ---
>   target/riscv/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

