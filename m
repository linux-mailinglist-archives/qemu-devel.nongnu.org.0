Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF38380FA8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 20:19:58 +0200 (CEST)
Received: from localhost ([::1]:52346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhcPl-0003pe-Ch
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 14:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcNK-0002Lg-3t
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:17:26 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhcNI-0003lR-Iv
 for qemu-devel@nongnu.org; Fri, 14 May 2021 14:17:25 -0400
Received: by mail-qk1-x72a.google.com with SMTP id v8so11618244qkv.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2G9ozxiaHjuL/P9CIVlVxN+jeKlbvhkAToG1ruCubp8=;
 b=wen5WOLWkU55w7v71vsyKfnyYCaNUB3GXFhCSGEUWwZD1exCDrD66HAdKf11MddduK
 abhkOtwv6YOlSn43eBMdL27gOGib84ojnI/2HM2+eehC0zWZ5SNFV6qajMumI8AITqnV
 PUizmYNk0pxqBylMRW8t+VCG2kprSrWYrvWGqCJeFkxDRCJ81i1SLgp2zbd4DL6gp8ky
 PvlJA28iQuAe7VpzgCi01Wg4IQZGWQJ5wfJch3vCKPt6zIRfgOVAl+p9lOScRkOrvHt/
 34LnbhSL2756Q2uIOuH1RZk3RfcdP1uXYK1pJXJ2ktbAJV1J52C4BbGDLnoea0rbjToS
 fzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2G9ozxiaHjuL/P9CIVlVxN+jeKlbvhkAToG1ruCubp8=;
 b=YJDZFP64LnL1Vt6cwEx72uFSySTU/+37bYkpjox2alv/11bjFigoBeAa2jSM2uzLxh
 c20tgwr7PV5aqJMNDlsjvZYMC6wUgbqYVQvC+Xqvsu8br+2RjtFMXe7jzA/n8UaFF2Wm
 MBFJu4wGNtq2sz9xvriTXNRll7NfQD+JrryVbEa3yOuAVB8mM62sF0ackgjnoQvh9pJv
 Qnyz7bMulUexIabXYRBOM2As/mySlPuU0W+AEbADZoxqlbZVWEIAXuF2bhbowILFVw/w
 OFYQ0dpMw2hkoBDiifUq8GOSJ9RcpJ3TguMNVCf57oARdkIUVPqEbwmjcstdETskQbtQ
 W23w==
X-Gm-Message-State: AOAM530bvLcbgGidC8n0FepqRI/rUHq4rms9RL6H/uhLbZGvY5GjgeEK
 rlER+PPL2bGr4MVA0OMexJq4ag==
X-Google-Smtp-Source: ABdhPJyFdXFrBSSD/4KDrRKapQWUasaRpbj18gyrjORAiKWG0xXt9KnVDp5+QtDNzJWbT9HJOgTAeA==
X-Received: by 2002:a37:b784:: with SMTP id
 h126mr46051962qkf.402.1621016243025; 
 Fri, 14 May 2021 11:17:23 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 7sm5254305qkd.20.2021.05.14.11.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 11:17:22 -0700 (PDT)
Subject: Re: [PATCH v6 55/82] target/arm: Implement SVE2 saturating
 multiply-add (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-56-richard.henderson@linaro.org>
 <CAFEAcA8SrNTpUCzJtx0ejEjFcURk43BJ+8Sa3XvqNSAuQCPjLw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2584e0f-18ce-8d83-718a-2a1f6c019da7@linaro.org>
Date: Fri, 14 May 2021 13:17:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SrNTpUCzJtx0ejEjFcURk43BJ+8Sa3XvqNSAuQCPjLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 7:42 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper-sve.h    |  9 +++++++++
>>   target/arm/sve.decode      | 18 ++++++++++++++++++
>>   target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
>>   target/arm/translate-sve.c | 32 ++++++++++++++++++++++++--------
>>   4 files changed, 81 insertions(+), 8 deletions(-)
>>
>> +#define DO_ZZXW(NAME, TYPEW, TYPEN, HW, HN, OP) \
>> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
>> +{                                                                         \
>> +    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
>> +    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
>> +    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
>> +    for (i = 0; i < oprsz; i += 16) {                                     \
>> +        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \
> 
> Doesn't this need an H macro ?

Yep.


r~

