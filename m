Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE373920B1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:14:53 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyzU-0004HD-JZ
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyrb-00029h-32
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:06:47 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyrX-0002ls-2x
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:06:41 -0400
Received: by mail-pj1-x1032.google.com with SMTP id g24so1338256pji.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Td+CBDy/I42hwygE1EuJxWYP+5i2rOSCloQUKG0fQhE=;
 b=JFfD8o37zt44nzS4IPsVfsAxvmiNkEduvI7YgU4bP9+kmLgEpVeYR4kE+hhO/cqQcc
 nK+tU0H+lyP9t6lqm+Y7yCYXb4nRsiFRu/ab1m9Y+XaHn0K/UN/JRAs24FyouuzOFOpu
 Gy8eyqUZ3jUjWgjnIzpiGamoCedUAkhelSipg6fWRS1M840eijTraKomhOCmV7C2vJxB
 5jvDUkfnUjvdcHxpOJ1Zlt+pkxv6r1dLsFlYmrRbiI8yTIYdE5/HbitB8xCrbsTX5I6F
 3KIe273EYZCCsRZyJLwuqxCU7rC7b9iUvLZ8+oyeXpKRTBTfRe6F9LpVjEnS06TPyR84
 +bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Td+CBDy/I42hwygE1EuJxWYP+5i2rOSCloQUKG0fQhE=;
 b=G1pzKyBxtzJVuT7VL7XMnjR148wLzvtrWoGOM17ya57xDN+JxJuEvacdGsYow5kM0A
 vGP4+1XvLjWkI8miPPWSvyCv60sPRfQwIo2eNX9wqjw+RVdv8m6Q5tKo67vOjN7MiDq6
 r03NILwCn+W3S0oJf9pL97Rk0yFJd5y1i1x4E7vdTI8Kdmbrw4oMwUSUAO9+t6jmY0Xr
 TGayeOipBvv/909JDhvhGx1GpIkPeSioneo+VI8lrCzxqALaGr9PqNDkLmB0gzHPqU8s
 BhR0KE58nW4PlYeyd3gQ57cwqOTx3PvciGI0/DiZpaWVcc7dm1+Heie45tKZfJ1lsYO1
 bsEw==
X-Gm-Message-State: AOAM532UdCHM0Yh4VjEGA1vEy14BxaMRBnni3LP2XcH3lI0xZGMl6uPJ
 KqsIMA4EPs9P5bMgotdTTd545w==
X-Google-Smtp-Source: ABdhPJwE7DZ0FDKEssOT3voosAqRMpuxGOyEDnVvdm8BZX/5KABhBMtLpcpnjZvuTGdSU/rNA4CQgQ==
X-Received: by 2002:a17:90a:fc8f:: with SMTP id
 ci15mr37465115pjb.147.1622055997756; 
 Wed, 26 May 2021 12:06:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 80sm16141664pfw.200.2021.05.26.12.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 12:06:37 -0700 (PDT)
Subject: Re: [RFC PATCH 13/15] sysemu/memory_mapping: Become target-agnostic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <910ba35c-3ebf-eacf-730b-c7f0b2646900@linaro.org>
Date: Wed, 26 May 2021 12:06:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> target_ulong is target-specific, while hwaddr isn't.
> 
> memory_mapping_list_add_merge_sorted() uses hwaddr arguments
> anyway, so use the hwaddr type for MemoryMapping::virt_addr.
> 
> Remove the unnecessary "exec/cpu-defs.h" target-speficic header
> from "memory_mapping.h" and use the target-agnostic "hw/core/cpu.h"
> locally in memory_mapping.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/memory_mapping.h | 3 +--
>   softmmu/memory_mapping.c        | 1 +
>   2 files changed, 2 insertions(+), 2 deletions(-)

Certainly hwaddr is now unconditionally 64-bit, so I think this would work 
fine.  I just wonder if uint64_t wouldn't be better, since virt_addr is not a 
"hardware" aka physical address (as per hwaddr.h).

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

