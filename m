Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D353933C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 16:40:32 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw32t-0002kD-0G
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 10:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2ye-00073k-7r
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:36:08 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2yb-0005Gq-CK
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:36:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id c196so1493155pfb.1
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=pWdkb9nCXHNLAF4DIznBQNvVDAvL8cu0pcKjQ/KOw6w=;
 b=MJQiYcckaY+QECS0lzzRxW1cIpvesUrNpG9/xkztUOKHV4ZU2zrwfwh4uBT1jicIeR
 N15VvCiWe4abM0MpkOlfGnboD/x4q+9V0W5QRurZSLvc8V2BB2LAHTHuzcnM5gw1D2jb
 tfDeP1aL+cLdcbIlGCkz7OIahfpTthHfiF7poHYx1DQUdJpvx0CZd2z1W5q9nEz004Y7
 H6IF3+Ri9pAaqEX9AiuVTcTXY2oy7lHWItkV1y9Yq8OIf+cicyEOGJ6x2Trru3tzqj6/
 3v0BkPIoPiywwZy0pQLPIXhn9Ny34YN4lm+K8TrebJ+DmDNig2zit17fvFUuKYHWSy4v
 4o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWdkb9nCXHNLAF4DIznBQNvVDAvL8cu0pcKjQ/KOw6w=;
 b=W0UetNYU0Yw+Zh2AEM3cgZCuJsF6QS+Qj8XliJSETN9LIR4rqwCsylLKzfM2rpK9Oe
 KL01V9c+AafiVyKsVxFnOXsyyHmXaGpgeiOj4UJ5y9Y/YpKTUmdydlueI4zA86wRCTFr
 8VRX2YoH1xNoxJgicDvKREkEVfEyj2zm0vMQpyy7APAfUiT8A8aGwoYGsaILlmGtDRwP
 eHW3gS8Lx3EFsujf7KYpWS3lNbOfDQsGflU8plWsOAHnJsxQYqO/gRca5cyXKNu8TA5B
 lGh3btwsQ18WYlcaj6eBoMBP9yBAMEPyDflBsFwbEnvMJQz8uHBEVgm0xSPsSol8Qcv5
 zSUg==
X-Gm-Message-State: AOAM533Vk8YNiooEfvEftc4p6iNqIalQIjua2MJi+AKUb7tEVhaBNYtR
 VMfLRj25g6loIq5kHd/SLyjUdg==
X-Google-Smtp-Source: ABdhPJxyc0aKUdnlgs/4rxEq8wwdMH4t3U9PK1pA0dwt1LSBV8wretRYy+VyrQajY8q3U5G9axP/0g==
X-Received: by 2002:a65:6e0b:0:b0:3aa:6146:15a8 with SMTP id
 bd11-20020a656e0b000000b003aa614615a8mr52071451pgb.181.1654007762930; 
 Tue, 31 May 2022 07:36:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170902c2ca00b0015e8d4eb207sm11135734pla.81.2022.05.31.07.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:36:02 -0700 (PDT)
Message-ID: <ed287f11-a910-89a6-18e0-5ee3ba6c39d5@linaro.org>
Date: Tue, 31 May 2022 07:36:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Declare support for FEAT_RASv1p1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220531114258.855804-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220531114258.855804-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 5/31/22 04:42, Peter Maydell wrote:
> The architectural feature RASv1p1 introduces the following new
> features:
>   * new registers ERXPFGCDN_EL1, ERXPFGCTL_EL1 and ERXPFGF_EL1
>   * new bits in the fine-grained trap registers that control traps
>     for these new registers
>   * new trap bits HCR_EL2.FIEN and SCR_EL3.FIEN that control traps
>     for ERXPFGCDN_EL1, ERXPFGCTL_EL1, ERXPFGP_EL1
>   * a larger number of the ERXMISC<n>_EL1 registers
>   * the format of ERR<n>STATUS registers changes
> 
> The architecture permits that if ERRIDR_EL1.NUM is 0 (as it is for
> QEMU) then all these new registers may UNDEF, and the HCR_EL2.FIEN
> and SCR_EL3.FIEN bits may be RES0.  We don't have any ERR<n>STATUS
> registers (again, because ERRIDR_EL1.NUM is 0).  QEMU does not yet
> implement the fine-grained-trap extension.  So there is nothing we
> need to implement to be compliant with the feature spec.  Make the
> 'max' CPU report the feature in its ID registers, and document it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

