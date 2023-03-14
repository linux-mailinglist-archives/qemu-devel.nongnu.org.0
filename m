Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C26B9E0B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 19:17:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc9BM-0005gO-Du; Tue, 14 Mar 2023 14:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc9BH-0005fp-ID
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 14:15:27 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc9BF-0000VZ-Le
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 14:15:27 -0400
Received: by mail-pl1-x629.google.com with SMTP id h8so17488037plf.10
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678817724;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RCux39HOyX3224k+WU/lGd2qfMSOcRNaZHJRnC5i+Do=;
 b=Y2wm14rGODZbUcyDVXa1xeU9iDQOeoiOTxYXXVf5sReNjn/a3gva6c3Hp5Hl5L7Z0X
 kfp5T4qbl02o9mmrZv19pQiZU6jfih5zpPMqdRDz+r0dOQtyhzAjcrBy17X5SJRw/sdf
 iV3upI8ipzEQpr8ondHR5RyME9iTx6jygX4dx4vaZsUN2uQLUqdM9Senxxxkj/poa89M
 Ha47+wSP1Ncw4IE14OTpdVUr7X7za+M/G026ARRSZuDsGjCmqzrbljNkmHNOSnnUiJ74
 e2pb8QvADuaxwl8VGGJSsVrdjaaeRP9KbDUgPvATPxv7LvLX4eW1y2icBovWCbHH8DZ7
 MIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678817724;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RCux39HOyX3224k+WU/lGd2qfMSOcRNaZHJRnC5i+Do=;
 b=myCJMc9zpqMHQ3U+JP7glvKbJYQJelgtE+XKQoHJHxi5gj1rNyq4ygMgEcbil6Tgfv
 +XEp2DQ18rvxR5ocLvuKJZlG/EJ1s5vAas0qHfOcekwsXrdQNBJslZCOqkzcU6W4WKYV
 qkm18ISyPROSLimu/YcxNG1gmmXtzeVN91JQtbybLPtMFWIZQadIN3bR39Lp6V8liTHY
 YUUfFtqaZ/PM6l1QmyluftjcgcalsJy/cHUyMgFnld5f25ATtb/CVag+NQwScsq3cv+P
 nX6Qd0+cCaAiMD5sFjDXfiH8LdNOwk9O7q9XgzDQ4FRBk2xoGgnKtYmPL7cHGRzNFuet
 +4rw==
X-Gm-Message-State: AO0yUKUCINEJNZlSuK9zwOJEIZga4CcaPW8hcyxTFCDBsVaWDUL9HPzt
 GYev2E3VTnAHtVebeqx8dwX8Zg==
X-Google-Smtp-Source: AK7set+zQKrUypTXkXpEiPW4Yv7gwI12UdjUMUx0oB60jgvJZIjJK2425ODzEaXXXkJX4/RxOBeX4Q==
X-Received: by 2002:a17:902:e842:b0:19a:b4a9:9ddb with SMTP id
 t2-20020a170902e84200b0019ab4a99ddbmr47184164plg.49.1678817723860; 
 Tue, 14 Mar 2023 11:15:23 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b0019e30e3068bsm2067332plb.168.2023.03.14.11.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 11:15:23 -0700 (PDT)
Message-ID: <db955647-d769-e9fa-b314-6a3ee16b0b95@linaro.org>
Date: Tue, 14 Mar 2023 11:15:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/28] accel/tcg: Introduce translator_use_goto_tb
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>
References: <b160a8f7-10b0-5674-a040-b11ca4aed3c9@intel.com>
 <714313d8-7828-196b-50ac-fe12d2143135@linaro.org>
 <12e54d71-e208-507c-c9d2-c313f9301fc3@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <12e54d71-e208-507c-c9d2-c313f9301fc3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/14/23 06:47, Wu, Fei wrote:
> On 3/13/2023 11:00 PM, Richard Henderson wrote:
>> On 3/13/23 07:13, Wu, Fei2 wrote:
>>> Hi Richard,
>>>
>>> Sorry for disturbing you. I'm doing some perf profiling on qemu-riscv64,
>>> I see 10%+ faster to build stress-ng without the following patch. I know
>>> it's incorrect to just skip this patch, I'm wondering if we can do
>>> something on intercepting mmap/mprotect (very rare), e.g. even
>>> invalidating all the TBs, but keep the cross-page block chaining.
>>
>> It also affects breakpoints.
>>
>> I have no good ideas for how to keep cross-page block chaining without
>> breaking either of these use cases.  If you come up with a good idea,
>> please post on qemu-devel for discussion.
>>
> Thank you for reply. I am new to qemu/tcg, lots of details and
> backgrounds need to catch up.
> 
> If we only want to address user-mode qemu, and assume this cross-page
> chain, first page -> second page:
> 
> * breakpoints. If a new bp is added to second page, the chain is hard to
> maintain, but it looks acceptable to flush all TBs and fall back to
> current non-cross-page implementation during debugging? I think It's
> different from the full system situation here:
> 	https://gitlab.com/qemu-project/qemu/-/issues/404
> 
> * mprotect. If the 2nd page remains 'X' permission after mprotect, the
> chain is still valid, if it's changed to non-X, then the syscall
> interceptor will change the permission of corresponding host page to
> non-X, it will be segfault as expected?
> 
> * mmap. I cannot figure out the situation. Is there any unit test for
> this, or could you please shed some light?
Also munmap, but handled via the same path through page_set_flags, see

     if (inval_tb) {
         tb_invalidate_phys_range(start, end);
     }

There is no unit test for mmap over an existing code page.
I believe we do have one for mprotect.

You could plausibly add a global variable choosing between link-all-pages and 
link-one-page modes; it would be protected by mmap_lock.  For link-all-pages mode, the 
above tb_invalidate_phys_range becomes tb_flush.  We probably want to start in 
link-one-page mode if gdbstub is active, which is the only way to set breakpoints in 
user-only mode.

I expect mprotect/mmap over existing executable pages to be extremely rare.  I expect 
munmap of existing executable pages to be rare-ish, with dlclose() being the most common 
case.  You might wish to change from link-all-pages mode to link-one-page mode after one 
or more instances.

And as I said, this discussion should happen on qemu-devel.


r~

