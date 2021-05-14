Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCD380E5C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:44:11 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhav4-0000Ty-9C
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhakm-0001XO-34
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:33:36 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhakh-0001XU-EG
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:33:31 -0400
Received: by mail-qk1-x730.google.com with SMTP id l129so29253648qke.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/SIuzuli96JbZLmRb71GT/L84ViWjZYRFf8bQ7bsvrI=;
 b=A0NrIoZG3acVFHGHmf74Ifb5dq8F0h1G8lp1vK/WuBDADRQwrg1AGdJ+4G7GxgpgT2
 CGMy7xI4HLuOTg8UnoB/i5xnHpfwfCxPnFaV4Q417PQKDr7LKXHu183C61lNbeMC2pTZ
 DZ5Erp04wYJWxmTceZH17qWBsfP39NxGL2GAt1jvL3xPv+x0qG7cEJr01Y46bZSygVM+
 GJaSb/tBYKR3dvPJldmvSMp7QEnTCVGnLyPuGQBHh41KjyrRIpufv179eEQH8zDmA1KC
 mxUP03NvPmtMHunSbJGWN4vVKbXqcOsy/EW3q3VSi/Z/cWbiu3vWlfgMadjMrI6lTsU1
 eWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/SIuzuli96JbZLmRb71GT/L84ViWjZYRFf8bQ7bsvrI=;
 b=NtVi8r7PMnMumqxRN0DoPSeSHeuX6wc+DxFHe4l6mRXo/ZGhdkyf1q6NB5T6JIK3J2
 4kBI+Cl2q13BXfo1SQRbQtjRtqbfG0sy19TLfc5Gpb+8OLDzhuoNqeupNliXzuc7R3/W
 lkwKO9EiLJ3m6nqJ3JpyEfr1YLaVHUguzdwcEjiMYIbPL9VG4Drn+P0xPTUOmGd5iLiz
 7w7i1l2xGBYwZ62bUqIfS7sMC7wF++FXFHyBeqe3tYfjkG3RNNhSew4aZDosaNPgpBJU
 fY0+cRGzeuUPgxCcSGlR6A9aT9UaYlr7D5guSY3uLzwxLqT66WzuTlltJTS1j9+1WpRi
 E5Pg==
X-Gm-Message-State: AOAM532Um1lFbMGG9kblmHfrEBMWEzm/r5xTXVfvnxBLaUX6rifJz+yB
 4QfpRHzBGLKAZsp8KeJyw+KFtO0tHfm7V+0y
X-Google-Smtp-Source: ABdhPJydkQ5gCv0t4Qk16j6MaT2VkP4Q1pT+KGkU9YJe9Ppwr1/fuZEWIinMnCbCDSFRUhGs8Ef70A==
X-Received: by 2002:ae9:f106:: with SMTP id k6mr12378523qkg.274.1621010005302; 
 Fri, 14 May 2021 09:33:25 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id f127sm4918698qkd.81.2021.05.14.09.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 09:33:25 -0700 (PDT)
Subject: Re: [PATCH v6 48/82] target/arm: Pass separate addend to {U, S}DOT
 helpers
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-49-richard.henderson@linaro.org>
 <CAFEAcA_KVJSmphodL=szHvguTpDnCU3BET1+Kn873uoX82zE_A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6df073b6-f65a-d9f7-1942-178875c2699f@linaro.org>
Date: Fri, 14 May 2021 11:33:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_KVJSmphodL=szHvguTpDnCU3BET1+Kn873uoX82zE_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 5:47 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 21:57, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> For SVE, we potentially have a 4th argument coming from the
>> movprfx instruction.  Currently we do not optimize movprfx,
>> so the problem is not visible.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v4: Fix double addition (zhiwei).
>> ---
>>   target/arm/helper.h         |  20 +++---
>>   target/arm/sve.decode       |   7 ++-
>>   target/arm/translate-a64.c  |  15 ++++-
>>   target/arm/translate-neon.c |  10 +--
>>   target/arm/translate-sve.c  |  13 ++--
>>   target/arm/vec_helper.c     | 120 ++++++++++++++++++++----------------
>>   6 files changed, 109 insertions(+), 76 deletions(-)
> 
>> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
>> index a3d80ecad0..f88e572132 100644
>> --- a/target/arm/vec_helper.c
>> +++ b/target/arm/vec_helper.c
>> @@ -375,71 +375,76 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
>>    * All elements are treated equally, no matter where they are.
>>    */
>>
>> -void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, uint32_t desc)
>> +void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
>>   {
>>       intptr_t i, opr_sz = simd_oprsz(desc);
>> -    uint32_t *d = vd;
>> +    int32_t *d = vd, *a = va;
> 
> Why the type change ?

Oh, just because this is logically producing a signed result.  Given that we 
use -fwrapv, there is no functional change.


r~

