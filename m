Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9DA611B09
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:44:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVGz-0004kY-16; Fri, 28 Oct 2022 15:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVGw-0004iD-Fe
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:44:06 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVGu-0007Ar-Pe
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:44:06 -0400
Received: by mail-pf1-x42c.google.com with SMTP id v28so5441418pfi.12
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tmLNbgk7tWZcUet+svGTFSQSXOEpucKmUZQob3ntieQ=;
 b=XhoaWT/2d2xHi8392I3YCIyNtx/GBna2WLhizkg+VfFXylHq1X5UA39Y4c/yDr3NJ6
 N8NbG9pnhy/PODSC8G/UTMOpSb30EizAZZqrgpBmM/paHF/BLmGuj5MQqCXTw5L63Q2z
 fqadtXtkg0HZTj9HvxTVVeo7n0fuN8eOInEVA4aECPO//0gY38BVwAseSI9WpwZ8I61k
 8GZhhrX3Vi++Pt7QUJAgXQreBYzu2ZqIWFxZJ2aA6Tzz1XeXy3dx2DqB0CgcMSQAY10S
 W8wEx87VSw+s4XwNLyHzlFIUexgqtxsoCed24LqXqhlrGpuvof1f8jSmGjK6YZpfJx+w
 q6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tmLNbgk7tWZcUet+svGTFSQSXOEpucKmUZQob3ntieQ=;
 b=TLzwU1Lou6lIR0Mptw9TGZiFJxdjmpeVLoN7B6CdZE//WyPvW7v/v178u+Sk/TBr8Y
 ndL8pAafmVhv5Zn0VneApX/gH0D3y9qjBDdrJury/E2PwZml0pJMfd43VEPjkfTwvZsu
 X7dft7tHHaH4262FjalLXtCiB4MVu7XO28H71h8ESyh7YgHs9vm96ZiY6+1ltHYSS4PG
 sEACrvxsmiYeucX8mIReWC/R60O22nld2VV1QoxZ3Zg+0QrssfXr5cM6Sjx8DVWHFdgg
 rE0E84CbIxPCNrzDTiM2Z0C2uGN8Ie7Z3+70i3/ekO8LcsJbUPIYjUqEvXBc33R/IiIC
 pGRg==
X-Gm-Message-State: ACrzQf2gpaAea2OnIcS6TdPIkpMY0m3Pu/RlvrcNaoUKmQhLfWWKds3I
 LBFw7aFVdgVZ22ZXsCmIDPB0rg==
X-Google-Smtp-Source: AMsMyM5Hm83rV3DII9z55pTjiV4+6C6k4ljiJW2GvjWLy6YF1zzNhH+pN0jUYjpBwjv9fslW5WrXWw==
X-Received: by 2002:a62:1482:0:b0:55f:eb9a:38b2 with SMTP id
 124-20020a621482000000b0055feb9a38b2mr675990pfu.29.1666986243283; 
 Fri, 28 Oct 2022 12:44:03 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 cp9-20020a170902e78900b0018700ba9090sm905387plb.185.2022.10.28.12.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:44:02 -0700 (PDT)
Message-ID: <17d1bc6a-a30e-ee8c-b3c3-a74dce657375@linaro.org>
Date: Sat, 29 Oct 2022 06:43:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/7] target/arm: Implement HCR_EL2.TICAB,TOCU traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/29/22 00:40, Peter Maydell wrote:
> For FEAT_EVT, the HCR_EL2.TICAB bit allows trapping of the ICIALLUIS
> and IC IALLUIS cache maintenance instructions.
> 
> The HCR_EL2.TOCU bit traps all the other cache maintenance
> instructions that operate to the point of unification:
>   AArch64 IC IVAU, IC IALLU, DC CVAU
>   AArch32 ICIMVAU, ICIALLU, DCCMVAU
> 
> The two trap bits between them cover all of the cache maintenance
> instructions which must also check the HCR_TPU flag.  Turn the old
> aa64_cacheop_pou_access() function into a helper function which takes
> the set of HCR_EL2 flags to check as an argument, and call it from
> new access_ticab() and access_tocu() functions as appropriate for
> each cache op.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 36 +++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

