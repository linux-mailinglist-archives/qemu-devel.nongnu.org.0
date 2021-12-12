Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22478471BEB
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 18:38:29 +0100 (CET)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwSns-0003wS-8J
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 12:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSk1-00022L-EY
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:34:32 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33662
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwSjz-0002qk-Cv
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:34:29 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x5so13075672pfr.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 09:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2q3FOjs3OFD29z+I+RnET3LJqbFDCsg8vnKqytoBMz4=;
 b=Iblrj4RZ6oqYoZ8YAS2iRR3hYsRVkFItwb1VSv/eLyLO9+TwOki9QmLgKMKrENebcw
 jKzqIVfkJq1L7Pzw1I8OY+MX1Mm6DVkEPYtDkQoRQ5hnYVNRGPBBN9DGkzjm05bEYtFh
 hQ1koNw9TDfSyb9Fs4RuqKhhLHAam7Hobb9+D1B7GPzjKluIUoHCsKWbpTCjRanBztXE
 QWguSs7pen2BS2IZASw4/u/nrTeZdBlii1/8PP3BX7sso5c3+cTRIAj2+wwIMP5R2q9C
 w2YFBh8rx8fSHJyEWF4qpqJ6dQgRpTqC+pHTUJ3YZaF4RUAoMsRUNyoePsiIPVtGWz0E
 8gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2q3FOjs3OFD29z+I+RnET3LJqbFDCsg8vnKqytoBMz4=;
 b=LbOpqQhkil7ejmn6WlaZla3AmKtexEp33kSRcmFoaH46qpL4Y1sAPKgJBdAbqI4pQT
 O8Bq6P6xDJuDxBK1k7lLLzLOGkwCiPva9NLqb321BS1EchT8iObzAms0dTrvPKf8GIrm
 gYOilZlL1wCr6PMWlI7svMBTeoQobUr/R6ohJMfhoMuvovAUxFSWgyLprOOZPMEwJSXx
 IZyWVLhVLmDLTyivc+IAsvJfDIuKdm5KCYIfg6ZS/M3Cd/Yzi2ZAKzJIHfkBlOPoCrEi
 IPMhdhOVjel2t9XTLACY2R4bZqpL+paeF90wqKgdY4di8Z3+ES89Qpf7Im1zRfj1z/1O
 tHLQ==
X-Gm-Message-State: AOAM530nlGkJkBtRouwCrkmLFvUIv1Tp0oGB4iYwJ2KTCkrn3YpxM2Cs
 piv6T/e/XpI7GG+inP8HufWjKQ==
X-Google-Smtp-Source: ABdhPJyOHJmmiuwXn0FtJscrY9f58sRAUvg/dyIXfJbRhtA2RM+yUjpac40DjLHR7wZfT4wPycVIqQ==
X-Received: by 2002:a65:464a:: with SMTP id k10mr42759173pgr.199.1639330466210; 
 Sun, 12 Dec 2021 09:34:26 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 12sm4578513pjn.16.2021.12.12.09.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 09:34:25 -0800 (PST)
Subject: Re: [PATCH 03/26] hw/intc/arm_gicv3_its: Remove redundant
 ITS_CTLR_ENABLED define
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee046585-e571-a466-428b-91e2344c95ee@linaro.org>
Date: Sun, 12 Dec 2021 09:34:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> We currently define a bitmask for the GITS_CTLR ENABLED bit in
> two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
> R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
> everywhere and remove the redundant ITS_CTLR_ENABLED define.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |  2 --
>   hw/intc/arm_gicv3_its.c  | 20 ++++++++++----------
>   2 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

