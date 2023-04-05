Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F766D8A76
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 00:17:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkBQL-0004aO-1P; Wed, 05 Apr 2023 18:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkBQJ-0004Zy-5Q
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:16:11 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkBQG-0000Lo-Pw
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 18:16:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j14-20020a17090a7e8e00b002448c0a8813so346820pjl.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680732967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hE5+4jxQy8OX4g1DtR/5YGCgpmShLLLHKO/RbmSpKD0=;
 b=xK0hY7CIh+yL+81BaJAVoV3/1Hsgk01zENsveGLPkPKOChQgHg7mDaYiIPr4wRsAaK
 TFe4VF1almULXoj6EoKN0KXIbbctiBNYWD+9n2OAO9NGI9myA7fmjrdBSAwYGLinrZ45
 v5fMbgbThflLXrTB7XEVDKLNKG45mYT+VGkN198XhUox2hw8LxzMSy4JYptinGs88u79
 YwAdHHZ0JOV1n+vEaLQRpg7KGt/jOx1D5N/qDsRCZ5F5DcbQjsLy8UH1zKRSDACiBdcx
 YSoF0Hpq8nZBDV6NCNncpxl9TgoXKmgI88MC/tiCy9Fny7K++11xmuHUxGqjCNW65q8A
 yhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680732967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hE5+4jxQy8OX4g1DtR/5YGCgpmShLLLHKO/RbmSpKD0=;
 b=MR78uDDehDMgI9bo70QXDvD7QOgoaY2PfUTRnbVjL5EPApzNdH+otzeaBgguiuOKc5
 8L7Wx+sdb4shtJ6GbT/OIL1ToctoNGvlBtkeN3JsbEyQv1Snn5sICx0XIM57kP/kPTYf
 HbQJ/+1JLLKrAebxsB46N7vESeTYLizSXcuQzoAAG8ZkAcKVoy1Lgth9kXxrNI7Ueazy
 4zg3vvzgpQX5R7wM4q+XFGGVqElZBDMMCixVX7Cjj2ny3Rx2z4Yq6HF1G0hZJeTkp9Jk
 J2QWawwoO4qr3Q3fjt+9AjGf5noJTgogDu2QNvN3w9YOVahQj+fKDRIkhHKbJlMTw6pm
 8EOA==
X-Gm-Message-State: AAQBX9c9YEhxNAPqEOXFo4cVfFdAEOhFf+G9NfRME2Uyk5jVBHbMU4wH
 OOh7R6TBb65dqjm+MXjGF3iInA==
X-Google-Smtp-Source: AKy350YgcIuHj/wl7JLhnZrKyZgU8FlhESkipGIziM5UeIMVPZLTeuZj52moAbrk9DNfSumHurgICw==
X-Received: by 2002:a17:902:f685:b0:1a0:7156:f8d1 with SMTP id
 l5-20020a170902f68500b001a07156f8d1mr9491172plg.19.1680732967129; 
 Wed, 05 Apr 2023 15:16:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:ce11:4532:7f18:7c59?
 ([2602:ae:1541:f901:ce11:4532:7f18:7c59])
 by smtp.gmail.com with ESMTPSA id
 bb2-20020a170902bc8200b00183c6784704sm10541358plb.291.2023.04.05.15.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 15:16:06 -0700 (PDT)
Message-ID: <674f66cc-9fc8-a8f6-f51f-881151bd9012@linaro.org>
Date: Wed, 5 Apr 2023 15:16:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] Hexagon (target/hexagon) Add overrides for count trailing
 zeros/ones
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230405164211.30015-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405164211.30015-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/5/23 09:42, Taylor Simpson wrote:
> The following instructions are overriden
>      S2_ct0            Count trailing zeros
>      S2_ct1            Count trailing ones
>      S2_ct0p           Count trailing zeros (register pair)
>      S2_ct1p           Count trailing ones (register pair)
> 
> These instructions are not handled by idef-parser because the
> imported semantics uses bit-reverse.  However, they are
> straightforward to implement in TCG with tcg_gen_ctzi_*
> 
> Test cases added to tests/tcg/hexagon/misc.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h | 24 +++++++++++++++++
>   tests/tcg/hexagon/misc.c | 56 +++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 79 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

