Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A1C2F1BF4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:12:52 +0100 (CET)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0kN-0005Ju-Jc
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0eH-0006nL-Do
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:06:33 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0eC-0005Sm-UY
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:06:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id t6so176250plq.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dK82wjkfuAUt/ix/gjuetbOsvwcK7HmGxCJnWH63744=;
 b=ams0f/YPuBmBuCW9qHPWWZK5ZzQO+cZzVlTJILnLy3QG5Ug1oUtozM7dlC9MdmicQE
 8bsP09pP+4+DQAservGlADMKD47ivqaUEb+uvU/71kS0elhuE2i0YDMlKIyrURzlV3kE
 xZikrVlFmWw+AbeWpQg4QJqgkN6vGimSiccLu/5Ayri0OdLr9e6N80bxqk5WBBAwLw0r
 qtgebzhmj93coNu2BVkwl38B4i5xk6Z26JC4I4zUr4tfqQJqIw/HkyndCffQUwpBjCqD
 nbwtiUhTIS9U3yObPdF7GH/gY5lLOIfDqDNxFCweCTzrWtd3oOWGq/udzKzblBAe4Nxf
 Jn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dK82wjkfuAUt/ix/gjuetbOsvwcK7HmGxCJnWH63744=;
 b=FNPjr+TAfFN+2qVjA5Do2nGGpzQB5ItjByk9Bk2q4nhqnQuo5ExbzlMoWLT4enJAO2
 xv88ZnO16VTZdjxIRaVGBxW8Ybte7BBeuph53NoyU/A4Fw79a3FEY9ezxEKPEwFN/lzT
 JB5LaNku/ClBpCy6vHaI0IbTrmyat+6WIqZAKeqWAgiLQj98huhMA8S8cqL1ZTZEjk9W
 //e2Kz9C1/mtfTevyuciZq8FbSqwyFlz03IVRRMjgtVB2KhcWVDbxxMlYCYsPsKQRXIz
 yKPU4MFUxUVqznpTbd0nokxY/ncq6i/z4RnS6Jtxz8x6987O+fI+p9+eoipIsH5cHc0Q
 yloA==
X-Gm-Message-State: AOAM532nkhjVA5xzPAIfoEN+GHxidbG3wX2aGqWpeNK8X/ZGvddQbFk8
 oGlKiWBYpZoh81V4yWVUYCkaCQ==
X-Google-Smtp-Source: ABdhPJwEjYGUezB1r4Orllhy0pxrGMZeEU6Tmzr7s4drBQ1tU2V2AFEfFE1cVn8M9MYIL0zMcr7S8A==
X-Received: by 2002:a17:902:b584:b029:dc:1425:e5af with SMTP id
 a4-20020a170902b584b02900dc1425e5afmr682857pls.3.1610384786741; 
 Mon, 11 Jan 2021 09:06:26 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a9sm163208pfn.178.2021.01.11.09.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 09:06:26 -0800 (PST)
Subject: Re: [PATCH] hvf: guard xgetbv call.
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
 <X/lDozXFWfR4AZAU@SPB-NB-133.local>
 <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
 <X/pccrqIQ9/N57j6@SPB-NB-133.local>
 <8da22f7f-7379-cffe-5fdd-94fd5ddece32@linaro.org>
 <4a24ae1a-8114-a840-b6bf-ae3a301f6232@linaro.org>
 <X/vUjHCd81PvEflw@SPB-NB-133.local>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <259b9e96-1f69-4e4a-16ef-7034e19ed1ef@linaro.org>
Date: Mon, 11 Jan 2021 07:06:22 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/vUjHCd81PvEflw@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 John Arbuckle <programmingkidx@gmail.com>, Hill Ma <maahiuzeon@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/21 6:31 PM, Roman Bolshakov wrote:
>> Also, if we're going to put this some place common, forcing the caller to do
>> the cpuid that feeds this, then we should probably make all of the startup
>> cpuid stuff common as well.
>>
> 
> I proposed the version because all callers of xgetbv instruction already
> call cpuid before invoking inline xgetbv.
> 
>> Note that we'd probably have to use constructor priorities to get that right
>> for util/bufferiszero.c.
>>
> 
> Please correct me if I read this wrong. What you're saying is we should
> initialize cpuid in constructors and then use cached cpuid ecx in
> xgetbv() (and drop one argument, respectively)?

I would have xgetbv and all of the cpuid values cached at startup, and all
three places would read global variables.


r~


