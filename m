Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0626C82DF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfksb-0004mZ-NS; Fri, 24 Mar 2023 13:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfksS-0004lq-P6
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:06:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfksP-0000KM-R3
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:06:55 -0400
Received: by mail-pl1-x636.google.com with SMTP id o2so2407473plg.4
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYsIFBeT4I7u+yupjgy/Y3QMbRFC1ZjEvHw4NJs2x3Q=;
 b=PbpKvD+qq8naJPFR+Ng4KrxT9fWnUdMav5W75KHKmQKo11NFtbuhbrzWF2BayETZwN
 nAB/2BXxmZCdilylW9T6yGjYaVl/DSuEMVNTM962tGZ/xJDIc7y47cJ0fl86AGPRnMaT
 BKwT5SSPku2poJetQf5UtIaMmhq5FafZqs6Dhzg+la2Zef7AjJsvwkHogqkf54+IBi0y
 Ch+bO3P5/YOxpuMT8zvc6PCMGYiSMLlgUMMUQh/YOgyGDgF3gXWg+vrDnSAKPMGqQYi2
 FXbvkKLamJmNQncwOxd3G5M6uvHcPyEHGiRWoQFcA2iRu3TEYGneMwv2JwAr+ehiwcm7
 e/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYsIFBeT4I7u+yupjgy/Y3QMbRFC1ZjEvHw4NJs2x3Q=;
 b=6H8+wixTrNTer1Q0KyOkQrk7twGh/T6tUDAmhWo4P5r9toS/z278mp9lnbn0pLxtdg
 8XiOnN4wwOM9D+cd3tdqO34Tm0hdJcmlGCX5hTXg+JMe4+gaaELGUH63PJOkQkeul4XI
 YuDCkEJT2kdvvMtpfCwTb6ThhRXBJZHrKvstBLJxFwRzTYAS3anxtmXiNd7gyysWHS8m
 VIixGOGhcyv8qZDM2havdO8np1mtCN/Xt9NfxMhqRuOjqvlzCUIMDhpU6oizZUeGLlgY
 ACD72T5MsieJ95w8L8C2amH8jtJII5DfIwAr4JoLQgsCMdZWSqK4UHnXzZZaZxLaqSIP
 +YMQ==
X-Gm-Message-State: AAQBX9c06sqOMuOs/ftwH/u3ceFkAnpNgrfemVO0Msfm/o45oeA7PqU7
 MZuunHcTnO7oeAyIq9/QLaYPKA==
X-Google-Smtp-Source: AKy350aRcgXEesb1tDRerQgsNYSHkpYo5qWF0Sh8REhx2/K+jXewpEakujBt0UbTL0CVSC4dDzhklA==
X-Received: by 2002:a05:6a20:7f5d:b0:de:b790:d249 with SMTP id
 e29-20020a056a207f5d00b000deb790d249mr905899pzk.31.1679677612445; 
 Fri, 24 Mar 2023 10:06:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 i10-20020aa78d8a000000b006281bc04392sm6499286pfr.191.2023.03.24.10.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:06:52 -0700 (PDT)
Message-ID: <dfa7ac65-f947-d69e-8196-f5a66af8c7f4@linaro.org>
Date: Fri, 24 Mar 2023 10:06:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] target/riscv: Add a general status enum for
 extensions
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324143031.1093-1-zhiwei_liu@linux.alibaba.com>
 <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/24/23 07:30, LIU Zhiwei wrote:
> The pointer masking is the only extension that directly use status.
> The vector or float extension uses the status in an indirect way.
> 
> Replace the pointer masking extension special status fields with
> the general status.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
> v1->v2:
> Move EXT_STATUS_MASK from enum to macro
> ---
>   target/riscv/cpu.c      |  2 +-
>   target/riscv/cpu.h      |  8 ++++++++
>   target/riscv/cpu_bits.h | 12 ++++--------
>   target/riscv/csr.c      | 14 +++++++-------
>   4 files changed, 20 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

