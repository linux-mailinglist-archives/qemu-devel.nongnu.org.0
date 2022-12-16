Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C790064F561
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 00:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6KYX-0004eu-RX; Fri, 16 Dec 2022 18:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KYV-0004Ww-Bi
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:55:55 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6KYS-00047b-FJ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 18:55:55 -0500
Received: by mail-pl1-x636.google.com with SMTP id a9so3804078pld.7
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S0J1Y/JHOekwGdbCkByHa8jzZHwbN5KNH5O0zH+eHo0=;
 b=pJp7dRGTP6UU1+2+n++b3U7FgFZOZWQNquXSWH5rFkYErPSWSv92tlm6qFUc2gTh+D
 BfUthjnvLF5nGNcMU4sIiwSgV3x/BT1X0DSuSBJt60Z7zZ649JhnLaAhBYWXw9z0Yv60
 H5tyklabc3GZYejdxC4W9g3GLBBJG3KllW64H2TbVU3QiQ+Ygo8JXljcKoicifJ54WtG
 7X+75n3UhSdiHWDT7i3UPrSqMbESmqBVRq950Gwo0FyEU5tdLqsoax35fsHWTAi3vBoX
 K69Y8PGh422gqfe/zyBC+HT5Af7hHTDxUeV176INdU6aVarty1Vj2sLXx/N4Znowegmu
 Qxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0J1Y/JHOekwGdbCkByHa8jzZHwbN5KNH5O0zH+eHo0=;
 b=7ljYx6fxPfYhFo90YpP6bwqP+qMzzTwqRE9m3EkC59tm91/VTcX6PNIjtdbc6h/+47
 UBRa5wSw+DHI8xg9SrNrTunWBaeaSMSqIbJfmOGIgk7dSiX1hZN4lUf3rzBHdmb2Q2zF
 I6zar5WOfCktq1aLefna1yZwA7zIKMj6lgvnZM6+XaFtENgVqO7xBV2RuneyEGtOjQm9
 7f0MWpAHFNp0dyDP2BAFzIy9+nY5iBkESTT+wviPzwB6YX3NJGxWgWzbq7UxuhNCCUdg
 3hBl/0HjBrcUbtZH+0GEOrx/bOc6mpM2iXBHDkB25TIoZ3KxibNCZe2I6RJoCEeKh6op
 C8aw==
X-Gm-Message-State: AFqh2kpavRx2/q5v3z087lEhTbOf4pJELDl97TIYDIPYUUlyknQR7SaT
 ELSCBxNPjRuqqkOzH4SwpP1dPTajn5Obs0hw
X-Google-Smtp-Source: AMrXdXsWhjxEdUKZtZWc7IwrXKVIYgmiYCXaqowhIwIudZ972K+bX3RiayeCegmz2pc+8wdnfDDRFQ==
X-Received: by 2002:a05:6a21:398b:b0:af:e129:cc1 with SMTP id
 ad11-20020a056a21398b00b000afe1290cc1mr3198894pzc.27.1671234950921; 
 Fri, 16 Dec 2022 15:55:50 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 ix22-20020a170902f81600b00186cf82717fsm2171495plb.165.2022.12.16.15.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 15:55:50 -0800 (PST)
Message-ID: <19adeed5-ca5a-b282-2be1-eec67f757dfa@linaro.org>
Date: Fri, 16 Dec 2022 15:55:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] hw/arm/smmu-common: Avoid using inlined functions
 with external linkage
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216214924.4711-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/16/22 13:49, Philippe Mathieu-Daudé wrote:
> When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
> and building with -Wall we get:
> 
>    hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove_by_asid_iova' is used in an inline function with external linkage [-Wstatic-in-inline]
>    hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function 'smmu_iotlb_inv_iova' internal linkage
>      void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>      ^
>      static
> 
> None of our code base require / use inlined functions with external
> linkage. Some places use internal inlining in the hot path. These
> two functions are certainly not in any hot path and don't justify
> any inlining, so these are likely oversights rather than intentional.
> 
> Reported-by: Stefan Weil<sw@weilnetz.de>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/smmu-common.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

