Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0A651DF24
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:31:48 +0200 (CEST)
Received: from localhost ([::1]:60436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2jz-0004qo-HJ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2a5-0007kv-2G
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:21:33 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:44698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2a3-0007YO-NF
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:21:32 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 h10-20020a056830400a00b00605e92cc450so5428801ots.11
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=mbnrpkcC7bxS5s4sFrFElerAzU2/YOP+y1bgLPMwqcs=;
 b=qKu56VNsL78MlHQRxPSsB59tkFNs5q+ygNaxeIynAIJ2yaQfyKmwDQE34u3og2asmG
 zNCUOtzb2BHn56gNOq2IKI1ST22f+36bfMHuGNBjE2+7SeZXwoOtu++SZrLFp9HNIUHY
 BAFt3dfK/25mBsrELVbZV9XV7/x+FTUCVbVBL/OhuZp8xoQ8zhAVXG+4W4KCHleJ0BNE
 BpOvckzV1dZ7VhnqldeUAgdbyA+GicIWiI2GwrZnmT0/+7BXGarE8uoOaOiCVYe5bVxp
 vLQ94BchFsC4We6lrD9kTvbMJL7Kb+q4Ux0AJOQbJ8iFS9c4c6zIoo8VAV3OHLhTxzTG
 uqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mbnrpkcC7bxS5s4sFrFElerAzU2/YOP+y1bgLPMwqcs=;
 b=0m3JXrHQieQlXkM7oe2s1IUr8WeJh0KvaKklizgRPH6WLk9wlNtCRhnpH6qMkdEcJx
 28yczcZ5+Yi3uKaLMau/yCN3tnpCwAbZdixQs4j3fV19sxvexC+xx6hXJVwQIKaXXMpR
 yE2Xf251NHUDU2jmkuPMzjYdsFV274mcW8Bb5B8YEWzfJrHGZGwL78J+adzqyqfC0gai
 mqOuKq/ySweZVYMoVa4MxVRqrTE2ZEHFKEEMK3SL1HFb7rS+S29pOYPnFvX6082GBQlo
 hQwYj/+HigvX9TdYjOAVszIKJfes+FUnGTBNSPePSqbyY4biLt64A32ztX98uFUkihAn
 o16A==
X-Gm-Message-State: AOAM533g85dl4zZbA6K24OEhi9vwBW+gNdL+05NLLZvUtQjaRpYnu1I3
 sJFYlmKuiVogt3GWVe3PIfvHGg==
X-Google-Smtp-Source: ABdhPJyIRgb2NPrmXIvmtupgS/kQj9UuSbuipHKoaUpbH3mXEJExbsVHue+Hw2ZUipdfANpNj5Pmjw==
X-Received: by 2002:a9d:58c3:0:b0:5e6:d8f7:c18c with SMTP id
 s3-20020a9d58c3000000b005e6d8f7c18cmr1495216oth.364.1651861290508; 
 Fri, 06 May 2022 11:21:30 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2?
 ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a0568301de900b0060603221255sm1868945otj.37.2022.05.06.11.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 11:21:30 -0700 (PDT)
Message-ID: <9d1af069-afad-7756-790e-b7d0fc708223@linaro.org>
Date: Fri, 6 May 2022 13:21:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] target/arm: Enable FEAT_S2FWB for -cpu max
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
 <20220505183950.2781801-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505183950.2781801-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/22 13:39, Peter Maydell wrote:
> Enable the FEAT_S2FWB for -cpu max. Since FEAT_S2FWB requires that
> CLIDR_EL1.{LoUU,LoUIS} are zero, we explicitly squash these (the
> inherited CLIDR_EL1 value from the Cortex-A57 has them as 1).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu64.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

