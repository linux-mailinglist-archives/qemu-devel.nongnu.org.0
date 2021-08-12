Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94EC3E9E52
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:14:07 +0200 (CEST)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE3yg-0001jw-78
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE3xY-0000wN-2j
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:12:56 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE3xU-0001Wk-7N
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 02:12:55 -0400
Received: by mail-pl1-x635.google.com with SMTP id n12so5258770plf.4
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 23:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6CiNj3Ch5OF89zBeCVhJiYUIWE2QWuGf7Uumn+yJGLk=;
 b=KHI3jhQoPR/0v0XS2ljnGH0DJoovnc+7xQTRMv8ZjpABLykJZxWwvCtiyOO5BhiBOs
 6YcSsbVr4yjjXAU3A7lvZZ39nUTP0sf7Y6GHyeBch5Uv5WKOjGcO3N1mvwUqBF0TNMMv
 sPQG8L+hkbsxNQzn3pzL2VG9XD/zg5/jPEr3MdqN5Yujkf0yiACRe824txHVWFgNAi8p
 BXvqAPoGPr28RIG3aHKccQLy9O1xWUaulbrI6WK0isuCvFLAJVWdFTNVL0p/M5SyIRWd
 JO+VSjkJ80wU62mBqTpLqhwUHpaNrIPT56iZIWCAzvsppjVqQ8v/drO3rWNvesb5YgWb
 YxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6CiNj3Ch5OF89zBeCVhJiYUIWE2QWuGf7Uumn+yJGLk=;
 b=uoAePL6HTNyXVfv5vjRqNerJX1YiTXEh8NTJTIIxlSG/2iSF+p+9/nU/l+rhqkGcox
 8fA6BnB0L8yLG3eY+hNLAjRz+aAWxNU3BUwBdMddChcP9maRIWRvK+6MsAsdVLXKRUal
 kKVJSSE6diKk1/uAYOoUsceeSiKj8KBYprMqgAiy4FZXw/KP++ATRSjve7qzMMzMmLxs
 pv3pku5XwopM1jPNP9i9FnMLCCc8FHKxPOE/CCHkUXbNiwLYYqrSGaESLiekD1ZBmoRG
 yhzVFfFMjzwmGHqpBR18Tw+E5A1ycf9LD1f0JghZRTt/0zDjvSoqV/1g1bzXq5c+mnwa
 MA2w==
X-Gm-Message-State: AOAM532DMm5DBwzwhlz+DriLKCEueW5Cm7SI0ruy2TvIpO1aJM5cBQNe
 2DuLsJrkgfZgqtLQNgHXpw6Zdw==
X-Google-Smtp-Source: ABdhPJylQP8vugRtBw7BEgaMwrfmhU5oMsJbNKdO2IYw7HdEHgN/VjO+f1mHHKPgPUWnIri/9ajftQ==
X-Received: by 2002:a17:90a:f314:: with SMTP id
 ca20mr1546036pjb.210.1628748770445; 
 Wed, 11 Aug 2021 23:12:50 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id l126sm1890464pgl.14.2021.08.11.23.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 23:12:44 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
 <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
 <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
 <6cbece33-7f92-0247-7efc-41b34b0b4d7d@linaro.org>
 <d24feab8-1ce9-fef7-6b43-b11377faec04@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f3a7f2f-d1f3-7910-dec3-75a06b5521bc@linaro.org>
Date: Wed, 11 Aug 2021 20:12:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d24feab8-1ce9-fef7-6b43-b11377faec04@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 7:03 PM, LIU Zhiwei wrote:
> 
> On 2021/8/12 下午12:42, Richard Henderson wrote:
>> On 8/11/21 12:40 PM, LIU Zhiwei wrote:
>>> If the software doesn't use the high part, who cares the really value in high part? Do 
>>> you know the benefit?  Thanks again.
>>
>> I do not.
>>
>> I simply presume that they already have the hardware, in the form of the addw 
>> instruction, etc.
>>
>> The mistake, I think, was changing the definition of "add" in the first place, which 
>> required the addition of a different opcode "addw", which is then undefined for RV32. 
> 
> Sorry, I don't get "the mistake" here. Do you think the specification is not right.

I was critiquing the development of the risc-v specification, in that there are 
complications in the current specification that could have been foreseen and avoided with 
different choices years ago.


>> They should simply have had "addw" and "addq" as different opcodes that didn't change 
>> behaviour.  Etc.
> 
> I don't get  this statement. Is it related to UXL32?

No.  I was just musing.  It's not important.


r~


