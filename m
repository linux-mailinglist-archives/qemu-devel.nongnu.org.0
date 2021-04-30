Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B836FEF4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:54:07 +0200 (CEST)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWP0-000083-RC
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcW8g-0003Qk-BH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:37:15 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcW8e-0007cK-3N
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 12:37:13 -0400
Received: by mail-pf1-x431.google.com with SMTP id c17so14236790pfn.6
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XcSIRjlVGJpecBDsZL6t9hPOFPhzYQZTBWsX2fwtOg8=;
 b=tGZPWODHY9sJw/8Br6XbLv0kEiBps01N4FhMizhyCWa+Xj+bQv8BOIAppeoMWSeAzx
 Jd61YFdNH97AcYu2Yz0ijXP/nRqqEwt7/4feSLuFGK0q26gDEJnUU9Hv69rrixrAhjhO
 4WAyzgh1NDV1BYEXzWPmwc9ss+JrQ27qdHiX7rRi7a5Ne6X/yPjZVCpXtfU8F8cP52Yn
 xYpecBtOZdY4olGiD9YfsqWwzXZt8d3HUYfOOKKR6KhcoSlLSM0MG0/aFJn9ORhKz9sn
 z4uXaUio/qGRXQeB1sshFH2VwD++79dMd6Qu6GiNjAguuxnFxIsycX3I1UYKOLWgb7aP
 g3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XcSIRjlVGJpecBDsZL6t9hPOFPhzYQZTBWsX2fwtOg8=;
 b=RkZeZ7bLJIPDblC8LKSuc9m5lxkzyW4XKZfxXWqU1B3UtPCHzp2ZgTY1q18YWdlnWv
 D3ycHjwcozcm2RW2yDFMsWqr942ghuw8czOrt0pp4Ay8Fz1Mxg1r0y0TGOZsggdowkWl
 fwn7rsQNtzQerNwkrq/QE24ORK9yyR0bo6alBXe3DOVBOa/LZ/nYhEh2N4l6blq7Clx5
 /Nniuer/1zWy6b/rm6wLgH6GsYV8dUxClq+TlmkSnGNRI3qLLc4g0owg9Kx7F6nnlxs0
 cZI8VIXzVJhq/MAFABh1hvsU9q/eYS0oDZlRGRe6tWfLNJn9Wr+Y9olQC4Al/mSwIqCg
 8wvg==
X-Gm-Message-State: AOAM533Ty/ajYa4j+PUQ37P5+vgbM31w+4bcHqkCE5PPsXppbtLRReil
 hjNkvzDuHoRheOhnivufjnjnIrqxgDGgGg==
X-Google-Smtp-Source: ABdhPJyMg6LmElAO/yfq3/C/ZaTVbNF0ZDtVRd6xexkLOQfrOUQs4zjpgwWz+8rRtpWQhw9z8fKNBg==
X-Received: by 2002:a62:ee09:0:b029:247:56aa:dfa6 with SMTP id
 e9-20020a62ee090000b029024756aadfa6mr5600976pfi.69.1619800630491; 
 Fri, 30 Apr 2021 09:37:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j24sm2426224pjy.1.2021.04.30.09.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 09:37:10 -0700 (PDT)
Subject: Re: [PATCH v2 05/13] target/arm: Move gen_aa32 functions to
 translate-a32.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210430132740.10391-1-peter.maydell@linaro.org>
 <20210430132740.10391-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <210a5e3f-9083-0d90-cb88-7e059ec446df@linaro.org>
Date: Fri, 30 Apr 2021 09:37:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430132740.10391-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 4/30/21 6:27 AM, Peter Maydell wrote:
> Move the various gen_aa32* functions and macros out of translate.c
> and into translate-a32.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h | 53 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate.c     | 51 ++++++++++++------------------------
>   2 files changed, 69 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

