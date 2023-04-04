Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B46D55CD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:20:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVK1-0000xB-J7; Mon, 03 Apr 2023 21:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjVJy-0000x0-7u
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:18:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjVJ9-0003WI-W4
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:18:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id le6so29806236plb.12
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 18:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680571078;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IpcS5DnfaqxCSsf0/qW43qfqm1MTwMbXslKnjRGQCjY=;
 b=DngOt41FhKvnjql5Zw2jPyxc8gaYaNVUcY5jPDw4O9D/3AFibMiPrnTxk99a45jSqb
 lHJuE85I2jW0vD7dVQvhTSjXJ13l4mJzegQEXx9HLXamW9SNNOkDCUOfhHqTbwT4zlW9
 e1uWMZu2yCYUFs9pTWG5F8saAw67JK9KHlmL3XzidXmQTEtXDvpiLy5mDZCkpGb6BLsr
 ef3U8K08um6ZcEWl3CM70bIRNvStM2weiIDqWL3yN5vdGis2YPEt4Tqpipz37Mgxpjt2
 wAXGgWt9b9ERwSv+Fad74r9JNKe/kUAiUjkOVnJm99yCIFqGOTolq5m4kVKEJpKXFAR5
 ovdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571078;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IpcS5DnfaqxCSsf0/qW43qfqm1MTwMbXslKnjRGQCjY=;
 b=MAGF1bRoWN7Ce7x0aXrf6gT6ZqwN+J5BQU2HJh1YRszCETtZSxXvaGZ6js4JIX0ViB
 1wrw01SCOV/0B7nTWT2BlMMMJTbhiIsLkIaUM3EIpaYrvs5HjCVQzVINNCplroI3OHLZ
 8EKJpzqM8Q1hNwXuMjgthaxIJwnrkCqn+qfgkHwS02tfoaaQUPYL20bSAIdR0YMARdmj
 xbdFi/c6f/Wq/fOjTSwLgKeVZSXaMrjAfpyTcIKcSpW9j9F+CamN1AEoIwnlT2DJAyXq
 7Mb0JqJMxJq9fo42F9K32KU7/asa6ByKsvshD0QOAkOOebXlNHqc8bkKEZNsXmkRHji9
 P1Lg==
X-Gm-Message-State: AAQBX9eD8rv9z2uXNUGirlEl12yp9vKN066EffqvwhKiR3Pdcr8HeKck
 oiVsMsEQIQ6F2WmGSHD1iXZkNw==
X-Google-Smtp-Source: AKy350ab2T29wbZKFPekJxu1f0j+rLHESi9YaPQ3P2qwNU8T64MlNtsnOW74qangRJ86/oroUg6NLQ==
X-Received: by 2002:a17:90a:347:b0:23a:66:1d3a with SMTP id
 7-20020a17090a034700b0023a00661d3amr783238pjf.45.1680571078250; 
 Mon, 03 Apr 2023 18:17:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a634f43000000b0050f85ef50d1sm6565760pgl.26.2023.04.03.18.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 18:17:57 -0700 (PDT)
Message-ID: <0b5c1876-d76f-15e3-82fd-347d26aafdaf@linaro.org>
Date: Mon, 3 Apr 2023 18:17:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 40/44] target/loongarch: Implement vreplve vpack
 vpick
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-41-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-41-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 3/27/23 20:06, Song Gao wrote:
> +static bool trans_vbsll_v(DisasContext *ctx, arg_vv_i *a)
> +{
> +    int ofs;
> +    TCGv_i64 desthigh, destlow, high, low, t;
> +
> +    CHECK_SXE;
> +
> +    desthigh = tcg_temp_new_i64();
> +    destlow = tcg_temp_new_i64();
> +    high = tcg_temp_new_i64();
> +    low = tcg_temp_new_i64();
> +    t = tcg_constant_i64(0);
> +
> +    tcg_gen_ld_i64(high, cpu_env,
> +                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(1)));
> +    tcg_gen_ld_i64(low, cpu_env,
> +                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(0)));
> +
> +    ofs = ((a->imm) & 0xf) * 8;
> +    if (ofs < 64) {
> +        tcg_gen_extract2_i64(desthigh, low, high, 64 -ofs);

high is only used here, therefore the load should be delayed.

> +        tcg_gen_shli_i64(destlow, low, ofs);
> +    } else {
> +        tcg_gen_shli_i64(desthigh, low, ofs -64);
> +        tcg_gen_mov_i64(destlow, t);

Delay the allocation of destlow into the < 64 block,
then simply assign destlow = tcg_constant_i64(0) here.

Watch the spacing: "ofs - 64".

Similarly for trans_vbsrl_v.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

