Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9196A0EFC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:04:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFv5-0002M9-Uy; Thu, 23 Feb 2023 13:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFuw-0002Ki-ND
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:02:10 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFuu-0003FR-VK
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:02:06 -0500
Received: by mail-pl1-x629.google.com with SMTP id i3so3540147plg.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 10:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zmg/v50actb5hR2Umzn3O61shGMBhzUsrOivH5Kzx7U=;
 b=ihVZ2rL00fgYK6Z5yEaeMjFExH9yMWlp92yTk33CQP8lbqbzRPW1XBgkFAnwRfKlyO
 pOtFqnghSG6ToKxe0y4iPfnkdaScxFJjCtwtqj3UDU18ja+oME9+Coen5CEJ8ay2VUr/
 g7Alpwh+G2wXcgo+44Biu9q7dDEnyakKfUKRhWqffU4dyoYiZX0N0T+bwTBHkgcdh0RQ
 TebhafAm5HPlAZw92dYdt3/OLv7Vgz40NYZK4ZmXSb+YFhJtNhCKXHEzRuTBH9lhg6bN
 jFnGOYWNiSGOSYUcZBUJhtPJ+5fmZpql1DqkoyEOqnyc8cjtyYM7tYBira7xdjCFBu4c
 Thbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zmg/v50actb5hR2Umzn3O61shGMBhzUsrOivH5Kzx7U=;
 b=qMqLRAu2FGqBaAml5mHOsU7sJKSaTglC0Fr8cYSKrQlIFXeczsz1NiSbrCSNvouFqT
 wp83C6LqQ+j+9mJ3nN7jBm6U5IErTb/chdHaiQo+C9ohxrkBqhb5sNLkiIqG6shcnmA5
 6mOlTkFrVuxB10MJn6ABjVf/3f/zQm4gDlU23/znyrq8cdG5K5pa0o5Ubd9a2xYHZyJj
 mSdLJNTaizMaRE0eGMTD/qJVTrVAIuzHXp6yjkDWSiNDAZy5O5aLYtWjIh6pOGrTsrpl
 jE7YvuOYZkEsaVjdUmyHz9DbRZcRRJ4w3oNcLOf3xc9TjppYNK3SrwrkDmFB7PGLyVVj
 pc4A==
X-Gm-Message-State: AO0yUKUE1qYiMIcpyQkfbwMShqKs0HqIZmBAnOKRk/6uv42BJDuwJtDT
 BGHbcxnvU3WvClyKJLkJ8b9CJw==
X-Google-Smtp-Source: AK7set+hg93kJ6HkW+73w//PxlPKyJc/mq1mrDtx60tCEsP4FX4bsiPCKlzmnHHlsCCT2cyIrwjZoA==
X-Received: by 2002:a17:90b:4b86:b0:234:68d:b8ea with SMTP id
 lr6-20020a17090b4b8600b00234068db8eamr12906504pjb.39.1677175322937; 
 Thu, 23 Feb 2023 10:02:02 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f19-20020a170902ab9300b0019a91895cdfsm2243221plr.50.2023.02.23.10.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 10:02:02 -0800 (PST)
Message-ID: <4727f0a2-680b-cff4-16ad-f7904f1cd086@linaro.org>
Date: Thu, 23 Feb 2023 08:01:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Anton Johansson <anjo@rev.ng>
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
 <039803d2-24aa-e22f-a154-7ca07e781852@linaro.org>
 <1562d9eb-abfd-ed25-e169-404a619df47c@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1562d9eb-abfd-ed25-e169-404a619df47c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 2/23/23 00:09, Philippe Mathieu-Daudé wrote:
>>> +#include "cpu.h"
>>
>> Does it work to include "exec/cpu-all.h" instead?
> 
> We get:
> 
> include/exec/cpu-all.h:110:5: warning: 'TARGET_LONG_SIZE' is not defined, evaluates to 0 
> [-Wundef]
> #if TARGET_LONG_SIZE == 4
>      ^
> 
> TARGET_LONG_SIZE is defined in "exec/cpu-defs.h" which is
> target specific. If I add "exec/cpu-defs.h" to "exec/cpu-all.h"
> I get:
> 
> In file included from ../../dump/dump.c:18:
> include/exec/cpu-all.h:439:8: error: incomplete definition of type 'struct ArchCPU'
>      cpu->parent_obj.env_ptr = &cpu->env;
>      ~~~^
> 
> Is it worth extracting the few tswapX() declarations to "exec/tswap.h"?

That's probably worthwhile, using cpu-param.h directly, perhaps, rather than pulling in 
the rest of cpu stuff?


r~

