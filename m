Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A58436E55
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 01:29:53 +0200 (CEST)
Received: from localhost ([::1]:49136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdhVQ-0000pw-4S
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 19:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdhU1-0008Do-TY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 19:28:25 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdhTv-0003wC-QY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 19:28:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id c4so1653014pgv.11
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 16:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=euuusfFEvDdEH/nQ8/rf+VotiBx8Txuw1vg6OalprbA=;
 b=d/cGFHDh9dSRkBp9asuXwe16GHngu+oRHW2G+BcPNRY7nATdmwFN+5hC4s1BlDwVJ8
 zPdFAb/rmVaJAOwxd1aqpYVaI+S7uZ/lC90qsbuc9VxsqRFt7vkFWICP9VGwaIL+tggg
 yJd0ABrQzgi3dHu11D3WqVEIP+aQWGd+3Ib6aZ1Qlu28vGxM0guF6PSl3E9FyDIVAzSs
 xBwTDZaoA7P6HnoIooi3ggQnVV2ZQMHH/gkDKgkMnGMTXu0SR17zVhMw3QLwUQhL/ZMV
 X+mzywOhjM/t/5L3yoyvY7QyHE8VgZ/xSK4+//UPsaSLILUbEFW31zvKfVFE1u78bP6I
 wCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=euuusfFEvDdEH/nQ8/rf+VotiBx8Txuw1vg6OalprbA=;
 b=R78iZp6gLo6xIuaDUr9QumU5hNGCnE94k5ynjytVDgoYdnRktCT5wDQ3dq8yfminiC
 LRXKSbSKt1G75wfUKxHqm1JWDFakvdfI0ZZ+q4qGcnsnF72he91phGl2r4tRmbJuyF2i
 AfEwuYEc/6Q5AMjPaIM4fFC8Z4wmrrbovHaCZ+ZuZxSoZbsetG9KrYtQeJXDzVlCZeM7
 knpyM6hHDJ/JICjxsh1DG7qmrvLcEmhQAKfMYA/xdYPJSSlGrIrgKEFhW+ap5cPrI3b+
 cjMkkCfsrH4BkXC8PCMrDmPyzhE6AxSB3klgbQWiAfGugCWwp03ZzL3ZtK3KvQxSQMZY
 IOmA==
X-Gm-Message-State: AOAM533XdwMghtSKSB8/w7Io8LlqBNcIsK3OfHbii9ZunL6Bn4gcsveg
 oVfJ+ZJao0sjWpcWxlOo52NVvg==
X-Google-Smtp-Source: ABdhPJyRrWDt4cQdSvHWzL45bCXjLQqEfZbxmGi0THexzNHcAoiU+9E+HInxzurVEphbee+t6GtqVQ==
X-Received: by 2002:a63:3845:: with SMTP id h5mr6615130pgn.362.1634858897921; 
 Thu, 21 Oct 2021 16:28:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b130sm7369480pfb.9.2021.10.21.16.28.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 16:28:17 -0700 (PDT)
Subject: Re: [PATCH v5 1/8] target/riscv: zfh: half-precision load and store
To: Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
 <20211021162956.2772656-2-frank.chang@sifive.com>
 <CAKmqyKM7kf7mFrh6i33ZSbLtf6tLC=qSUmzRTvwk=H_rFYs3ZA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07a1c82b-a8d1-cb01-e647-e777cb3aa497@linaro.org>
Date: Thu, 21 Oct 2021 16:28:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM7kf7mFrh6i33ZSbLtf6tLC=qSUmzRTvwk=H_rFYs3ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 3:31 PM, Alistair Francis wrote:
> On Fri, Oct 22, 2021 at 2:30 AM <frank.chang@sifive.com> wrote:
>>
>> From: Kito Cheng <kito.cheng@sifive.com>
>>
>> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
>> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> It doesn't look like this made it through to the list. I only see v3
> on patchew: https://patchew.org/QEMU/20211016090742.3034669-1-frank.chang@sifive.com/

It's just the cover-letter that got lost.

https://lore.kernel.org/qemu-devel/20211021162956.2772656-2-frank.chang@sifive.com/


> Can you rebase this on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next when you
> re-send it?

But a rebase is probably required anyway.


r~

