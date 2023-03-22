Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026226C5A59
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:30:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf77Q-0007KU-Cz; Wed, 22 Mar 2023 18:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf77N-0007Jc-HB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:39:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf77G-0007wI-RD
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:39:41 -0400
Received: by mail-pl1-x62f.google.com with SMTP id bc12so20031244plb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679524773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JkdAZHib7lR8FysgoNWuV/psgaBBczZUKNI5U8fBuUU=;
 b=nOv+CREbCvKaW4xH7cTQl19e64E1d0MA81XhLqKanWCBHZkxqEQRJpvSXfayZpSHwZ
 5SWOI4k38Cftb8lOQOp4pUFDIZKPmfar37WsrpYAJMaNX8b6MoxzOEuzDAymJY/fLCmT
 aEdy2VlMKfe7N0NoWN3rdH/FcjDofm1qf7DTFBpp47r6OOkMZVqR2LIHduQh+n8PYPkq
 RihV90K9QiHTQEGeiC0LJL5u1wDt2komdiDx/X3cWRHRAkF5T0JGrt1cWiF4SaCv3LAO
 T46zTOXvYphjIcArt0CyXvjx+8h8bP4/hbzYQdHsR0chohfjPLMyqq/3OJ2FPEnJCVMT
 blFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JkdAZHib7lR8FysgoNWuV/psgaBBczZUKNI5U8fBuUU=;
 b=m7f5XOBV7nN4YT9u7l7+gT3FxZttR8nD+6BUyX+liolavRqZjjqzoGMGEOt4aJDhRQ
 4dXrN38ZecNgGKvoPtfLzi75vXuc5YnFcZDfc18EShRj0+dBE/HsN+2LiVxUBNLxPye1
 PyCwBGyt3y2n3PRDcVg+vD0ziHZdP93nxj3ZhcHl5cROpCg3fKVf7IO//HdOlDHYDcR5
 fvlcsRA05not8zfyPnJsUylE3KDMU40YgCeNCysFjsakCK+3WgWyiGegKwagACBsXATJ
 8/N5JPwPV2OBHVu1ILHl0goNSdjkt61zd67LHg9B4p7kvZ1BMo6HXGVbIBDbSuchxvIq
 cUjA==
X-Gm-Message-State: AO0yUKUEPZLavuQVxJg8M8M6XQl/oXLnma3gbCelSVq2w2JOmx0o/PtN
 k/bCQnsRneKtqK6RKfAotPvQqA==
X-Google-Smtp-Source: AK7set++Aq8+vn/mx9+Tn5xja0Qah2o1vUKjgZpN4mxLRLsNHyrBqRfO+k8a5mVyhIXUTmjlsCkgUg==
X-Received: by 2002:a17:90a:195b:b0:23f:8752:98c0 with SMTP id
 27-20020a17090a195b00b0023f875298c0mr5513258pjh.19.1679524772738; 
 Wed, 22 Mar 2023 15:39:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a6b4f00b0023acdac248dsm32804pjl.15.2023.03.22.15.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 15:39:32 -0700 (PDT)
Message-ID: <976fc94f-ad21-3130-014a-4da848d1cfbf@linaro.org>
Date: Wed, 22 Mar 2023 15:39:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-7-aaron@os.amperecomputing.com>
 <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
 <ZBtmAEYfI8T8Y/zT@strawberry.localdomain>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZBtmAEYfI8T8Y/zT@strawberry.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 3/22/23 13:33, Aaron Lindsay wrote:
> On Feb 22 11:37, Richard Henderson wrote:
>> On 2/22/23 09:35, Aaron Lindsay wrote:
>>> @@ -406,6 +421,16 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>>>            uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
>>>                ~MAKE_64BIT_MASK(55, 1);
>>>            result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
>>> +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
>>> +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
>>> +                 !is_combined)) {
>>
>> Indentation is off.
> 
> I pulled `env_archcpu(env)` out of this if-statement in my latest
> patchset in addition to the indentation, but am not confident I have
> done what you intended. The QEMU Coding Style guide doesn't seem to
> address longer statements like this in its section on indentation, so I
> attempted to follow other examples in the code, but I'll take further
> direction here.


     if (function(a) ||
         (function(b) &&
          function(c))) {
         ...
1234567890


r~

