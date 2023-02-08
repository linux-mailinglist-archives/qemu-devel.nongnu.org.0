Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CA68F9EB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:53:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPsLv-0007UG-2P; Wed, 08 Feb 2023 16:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsLt-0007Tj-4G
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:51:41 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsLq-0002y7-Cu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:51:40 -0500
Received: by mail-pg1-x533.google.com with SMTP id x31so267940pgl.6
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=05LT+mpZ9xuXMN/HNZfAzIm0Bc4e4tmmE57FFRYy7ew=;
 b=JPTbIirih3NlXGboQd7BFSlQmgWKZhOP/z8Hz/Al5L4NvNelanXkcq8QOoFIvEjCm9
 EgiodoD7BT8KsDYXpuNtosgYgqKL2N3T+uL3QPUwAx13MJcHmPZaVnJ9BSlOQ2GxYK72
 mBfx+K7gD18TILqGFZHFGzwuidbUVXGEzupzcPmgkHDrUiKG6luZtTWda6ExzBq8eOyI
 ai/Qhcq8QCQ5jhdZxd+6TO+wq0oEUWnkT6WSacLpssB4LxZuClp0DxKe6XJOpQKKgJAF
 gzfSh+ZASNklo9euRTMiQcqz5azLIJ3NCdDeK5hMGq8BJmQCcuXBkgCCmeOEyJRoELlW
 dYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=05LT+mpZ9xuXMN/HNZfAzIm0Bc4e4tmmE57FFRYy7ew=;
 b=gdTtnWIilS5VXnXBvNfRUHHGif+5DBJPYCw/EtJVnjntEfMp0fKfpdcuWMkm47b3Wn
 nISw0F1RA4eOHvpMAG3eIGLP740SzkOSJQTrH6ZhxcX/g1C1PNphc7yo6fjwwBr3CHk4
 iN28ikIx/rQcXouUtnKMTJIvWOdL/CjUjVVI99kYmupri3PLzoBxrfWC7/Rf3f9MzQzT
 AlBe7ouvbG3eJE2VQw+X3MUd6GEr6QoMJj6O2Qe5uTtLC1SelIcGImmcKQ16M6mEKktJ
 3pVQhVeLOFb3m27qKki6rGn/w7UTk7Cog+TTs8hGE4m9Nop9vlyHefzzNGhgEP9QrC1S
 hsdg==
X-Gm-Message-State: AO0yUKXWItlJ19MTFx0++ZGDA1wNrZAbUBDm+5//+wQlmbT8sW5pf4Lw
 ODcn1W1NKTK+wu5trS2Q16FqcQ==
X-Google-Smtp-Source: AK7set9+EsnCPCyp3bNEoxyC8eiJpvHY82QlNx0S0wdpnMnomdZzAQZXxudDUd5m54jWDwWfULIwAQ==
X-Received: by 2002:a62:1a4f:0:b0:593:b491:40b8 with SMTP id
 a76-20020a621a4f000000b00593b49140b8mr7283318pfa.4.1675893096691; 
 Wed, 08 Feb 2023 13:51:36 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 o185-20020a62cdc2000000b005815017d348sm12085922pfg.179.2023.02.08.13.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 13:51:36 -0800 (PST)
Message-ID: <adc3f811-c2b5-8ee2-1396-dad9bb6d3911@linaro.org>
Date: Wed, 8 Feb 2023 11:51:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/22] target/arm: Add RME cpregs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-7-richard.henderson@linaro.org>
 <CAFEAcA9vW1Z+6c7HWh+s-d74kFrpBm3JDMCzdY_pqQh7-JPjVQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9vW1Z+6c7HWh+s-d74kFrpBm3JDMCzdY_pqQh7-JPjVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/7/23 04:53, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This includes GPCCR, GPTBR, MFAR, the TLB flush insns PAALL,
>> PAALLOS, RPALOS, RPAOS, and the cache flush insn CIPAPA.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h    | 19 ++++++++++++
>>   target/arm/helper.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 93 insertions(+)
>>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> as far as it goes, but don't we also need DC CIGDPAPA when
> FEAT_MTE2 is also implemented?

Quite right.


r~


