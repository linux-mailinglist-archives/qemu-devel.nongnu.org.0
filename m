Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D521C5F3BE6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 05:54:41 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofZ0y-0003Iu-ET
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 23:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofYof-0004vU-Aa
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 23:41:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofYmh-00065Z-Hh
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 23:41:55 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so17402315pjq.3
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 20:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NrsqlHT+SWorq2vMGLKkcJ9jxUhHgPTnKBoMnpFY1yI=;
 b=BqMdwXFoE8RJ7aPMF27LGIvI3DDDCazkvNPS9Fb864+fzi4P88LJ4Md+IpKHF9PSfP
 HIQJRQzrpz3W19w/TG69s4rW8WX9S5zm3bwsYXFDlLMtY+Kx1zHRIpaC30uvI5+I9Kdu
 q3E4ZVbMqGWGjenfm+JO8r27x9BoA0+IqcuMRlfVdOE+HebVoHT2edlrATuc+SrWpRgH
 i2w6LKymT7SKMxBR0tMXCLuDX1ahPo6YxA558tu4LNZPlvSvMUOMUQgHE5UXuacULPXj
 CVT02KKFuVfr5lQygMgw/IabZVPkRXiTXKJ9e7PoVYJSMVb8Q8iiG9aySur6ZsTD8eBj
 /R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NrsqlHT+SWorq2vMGLKkcJ9jxUhHgPTnKBoMnpFY1yI=;
 b=mLNEheZYujiEtybHDi7wLPwU4edIuHS0JH8DU9iPf/r6I+22LwEv6sYhlY0FOeC2aa
 fnxItq9PyQvthBF2PgtFKDL562w9UbsRNfyKWfJtCLz8rLmRjWG2KCVrxUQv7FewzRkJ
 s7SDVhoHfmH8rPZZ6KNiWAZ8F9lxgSz402MbBiq0s2LNH8nyXBWS21p5Rbhs0gQBm/I4
 9MvHurmcc+iOiQF1zhbENldKqNAzFS7fveHVKPxsS+QM6efX/VCF4GcC1pG5MAxLngw4
 kZKhE5DkfkxkpqZ2QJ+SGxztSnt1SXp/3/h5iQdn2pWGGffs8zHCRVE8iENkFczBwJzP
 6A/g==
X-Gm-Message-State: ACrzQf3aAPiohwB36lv5hr9eaZdAf67iCMYtA21Jv0c8PKSfoBHtD+eV
 M1pXGUjr2IjgcUEoR5Y2bQui7Q==
X-Google-Smtp-Source: AMsMyM6vtutTWzNeebsaS8zWBvEja0bLSFkmmPbq91SGJuY/7Kn1Q7qBJZPAxw+fymD/vnPVv+m1gQ==
X-Received: by 2002:a17:902:f64d:b0:178:a963:d400 with SMTP id
 m13-20020a170902f64d00b00178a963d400mr25788383plg.6.1664854793904; 
 Mon, 03 Oct 2022 20:39:53 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8013:3067:f071:7cf1:b2a:fad?
 ([2605:ef80:8013:3067:f071:7cf1:b2a:fad])
 by smtp.gmail.com with ESMTPSA id
 200-20020a6214d1000000b0055abc22a1absm5593470pfu.209.2022.10.03.20.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 20:39:53 -0700 (PDT)
Message-ID: <95da790c-e4f8-9d4b-d6aa-e06f4ec40ddd@linaro.org>
Date: Mon, 3 Oct 2022 20:39:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] target/arm: Use ARMGranuleSize in ARMVAParameters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221003162315.2833797-1-peter.maydell@linaro.org>
 <20221003162315.2833797-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221003162315.2833797-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 10/3/22 09:23, Peter Maydell wrote:
> Now we have an enum for the granule size, use it in the
> ARMVAParameters struct instead of the using16k/using64k bools.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 23 +++++++++++++++++++++--
>   target/arm/helper.c    | 39 ++++++++++++++++++++++++++++-----------
>   target/arm/ptw.c       |  8 +-------
>   3 files changed, 50 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

