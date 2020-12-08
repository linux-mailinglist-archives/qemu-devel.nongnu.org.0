Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4A2D35A6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:55:46 +0100 (CET)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkxV-00082m-Vm
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmk9p-00088H-Hk
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:04:25 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmk9m-0008VT-DA
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:04:25 -0500
Received: by mail-oi1-x242.google.com with SMTP id k2so20917004oic.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iXihmzK9lAlZvW8uKEFpJT0zEvm0irx64j4KcxO0Ocw=;
 b=o/iafnMcLJoUp9rjsRj71YMK1S7UMkz7Fq0R+1Wxfulv6J60zq04RC4HSwFaysXnMf
 zwzgYgmPaNHCfLQiI4M2++zFxhBKS9GJjBVGi7OnKnZAGl5a23J/042/thSEhWNujI4M
 OV1CGYMQDkiNQONg0pYNvEuZ8IHC+W/N9fcZBqQNz7ODi4EbTdhZLz3iDXHAeqg9UfF/
 fTXVeUF/ZwUW5z6Ddp4HNIp0zBlLlnDRF1xLgPymkUfCpzfBufCua/rRKcBQjZVClo/z
 B78v7OQFeXNab4zTV8Me5t5yBA2Y0pCDI8ZP8IgAvoolLQ+UezdL9kBpZGvd7oI0cxoz
 Onog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iXihmzK9lAlZvW8uKEFpJT0zEvm0irx64j4KcxO0Ocw=;
 b=JvY4ZvN9BZYNvlK1RCVY06ffv4epHmZI95IKN9dtcW+viRXr8X51hcVe/VS+oL1OyQ
 7UYQ+3pak609C6A+UiBXnmHcPopOXRII7xA2cT2r7d+F1ZYNQAj/mh8B0wjX5DHG9A6C
 nucy//yPxYkxqe8aTZK3PtIqMnsx7MPDNl573vvcXdWtnAsiRxm1FaHfMq8hTLJXOmSJ
 WWq0aqttRKLLIMz4eSeBLZleb6Js733D/eSpSXbGWC7xyTOmf2zabsf8gwc3VzYsGCIF
 WVfKfCmIyOzfVHm4jji9qqtU3NWLONMI1MgM/23JTMTCBR+jI/glSjOW+Kqm3kwsDl4F
 Y+2Q==
X-Gm-Message-State: AOAM533/83BzSXFdF4SHCrvaFaKCO1uO09wvKp/H53M3+J83aE2a9ToM
 Ml5TIweZuORcr6OR16Q/r7RNyw==
X-Google-Smtp-Source: ABdhPJyCospKak0di40fkF9W2sz8Tik55pSV8ZCwn3nl7RVYsSXj3uVitmaczSdOqcvPMBRnN9PEHw==
X-Received: by 2002:aca:edd7:: with SMTP id l206mr4163894oih.99.1607461461156; 
 Tue, 08 Dec 2020 13:04:21 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s9sm3655168otb.6.2020.12.08.13.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:04:20 -0800 (PST)
Subject: Re: [PATCH 3/4] target/arm: Fixup SIMD fcmla(by element) in 4H
 arrangement
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
 <20201207044655.2312-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <689477ae-0758-01d4-f0e2-d4024537527d@linaro.org>
Date: Tue, 8 Dec 2020 15:04:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207044655.2312-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 10:46 PM, LIU Zhiwei wrote:
> For SIMD fcmla(by element), if the number of elements is less than
> the number of elements within one segment，i.e. 4H arrangement,
> we should not calculate the entire segment.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/arm/vec_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index 7174030377..44b8165323 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -544,6 +544,10 @@ void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
>      neg_real <<= 15;
>      neg_imag <<= 15;
>  
> +    /* Adjust eltspersegment for simd 4H */
> +    if (eltspersegment > elements) {
> +        eltspersegment = elements;
> +    }

Ok.  Maybe better to fold this back to the initialization using MIN.

>      for (i = 0; i < elements; i += eltspersegment) {
>          float16 mr = m[H2(i + 2 * index + 0)];
>          float16 mi = m[H2(i + 2 * index + 1)];
> @@ -610,6 +614,10 @@ void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
>      neg_real <<= 31;
>      neg_imag <<= 31;
>  
> +    /* Adjust eltspersegment for simd 4H */
> +    if (eltspersegment > elements) {
> +        eltspersegment = elements;
> +    }

Incorrect: this function only computes 4S.

>      for (i = 0; i < elements; i += eltspersegment) {
>          float32 mr = m[H4(i + 2 * index + 0)];
>          float32 mi = m[H4(i + 2 * index + 1)];
> 


r~

