Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923143F3415
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 20:48:24 +0200 (CEST)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH9Z1-0002Xr-7v
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 14:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH9Xu-0001sN-QS
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 14:47:14 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH9Xt-0005KR-80
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 14:47:14 -0400
Received: by mail-pg1-x534.google.com with SMTP id s11so10064344pgr.11
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 11:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gd5FWMD1UgmnnMX1OdePraI582nSBgKpwig7agQqpf0=;
 b=ceb4DL5IhaUItYRD2XpBZIt+BzjDPLsgS2VyIQceWc9+D+8uFtoeDk/zoK6FhNRCZZ
 6WuroOz2RKl2f72IsHSog4Fv1MpUG499AjHby7TaMPo5a5IZx2t4XNv/qnVhbMHbOk1A
 Sf0Rb/cor6kRT2GBENiHux26s2ipV4cY4JsKckNZ/PGWIoiUx7skMnGPniELrJUoIXYM
 Fz8bLT56Qo4xtqmo6tu5kmYwGg+VjbJqoFhP7LBImanjtgzZB0UYOwscyP+5xhBOrNPQ
 ZoQFmjKYegSM8z2AovTsR6XsDb0ql66MUCH76o4V4R5xOwSWWmom28VJbgZiK3ZeixsQ
 lyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gd5FWMD1UgmnnMX1OdePraI582nSBgKpwig7agQqpf0=;
 b=bPl0Htr3VQZ8oJH+cYM2k5sqLoiPOf30tGdFK4ms44XC4yJp0HcuUwnR/M7OrgQ+kv
 6iRu94nK+1o1UhMcmk1WlmXac5f9idEyUhVz3WYaulB2fSYa5MbdV3j8jDu104FhIAMv
 YtdoypGVDGY/qdMixppV/2u4o4ZESmabESspye7LqPgla/X1RQaw/5b3zsa+OpVyvKan
 Ev8axKHg0ndYtqqtblmcsBhFWBE5sTWOcyF8bvgOQ4EWDUJJbFcvIOJeM8dGyMTROO9J
 T4eFtKt2R39Pxno6M1B3YODss4gA0JRXXoOM9REhIMS8LMek3drPikCtQZcCCqEKh2x8
 dm8Q==
X-Gm-Message-State: AOAM531ziTlVIwCbqMl25FHPkNdqc8CD9I7Yv6tWGhunwn8LRkMdteG7
 qRQLwPtAf8FYxazWpHNIQbezFvGJ4jy95Q==
X-Google-Smtp-Source: ABdhPJzKBobUxf0ISz31BvtQq6KO0s5Bd7jIeWvapQ25/deMAP50WDkEhYSONlB++DL8UBD3co3jhQ==
X-Received: by 2002:a65:494e:: with SMTP id q14mr19902100pgs.314.1629485231592; 
 Fri, 20 Aug 2021 11:47:11 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id n41sm7946086pfv.43.2021.08.20.11.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 11:47:11 -0700 (PDT)
Subject: Re: [PATCH v3 13/14] tcg/arm: Reserve a register for guest_base
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-14-richard.henderson@linaro.org>
 <CAFEAcA81XmmHFtVfA9U307y5D41NzuHZNTFXgHe2-1Y+ZEhjSg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47d219b3-72fb-f9bf-d420-cd08bc781119@linaro.org>
Date: Fri, 20 Aug 2021 08:47:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA81XmmHFtVfA9U307y5D41NzuHZNTFXgHe2-1Y+ZEhjSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.49,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 2:03 AM, Peter Maydell wrote:
>> -        } else if (datalo != addend) {
>> +        } else if (scratch_addend) {
>>               tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
>>               tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
>>           } else {
> 
> I don't understand this change. Yes, we can trash the addend
> register, but if it's the same as 'datalo' then the second load
> is not going to DTRT... Shouldn't this be
>    if (scratch_addend && datalo != addend)
> ?

Previously, addend was *always* a scratch register, TCG_REG_TMP or such.
Afterward, addend may be TCG_REG_GUEST_BASE, which should not be modified.
At no point is there overlap between addend and data{hi,lo}.

r~

