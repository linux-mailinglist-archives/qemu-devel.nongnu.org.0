Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368EA6A0DA3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEDP-0004Im-Mi; Thu, 23 Feb 2023 11:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEDN-0004IP-Jp
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:13:01 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEDM-00018c-42
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:13:01 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so4731989pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5HSZCPVGjOTae7UAkHFgyz6AX7pEyOjj0X+ZRHMUqJ8=;
 b=wI4AtmCGtE9Y4w0SzAOe93rjlZomI98tC7O4bjJIRIHLlMn4eNRJaRqHi2YqUpWuza
 UywHestLsG5mkh/D+nPcZnP/6nSHw1l7aBy++323iax0hDmJSZXFyAK2/eN2Q9BoTyqp
 6SI1V9yjA0hu6dKzxebA8WWPFmN8sE7HlrEzx769g68y9gNED96rUsUu0aVkYzHwYPUX
 GiWP0X/IrOhAjSbG7J3Q4+b7UpZ1/gVzrh7pTlQrdQD/29tyCRb8JGQbPPs9YIc2u/a3
 qfGico076UbptIdKo/qXGPK8QD3FkFuBlkrh79Z3jkESXLLjCQSxwG2L9FWDnJzbcfWO
 Ze0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5HSZCPVGjOTae7UAkHFgyz6AX7pEyOjj0X+ZRHMUqJ8=;
 b=e6A0lH9/s7qY826xTCQGwy4nX7ee5fWeIIVBOuwq1hv4mSWsVo8FnxOY+g7nELZ7KT
 JPLeqrVVhiTHCjvBIUdgODgGe+zrJGsqDYb0VS4pBawRYY2zoErMPz/O4tWq3C86EZnI
 GbYrNxm8dmeu/nHftZ3YHCRUybIOcVA4Jl/t3cvBhFiL1R7XmlJ8Y6lABHKTUAY1BCJy
 y1O7P59CUFEbQPTUH81m8J9swR4+o+iel58gbLWXgbW7eIqRIWofjnvpC5b6twZgbp/d
 PA/1FLVKMpbhM5L3cjQ6EJ4Hwa3xpLCAmbsXDK49hgZqY6bKfjiuAdmd8BuNHMPspAWW
 ChOQ==
X-Gm-Message-State: AO0yUKWiage5rk7LLIPR/VJCcv9eJ/r5nKyuPnIMGjysRgUjsPxMZmJq
 ls32LfxAO5EZYkaW12wja47GTw==
X-Google-Smtp-Source: AK7set/eYBL3lviriNFm6Ly7xgnp2syJEBmy6RlLfYRqOb0cCQ8SKHS+J4d2oqHtO6gtLMObkymSfg==
X-Received: by 2002:a17:903:283:b0:19a:96f0:a8de with SMTP id
 j3-20020a170903028300b0019a96f0a8demr12255418plr.5.1677168778258; 
 Thu, 23 Feb 2023 08:12:58 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b0019acd3151d0sm8675345plb.114.2023.02.23.08.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 08:12:57 -0800 (PST)
Message-ID: <8e759fa2-674f-184c-1ddc-35638a18bda5@linaro.org>
Date: Thu, 23 Feb 2023 06:12:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the
 high bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-2-richard.henderson@linaro.org>
 <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 05:14, Peter Maydell wrote:
> On Thu, 16 Feb 2023 at 03:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We currently treat cpu_exclusive_high as containing the
>> second word of LDXP, even though that word is not "high"
>> in big-endian mode.  Swap things around so that it is.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate-a64.c | 54 ++++++++++++++++++++------------------
>>   1 file changed, 29 insertions(+), 25 deletions(-)
> 
> This code change looks OK as far as it goes, but the bad
> news is that we migrate the env.exclusive_val and
> env.exclusive_high values in the machine state. So a
> migration from a QEMU before this change to a QEMU with
> this change on a BE host will get confused...

Oof.  Ok, I didn't *really* need this, it just seemed to make sense.  I'll add some 
commentary about "high" only meaning "high" for little-endian...


r~


