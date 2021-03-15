Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E3333C643
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:01:45 +0100 (CET)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsTH-0002GH-U2
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsB3-00015K-5s
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:42:53 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:35136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsAv-00088d-Gu
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:42:50 -0400
Received: by mail-qk1-x735.google.com with SMTP id d20so32735580qkc.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ll1twSIfXiyVJ4dZR2FAB4DAEuKbXE8Bmhu2sOphazg=;
 b=lUx/IkVzd6183VeQv0FHckl/2N7b5AmCy7YimVM6xsxpOdZRabM/NiFvGyi1IQBrdw
 VXbeI1s743JzBDk3G7oN08Xpz0T5rrVp18mGVwPsgyXwCNLQvHAutregxdBMTsDWOKuO
 KWXD+suj1dN6fYQXl/EZYdUqU05TYU/Sz0eQIvFcuNlYNgdBqfClNonq+jg1d2fQGPpW
 b4Dpw9cGrrVyJH7qNRQ7y7cx9rzNMGTfE/RLvqIx5+rAYOgQVXO7unUWN02dIHOmPqwj
 C7zq9R/NYC13yPOiB5eHvi0jTE9h4qRzdXwnQyA7xAKJr8PXG22LfTcpdk0gTYWnVkEg
 /Wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ll1twSIfXiyVJ4dZR2FAB4DAEuKbXE8Bmhu2sOphazg=;
 b=NcJ4xuGj2wfzq3S25MSTV0qpoAHa+cf6L0KPUa12nQDsOOavP4UJFOQqlxxfDN8z0L
 6cf9ShkUrrEv3FPqPWDmnHZxuIdc8Zz4L6RMuckJW/2yZ/Dk3ZNjRwecYlcVnAz8RltN
 64EmfKtvdDo8GxgWRcQieaeOUrm0799PWJHQqq5y52Pxki16UANSx8IG6aoXsUHMnYsV
 r7qGfy/ZjD79Hjkdq1yhV1nov/HRQxlWZv4w2uEBZiGfFpB2TlsxqXvK85gc2wfNj1C3
 /Mijzhi2tVd1UC17Qyqhqc4SVDMk4dJmdyFDwFoZ56rTdiuFtXmiOU4DGBsb4h5/UVjT
 Pgag==
X-Gm-Message-State: AOAM531HuwBBV8tDdIVtRnh69V6Cm6OVN0oaXEn4D9xmVceoKDiTgCHL
 MAovs88nsS0I6kGmNd19YaJeg1dUikNsxIxN
X-Google-Smtp-Source: ABdhPJyMGwWDU0P4chHqCCzt7KNmJwZPZg2BH93juHWi9HMKhOt/ROaII30JgwyWyToHWJV2FQvOmQ==
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr26435176qkn.442.1615833758043; 
 Mon, 15 Mar 2021 11:42:38 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a14sm13143044qkc.47.2021.03.15.11.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:42:37 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
 <a1fff12e-eef3-f742-be40-3eee395972e7@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6edef34b-215c-6c18-1400-16dea21f4555@linaro.org>
Date: Mon, 15 Mar 2021 12:42:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a1fff12e-eef3-f742-be40-3eee395972e7@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 12:34 PM, Rebecca Cran wrote:
> On 3/10/21 12:24 PM, Richard Henderson wrote:
>> On 3/9/21 6:29 PM, Rebecca Cran wrote:
>>> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
>>> +                                    unsigned int num_pages, uint16_t idxmap)
>>
>> I am not keen on this interface.  I think you should take either start+end 
>> addresses (inclusive) or start+length (in bytes).
>>
>> Using num_pages, and as an unsigned int, seems too easy to fail when applied 
>> to a different guest.
> 
> Do you mean pushing the knowledge of the number of pages to invalidate down to 
> cputlb.c?

Yes.

In particular, your interface does not allow a single call to invalidate 1/2 of 
the total address space.  Because the type for num_pages isn't large enough.

There's nothing else in the cputlb interface that is page-based, except for 
"flush one page", and I thought that either

   target_ulong addr, target_ulong length, unsigned bits

would be a clearer interface to use.

> Because I'm thinking there has to be a loop somewhere that 
> invalidates each page if a full flush isn't being done?

Certainly.

r~

