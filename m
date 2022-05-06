Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40451DF1A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:27:44 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2g3-00081r-FP
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2YZ-0003mL-7l
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:20:00 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:42516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2YX-000790-1m
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:19:58 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so7636447fac.9
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=mqry8tzD7ld3o3++D3wVz3uzz2eDRdX+8e8XC5UF9Y8=;
 b=v8li9RU9ml6RZfegnWne9bZmMqId87CDPkKXLCNK+VuX5XhfgQ+BWGA4AE0zJ9kirZ
 al0A1CIVl7b4vjfNFAAgrl8vaSqpBysz+f9dhDhj0PQ/ctNNGLMFbafcx+KDoQte1W1U
 AS2c78pRyT+vtK3inzTQSA0kJjMcSS7oSwZajrvvvFGUcez3eRg3275nOJ7VFwNM3h7r
 OvOsaOSuKVHyE5CtzxCEBgdZMbsCJfyU+3NskOKoRgOmEoyDulO3EBjiK/0V9CxhCIEy
 n29SqqKDghStbdNJkQDx6dG9Kf+hjIx78PvKx5BXubolQDRuoCa+U+/zeFyfs2aQakAU
 QjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mqry8tzD7ld3o3++D3wVz3uzz2eDRdX+8e8XC5UF9Y8=;
 b=yye5q3vKd5BDSDrzaOrIAa3FQZSGJUDT90TAkKKcr1DiFz+Vppwnk1rjrff46osbsn
 dmfOZxhUOXFfFUq8qVJA8hZk8tMopafjYqC4FveQ8+WZUZQWqIdF7FwxeLYwx1e4K4Uh
 9giy5Mo/jheBH4W4QnkGNKni3b3bZYuxvnG+IHz1TQSeboVpm52mQ4YiAfgcgL4Mj2CA
 m2Gs92Zi6wNc0epODZ64WKcgKO5kYsDEK+tMQ7NmK/ZL5iMe/Ee8jZ4I/KSsjG7Vh9hJ
 UC62nqqvtV0zEy5UwZK/ZkjFfqDVGGzBo1Zf5A53bnM56166uqdAdRH9oridSiIDmQPD
 pQXA==
X-Gm-Message-State: AOAM5313WRjAI4GU3hffmxGRSRD8Vq2VrFgGmk1Gt95dFRGze3nhXDkG
 Osx1/oLxDrlnc8xR311AdX9Gog==
X-Google-Smtp-Source: ABdhPJy7HklPeIiClkOKgJ/pSu2v2Kp4MWH8mdoE5sFmCjUwRW9qYpJAHOqANI+/ui26Q9rx4y+Deg==
X-Received: by 2002:a05:6870:b686:b0:dc:a9f4:90a2 with SMTP id
 cy6-20020a056870b68600b000dca9f490a2mr5070555oab.243.1651861195404; 
 Fri, 06 May 2022 11:19:55 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2?
 ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a9d7b43000000b00605da994088sm1911409oto.2.2022.05.06.11.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 11:19:53 -0700 (PDT)
Message-ID: <8d1b9c7d-ce7e-fc24-6425-bc5763b3fd24@linaro.org>
Date: Fri, 6 May 2022 13:19:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] target/arm: Implement FEAT_S2FWB
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
 <20220505183950.2781801-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505183950.2781801-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/22 13:39, Peter Maydell wrote:
> Implement the handling of FEAT_S2FWB; the meat of this is in the new
> combined_attrs_fwb() function which combines S1 and S2 attributes
> when HCR_EL2.FWB is set.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    |  5 +++
>   target/arm/helper.c | 84 +++++++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 86 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

