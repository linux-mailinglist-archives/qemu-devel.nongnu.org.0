Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A849C3CBA8D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:28:50 +0200 (CEST)
Received: from localhost ([::1]:39848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Qhl-0000dz-Hn
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qgz-0008CO-RT
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:28:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qgy-0003Qz-Al
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:28:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id p9so6725584pjl.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rXPIG3xCGF57HocfI/Q62h95ASlLTxwHXrO4JHTtXhw=;
 b=L3i4C4YGvL5Mo1x5Dbu/rLdXV22IX9HUU+1ngb75VoYg+gXonQrwkkk+bEEzxDD57i
 mvb0hA0w6TNaHSeWhoWtPrRgGMmlo9BfaGqcpAAmVIFj2W/2CvLbcgjnwjsS/V/ctiXF
 optE4voDpVUbqIt/iVpdTUVEUZfXGSVP+qp7T6+z70+rTb03SskqPMXVAkdo/FG5PyqC
 5gLtESS3aqfrnuujV13hDZP6V2hKBANT9Hi0OxxgcwKEtFFfmpf65ZcCVKEBL7BqyXOh
 knv+iyLXgie+OkRni7bwAGwO2lvGxzxJxUtTFTtHlrccIY2Ti4wLMOBGzheHIyEpA7ki
 2cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rXPIG3xCGF57HocfI/Q62h95ASlLTxwHXrO4JHTtXhw=;
 b=GlCaFpBIt90D7EiBg7HBBOoBRWQ8VE2x0QBtIWmsd3Ulp0insbtAVHDCJTi7GUKC8A
 3RL1L/RalBie+cM9pKKCF1lrJ6v56xYq9tIk9opEh3pSvHs2bR8YWjVEIL8o36mc3NF+
 a+VKSPd+4VypxAVK5xG2ZZr5HpzKZHOHNsznsSK0wphxKOMY580DhwFhv/P0nZqwIPlc
 Hs76ZX0jZRze071dDtwPKCBy0QMwD4ljOMgMRuASVEyUZuUBMBKK4Eib0k2Q026qUP02
 8XLhZqYZ9Ywa6bjzo9aDeZLMGa5Vx/bWJZnt8KWnF79zJmds3PBs8VkMrGT0nuMlbFrh
 sC0w==
X-Gm-Message-State: AOAM531YvklGGEmDxiABRwV3Vb1vGZiIZo23e0yVAqapZO407C1mcW8O
 JA0e2O/p+xWPGllR+ZhkzldSVqrjs7G4nQ==
X-Google-Smtp-Source: ABdhPJykz5NVpxzArkpnPckk3JxRssNU76bfppX0B3SGAWxr6dTZhQq3KXuJXVbmzOQk9zFkHlKkEA==
X-Received: by 2002:a17:90a:5b07:: with SMTP id
 o7mr10825783pji.35.1626452878785; 
 Fri, 16 Jul 2021 09:27:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b10sm10506850pfi.122.2021.07.16.09.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:27:58 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/34] target/arm: Fix MVE VSLI by 0 and VSRI by
 <dt>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49e5cfc1-518e-78dc-f212-558b69a39451@linaro.org>
Date: Fri, 16 Jul 2021 09:27:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-4-peter.maydell@linaro.org>
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

On 7/13/21 6:36 AM, Peter Maydell wrote:
>           if (shift == 0 || shift == ESIZE * 8) {                         \
>               /*                                                          \
>                * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
>                * The generic logic would give the right answer for 0 but  \
> -             * fails for <dt>.                                          \
> +             * fails for <dt>. In both cases, we must not shift the     \
> +             * input but just copy it to the destination, honouring     \
> +             * the predicate mask.                                      \
>                */                                                         \
> +            for (e = 0; e < 16 / 8; e++, mask >>= 8) {                  \
> +                mergemask(&d[H8(e)], m[H8(e)], mask);                   \
> +            }                                                           \
>               goto done;                                                  \
>           }                                                               \

VSLI is d = op1 << shift | (d & ~(-1 << shift))

for shift = 0 does result in d = op1.

However,

VRSI is d = op1 >> shift | (d & ~(-1 >> shift))

for shift = 32 results in d = d.


r~

