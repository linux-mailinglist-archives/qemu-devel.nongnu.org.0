Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7543CBA95
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:31:40 +0200 (CEST)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4QkV-0002TK-CC
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qic-0001UO-T6
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:29:42 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qib-0004b5-6e
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:29:42 -0400
Received: by mail-pl1-x633.google.com with SMTP id d1so5583124plg.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nz6GLT1S5L2KFeboK4KPSNELzhbgKvuuamaB+ASn5Mo=;
 b=VS8bRFZxvCMpBFK66x3uldrXIlHR9PBwFRKAnF/yPl/FeUJpFY+loKQF4lm21O7UqH
 87+slxaH5m+Q28HXpiHbtxMggmChde23CY4eN+bxRJfNday+AvP3MRzrHVvtCDBM1snU
 mXi4RX/ROfnvCG/5JlN7XTah1OGXJdqNQINc7S8qv+PrIxwYd/+0HALvUD4ajShOB3YD
 X7min44kHfPEizrYgLi1DJceDsSIKjx0iUy/diOwZ+X5otj0z9g5M1uvkHHedRC3Nphp
 eX90C7O5OV9nGueg7ysv+EAUSB+slfrtHQTcWFp3Bv+ebn6eavbZ++x543M3fGpb4JQ1
 YSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nz6GLT1S5L2KFeboK4KPSNELzhbgKvuuamaB+ASn5Mo=;
 b=VR4lm/X1Rq8mICU47b9612vYpY4AOElZdPvZRR6yTK2s0CiL2BndkL76CwtBQA+jiK
 Lkt3MiVMQaBeNVw7smYpoblonf7CTZKCU5AjzcjVKG7UAN11LFm7026oBioCCn9gW2kb
 UjYuJ42kv1SbfsAEWBWHdJ66FGxgvdYh+Q7DsV0pl89zDdU7on+QlTKiaKjAyLL5wral
 8JqWKQJ5cv/97mAkBhycX/iSJ46VaCdZddYZ9rbmt88NZFCX8RetXhKTR4KvK/RpqQjm
 jwZyScmQpOoGgm+N6Ajd72l4lQxWkhmD7wD1qyjqyyJqcgGkFgFuxxKZJ6/PmS+wkq31
 D2Tw==
X-Gm-Message-State: AOAM5335aGO1teQqtyY9O180KBBcEuWpwDXlB2cIIR9lMYCZtes6Ggls
 5VdLML0dMVwyx78ftVjTEbRFHnjqyI0Vzw==
X-Google-Smtp-Source: ABdhPJxEhyDq8ULm6Y7fP8oof7meDM2JYRXXsDqbLGAXzxtRjUSzsCv3tWQx4nr/2GIyq/trwZ34FA==
X-Received: by 2002:a17:90b:fd6:: with SMTP id
 gd22mr16550360pjb.37.1626452979676; 
 Fri, 16 Jul 2021 09:29:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i13sm1990127pfr.79.2021.07.16.09.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:29:38 -0700 (PDT)
Subject: Re: [PATCH for-6.2 05/34] target/arm: Fix mask handling for MVE
 narrowing operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fd384a2-1fd0-42b2-6adf-14ace864629f@linaro.org>
Date: Fri, 16 Jul 2021 09:29:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
> In the MVE helpers for the narrowing operations (DO_VSHRN and
> DO_VSHRN_SAT) we were using the wrong bits of the predicate mask for
> the 'top' versions of the insn.  This is because the loop works over
> the double-sized input elements and shifts the predicate mask by that
> many bits each time, but when we write out the half-sized output we
> must look at the mask bits for whichever half of the element we are
> writing to.
> 
> Correct this by shifting the whole mask right by ESIZE bits for the
> 'top' insns.  This allows us also to simplify the saturation bit
> checking (where we had noticed that we needed to look at a different
> mask bit for the 'top' insn.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

