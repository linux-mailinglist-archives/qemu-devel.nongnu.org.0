Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DE52A7F9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:33:00 +0200 (CEST)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr07z-0008G1-0C
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqzr6-0000tf-9U
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:15:28 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqzr4-0001Jq-Gm
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:15:27 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z7-20020a17090abd8700b001df78c7c209so2955171pjr.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vu4bRFyCQl+zZHvFWK8PC+cq064u3zzxRGtBX7tCjMA=;
 b=HDopOhFDNQBv1yDUUpZhjPqNULtTT+hTn8d5oSDjK9BU/8O6/BPe4iKVdqvNLUUb7C
 iw7cwRIuWXpKDZm0oGdVpA9t0OKxGHWwUD0kGwEGZ1xXuS5z72hAqmCczy8kCRgIS8Er
 ELoXUOzs02A5YsAA/0bioT1W/qQlr/X9/kLd1gWWK3u0R+PdPTBsnJtrE2fcL7pyDvTP
 GsILaut914aqet8v3ou19PK9AOjFuKtKGYLGxuarmxuWVRGQCzNmp1PMJB9OSM5mviPf
 lnvGMGQC8uAB4RR/KkkZdAatUF2EbBX+Hvqh0vsbPl6/r77CPNtqEAt2nXowDI84rHhN
 wEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vu4bRFyCQl+zZHvFWK8PC+cq064u3zzxRGtBX7tCjMA=;
 b=xjXLQV0pYTaZr1pNgFTgKgXhI8LTCgwte50tPsSIAkeXQbiRRUPPf4qNSy1aQ94sfe
 AbBtCj+hc0E3S45rXqK0yeqV6Rd1ZHldw4Ugmzc5DlZEbCvN69JLoabeb4M7QBGVqdxq
 m+H9qtmV4QDd+pIL0XrNgbiLrqbHKXN+zc1bXMH9f60d89WXpmlzfxHMlv7bPBjuQ8hi
 6gQ1tO7a18JXHyxAIZ29fETSiLHYfnqHkuQC0ick/pZhLM7eslR1tzKjYZwQlgsCFuYB
 4C/bjnrTz+rjImwiMl6Iw34k8HYiCSGmJfVJXtyXkPUu4TxqntIBrQLf8idc8x0LVVua
 Q0dA==
X-Gm-Message-State: AOAM531wYFWcT4csfVqJXjtS6aAUnLJyMbzsKs6aT7ZttgFaL5tWyAnR
 YSPmD0B8Gl1p//ar8LEK7CbCPw==
X-Google-Smtp-Source: ABdhPJyn11woBoJyPJPf0Bir2Gn1+HQjGPw6MyWPPlem7HRxYKx3yvdE7aP0bTdc2c0bh+ZAf3dI6Q==
X-Received: by 2002:a17:902:e809:b0:15e:c67d:14c5 with SMTP id
 u9-20020a170902e80900b0015ec67d14c5mr22756799plg.13.1652804125201; 
 Tue, 17 May 2022 09:15:25 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a634a04000000b003c6a80e54cfsm8754898pga.75.2022.05.17.09.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:15:24 -0700 (PDT)
Message-ID: <7fcd0acb-f88c-b262-b9f0-33b97ee2772a@linaro.org>
Date: Tue, 17 May 2022 09:15:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Capstone for MIPS (was: Re: [RFC PATCH 0/3] Remove some of the
 old libopcode based disassemblers)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20220412165836.355850-1-thuth@redhat.com>
 <2af15d6d-ad10-2f98-fb0a-37d0125044ca@amsat.org>
 <a8a7b68e-6fb9-e329-5c88-99a1fa5da75b@redhat.com>
 <43860dbe-5cf8-91ef-2bba-8da631154b3b@amsat.org>
 <444414ba-6ca8-c22f-601f-498f06c83d80@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <444414ba-6ca8-c22f-601f-498f06c83d80@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 00:18, Thomas Huth wrote:
> On 09/05/2022 15.42, Philippe Mathieu-Daudé wrote:
>> On 9/5/22 15:18, Thomas Huth wrote:
> [...]
>>> By the way, what about MIPS? Could MIPS be switched to Capstone, too, so that we could 
>>> finally remove disas/mips.c ? (We're not using capstone there yet, and MIPS has so many 
>>> flavours, big and little endian, 32- and 64-bit ... so that I'm unsure whether there 
>>> was a reason for not using Capstone there, or whether it just hasn't been tried out yet?)
>>
>> Last I remember is Richard saying "the capstone backend for mips is not
>> in terribly good shape":
>> https://lore.kernel.org/qemu-devel/0c7827df-c9d4-8dad-a38c-4881ce7dd22b@linaro.org/ 
> 
> That was in 2017, in the Capstone 3.x days ... maybe the situation has improved nowadays?

I don't see any substantive changes to the capstone mips backend since 2016.  Almost all 
changes to arch/Mips since then are changes to function prototypes as the internal api 
evolves.  I.e. just enough to keep it compiling.


r~

