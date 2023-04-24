Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF86ED1EB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:03:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqydK-0004TP-Q4; Mon, 24 Apr 2023 12:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqycy-0004Io-4t
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:01:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqycv-0007U8-Lk
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:01:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so30773985e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682352075; x=1684944075;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=REHjfEwr6mzOv2iFa4XI9wUNliTobtQrCHVGQt9oxnU=;
 b=VOxFn92/iwMhb9Gz4K83iLenPAHVUkrgFZoRJC26LIX3IFk9HrLSFKP6IewfURbBUr
 nTFvc24JR8MH/6yuzJ9ZpH1OnlHBl5Ml3HJJ9C7dmRhlMJYlzlouBpmzgLG8CKUAlVSr
 +qoTGk6AnLY8/SpEEZFDKL3MZ38QsPxrHN9ytHjHuOU84Z0FamdzoEI9KBgi0As2I+3e
 Wmg1QWCBXGbHP3LaVUbnuoo3Urg5is474TRJsDt9mwd4rTPsNvm6ors7/N7jCIK76P93
 UaHokRmnWikA0OLLJT3qkAlFYZIvKr8d79SKggxK1HJ+0F8SJaPxEhEkNA21wxGIbmdN
 6X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682352075; x=1684944075;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=REHjfEwr6mzOv2iFa4XI9wUNliTobtQrCHVGQt9oxnU=;
 b=iyWc+AfOwXVEH1GFkqVtZ7UAFM4pZ/xTlSYej2OBx0ewZ/PQSvu2HCdDG5g29ly8O7
 8uqLEc1psCTJ+fR5c4SU/17voDyD0SLWuAKxHbi50Uen9C0z5Izrn76AxYWbkrbUwTpu
 A0cD0opmOscEoY+/XzYpACG/tcAgFUF3LgWG4jyz1WLsA/nZKBfZMNztuHhWgcnk2nzD
 ANPTAxPjzy/bWksxck45PO/WPfSfz4xnQZQKb8vYQfoGUPROqSBix1SRUuM1DBpdgb+X
 XPxz6CGu+b+6gdAGmJeVm8hzEVETSudTFj5MoCilEbDFdYRHxA1TX8QyibLau3lX9jM+
 FDig==
X-Gm-Message-State: AAQBX9fmiiRDo5wDy1ofcsHCDb/uJeL0n3lAvOkzkRZPLDiRoLxEYThn
 73alEfbpxoWRAPh8/SCE0g8LS99R8lmp8QHBxQHLXQ==
X-Google-Smtp-Source: AKy350aQZuZQ2+BRORlBwB1bFc59o1NwxFuhmQgyAFkIp3wruSpn9TAuEmjHxMVrkycDNZVIbZTemA==
X-Received: by 2002:a1c:7707:0:b0:3f1:92e8:a6fe with SMTP id
 t7-20020a1c7707000000b003f192e8a6femr7725301wmi.31.1682352074857; 
 Mon, 24 Apr 2023 09:01:14 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm12490350wmj.35.2023.04.24.09.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:01:14 -0700 (PDT)
Message-ID: <1652f5e3-a550-5a14-9e56-89557f7d88ba@linaro.org>
Date: Mon, 24 Apr 2023 17:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 41/44] target/loongarch: Implement vld vst
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-42-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-42-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 4/20/23 09:07, Song Gao wrote:
> +#include "tcg/tcg-internal.h"

This is internal to tcg.  Do not use.

> +    tcg_gen_qemu_ld_i128(val, addr, ctx->mem_idx, MO_128);
> +    set_vreg64(TCGV128_HIGH(val), a->vd, 1);
> +    set_vreg64(TCGV128_LOW(val), a->vd, 0);

You want tcg_gen_extr_i128_i64().

> +    tcg_gen_mov_i64(TCGV128_LOW(val), al);
> +    tcg_gen_mov_i64(TCGV128_HIGH(val), ah);
> +    tcg_gen_qemu_st_i128(val, addr, ctx->mem_idx, MO_128);

tcg_gen_concat_i64_i128().

> +++ b/target/loongarch/lsx_helper.c
> @@ -12,6 +12,7 @@
>  #include "fpu/softfloat.h"
>  #include "internals.h"
>  #include "tcg/tcg.h"
> +#include "tcg/tcg-ldst.h"

Do not use.  Use "exec/cpu_ldst.h".


r~

