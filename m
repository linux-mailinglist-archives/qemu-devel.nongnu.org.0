Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19AD4FAADA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:49:10 +0200 (CEST)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndI17-00075I-BY
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHzp-0005Sl-4a
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:47:49 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHzm-00050G-Qo
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:47:48 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so14911506pjb.0
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=twE9MxGPKuDn6x9Bt0K7VtxCoo4pVL4TP9mNCW6xpQs=;
 b=wkrCf48PDmOvGBUhcwVWkMTzzdfE0FOvbBqcqy5mv397HlVV9KRSQpOMwNSBHjTJNz
 x0UCzc3ZQxbW5XIVaupyH3vR+zAC29N81DICjFwI6qR9twTQVGA6YQVWi7RL+jc9ZZtu
 cyHS8YdOUGAo7QEXq4LArAMJt65DwnEoGqA5aaMgHg3XYcT+UWAvBikR33VdJ+Phd5hc
 /ZlAgd/+nlQpuTyIDTEpi07BVBsWfYCQdqMelIHe/QR2wpjh7MQ+wtx5364/CwBnVotV
 dHPEmKQhHzQM9smzm+L21j+kZJ4+7LTm0tVxyCG/lbBlFYDHk2LBKRIYkmM0gdfv/0nb
 VErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=twE9MxGPKuDn6x9Bt0K7VtxCoo4pVL4TP9mNCW6xpQs=;
 b=2/G6hHhKqF2LpANJo5IdAQJAoa6PsRLhFDnUuAasLz8RZOE2fPpHVTQCUmUQFQXU58
 Bw+sgw8LTAD6V9HvbMp9vQ+1EQr1NWptEi/kN4Jlahc963Halj1gRVoTwqA9zcZ2agWq
 kakjKZniQweuLuECMKo6hGnxYCyPHcYYVWWP0GyzHup6z/9e0HYkxeSOeAzZD5prMw9M
 DOTHXn4DOkp08TTvY9eZnbGg0mWkC9DmfBlWSqsK5xhu2fIFUlucYMFdNJeaZQAQA+jY
 nA+CFo5P7/i8jPAaPfMXYk2NaovLnfu1MIwa5Wbx8VEeP1nEM05XmdQJsFes+5lU6keT
 cI5w==
X-Gm-Message-State: AOAM530KZT6NhyIopm1ikglAHxzN/EilXW3W5x4UF6V2Myik+QHqFsBn
 EC0zEQNEc7KkAuQQLiuXe5ayGw==
X-Google-Smtp-Source: ABdhPJxqRn6iLy0dq9p+KrnH8/kF+IfCQPnrOZoERYq3B8GRm5NYcS32YnRfBeFHUbLko9BW+m0/hg==
X-Received: by 2002:a17:902:f64c:b0:156:4349:7e9b with SMTP id
 m12-20020a170902f64c00b0015643497e9bmr25618254plg.139.1649537264994; 
 Sat, 09 Apr 2022 13:47:44 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00170d00b004fb1450229bsm32072933pfc.16.2022.04.09.13.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:47:44 -0700 (PDT)
Message-ID: <f86902e0-8cf3-c492-f356-8d5dd438597b@linaro.org>
Date: Sat, 9 Apr 2022 13:47:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 37/41] hw/intc/arm_gicv3: Update ID and feature registers
 for GICv4
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Update the various GIC ID and feature registers for GICv4:
>   * PIDR2 [7:4] is the GIC architecture revision
>   * GICD_TYPER.DVIS is 1 to indicate direct vLPI injection support
>   * GICR_TYPER.VLPIS is 1 to indicate redistributor support for vLPIs
>   * GITS_TYPER.VIRTUAL is 1 to indicate vLPI support
>   * GITS_TYPER.VMOVP is 1 to indicate that our VMOVP implementation
>     handles cross-ITS synchronization for the guest
>   * ICH_VTR_EL2.nV4 is 0 to indicate direct vLPI injection support
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 15 +++++++++++----
>   hw/intc/arm_gicv3_common.c |  7 +++++--
>   hw/intc/arm_gicv3_cpuif.c  |  6 +++++-
>   hw/intc/arm_gicv3_dist.c   |  7 ++++---
>   hw/intc/arm_gicv3_its.c    |  7 ++++++-
>   hw/intc/arm_gicv3_redist.c |  2 +-
>   6 files changed, 32 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

