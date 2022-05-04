Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08E51A5E1
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:46:48 +0200 (CEST)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmI9G-0004Up-Vi
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI68-0001th-PC
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:32 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmI66-00083W-Ea
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:43:32 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 q73-20020a4a334c000000b0035eb110dd0dso280321ooq.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ccr5WDBDbwlEHtwDonHZ6L98h7p6Pd5pKrEmGwHh29g=;
 b=uhKgfYjUBUFIqtrY3L5oLIstdbrPtYhdOJGJ2pw/Wa5p1BIpca13ypTmWSfGoMVQDv
 XjEFqnQHQbbsy1tFSMg4oL8nHbAEeHy7dY/Dg4Wyy3Tx9UcBLsyVgn3qvT/Y/vob4Hfj
 eePQ+f2zvEE1222N3qBRMTDxjEEReKpjp/WTOm7MpScyXIEVfZaMdzqUt+GEUPMEj3QQ
 qAtC8we66bu2UjE2LOnw+K+anubc28hhfXIUDUOMcizU7gXwtfFT6Ldp1ovMwox9iz3O
 NdwIYIAkIxlVPNaKL9VsDf1UazguVAW88LVysWEXAim41kAq/wa/p+on68fhfI7kbAK9
 GNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ccr5WDBDbwlEHtwDonHZ6L98h7p6Pd5pKrEmGwHh29g=;
 b=wVGyUQy9g0s3hC6OuhBFn/JE9sn8Typ8SCAtsEZXpofbPGnwX6OGJfh1H3ZwvYe1hK
 tg8immyLqkctl8+WWjjab3NJcxr5ttvNtRpKVyb3NAHzEiWFWgRqcWMBVVyBL6lJeMWb
 tv8mNlog/8/nkyZHyIWoWa+Q0cyCT06XjaTRL/31VQkMHnYGzNSt3VVo7gbjrC8cG/+G
 3XCs6k4aXwD68gH8hDIG5T/do7g9g6TYsaW5DVYx8r1K0AtYBYNUBI+4BZLt2aHPEbF+
 yQsYg2rohbxiAs0LEwdCwYcC2gb4Osv3qLchH8Y5XVjgSIDHzDpdFshp11tmfll59O+E
 cP2A==
X-Gm-Message-State: AOAM530jlF4E1Q35rgkn7KUEYzc9qQyLrTEso1sjtZ4sqhoJW/Q0ObYO
 yT6RlTGUGS3GTp/S6yzzL8Z78w==
X-Google-Smtp-Source: ABdhPJy9hFzgZ92B1mZsWEiG1HwH3ZjZYSPJWeBKIpgeN0wYFlocF7x9VgUU2EPyeeSvOmj2ZE67YQ==
X-Received: by 2002:a4a:9584:0:b0:33a:31df:6b6 with SMTP id
 o4-20020a4a9584000000b0033a31df06b6mr7535684ooi.73.1651682609349; 
 Wed, 04 May 2022 09:43:29 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a056870d58300b000e686d1389csm8841727oao.54.2022.05.04.09.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:43:28 -0700 (PDT)
Message-ID: <fda18484-f36c-0646-2df1-0831e9a60dec@linaro.org>
Date: Wed, 4 May 2022 10:36:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: read access to performance counters from EL0
Content-Language: en-US
To: Alex Zuepke <alex.zuepke@tum.de>
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220428132717.84190-1-alex.zuepke@tum.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220428132717.84190-1-alex.zuepke@tum.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 06:27, Alex Zuepke wrote:
> The ARMv8 manual defines that PMUSERENR_EL0.ER enables read-access
> to both PMXEVCNTR_EL0 and PMEVCNTR<n>_EL0 registers, however,
> we only use it for PMXEVCNTR_EL0. Extend to PMEVCNTR<n>_EL0 as well.
> 
> Signed-off-by: Alex Zuepke<alex.zuepke@tum.de>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

