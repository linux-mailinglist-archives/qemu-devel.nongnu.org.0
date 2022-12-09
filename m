Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9156484E9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:21:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fAO-0007wT-9t; Fri, 09 Dec 2022 10:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3fAC-0007uI-KU
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:19:50 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3fAA-0000TZ-8f
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:19:47 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-14449b7814bso111599fac.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oAlmrgspxyBB/or+Ml3T+A2YBMWVU6KN57bmFAhRCJw=;
 b=pKRnSBE1h4i57vatDEfJLpQU5PvvIPTffm/cAXwtZC3s5VZBBOpgoD27IWrlCrKFXS
 hUnxNQXnVk8DTlvkIkQ1FMPI84LrcJ/dCSXXpAHSfXnOSfNo76MSPWdMuT5fjhPG97UN
 qZkCf8GlypqL2hm4nkboOi5/GEV1PkNBwpWfG9HZHgOfq3OJZotItmMwUiszgv+eXfH+
 c6P2PR66zSawpHUmfKYhcTX0QodvHOU7FTRD4a6ma0quG0YgpW3YDJuBz2Y6oSZqN/em
 VBscFVJDPDGwddnb7I3q9SCN2nEOOK59cOiEUjwqQZ31awojutvbiKGdvu+MURfm5oe9
 BpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAlmrgspxyBB/or+Ml3T+A2YBMWVU6KN57bmFAhRCJw=;
 b=nFODRvvzJOAXrP9LfRAVmUMpMNECKfXq7W5URxhlA5Q06dFXO+f+NDYQw6weNhcbnw
 pUv7nmNXzuXQqwfSiRUR192Z/gQ3Mq76YHPjyxkcts+jHC/EQTlcvwqeQXiH5DRh+CXz
 0HyTh6C3yBXX8OYC8+C8XeeJdcEfoPlptxHA4E+aTwSI9xgp7WY9o+YBN2+VAl9fOzDD
 LCAziUOmU4jqLSGymiDsR++y6jGA7pkbB3E2syfolSW32TcQW2wdxGLgNIgIDZwVxK3G
 4RM5dnn55UI0ZjBmDhsNpvT2VbSCT66J3pB4rtuQ9/kXUPr/SyGTXCdRvwPO1zgdFM4m
 VuWg==
X-Gm-Message-State: ANoB5pktPUtvMjDFGs037BL8LKnS2B3gO92tQH6e5bCcxfNLPFnQMCd2
 VfweNAAr1XGG4UUaZsSTdsvPvA==
X-Google-Smtp-Source: AA0mqf5Jr7osV938s2rvjrX1XNTSKv9ZKXKPSG3gyOipLDIR1tEf8YgpAae4nf5adHPyJEQicjpupA==
X-Received: by 2002:a05:6870:4b87:b0:144:a3c3:ad52 with SMTP id
 lx7-20020a0568704b8700b00144a3c3ad52mr2761821oab.9.1670599183329; 
 Fri, 09 Dec 2022 07:19:43 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:e9d4:8f23:13a5:7d87?
 ([2806:102e:18:2efc:e9d4:8f23:13a5:7d87])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05687061c800b00144da40cee5sm982574oah.10.2022.12.09.07.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 07:19:42 -0800 (PST)
Message-ID: <5f838c11-765b-72a3-0d40-5dd46994fd8e@linaro.org>
Date: Fri, 9 Dec 2022 09:19:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0] target/arm: Keep "internals.h" internal to
 target/arm/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20221209111736.59796-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209111736.59796-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 12/9/22 05:17, Philippe Mathieu-Daudé wrote:
> +++ b/target/arm/machine.c
> @@ -6,6 +6,45 @@
>   #include "internals.h"
>   #include "migration/cpu.h"
>   
> +/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
> +static const uint8_t pamax_map[] = {
> +    [0] = 32,
> +    [1] = 36,
> +    [2] = 40,
> +    [3] = 42,
> +    [4] = 44,
> +    [5] = 48,
> +    [6] = 52,
> +};
...
> +++ b/target/arm/ptw.c
> @@ -42,45 +42,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>                                         ARMMMUFaultInfo *fi)
>       __attribute__((nonnull));
>   
> -/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
> -static const uint8_t pamax_map[] = {
> -    [0] = 32,
> -    [1] = 36,
> -    [2] = 40,
> -    [3] = 42,
> -    [4] = 44,
> -    [5] = 48,
> -    [6] = 52,
> -};

How does this even compile with the remaining usage of pamax_map in get_phys_addr_lpae?


r~

