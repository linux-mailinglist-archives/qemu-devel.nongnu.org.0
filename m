Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBC32DA75
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:36:04 +0100 (CET)
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtlT-0007O2-Ly
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtkB-0006Ys-HE
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:34:43 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtk9-0004V6-3B
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:34:43 -0500
Received: by mail-pf1-x42a.google.com with SMTP id x24so2447441pfn.5
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mhiIeoDCIjNu5cHdu32vkf1b234ZOSh9+pH/oK5fT0Y=;
 b=nZF85RrBSQgm20Mn5rr3Q4YKtNoIlNZdeyBUG5CZREjqbi5RasTjNazV5mX5ZZA3Uj
 mbIq6gT23FsP64aW0fEXYiCHSS2LWwcFq2ObxxnTX5Mw217QwT3lU2f1PXqDlBq9v8Bs
 4lea7AdZGs35qng+wqthJM51S+DZxEtyOxpEXXEJwMII5cxN7SM6Gu4RGhzgEW/ACjE/
 j6v0ELZmKZU1cQZehy8Y4NW8ZCto7rr2qhHxqvUwEBbnO1scnTh6F6ppgrXH1nzIQs5o
 tZoKn60+m7/UBKdzqT27MAEDVJU3aRor8VnjjKe4xuSnDnN/qhfE/ai7Y1SoQaml2zgR
 LUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mhiIeoDCIjNu5cHdu32vkf1b234ZOSh9+pH/oK5fT0Y=;
 b=hxj5rl3gFDoRf5mF3jAlm3NU37qo4Mz9u4CitxRBQzpfxEQpmV1FppKV1AIU1UghdW
 oHHAqBylsqnLa7gUgm52ZGrUsrl5Kf9eALNAJaArcd2s03xDKsiObyLtYRIO95pmW8gK
 ug8d4LX5a1dnGXqHZ2gcX+z2Krt+Xyxgj6Fg9cFAH1uOgXKwUtDb52i8XHlv7IplT4na
 gxUIi4wk8XJMOC/0vZcttNs8zA/CEu4Pc9E/6xH1q+TilqCNrTwgNU30k39yrEexUW5a
 IRxrQVkYKmn8J0DIK7qIPpKolb/a8LWnPFU5ONgYYFfQvBgSqllg4M5FNaJeN8y2C1zU
 5eAA==
X-Gm-Message-State: AOAM530qjioyit5psRX/E6mp3gC85IX94Y3i164ABskru/LjnuoIiIua
 ihB0+5YlrU2sHCYoSrdYIpsuNuAFu27K/A==
X-Google-Smtp-Source: ABdhPJyUI7FrySs/MnQ5ziK68NeSMwOE826JZYZoqpbt0xPCEcXj6vIWOO4JW9N26wm74jU+jqOABA==
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr4903533pgt.74.1614886479548;
 Thu, 04 Mar 2021 11:34:39 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k128sm178414pfd.137.2021.03.04.11.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:34:39 -0800 (PST)
Subject: Re: [PATCH 14/44] hw/misc/iotkit-sysctl: Handle CPU_WAIT, NMI_ENABLE
 for SSE-300
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32cefbd3-6af0-da4b-b07d-9d8fe52e46ee@linaro.org>
Date: Thu, 4 Mar 2021 11:34:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> In the SSE-300 the CPU_WAIT and NMI_ENABLE registers have
> moved offsets, so they are now where the SSE-200's WICCTRL
> and EWCTRL were. The SSE-300 does not have WICCTLR or EWCTRL
> at all, and the old offsets are reserved:
> 
>   Offset    SSE-200      SSE-300
> -----------------------------------
>   0x118     CPUWAIT      reserved
>   0x118     NMI_ENABLE   reserved

     0x11c

>   0x120     WICCTRL      CPUWAIT
>   0x124     EWCTRL       NMI_ENABLE
> 
> Handle this reshuffle, and the fact that SSE-300 has only
> one CPU and so only one active bit in CPUWAIT.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

What an irritating and pointless change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

