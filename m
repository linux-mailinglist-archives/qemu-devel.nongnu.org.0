Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19139ED23
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 05:41:42 +0200 (CEST)
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqScX-0006C0-D2
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 23:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqSb9-0005EL-4C
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:40:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqSb7-0006Gl-E5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:40:14 -0400
Received: by mail-pj1-x1030.google.com with SMTP id k7so11071317pjf.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 20:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rPVBKYfXcnQKOC26+kqJFqri41rZP14tBHlADE/Vt+s=;
 b=q9LNj42dRo7LfrquOGbTxoPF7sUI0gutx3B28yETahRTKEgNTXIE9VVerUJe/XwPb+
 AGm5SDLNVP+svBU8M+SKtvT9HvvUCokbb5sYuztgrM/TZ4F1O27SozIRf2uOUFIaHfBs
 NamNJWRMvrbaStsFZK0SA5xTfXRm/CcXlThlWYOV+yUYF9zBn3HXzLILR/xppUq4f4gB
 y0f+KCxCSpE99szJQX4eEY0gg3tEL2X3RVFgqjrGGTJwL8+hd92vfrPO4b7b3AvmKsUP
 JG7TevCGerHuOiPjRuiQo9+/93jgauFUmq/Hu18PAOJW2ucaSjcOE5FzMTnS84zrCleq
 ugmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rPVBKYfXcnQKOC26+kqJFqri41rZP14tBHlADE/Vt+s=;
 b=C++E/AS7/lgBeUUv5iV9OizKlPSTMdkIudV4YXONw+oPd0kp+BIkckgKeDc69d8M+A
 ZL7X5m0N+vOoN5QVIrOh586VyZfrp+81Y8W6EhplIv8v6zaDji+ALzTHbKU4L2bYWR2X
 aOx4YaUxUpmDMlbsWqB8zgECtmVUQHnLpTum+5Nbi3s1faSUw+eNLuyFW4cLfwWx+8AM
 eCROV6ITL5FZ4u9NpZZBFRx0B99sQJGj112bATK6cBdmnGcr+Xztni/FwGdGNZdy6g5J
 gwmX/Kwe+GZzcaQDhhgIwyHMC/KlhKM8osFl+/61HAxXW9l2hoMJ5XyxNAY6bQS0YV+0
 UTVw==
X-Gm-Message-State: AOAM531WlKDuZc6ubDor5fVO12B6H7ldTI3oSn6YMyykLomOPrL6dqjV
 vuLCm3v3AzDEUhIjNNBZ67WtlhxMkvyQ8w==
X-Google-Smtp-Source: ABdhPJwiCl4/4DNUuZGC9hhGl1R1/jUyMJ9VZq/vpEh1+K6YakZvv+BUIlpmi//N2Q4F1kA8YqNuxg==
X-Received: by 2002:a17:902:44:b029:ee:9107:4242 with SMTP id
 62-20020a1709020044b02900ee91074242mr21111274pla.18.1623123611819; 
 Mon, 07 Jun 2021 20:40:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q24sm10030349pgk.32.2021.06.07.20.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 20:40:11 -0700 (PDT)
Subject: Re: [PATCH 09/55] target/arm: Implement MVE LETP insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9324f3bb-d497-bff6-7a92-1a602b30b6c5@linaro.org>
Date: Mon, 7 Jun 2021 20:40:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
> Implement the MVE LETP insn.  This is like the existing LE loop-end
> insn, but it must perform an FPU-enabled check, and on loop-exit it
> resets LTPSIZE to 4.
> 
> To accommodate the requirement to do something on loop-exit, we drop
> the use of condlabel and instead manage both the TB exits manually,
> in the same way we already do in trans_WLS().
> 
> The other MVE-specific change to the LE insn is that we must raise an
> INVSTATE UsageFault insn if LTPSIZE is not 4.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This amounts to a complete rewrite of trans_LE()...
> ---
>   target/arm/t32.decode  |   2 +-
>   target/arm/translate.c | 104 +++++++++++++++++++++++++++++++++++++----
>   2 files changed, 97 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

