Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B706FDAFE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:46:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgNe-00021o-1h; Wed, 10 May 2023 05:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgNb-0001x6-9J
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:45:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgNX-0006vQ-I2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:45:02 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so6586311f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683711886; x=1686303886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQsUZSJXfmCoG+pVBkhp7vx6SfgiTqxsU/hLRYAZLJ8=;
 b=kFaWJbXnCg937UQKs8jmqa3SuZVjCEg/HckWZS/iDaSjJjI69VsskPVIedDAob3rjP
 93HU/5WOOtKey1CV1iiiRwOCDAfzLjhBxqPAsCz9DcTz2ZPV39JNGun+xyqXoI7x9inW
 VVRSUavXvoUlPImw9PNetnI4ri45HSZHaUmsPPE2L6P0TqlAJyDt0C0+cueCM5zDXnf9
 WSuAW++ksmZI2qIqV/vONV6nSifMj60866r//t7RnT1Kk9aqS0+ciJl1w97X8Pz0Fgd5
 tqmoP9Vwm/MZBf53REuWdXsJcpYom2GvqECdzuvkEqOuES14AdvVyiiMVlSliHUymChy
 XUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683711886; x=1686303886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQsUZSJXfmCoG+pVBkhp7vx6SfgiTqxsU/hLRYAZLJ8=;
 b=NV0MX9y5smZc4k5h+2vdtUloCfc+qChRTmPHwYNfOMB8llFQE2zpXEAVCYpVF503vk
 Zy6rKOXp0kLqT+8zdFTLCbKnYefrLyc2aUr5Ze8H4Q+4t6L7dCVjOju4egGQuSN7TQob
 PxirGKyALrTq/g244TW6VDmKiqaa+OZvBMLSerukzzWFWY7UPxEh7c3y2WnZ2c6HY95r
 0ODdz1jzF3aUvacNABl//h3rkKsZA83QI1jSurMYpXiCySZZmum6SkxIEDc9zgN0o4Nj
 K+LTJ7DWmGqOJ6vQFGWhdshg2XmzRxkTXgHSfDD6r6M/YaPHOKEpiVHImR39urFekJUN
 W5IQ==
X-Gm-Message-State: AC+VfDxVxpqrsXL+aZ4ufIHnw+usjv5nYuuudLgdwzq2iSi6pKkSEFZ7
 OqF7NFbfi4i38SQ05HKi0HVb5t97gTf90/ai+/2eXg==
X-Google-Smtp-Source: ACHHUZ51In5YYxKPfAOUHXh9hroMsfc3C2/bMqmWpx6lmXZRAM+4hBoNa/tCakLXhioDpOq6vG6jNw==
X-Received: by 2002:adf:e587:0:b0:306:2bb6:c7c3 with SMTP id
 l7-20020adfe587000000b003062bb6c7c3mr12001016wrm.6.1683711886368; 
 Wed, 10 May 2023 02:44:46 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b003079d61a107sm6741218wrs.25.2023.05.10.02.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:44:46 -0700 (PDT)
Message-ID: <62b2216f-0529-5f7e-b5af-9a6095365d00@linaro.org>
Date: Wed, 10 May 2023 10:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/12] accel: Replace target_ulong in tlb_*()
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-2-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-2-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 15:13, Anton Johansson wrote:
> Replaces target_ulong with vaddr for guest virtual addresses in tlb_*()
> functions and auxilliary structs.
> 
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/stubs/tcg-stub.c       |   2 +-
>   accel/tcg/cputlb.c           | 177 +++++++++++++++++------------------
>   accel/tcg/tb-maint.c         |   2 +-
>   include/exec/cpu-defs.h      |   4 +-
>   include/exec/exec-all.h      |  79 ++++++++--------
>   include/qemu/plugin-memory.h |   2 +-
>   6 files changed, 131 insertions(+), 135 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

