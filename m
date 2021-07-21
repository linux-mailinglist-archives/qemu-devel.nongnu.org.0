Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E352F3D1961
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:47:49 +0200 (CEST)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6K4C-0000Yl-FO
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K1i-0006bE-JI
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:45:14 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K1f-0001bi-Bv
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:45:13 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so2613833pju.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=buq7FDD3KZ43gB2YDId8Ok5h3xwtgLW8DgxP/2wy9bs=;
 b=Zvdyr0nf7L0It1wiRd1+FjBEoocmNcbpg05n0QoQYqb4fAHuXEHegVefKWZDDpP137
 3IE4pmuDtBvAVqm8/Euoq9hfVOFfcGtWwet3eaY1/++MjziQqg+vyEK7RrhicZz3ncoV
 2i2ls9EJV5j2+D/MVi2UUeVkXD26YnO/g0yqlS3KKDXGxDRfEAlAzhJ73VMn6kqEwO06
 22ohp/gREa8bSkLS4px6TEMvzPRVDgMIb1lGzMl4P7YMEkZNh4HqLsLzdvR3iBChZCsC
 vjygUX46W816hqa5/vzGXuUqB2gk8Nbqs3ej1LiE5q/Bv+OklG2JSQnn6l1Dmoe2ayL6
 vaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=buq7FDD3KZ43gB2YDId8Ok5h3xwtgLW8DgxP/2wy9bs=;
 b=WZ2mQLJinl861XRHQRRBnfh2ooUyGeKBGoYQRLNFVdu4+8mjMWRABIztoCw/Xb5naH
 9JpiNB7yyVO+KcFilDivXIe/zZkm4diTHFM3YkfEiyJBuyPDIF8iZlT3L3G0Pm0e08L1
 YrwDDVOcRjQHUrTY9RNeVDH/tXEpbW9iFmGtavmO0Zjjuh2fHG2cXgUPd63QOQfh0AR8
 uyYnlEtuZb1gsN5nIQ9CFiG9Ua4Lazt42oUteSpgtKZ170KCPaMO41pM03wA4VRkphmd
 CmgNFqP4JjsYHq9GnlKNsuB2SNSopKGzPM93cepfCkmelkYaWKrfX0q7WMEPloNfyIWf
 AFzA==
X-Gm-Message-State: AOAM531p3tGyXIIJxwxtrKhfEGOB8aLXnFZDmNI4F+ZdR1yOhoDXCEfR
 TyGUxz51GUHXliqSd0W3F8OWgBkoG1YeqA==
X-Google-Smtp-Source: ABdhPJw+4c5TFFqfS7fjaRMWgiXowdEcL2aAc8b8vAjRBJmizR4t03WUJFDfY4vnH04aEGBDE/xadA==
X-Received: by 2002:a62:b414:0:b029:317:52d:7fd5 with SMTP id
 h20-20020a62b4140000b0290317052d7fd5mr38719290pfn.30.1626903907213; 
 Wed, 21 Jul 2021 14:45:07 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id k8sm31688977pgr.91.2021.07.21.14.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 14:45:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 22/34] target/arm: Implement MVE narrowing moves
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d43270a-47cf-cfba-676f-e90958216ae9@linaro.org>
Date: Wed, 21 Jul 2021 11:45:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE narrowing move insns VMOVN, VQMOVN and VQMOVUN.
> These take a double-width input, narrow it (possibly saturating) and
> store the result to either the top or bottom half of the output
> element.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 20 ++++++++++
>   target/arm/mve.decode      | 12 ++++++
>   target/arm/mve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 22 +++++++++++
>   4 files changed, 132 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

