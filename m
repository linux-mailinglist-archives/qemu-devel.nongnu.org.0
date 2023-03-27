Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300746CADF8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 20:54:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgrxb-0000zZ-04; Mon, 27 Mar 2023 14:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrxX-0000yv-Ui
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:52:47 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrxW-0004f4-G8
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:52:47 -0400
Received: by mail-pf1-x431.google.com with SMTP id u20so6353725pfk.12
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679943165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BK+2f1N62YgTDmxPxp2nVxYVqSHz3CKGFnPzEdvd8/8=;
 b=nHVqpcrWFp9P1O3BlHQfxCyyBiULJ0es0wBchVFtMHxwbnt1E4aatTiFyaLV62qWuB
 9+7p1dis8DFfiDFhUeyg2WADPit41ee8FfqrlC57Gz8bw0W5/c3aws4Q/J5f4opGKFec
 AGd6PV5Y55fdgEGFCeEG1OUfcAdEnOV1ilMK1mMx0PudEuempnjGRfxHfd1HLmZLHFh9
 r7t9qaq4ih7wRrESy5xipnXPzWnQoSmL6+Y3YjRh8fsF5UEKsOsS7EIhBQ7BIHhtBpoY
 wMYE0vtt+v0lYXiVwaCEwlLAY60Qp5ds7Zaq0LXvj1ZhT4RPcwvWsqowxGN48QS2dGW9
 9HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679943165;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BK+2f1N62YgTDmxPxp2nVxYVqSHz3CKGFnPzEdvd8/8=;
 b=g+pqm3vPP0nNXH5yHdnF9RvtEilGFMVtNitCRdiauaNvMdU1jSr+m0dgLC3rOJcIAU
 JjLGgUMjNnN3My55GRb2GmOjWpZbTWQUtgcr4e4xfv9OpM8Cv2LAAevL2vii7x82JnR2
 Xtx2DAme6vn5Hia4qHZ/VFKdcil58p3TibkgP1l19a5/jQovrlzWxwWUWZx7bE2ujaMZ
 UtWynLu9ThatO7Qpi6PA/mX6INgrzey3X000/AJ4rrSSbnVw8jDfmMGhbFFiMDvMaZlC
 mV1BM75zhc7+Qlg3dasPnhS8TlBjW9nUPI83cS3UfremcDvcL2UnRp9RzCxQ+vLpqH4I
 5JXw==
X-Gm-Message-State: AAQBX9f/zp1M+8WcnN2mIQOXhbMJRGmLVJjPEBYyxR7VZuA6Enqbxmsk
 yLpxrYJMjNWmdHLELzCiiEm6eg==
X-Google-Smtp-Source: AKy350ZQw1FhS9JOOhRtTPqUd4g6pT7uDfwTZKP5Xd2B/NuuioxVFKC9P6n7jkopOV6JXUjAh8/c1g==
X-Received: by 2002:a62:7b53:0:b0:5ce:ef1b:a86 with SMTP id
 w80-20020a627b53000000b005ceef1b0a86mr10657394pfc.2.1679943164903; 
 Mon, 27 Mar 2023 11:52:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d6-20020aa78146000000b0062d945e416esm677900pfn.160.2023.03.27.11.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 11:52:44 -0700 (PDT)
Message-ID: <a5a3e653-c58b-8da4-106f-2913235a44ea@linaro.org>
Date: Mon, 27 Mar 2023 11:52:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
 <20230327124247.106595-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327124247.106595-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 3/27/23 05:42, Daniel Henrique Barboza wrote:
> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> +                                 void *opaque, Error **errp)
> +{
> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;

const

> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> +                                 void *opaque, Error **errp)
> +{
> +    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;

const

> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};

const



r~

