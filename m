Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6806F04D3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:16:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przbV-0001VZ-B0; Thu, 27 Apr 2023 07:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przbT-0001VA-8C
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:15:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przbR-0000gw-9z
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:15:58 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94f1a6e66c9so1543398166b.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682594155; x=1685186155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vn1uCQR5r1yLtt26CESKDzwCqcKCC6cjt0Rn/7GBdbM=;
 b=llPKHq9AXxfylZN2p6eW0UTaVBvhgw7qwDmtn09QMJv/LsUKI8NnN/ecJ0MtKryrww
 7NWTaVl1kiVEI0oUOJIMPLVaFhWPC6oYznr993WrdP1NOFa27ZCArK7mNThASs4FLKk6
 QLVg4Efgp25nh+/Mxjhqd8SO15qE6ZU+znN9TGRWL6yMj8zK7lUj8QPHDC+26VR8lWBz
 GuzxSiFeT0urAcdE/pRD5UAeK4aTviUTRVzFWUCTfBjeqDXkWKxoKX/4FNqGBLfPmg0F
 0pCHgsZwj20sNu7nvDh/DBFVYdjv0tR1JwuRWKVO6WYroQU5CmfsZW7dyhpmH2wB+gU9
 G6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682594155; x=1685186155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vn1uCQR5r1yLtt26CESKDzwCqcKCC6cjt0Rn/7GBdbM=;
 b=DvcEP+Ka2Bd11uC5sEo253WtN2nq389npk3y0v2H7G/DgFGdxA+0FCD8s/gH5FORBe
 I6lnN1OKSyN3xzN3Ka0iQRmhK8jB+j4S0kACUPT+kiIltXDz3ldlSsrF4AsfTYtIBE7X
 5vkuRcd0Mjzb4xzTwACPiGN+M/Hk0oyHQk8+wXLfp/toGxHP8t4J/RD9+sPWAw3m6eEz
 5BFch4uCMmStRqxvzro0gJbRp32K7Y3P/M9r3po6UjUWP96To4F+ypvSnZp/sImWumWx
 vp4aEJqxsCPIsuxZ2oKkAbX8nH+iaR7siZTGXNzzLn9OYRNGqLU0SK058h+eo9yg9qEk
 6htw==
X-Gm-Message-State: AC+VfDxrTlKfpkXltfFLORsyBV6E4CZY5d3FykyU0ol5klZDYMCxiZxA
 e7iZ0Pm8qoHqHVJs+C0p1BfBBQ==
X-Google-Smtp-Source: ACHHUZ6Ypucbz0Xt2Ky5+32QW9sfja4VmWdqxrzJIHVwZ1+kG+ycQaACG79h8KVqN2sHpAxORnzlgw==
X-Received: by 2002:a17:907:6d05:b0:94f:250b:2536 with SMTP id
 sa5-20020a1709076d0500b0094f250b2536mr1312218ejc.28.1682594155372; 
 Thu, 27 Apr 2023 04:15:55 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a17090624c600b0095707b7dd04sm8519949ejb.42.2023.04.27.04.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:15:55 -0700 (PDT)
Message-ID: <0f86e891-8309-e799-be4e-62bd0de7983d@linaro.org>
Date: Thu, 27 Apr 2023 12:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 21/21] Hexagon (target/hexagon) Move items to DisasContext
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004240.1319494-1-tsimpson@quicinc.com>
 <20230426004240.1319494-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004240.1319494-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/26/23 01:42, Taylor Simpson wrote:
> The following items in the CPUHexagonState are only used for bookkeeping
> within the translation of a packet.  With recent changes that eliminate
> the need to free TCGv variables, these make more sense to be transient
> and kept in DisasContext.
> 
> The following items are moved
>      dczero_addr
>      branch_taken
>      this_PC
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h       |  3 ---
>   target/hexagon/helper.h    |  2 +-
>   target/hexagon/macros.h    |  6 +++++-
>   target/hexagon/translate.h |  5 ++---
>   target/hexagon/genptr.c    |  6 +++---
>   target/hexagon/op_helper.c |  5 ++---
>   target/hexagon/translate.c | 23 +++++++----------------
>   target/hexagon/README      |  2 +-
>   8 files changed, 21 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

