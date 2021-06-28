Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02A3B65D2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:38:32 +0200 (CEST)
Received: from localhost ([::1]:55402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtLD-0005g0-AZ
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtKN-0004kj-13
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:37:39 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtKL-0006um-HQ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:37:38 -0400
Received: by mail-pg1-x533.google.com with SMTP id w15so11233442pgk.13
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=k9o/wcTqLiExTV0kzExT6vRG2A9c+1Sckq8SZoWBLUg=;
 b=QbXra/PkydMy/8ASbd1MoUE6fYSgQtOFYeEbIgb1pix90CySG+nMCtmOqAuRe6vRk9
 R38qIcUcdbNe4b2y0PsD6eH8suu43IaPbZy2PaTsSN0NSjd9ewMBhOqvo149BzwiGT4P
 d7SVimSpmvEgL+MIOsosabv8VsK5HWL0ZkRIiT0Ufb0+KlSrfVvnU32M9FK2ZhBkDWp4
 RSQh73LaI7eyuGXe/5XIjAZ1l/NT4WQu/QuJAmQB6XITDxDwfD497Gb1asUcXM3sSIdw
 sljZLkcKJoBUAHCz7ku8huQ5gu8NPp22cJu7rt3pUml8W56TACKnK266JCcn3ZCZmL4V
 DJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k9o/wcTqLiExTV0kzExT6vRG2A9c+1Sckq8SZoWBLUg=;
 b=f3HT+Mw0dRRpYKHNCdDQWYGEipFkRdFvX8clrkx8CloaotzX40mvqCgUJpm8qQrZel
 phvHffh6my5/we0s/+giKVgTysFjGyRHe/lx5UNSCoJEuC4T9ahPRWUCxe+5/mUlIQWp
 Jfy8Bmc1V+fUcYqAR7oPijw4jNxpUP4ydCPmgYFa1Bd+0CwadtUA+olJ4WYTKkopjwOQ
 VvGahD/IhLzc631ClbUcAD7mTW0CWFtF9RiI4mdfSFTohH8drq7Ml7yeSFxLfV/W7gJv
 6LD9tqn65Yq76yuM+vjLL0Xctj5VxmE0S9Q1Aa3HVUrpSKMZKtQixOHoU3xVPLIBIg+h
 WxHw==
X-Gm-Message-State: AOAM530qRwCebDj8wnD3jd09KRjinsQWm8yhIaAPvYXoHKQc2TU9gl37
 Xiyvs5HNjSEcXx7X9oRvfXy3VUSsRpPw1A==
X-Google-Smtp-Source: ABdhPJxbz5iP8g8z3eqixtTfwAyG5mTqRlHubjlBYR+GOrcsdswIvmEhdYwKlvjF0sidkNIT1Jx7Yw==
X-Received: by 2002:a63:2258:: with SMTP id t24mr23643763pgm.357.1624894656111; 
 Mon, 28 Jun 2021 08:37:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z9sm15099935pfc.101.2021.06.28.08.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:37:35 -0700 (PDT)
Subject: Re: [PATCH 06/18] target/arm: Implement MVE logical immediate insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <378b42c0-ee2d-d293-4050-612fb7b1a0a1@linaro.org>
Date: Mon, 28 Jun 2021 08:37:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE logical-immediate insns (VMOV, VMVN,
> VORR and VBIC). These have essentially the same encoding
> as their Neon equivalents, and we implement the decode
> in the same way.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  4 +++
>   target/arm/mve.decode      | 17 +++++++++++++
>   target/arm/mve_helper.c    | 24 ++++++++++++++++++
>   target/arm/translate-mve.c | 50 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 95 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

