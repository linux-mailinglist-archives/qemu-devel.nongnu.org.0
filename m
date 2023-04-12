Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0476DF1D9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:22:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXbb-0005vF-7W; Wed, 12 Apr 2023 06:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXbV-0005tP-7p
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:21:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXbT-0001fo-NV
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:21:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id s12so1870258wrb.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294886; x=1683886886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kbvz25g1gd95mfNr1Luvyo3c+omVh7uTvD4cLsXR77g=;
 b=cOQhZ62JYuVnVBcBF63FOzNvfwfYCrSFXc7MlSbdgkhiHvGR8AVYSZrHbnvtlQwDDD
 qvEJbHCvXHEHkqcl6ha7qnRHNse78PujMAWp+2biBAFzCXTOCSTkrf9tqdc6oSAZu/mc
 JNph3EKsnMWOnRV9lN5Ia+4mI5XRhd0cGo3quUFG2593Uf8D0tTRTn3+E4IbzW9Ls1sr
 HobTf5BDJhJEbZ2gJKUdYJcUR8ssupOZgbq1PsjAUUenOxQ0AW/wY1AU21eCURGo6mIg
 KlO0BpQ6W60gxz2bZ7dm5zf5+f2wKhgGjrYRXQr3gr1X+8dJ9vd6xTgUr8pf124szKsg
 W5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294886; x=1683886886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kbvz25g1gd95mfNr1Luvyo3c+omVh7uTvD4cLsXR77g=;
 b=Rh/woEoHTwKg5b0R9IxMzAfvXyOXe/VBDLBBvWKOzpESxaz8afAcpjg25Vv0M0a6Ei
 Oviqc4p1SRxUslLxdSoHSSfX3JY+U+lZoA6rF/LQ4nUdCZCy5wL1FTzXBBKY0nNeJtvU
 Psu60Vm2jZlGGrpZF0YxKyFm3un5soTmDRSqnrLmDkpNHUP7ZaXlOu5WY0r26TwKRUnB
 jCgq3N1P8s/6flxZfXaPsZCgJOBkij3LMcvN6mxhacNjBRQ0GP+xcJKX6ufQOdESNB4c
 4B0oCwFvSCdqhM3Qajk13Kpa1gJ3WmuDVa9XwCZcbosSljvQhT428rlioTYLOpnPDybO
 obsA==
X-Gm-Message-State: AAQBX9d5X1EjefRqpZtj7M8UtbgRbXYzLaQzzZDOIixNQIMSqEggg6ip
 hDtLY6dapnEEEh5F0Vvc9rdFnQ==
X-Google-Smtp-Source: AKy350aFmDdRlNLfeQspb3wfY3vh021p8FlSeVnBQgTnLZfjsW5Wt9KVNIei3852Ma0GcztLgMc0UQ==
X-Received: by 2002:a05:6000:1045:b0:2f4:2f98:bf2d with SMTP id
 c5-20020a056000104500b002f42f98bf2dmr1676656wrx.37.1681294885981; 
 Wed, 12 Apr 2023 03:21:25 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfe0c8000000b002cff0e213ddsm16886557wri.14.2023.04.12.03.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:21:25 -0700 (PDT)
Message-ID: <e2ef863a-b9d6-49c7-3691-2ce8768b0b4a@linaro.org>
Date: Wed, 12 Apr 2023 12:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/5] target/riscv: Add support for Zvfbfmin extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
 <20230412023320.50706-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412023320.50706-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/12/23 04:33, Weiwei Li wrote:
> Add trans_* and helper function for Zvfbfmin instructions.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/helper.h                      |  3 +
>   target/riscv/insn32.decode                 |  4 ++
>   target/riscv/insn_trans/trans_rvbf16.c.inc | 64 ++++++++++++++++++++++
>   target/riscv/vector_helper.c               |  6 ++
>   4 files changed, 77 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

