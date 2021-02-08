Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC441313506
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 15:24:43 +0100 (CET)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l97Sx-0007ek-OJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 09:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l90mL-0006x8-C7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 02:16:21 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l90lx-0007Qi-EL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 02:16:02 -0500
Received: by mail-pf1-x435.google.com with SMTP id 189so109119pfy.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 23:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U9J0odMXqIcgpzH0r2zBKAhDkyyIlqU8QMWpCkoNNDs=;
 b=bZ/UpFCe1EgLSITUc3S5tgyHCd9N7NBUPSxKXEYdBBIBiZLxsEGVY6mzYssb8rt2Pf
 Vwh8XcofZSz8olvr2JRsDzkBhyco/FpiTHV3o58DVXLKf2gJoB4nB694f0nljH2f3LbW
 gExdhz5SIYUV2D/+xFVmUf5gCaa/FGtMkKMRQwnS5dAP36qRonn5zgOgTi4TwBlWdBA2
 e2buvrusNRaTsYX8ZowKoIQJrXZO+a8VfTe1m1KbnIXxFLexW3hVIt6A8QtYpftuyH+L
 rFdJrIgMUuLNWTTDJBp/d3w6Ci2qGfTLhhxcWo2q/9zzm6hSjYZfJhTOWNR+E66A6NYC
 rr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U9J0odMXqIcgpzH0r2zBKAhDkyyIlqU8QMWpCkoNNDs=;
 b=OZUyoKAi1FebVi9XZ3z8sLVWJGzUG8s6EGV3xoBd9svJOpyJnGfeXrMVtrj8yI2DGr
 q+byuBqdb815pxIKW6zuErH08QDm0si6iAiimIV4O70VTr7j5ugTu79UMxE4mETPp9q3
 9494SpZton7zMBsIAqOfLDZoulHFj0o021Twip7A8IELI7+t4Fjmr5zYrCb4rIGACmxM
 c8AtjG6bTOjPn/qXZae1bk8bR38qCLnETJNVQF8tGHWwwRgJ0GVnrkWAUmzgp6E32JJC
 wnliI/IhEuuKmgAD0/IbLPW1waTtQjW2sQySx+BIZIM1XUE5H4XnKg4m4w+hKzJwm+nh
 oXDg==
X-Gm-Message-State: AOAM533ksdQ41EToW+yAe1WB4MnHCUNBeMUUp0UGpd94BMDRnPhov0ys
 q05eYeFQ/88wSW/zCr6nqTSkpw==
X-Google-Smtp-Source: ABdhPJxmhW/m6oH8PQsRx8zCZ/Ucd4euABshpUWho4OVHZbHxVBnNoySxr4Ahhj3xJSdE0pCGxCovQ==
X-Received: by 2002:a63:c10:: with SMTP id b16mr16437611pgl.326.1612768533189; 
 Sun, 07 Feb 2021 23:15:33 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 e3sm16946621pgs.60.2021.02.07.23.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 23:15:32 -0800 (PST)
Subject: Re: [PATCH v5 2/4] target/arm: Support AA32 DIT by moving PSTATE_SS
 from cpsr into env->pstate
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210208065700.19454-1-rebecca@nuviainc.com>
 <20210208065700.19454-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4549fd4b-ae6b-3a6f-80ce-5fc7c4317961@linaro.org>
Date: Sun, 7 Feb 2021 23:15:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208065700.19454-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 10:56 PM, Rebecca Cran wrote:
> cpsr has been treated as being the same as spsr, but it isn't.
> Since PSTATE_SS isn't in cpsr, remove it and move it into env->pstate.
> 
> This allows us to add support for CPSR_DIT, adding helper functions
> to merge SPSR_ELx to and from CPSR.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/helper-a64.c | 27 +++++++++++++++++---
>  target/arm/helper.c     | 24 ++++++++++++-----
>  target/arm/op_helper.c  |  9 +------
>  3 files changed, 42 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

