Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A323A0661
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 23:48:06 +0200 (CEST)
Received: from localhost ([::1]:56120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqjZt-00046h-UG
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 17:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjYu-0003GI-4w
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:47:04 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjYr-0007OD-Rc
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 17:47:03 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso135538pjb.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3+oc78g596RRtIkpQo8jMgxOX3x+FtFo3EtiEpvJKaQ=;
 b=niCeFLGTT2p+n9B72RDthM7SRI60PZfhP4gnjWrBueijpQYRej45PJwh1dOBs92TnJ
 RzG/Ofn6WHAwAUGPSD4s+7q9317ipT7vPMabBd612cTM/H6mZcX+Zv/NVFnq8//q6D/d
 r5CLLhaSAeEOL34qO+qqtBCp7NtciTIfyQlw056bOhJ2l2hpj1MbAssjiUcIosugZ2Xy
 yylE+6mKQR7QDwKvMtoo+73L2yy9FeTYplRDOQUp3PdQ3+aw4KUy72E4fzN3tbzsQK/B
 HJqMP87Z88l+LWWRGcQ/lRYJJOrJzRimldrWvMIgEZ0J3W4hDlhN2i1M1XHhn7cSWWjy
 kHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+oc78g596RRtIkpQo8jMgxOX3x+FtFo3EtiEpvJKaQ=;
 b=O9tZBCKc2h2JUmBp191GsjAb1Kx8mIEGCXFrWs2G13a9T00C7JH3XU8eR2h0514DPC
 Uj8bEgumwOSU0ArRTeYeDQWOhWXt2eT8WieRJlxnDuHvIcFzNA/5cYo8IMvmso2nbOJi
 Z2aPQimXPMr9Kmxrl9KZra8AaRru8zuiVNvh+DA4H/YZBx6yXCgBGDr+0dPEkrmws188
 byoKcbIu+lQiOsgZLMzmpohjo/NhvgzHYFvXKXIjngHGL08afZ1EtfWWti2Xhg1N4uO/
 kvrvpPslHYQXDkMZydzmi016ijrId57aNnAwFA4mtHd7tQoICloQUI2lZiuZ1TGcQrIi
 EyUg==
X-Gm-Message-State: AOAM533T1Gy2OoQipnOMrpKjsYH7cXO+Bdo4nrFg/Q2NuxXCj3tEYB/X
 VuVaRp/pHhFkc/AnzpoG+2r1hhDCwMjh/A==
X-Google-Smtp-Source: ABdhPJy4K+0CM7FMm0WOOomjjQcdcwVJvO1kD3UbTKjNHVhgclIfNiUq66G1Hp/2b2vVwSTmVtju/w==
X-Received: by 2002:a17:90a:d30a:: with SMTP id
 p10mr28739610pju.104.1623188820462; 
 Tue, 08 Jun 2021 14:47:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b15sm11658744pfi.100.2021.06.08.14.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:47:00 -0700 (PDT)
Subject: Re: [PATCH 12/55] target/arm: Implement widening/narrowing MVE
 VLDR/VSTR insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f5a25af-9a0e-a877-bbeb-c2a09a0a33f1@linaro.org>
Date: Tue, 8 Jun 2021 14:46:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_VLDST_WIDE_NARROW(OP, SLD, ULD, ST)                          \
> +    static bool trans_##OP(DisasContext *s, arg_VLDR_VSTR *a)           \
> +    {                                                                   \
> +        MVEGenLdStFn *ldfns[] = {                                       \
> +            gen_helper_mve_##SLD,                                       \
> +            gen_helper_mve_##ULD,                                       \
> +        };                                                              \
> +        MVEGenLdStFn *stfns[] = {                                       \
> +            gen_helper_mve_##ST,                                        \
> +            NULL,                                                       \
> +        };                                                              \
> +        return do_ldst(s, a, a->l ? ldfns[a->u] : stfns[a->u]);         \
> +    }

static const on the arrays, or array, as before.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

