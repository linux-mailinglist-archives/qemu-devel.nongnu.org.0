Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6513A6B24
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:59:51 +0200 (CEST)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsp0A-0006cI-1Q
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsoyj-000439-6F
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:58:21 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsoyh-0002Rl-Gk
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:58:20 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t9so8990594pgn.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=I8KcxhXDDn4bUdn+XvUNl40EzITa8WLnLwRVoalpkJc=;
 b=J0jxbr3Ln8Y1k/GIngGv9uz8Oe2PRn0I61Vx/s6Ph3TKcu4pyyDWy8kn15jHr7QI6R
 WmaDeBmznu6ZsPVoGcsP7fNNzh8yAoArWgZx/l5dZy7Ae0/y6wk8YcEEAQqLjrelzEAP
 t35gs0o/mvScARIXx/PCVh53Qb3OecPulYDOuYB8ikvSf4sSj775DY7sb5MgIYRklGc8
 zCdDMJPw6vomodjyvIEQEWInAS5O1QFXS+3GnS0/95xpUqG6xruU0zMbE+IQH3r14kuB
 0nL3gdqmBe2Z/RM/JQBkDlTlxxrlk4wV8ac/Lxo3q91nHesc21eg7u3X/NL96udy+Bna
 613Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I8KcxhXDDn4bUdn+XvUNl40EzITa8WLnLwRVoalpkJc=;
 b=JdY9ARQ/i/XozoaGBhoqku7XU6wOQoNQBlvZvOBKe/uCiuAJmo2S6oNcxWSEqpYN2f
 DLiVCZjDiDrE8YQiFa2vruJNv6cLGC2KoqiazZo7/mTIvFuOoAoHgSDNJF5wU3SgfkcJ
 7UL1ss6VtUpFl2c+TdQWA9JbZpLbTwtC28KD9nSsEZUJvH1sqFqkY8Z39uHf/tyVadz2
 Ukogh9gJgw/Y2Tttijj7+uexabdYduDdoGRhlodXcWkcIwA0KGntJ0j2fmCC66HK7Mnv
 QYC2E59ZGVmtlNXfdIbvpcUCW9O1MjdvqHoV5KV5PNAxphkaMEJK2WeiooaClmZkkg63
 burQ==
X-Gm-Message-State: AOAM533+7flwZjqMlkICqVGjKwPSi7E8h6EzqB1qCFc2joH304KqEwBV
 QdDg5ymn5yVrrJISws6i6LuVb3GdZDM24g==
X-Google-Smtp-Source: ABdhPJwdu4CJhxGXIzXnWdR739ajZsvmTOyiDmXs245QUYNXk0Y84VGJjFcOosZMMLWPoMIAPZrKfA==
X-Received: by 2002:a63:4512:: with SMTP id s18mr17807269pga.81.1623686296127; 
 Mon, 14 Jun 2021 08:58:16 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 l7sm3850679pgb.19.2021.06.14.08.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:58:15 -0700 (PDT)
Subject: Re: [PATCH 17/28] tcg: Add flags argument to tcg_gen_bswap16_*,
 tcg_gen_bswap32_i64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-18-richard.henderson@linaro.org>
 <f01808cb-0bd1-aa4d-f289-a59a4c281203@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9972b30-7f01-5600-c942-9058f78fca2e@linaro.org>
Date: Mon, 14 Jun 2021 08:58:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f01808cb-0bd1-aa4d-f289-a59a4c281203@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/14/21 2:41 AM, Philippe Mathieu-Daudé wrote:
> On 6/14/21 10:37 AM, Richard Henderson wrote:
>> Implement the new semantics in the fallback expansion.
>> Change all callers to supply the flags that keep the
>> semantics unchanged locally.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/tcg/tcg-op.h            |   8 +--
>>   target/arm/translate-a64.c      |  12 ++--
>>   target/arm/translate.c          |   2 +-
>>   target/i386/tcg/translate.c     |   2 +-
>>   target/mips/tcg/mxu_translate.c |   2 +-
>>   target/s390x/translate.c        |   4 +-
>>   target/sh4/translate.c          |   2 +-
> 
> Various REV 16/32, would it be useful to have it as a TCG opcode?

Which operation are you proposing as tcg opcode?  The per-halfword swap akin to mips wsbh? 
  Yes, that operation also appears in arm (rev16) and ppc (brh).  So it's a reasonable 
thing to do.


r~

