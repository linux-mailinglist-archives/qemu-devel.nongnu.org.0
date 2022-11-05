Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5061A6BD
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 02:45:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or8EN-0007Jh-VG; Fri, 04 Nov 2022 21:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or8EM-0007JL-8u
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 21:44:18 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or8EK-0001Zw-K6
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 21:44:18 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1322d768ba7so7364695fac.5
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 18:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+kfOVFfUuyltu2VgUPycEmTu6JFVALqe9o8gGiW6GQQ=;
 b=QflVLzPWlfk9T/YSiD+rXFIvp9vK8JthHFRe+sHm3hVN4mfNLLyNpcXHzwJ1aLcZU3
 /l+/lieinmWgj0OGhU8gzAJpgPvHwRQvtjW31LP++/y4lJECdzGOS3+vyFkjWluqeCeD
 OhNFbnww/vcQ7bp25aiucJ6y6XbJtzR3s3pAMgLKV9y2cakrNxwK5A9YT+x7fLTuF4vg
 0I8C5/HpehOieqVUoxkU7pGFIj6Ye0IVWve9hVg8TEz9K6as8veXi+QpSlTytWR/FZv7
 rGyNo4hswYZk3MI7i5Y4vb8fG0p93vP4NdGQAfcJisscUOpIItBWGhdSMdNUCBKyAuI/
 rv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+kfOVFfUuyltu2VgUPycEmTu6JFVALqe9o8gGiW6GQQ=;
 b=6ms3KqueqYIw95nhRmt7sT9oxo5U2ACT7FvOi2o16PNDp9/cS1Cm9xV6It7oEIMRao
 rG5sAq/+twXGhsEfyi5KezPpmvHzQOHQdl74PDx5WMo2RvLuw4aO1Xlxn2gY+ubSswmP
 XTaBxs0BlqRsaOQY659VegNTZU/07+7sQEEw6iUY0Yn99A6qoATp+dR2dcly9S4Z8M4k
 krhxg2S9xQia3UZfXXMOEM/sm64KCHXkLuB+fWRM55NsC35G4shmDu68tLlTxYBZ+g3T
 yCtafZvGpnA7uZIQ4n4y+IFpm1DAqiQgDabkEolOJ9XUWGKPG3ZHheWVNSVrmVmi0yNt
 56Rg==
X-Gm-Message-State: ACrzQf2o2o3mi9PN/tPas3nhpcx3nVc+2R2KKlfKxAxrEzA208SoLVL8
 WRRQqdBZnkCFgjUSuB7DNvL9aQ==
X-Google-Smtp-Source: AMsMyM75b2Oyl/WN4xUBxax7IUCAqt3frld9UCeevAVcQZGBqnIyq1hFTONz2eNUyg+Oi0frCPyL5g==
X-Received: by 2002:a05:6870:e416:b0:13b:71ae:599c with SMTP id
 n22-20020a056870e41600b0013b71ae599cmr32663833oag.215.1667612653760; 
 Fri, 04 Nov 2022 18:44:13 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a056830000c00b0066c39c99ae5sm393251otp.25.2022.11.04.18.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 18:44:13 -0700 (PDT)
Message-ID: <a13e4232-dea1-3050-b0c8-a6cd0cec3137@linaro.org>
Date: Sat, 5 Nov 2022 12:44:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 11/11] Hexagon (target/hexagon) Use direct block
 chaining for tight loops
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-12-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-12-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> Direct block chaining is documented here
> https://qemu.readthedocs.io/en/latest/devel/tcg.html#direct-block-chaining
> 
> Hexagon inner loops end with the endloop0 instruction
> To go back to the beginning of the loop, this instructions writes to PC
> from register SA0 (start address 0).  To use direct block chaining, we
> have to assign PC with a constant value.  So, we specialize the code
> generation when the start of the translation block is equal to SA0.
> 
> When this is the case, we defer the compare/branch from endloop0 to
> gen_end_tb.  When this is done, we can assign the start address of the TB
> to PC.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h       | 17 ++++++++----
>   target/hexagon/gen_tcg.h   |  3 ++
>   target/hexagon/translate.h |  1 +
>   target/hexagon/genptr.c    | 57 ++++++++++++++++++++++++++++++++++++++
>   target/hexagon/translate.c | 34 +++++++++++++++++++++++
>   5 files changed, 107 insertions(+), 5 deletions(-)
> 
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index ff8c26272d..5260e0f127 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -152,16 +152,23 @@ struct ArchCPU {
>   
>   #include "cpu_bits.h"
>   
> +typedef union {
> +    uint32_t i;
> +    struct {
> +        bool is_tight_loop:1;
> +    };
> +} HexStateFlags;

I don't see this as an improvement on manual flags handling, as it makes the flags value 
be dependent on host bit-field ordering.  This makes it more difficult to compare traces 
across hosts.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

