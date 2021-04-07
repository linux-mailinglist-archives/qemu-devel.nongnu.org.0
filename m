Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C53357844
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 01:09:14 +0200 (CEST)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUHIP-0005wv-1b
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 19:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHH5-0005RD-Tp
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:07:51 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUHH4-00067i-6h
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 19:07:51 -0400
Received: by mail-pl1-x630.google.com with SMTP id 7so39412plb.7
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=04fotQynVTU4+wBpOcUlkGPCMes/rCmQxrfwUr4kB7M=;
 b=buI/JBoZO/WLOhtMBDmvnIqMsPpEtbUePDnKgfqy6Qg0QR6OQTfG3VgftZyQ7OMMkH
 SNyDvThq1zKM5CYvZBLEJFk2z/zPtKIMCREd3rTEp1WmGsLQ3eIM6UWt7ziFz6PKLob1
 +vXbJUmt/nKVyj4ozCQzu7iq5a35N7qpj7MOnI50vJkS9yG5Gb8MsTmREJRAJ2txnCjS
 Ee1f9TpkoMgI9VGTAlyUgAI1QlUk5d3TyZoaFQJHY7kRX0GiC2aVux67thamcY5UVPni
 5wJ3LR+xQVyw2Qzj6INjNQbAzhUhLemlUfwhMJMNmm/y9ZcybYXuV6YSEGjiVh9uv3zc
 Ji4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=04fotQynVTU4+wBpOcUlkGPCMes/rCmQxrfwUr4kB7M=;
 b=LFrNG5JyD1DpWfaSFk1dmbVBiwHW1tZ8BNxlUA26agY2TtblFITBovoZjbDUjwPV+O
 Ewmt1sZmcw77XnMeKY5i48DqMhjw070QQBRbu2aeYzI27sy+qAaIjjFkrrm9bZx9xls7
 6hTQAAyiegohmJhWzXrtfXsIeiK0HY7EWFP77riwsg8GrTYraI77wO7USLv2nGott72Y
 gHhdaWzSyFPCm/6q3JTCKHSJ7jC78CYZkcLz9Yd86ZdJOpH/CcZwfe9mB/y04lxferQI
 pNWfO26sT7ZiIgv4PvaXvYC7h8CdYuD8TdSithAUqpfe29v+lMAX68sVGr3PA6D+m3He
 acNQ==
X-Gm-Message-State: AOAM532sOESVpJi4tlVPpKcgwZexBy12iBBs8sAiGgLBgYiinlKRNGVb
 IrZ/V3N6pzHrpnWT0i5wUJQOMA==
X-Google-Smtp-Source: ABdhPJzpbWzOXL/jAu3iYirepq9u44O409YEBXG22Nqs8IbE6jQmhtimcnsJyRFxKtcYlmt2BLkXmg==
X-Received: by 2002:a17:902:cec1:b029:e8:bf66:42f6 with SMTP id
 d1-20020a170902cec1b02900e8bf6642f6mr5051556plg.16.1617836867456; 
 Wed, 07 Apr 2021 16:07:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z192sm22497300pgz.94.2021.04.07.16.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:07:46 -0700 (PDT)
Subject: Re: [PATCH 18/27] arcv3: Decoder code
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-19-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95b710d4-7379-85ab-63b3-9cf798fe1ee2@linaro.org>
Date: Wed, 7 Apr 2021 16:07:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-19-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> From: Cupertino Miranda <cmiranda@synopsys.com>
> 
> ---
>   disas/arc.c                |   51 +-
>   target/arc/decoder-v3.c    | 1547 ++++++++++++++++++++++++++++++++++++
>   target/arc/decoder-v3.h    |  322 ++++++++
>   target/arc/flags-v3.def    |  103 +++
>   target/arc/operands-v3.def |  133 ++++
>   5 files changed, 2147 insertions(+), 9 deletions(-)
>   create mode 100644 target/arc/decoder-v3.c
>   create mode 100644 target/arc/decoder-v3.h
>   create mode 100644 target/arc/flags-v3.def
>   create mode 100644 target/arc/operands-v3.def

Do we really need a complete copy of the v2 decoder included with the v3 decoder?


r~

