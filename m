Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7C34A978
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:20:39 +0100 (CET)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnKI-0007EE-NK
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPnIt-000690-Of
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:19:11 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPnIs-0006Yn-3b
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:19:11 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so5347211oto.2
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BAsIdBXFaH7l4U0IrQfcuNEDeqVf9wqFZqfCa7NjODY=;
 b=SEoj9CTzjPR82OjRwhbh6mTm+rVEJsV7SlCutEDo7rXv9mmK8xnId4kHl47JI4BMi9
 Sdi6kTG9OQq9GrEyAy8KbY3bFKiNUXH5MpE0gprUpHqiLH8nj16amnQ0ljs36Hjk/1wO
 X3B93Z/EF7eYBu5SX+kWTXm9v7q3E9/ItdrJAg7B57+h87PQCfKoXfxxbvVwhqBdv1fA
 cJD6z8kwCgsSPX8YbNiFtzxQLXSXBL1wOi10Lz9qUUQq17OzgS8mcO1HylkK/moBKEIj
 0Ow3i66nAJM1yAr9uPSJ7OCYDvAYAmmMuL8gYED6rI+xenRx2lfpOkIAZSzOgQgRfBaK
 HEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BAsIdBXFaH7l4U0IrQfcuNEDeqVf9wqFZqfCa7NjODY=;
 b=O+6UyRYnXte+qrCSDkIsrv2Cs0D00v4FlbG79fUrEeL52Ru3FUpeHrmAh/33tZVp4y
 OReKOCy5pdTkii9yS8K60ayc98ETWfDnfATwO1UPMTf5s3Xxyrt9xey1LM8TxXmbnS5k
 zlC5Lm5Bavlz7M0Mqs41V5uAA16YHYr4bRpw6/NPgWbKJwdt63l5H+OeiU2H3NVK4obr
 30QAfbyycYJOyfS68DdPl/VUk/JStD0DFObcQwEHTeeyXlsMmejyxvborpWQKLkPwaMu
 2RQgRU++190wgeWyHmojwrHVcWNtbsAVlpk1chw8z16hICmfjROMxJ7fgNisfpnaiMR4
 vgTg==
X-Gm-Message-State: AOAM531LRB3tCXZxiv4OqYLAj3jWy7cjYF58IIBWDC8XzUJWGhhfGEst
 nLQcPFFfaXe1tzY1kw077I4qGg==
X-Google-Smtp-Source: ABdhPJwB89Qtg8wEsnVkiqrHaedgKXlTqxZ6uBa33yFd3C5n462lS8BkrBLA6pqAMKKZKVAXL8xGuw==
X-Received: by 2002:a05:6830:149:: with SMTP id
 j9mr12032886otp.66.1616768348726; 
 Fri, 26 Mar 2021 07:19:08 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i3sm1918836oov.2.2021.03.26.07.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 07:19:08 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210311165947.27470-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0409d14a-85ac-aed6-1867-5ee95a3926ca@linaro.org>
Date: Fri, 26 Mar 2021 08:19:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311165947.27470-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 10:59 AM, Peter Maydell wrote:
> Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> means that we don't provide the 6 counters that are required by the
> Arm BSA (Base System Architecture) specification if the CPU supports
> the Virtualization extensions.
> 
> Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
> specify the PMCR reset value (obtained from the appropriate TRM), and
> use the 'N' field of that value to define the number of counters
> provided.
> 
> This means that we now supply 6 counters for Cortex-A53, A57, A72,
> A15 and A9 as well as '-cpu max'; Cortex-A7 and A8 stay at 4; and
> Cortex-R5 goes down to 3.
> 
> Note that because we now use the PMCR reset value of the specific
> implementation, we no longer set the LC bit out of reset.  This has
> an UNKNOWN value out of reset for all cores with any AArch32 support,
> so guest software should be setting it anyway if it wants it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is pretty much untested (I just checked Linux still boots;
> haven't tried it with KVM either). It's an alternative to
> just bumping PMCR_NUM_COUNTERS to 6.
> ---
>   target/arm/cpu.h     |  1 +
>   target/arm/cpu64.c   |  3 +++
>   target/arm/cpu_tcg.c |  5 +++++
>   target/arm/helper.c  | 29 +++++++++++++++++------------
>   target/arm/kvm64.c   |  2 ++
>   5 files changed, 28 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

