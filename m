Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF913F0BE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 19:24:03 +0100 (CET)
Received: from localhost ([::1]:46678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is9oI-00023z-Gm
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 13:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1is9mb-0000fI-0u
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:22:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1is9mZ-00014O-Uf
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:22:16 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33139)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1is9mZ-00013J-O8
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:22:15 -0500
Received: by mail-pg1-x541.google.com with SMTP id 6so10317690pgk.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 10:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ebQiFT0zVaDe8z4imdADWQKHLWWb9Kyfyc+5MoyVOEA=;
 b=iyVYZfJ0siu6fPXwoELHeStXNL6ELE2ti/lLGsX7LNQeJx2EtVAWviWM+4vb/QPYPd
 mkueUUTtWfeycqwhx4HNyUrVVmGEVrh6xd/zqLr4APNGQQ8S7w3oU7OPalvvltUYafVN
 zmb/faBQa484v0XQaodfEb57W2x2zHhww4pSQn3RU6ubd4wxsW5XpKt/b4MmIlrBVOXv
 knlsRRy09oA8WAKLP13hLb6lCZS8ea3kk6LYi4lt3iqI5jkgCxSZ1DM/H0g/ug3WUomf
 /j8X2yA7UgreC6c1868DoBBtr40mzMrwtwcqbjtXkz1K4jVj6dUUR66IQSZ7wLYZZ+ih
 QUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ebQiFT0zVaDe8z4imdADWQKHLWWb9Kyfyc+5MoyVOEA=;
 b=aOBEWxOk2mlXAg0QonmV8QuJ4p4xNo/ZeEEJ8NYR2m21c2LOgotSHNe/gLEywekiMi
 AaaR7nQuzr6ryWOVAH20Ln0Xa9qNvsdJLPUVHasnb1DBPqJGvQkSUWDwAJ7bmp+G2era
 ot4ni7bOt92rN6hII303rvtcKmHPxyrl2lhZEMODgvWtxA0iSkifiEQE4b6KpLxeFa0u
 3qqzj9MgM38dnyoXFC2XP5BeLblSRJBNDi6GaCfnkgLga1jQW+r+LYzpZriIe/y3lFIV
 Fh/m+baZk8U4uQ4Oq541ZkLgWBpo/tyMaT5wG+5K00gSC55Ce+oH3NRvgCYuXuyQoOWR
 F+jA==
X-Gm-Message-State: APjAAAXA5rUGD6z5b8vUe7VopyaRAJCgYZ2TqjTEkk1j3xtrfVam05sf
 OCHWJjaqq+BSG4Dfe/woZezNzlnM/q8=
X-Google-Smtp-Source: APXvYqyoqwIqKEpY62mA8d7MpFL4/Vcp7mF8jWMLATlPXeL8mPqvO42/U9+/pzRuylOYQtwNkrobBQ==
X-Received: by 2002:aa7:90cc:: with SMTP id k12mr39084323pfk.105.1579198934173; 
 Thu, 16 Jan 2020 10:22:14 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id i11sm3281265pjg.0.2020.01.16.10.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 10:22:13 -0800 (PST)
Subject: Re: [PATCH 3/3] linux-user/i386: Emulate x86_64 vsyscalls
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200114210921.11216-1-richard.henderson@linaro.org>
 <20200114210921.11216-4-richard.henderson@linaro.org>
 <87ftgfl64x.fsf@linaro.org> <3733f2cd-9262-d7f9-ab9c-c8a3032732df@linaro.org>
Message-ID: <a81dad4f-7968-a360-6a66-9559ef131dd8@linaro.org>
Date: Thu, 16 Jan 2020 08:22:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3733f2cd-9262-d7f9-ab9c-c8a3032732df@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, riku.voipio@iki.fi,
 laurent@vivier.eu, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/20 8:19 AM, Richard Henderson wrote:
> On 1/16/20 6:26 AM, Alex Bennée wrote:
>>> +    /*
>>> +     * Perform the syscall.  None of the vsyscalls should need restarting,
>>> +     * and all faults should have been caught above.
>>> +     */
>>> +    ret = do_syscall(env, syscall, env->regs[R_EDI], env->regs[R_ESI],
>>> +                     env->regs[R_EDX], env->regs[10], env->regs[8],
>>> +                     env->regs[9], 0, 0);
>>
>> How come the register ABI to the syscall is different to the others. I
>> can see why syscall doesn't come from EAX but the others are a different
>> set to normal syscalls which might be why:
> 
> Cut and paste error, I assume.

What register difference?


        case EXCP_SYSCALL:
            /* linux syscall from syscall instruction */
            ret = do_syscall(env,
                             env->regs[R_EAX],
                             env->regs[R_EDI],
                             env->regs[R_ESI],
                             env->regs[R_EDX],
                             env->regs[10],
                             env->regs[8],
                             env->regs[9],
                             0, 0);

Looks the same to me...


r~

