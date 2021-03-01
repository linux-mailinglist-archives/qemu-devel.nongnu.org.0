Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23643276A4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 05:22:12 +0100 (CET)
Received: from localhost ([::1]:37130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGa4R-0000aN-7Z
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 23:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGa3Q-0008TN-1Z
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:21:08 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGa3M-0002j0-Gs
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:21:07 -0500
Received: by mail-pl1-x632.google.com with SMTP id g20so9083102plo.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 20:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oQNBZmYRf6tbno0YJw6e1dlEhetLAGlUZoz0Ct6xSKs=;
 b=Ni36/Y5wnHtdc3EbeAGPVAGXEl0SwtLWFJy1nS+BxWP6cpAw9L5UBBwgR3mMyzsMjQ
 2StxRl8f64APVITGi9rXdt6O8QVcwlNoEGtpEKVRVHFZMEspyyxREyZNsKT8AddSdflq
 bMKvWS9PR6Ae6I6VSq7B8j4DCRNoRxbsanIjyHQ7V0o0D4uS55nAy3aEMxAj9xU2+Sh4
 /iVwuvFjdp/rjCArjHFTerxiL7xSXgBD6WeOVNR7o3Op8KyOXSE4fExaWdm1iLTarrbk
 pY9LetG1r6CoFbctYFdYcR7MJsxZnYqon+5kVbrCGLAU7H1j4D0ezfNUxgKrBW/saI3/
 mN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oQNBZmYRf6tbno0YJw6e1dlEhetLAGlUZoz0Ct6xSKs=;
 b=ULsX4Jbo5DEISq0EJ11l/LFEEkFom8tKcQVoaBro+Rpm+gSgXjwiTebnL045XDLaGE
 4woHBppNMC5g1rscNil9IKA6RsDDHW/MIQblbG+kkjpeOpaW1Mm/SwQPEl5u2D6lhHf4
 Wn+HJjdAPDkxdTpPD3u7HNHF/AGTaVkr54d7DgIBhkQ58sS0sq1iXdugskNPcJqXjHKr
 orRlwuNdKcg4xwPO2fqKAJp6+fTSWyuo5QdycagQpU27bVqRHe7u4riMea09xcx8XfB4
 /7VYOIEfzSyIAuK3i9gK9s5Ue8XZ7Fgy8jkBRtpLPRwAyNbw4gc8NEqXzpi+Tc8mAxBd
 3dcg==
X-Gm-Message-State: AOAM530ilvmE52BthbP68L8cKKYJqS+lYzjx6D63xmi+2GMzvXdTmk30
 FIO3SlHrReGrct10So5SxfTSDQ==
X-Google-Smtp-Source: ABdhPJwLYg2Cs095WDhXjJ8TbCzkTSVgW5ffRGhv3VWuNibzTMUptJWP/e+DznXkOSOO9LPGHy9sOA==
X-Received: by 2002:a17:90a:f0cf:: with SMTP id
 fa15mr15911571pjb.20.1614572463025; 
 Sun, 28 Feb 2021 20:21:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id j35sm566414pgj.45.2021.02.28.20.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:21:02 -0800 (PST)
Subject: Re: [PATCH v2 13/24] hw/arm/mps2-tz: Move device IRQ info to data
 structures
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7378f3ab-b858-8d0e-293e-3d32b6e40238@linaro.org>
Date: Sun, 28 Feb 2021 20:21:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Move the specification of the IRQ information for the uart, ethernet,
> dma and spi devices to the data structures.  (The other devices
> handled by the PPCPortInfo structures don't have any interrupt lines
> we need to wire up.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 52 +++++++++++++++++++++++-------------------------
>   1 file changed, 25 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


