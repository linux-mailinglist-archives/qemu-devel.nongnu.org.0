Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB553DBF57
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:02:35 +0200 (CEST)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YiI-0006N7-RY
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yfy-0003hg-BH
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:00:12 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yfw-0004s4-1E
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:00:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id ca5so16747490pjb.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Sehry0BQkrQxk/mPXpFuQxFtXwBOUZhi/xa0ULIHiMo=;
 b=GB+Qf8j4EIVwaQONv6//GbiQPsaFxdegJW2GxpvlG73XXCn/JQQjuA6fbryzCTEh5M
 vaA+T1A6CICFcc1mblIQdDZPo6Msetd5+8at7ZnhbdRMPnKoB9Dv16TYdqJzZtPFG+oS
 rX3F6Pb/fpvUQV6GYSmcVENTtXMJHVwTIyT/q7MNsADUodcKjXoSA0WexK+dNseGpiaf
 ADoWangIRyJ9oLPl/h1QYuRTOKKFBGXioA0Zfj0rtqpQhSfuCHWvshEI5ht1+ZDOkf+S
 UUrFhKPoSfeiVdc48W2/wqf3Fov8YQ2mIGuMGtt6mD55XIgGfzApPSbrs84t1SiVAp+Q
 u5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sehry0BQkrQxk/mPXpFuQxFtXwBOUZhi/xa0ULIHiMo=;
 b=KtWhHm5qFsjkjAsqjTMoFsZ6ZmZqKxHvToZ9gttv5ZvUizONxitsndu6dN+T29QK40
 0u37fj2pwvZ1uk8zUs2RHTL1FVotIipK3i5etQvZGbe6prm9Iq4D8zh/aV1iaMMVNZBo
 NDR5DS1IqPGdwHWsXkxAsFBWKhwX3wOcmJJlrCRNPfJVb4SopYeEd+w3hGeH4FTT2XLr
 OTr7e5AKm++I4CG2CTDt42MbogTEVdX8JHx++obI9pSumCjjLxxn2Ex6Y+4rZyNRxKmL
 V2MxIf6wPh1NCEBQCCG96bWmubHDCxilOcJJ6IEvn2pIbDYI4Uc2KoMEs+Zq/eBqFfqG
 b1Pw==
X-Gm-Message-State: AOAM530FMWl+JNELF8fuEu5e8PavQnQY6snZF0duKbDGDFKylLowEvHa
 XNscn1GnD71X6C6Tb6vrMcmHXd/yd4FCgg==
X-Google-Smtp-Source: ABdhPJxGdn/Iq1A+KTfq84k/HZkB45IgwpdHRNzviUT7j4T+c2ExVGIUMsa3cAz8fJlORECmUTjCbQ==
X-Received: by 2002:a65:6a4d:: with SMTP id o13mr1743757pgu.361.1627675206351; 
 Fri, 30 Jul 2021 13:00:06 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id x26sm3303870pfm.77.2021.07.30.13.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:00:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 44/53] softfloat: Remove assertion preventing
 silencing of NaN in default-NaN mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-45-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d603e08-9f6c-896f-2ad9-8b5c06291767@linaro.org>
Date: Fri, 30 Jul 2021 10:00:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-45-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> In commit a777d6033447a we added an assertion to parts_silence_nan() that
> prohibits calling float*_silence_nan() when in default-NaN mode.
> This ties together a property of the output ("do we generate a default
> NaN when the result is a NaN?") with an operation on an input ("silence
> this input NaN").
> 
> It's true that most of the time when in default-NaN mode you won't
> need to silence an input NaN, because you can just produce the
> default NaN as the result instead.  But some functions like
> float*_maxnum() are defined to be able to work with quiet NaNs, so
> silencing an input SNaN is still reasonable.  In particular, the
> upcoming implementation of MVE VMAXNMV would fall over this assertion
> if we didn't delete it.
> 
> Delete the assertion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   fpu/softfloat-specialize.c.inc | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

