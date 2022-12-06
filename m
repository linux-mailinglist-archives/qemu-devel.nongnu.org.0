Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A46644834
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:42:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2a4u-0005dX-Gi; Tue, 06 Dec 2022 10:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2a4q-0005dI-Ot
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:41:48 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2a4p-0003in-Bo
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:41:48 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-12c8312131fso17879742fac.4
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 07:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eAfqq8nXl3RusSkFr0BFIwVpz/bgVmajOHgDEwgRq5w=;
 b=Mfrr7e3685rdmlZK6hUV5UbzOPcl5e4sZhkMHERvkUnoMv0ofnoB/q0BXwdwsUMP8l
 wghicuZ3IJuHcCQvSS3qWNlDRjoUCnHD3sAkp0mCfYkN8l/95CRNY/3ybq0g/ZxtHGt7
 xwZhJj2PGoxr2NcOy4oTOXFvwpEdXYavMpPAf2MyoL8tfRcfp/uz+SyYEav/+0LnxFjz
 i2ezgNC8e5la3fsDMo/A9Aq5iN/FhjKP2PG3tstMzcbsMiEe+lLa/Y3QcrgjsFIzC72A
 Lenn0OIzHpHTodCpeHKGHvZbMaLdbdlPdvifImOexse/oF0VCYiPtwicujs8CEtNw4pT
 ApZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eAfqq8nXl3RusSkFr0BFIwVpz/bgVmajOHgDEwgRq5w=;
 b=SJd0sMbwXCLHOzSsT970P2Nb+I8fxzxVj4KsVC08kRwhasRHcJqfAwzHhF93PDyGeS
 OybPWHaiK6dI8tYGQFgSctExDyIIcBGlPhWQg+GRhslfwceA+QdDe032YaFFhqMLvUEM
 llbr1cPQ4cbRdH6MuSdZ+1eBeSM0vuKDfys53TdNTKxBgW0OZxqLpNx7ZCckGSBEB123
 CKMCoxRac2l13t+VsJBIUIkdnw3DRpo4KUCTF9MauSdjsjH9E+4jPW3fhzL2umUJYu5u
 fzLh7MW40fVT/DJW3ybi6mUS/F3SwilMF+wMgo9uqU5+/pPhR2zzrjAj7zIKpuojnj5h
 jAcA==
X-Gm-Message-State: ANoB5pm+7r6tHE9LNnSCivchG8xNI1sWfSAAYZssvpFhSiiXCWj3BjtO
 /07DNzKzklddhCTXumt7P2UdOQ==
X-Google-Smtp-Source: AA0mqf7CBGSEeH2eLtrnuQnz8yXBJlOeaF0maPs+/dEW3R2mOnxkgkzhPRkNRQhC2WOFNY2zXw8ubA==
X-Received: by 2002:a05:6870:6c09:b0:144:b83d:560 with SMTP id
 na9-20020a0568706c0900b00144b83d0560mr3476274oab.193.1670341305901; 
 Tue, 06 Dec 2022 07:41:45 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:e319:9475:a359:f17a?
 ([2806:102e:18:70b5:e319:9475:a359:f17a])
 by smtp.gmail.com with ESMTPSA id
 bu13-20020a0568300d0d00b00666a5b5d20fsm9124153otb.32.2022.12.06.07.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:41:45 -0800 (PST)
Message-ID: <df6be62a-ff4f-ef23-8ad5-8cf16ceee473@linaro.org>
Date: Tue, 6 Dec 2022 09:41:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 22/22] tcg/riscv: Implement direct branch for goto_tb
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-23-richard.henderson@linaro.org>
 <6740ec4f-a978-6467-ee6d-79eeef3c4059@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6740ec4f-a978-6467-ee6d-79eeef3c4059@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 01:48, Philippe Mathieu-Daudé wrote:
> On 6/12/22 05:17, Richard Henderson wrote:
>> Now that tcg can handle direct and indirect goto_tb simultaneously,
>> we can optimistically leave space for a direct branch and fall back
>> to loading the pointer from the TB for an indirect branch.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/riscv/tcg-target.h     |  5 +++++
>>   tcg/riscv/tcg-target.c.inc | 19 +++++++++++++++++--
>>   2 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
>> index 56f7bc3346..a75c84f2a6 100644
>> --- a/tcg/riscv/tcg-target.h
>> +++ b/tcg/riscv/tcg-target.h
>> @@ -159,6 +159,11 @@ typedef enum {
>>   #define TCG_TARGET_HAS_mulsh_i64        1
>>   #endif
>> +<<<<<<< HEAD
>> +=======
>> +void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
>> +
>> +>>>>>>> 89ab294271 (tcg/riscv: Implement TCG_TARGET_HAS_direct_jump)
> 
> HEAD is correct :)

Ouch. Clearly didn't get the fixed branch pushed back.
I wonder what else I missed...


r~


