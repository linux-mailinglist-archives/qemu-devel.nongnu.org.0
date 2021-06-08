Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71573A07F8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:40:51 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlL0-0007xR-Ot
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlJO-0006SX-SH
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:39:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlJN-0004mm-DL
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:39:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id d16so16923761pfn.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wc/TXXKv8O4I34WBHZwTU4ZQp4GgnH8XcB+M/gqFy9s=;
 b=xHgcQF4px3DxZ4v1rI2SaYGDgqO5RHZ5+7ikgfeRB6o/OX/6rhKywV7yOWxn30alIs
 AdiNk5AOkTZ74+O9BBNErYpEswhBcl+G5Mcw7O7J34MtHX6k++vrSe97QSWi0pgyL6BO
 kk4Ou4h3nmtGvKbXaw3XXT3Ljz0Xq3oatKLRsQJ25Y0LYs9yjXuY1NF/2FaV2lBsBPe2
 pX80JFyVdT2gGdK7VUO3Vd+LqrDMTwtnZpxPDAxqZn9CI9IqQ+Jjf+FEDAD60pnwUcTO
 TCiskTwLUErFKWANACL8j8u1hB0AQxGW9KpppmeZY41cNCXfqz4XzaGUB+rOSfvsFBcH
 QIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wc/TXXKv8O4I34WBHZwTU4ZQp4GgnH8XcB+M/gqFy9s=;
 b=ADMVsksM8gdWXPWNrdv9Yrz5PgivFFHFnpVs5WOFhTtzkCU4BJOl93QLA5J5oJAbm/
 vd6w11YwhdKsZcvg7BPMeZeQNP62b0/KU/dSPmJMLblII29zKeABLP4MnbVpgQPMFRaa
 YL8bWulNEuM4cJmg61Cgv+2IiYzAPGUez2JC5DY+gMXoMQCJyAnk+klIVZULA5mfOn9W
 nkiocYzLySotNvo9t/pF47IV1hYGhlrT59gRxwZx+SjH1uehPOGQR7j6jQSm0kXo73Ex
 luyL1n+UIWrUdQ8P7rVgulZucfhquC1lPGDYPJ8DowoV5EvNZTvPP+ckazHt/BfIdDmX
 KsBQ==
X-Gm-Message-State: AOAM5338st1HRUd9yj4eX0FNaYte8kGY0UMg9IgF8XTMsiUfOgUgn4Cj
 8TPYwtJqJHFn7UsHwof8AeCy1gUF2nkciQ==
X-Google-Smtp-Source: ABdhPJx8m+WtU9ujRcWKElJGuS+c28KxpNVWnO80UHIhyRlPtK5vkJmg9eIK8YDmSu55gT0+lOrIbA==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr2414487pfe.37.1623195547883; 
 Tue, 08 Jun 2021 16:39:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a25sm11728268pff.54.2021.06.08.16.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:39:07 -0700 (PDT)
Subject: Re: [PATCH 26/55] target/arm: Implement MVE VABD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d17018d7-6803-9a6c-8d41-c2c50da68cdf@linaro.org>
Date: Tue, 8 Jun 2021 16:39:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VABD insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 7 +++++++
>   target/arm/mve.decode      | 3 +++
>   target/arm/mve_helper.c    | 5 +++++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

