Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09264400401
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:19:35 +0200 (CEST)
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCqk-0003Iw-4H
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMCcZ-0005R6-Fb
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:04:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMCcQ-0007qW-97
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:04:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id v10so9125763wrd.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aCvVztgefZqw2zoWblNqQjaMz2QZeaFdKupDkAe/l6U=;
 b=sqXcm8R36EJGl4fhTxzVWZhD4rmPCoPVAh/bkgcgXNZKcRnYq3RQYfGZzIqOQLpw+O
 gGJ+MiT4/z/iDrU5NnVAWjj/6V2egyF42O72gKjHE4aAmNohozTogltlVG7VknCFKgq/
 CimcyLmyfOy7r+rxLOZJY1HwKtZCDUOlRfw5mK5j5T7XzW+ogJTiz8A/iDHuTU6CUTx9
 7XiWRuMXsCz+owAb6wocRfWqWl5kC98hwQ41wv96OwjTnrZk2K5z/XXWe6i7HgfkITJa
 tWcCxn5zuPiJg+OU4fulG6seQC84niT8CA73dZ3/jp7ZAZjxvjbLcNxVVNLQynNYOwiH
 Wh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aCvVztgefZqw2zoWblNqQjaMz2QZeaFdKupDkAe/l6U=;
 b=KeR1T2lkxN6bN+SbGZp/ehuaQ86wwkNyAXw6hZ90ZzHRmCXhtv0i6UON6Ea/WfKtgX
 aWKaN/H2fW3wisJAIYb9JJfGSC2pAapYkojZ/PnO8Op8MS9/SpOGK0pD7flxnleV3TpG
 ApuiaEogShykPwESGEGpousMe/Ynbu9+/tj/mK/UlRBlImnZIjnTB5Z3PZJNadOPRTFH
 ty2Z+y39pHp8WymS2PM05grLWlMTJZKl2uUhl4/F96NNapMHKJYGXtw0f9obHCduE0sy
 cpRJAzHmMSue2b1k9+OUqOSfygdFwhDebyvn6wlAMlf5oI2mVdXi6hz6Sv4PgcBiE2BZ
 q5XQ==
X-Gm-Message-State: AOAM532zZIfkTugwJHynSXmP9z53yMxqYQDMVK36uDyHXmSNhtkTUwHy
 6YFJkBS52WFv39pRl+khLF3UiA==
X-Google-Smtp-Source: ABdhPJw0sBqyp1rARfaiUghxahAYyb4EobYjz9osAR1XerC1XImjOwt5A5++LDRa9MNB6dhDuDTY5w==
X-Received: by 2002:adf:c402:: with SMTP id v2mr85774wrf.130.1630688684449;
 Fri, 03 Sep 2021 10:04:44 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l10sm5728859wrg.50.2021.09.03.10.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 10:04:44 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1630624983.git.alistair.francis@wdc.com>
 <289f8d59cf883fec5764cb0cea8da4430b6fd6da.1630624983.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <071cf027-72f9-756f-36af-758f35bb4123@linaro.org>
Date: Fri, 3 Sep 2021 19:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <289f8d59cf883fec5764cb0cea8da4430b6fd6da.1630624983.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:23 AM, Alistair Francis wrote:
> +    target_ulong bins;

Surely uint32_t, at least until 64-bit insn width is required.


> +    TCGv tmp = temp_new(ctx);
> +
> +    tcg_gen_movi_tl(tmp, ctx->opcode);
> +    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, bins));

   tcg_gen_st_i32(tcg_constant_i32(ctx->opcode),
                  cpu_env, offsetof(CPURISCVState, bins));


r~

