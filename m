Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF45F7257
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 02:42:40 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogbRn-0008VJ-0D
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 20:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogbNi-0006ER-0q
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 20:38:28 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogbNf-0006Sy-Of
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 20:38:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id 10so3245505pli.0
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 17:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gxD3bz8V1XLxh/6lskR336UF0PPNKio5ulpsblR2YkU=;
 b=UOMjFLl5kcEMAOld9vNJnYXiTSFAvSQU7jT+H6kGAB26x0m1Ed1ADauMTTmHgzqoXM
 PrQok97j7sbns4OhqF2Fxl+j3cmYVFyZD0wT6L3AZS5Kijc9EYJsXJS29SB5EXWQIqwd
 UrJ2ptDOwwlMkrSek56YqFT9TIvVqvkcMk0zVNXo6E+SMzoVZlIBlPH+w9KBgS5JbX2P
 Q9bft0n8iwN2WKhAK3HxqXGgtO7rQEfB3rGddiKFEZmXaTo1Wsps+wOSjEo06JT1sSve
 Hc36uTVWB8schxNhFEiOx4reVpeWzaeA/vdP/IaKUkuPkvZbz8QvEZKd/q0U1XBNImlS
 h7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gxD3bz8V1XLxh/6lskR336UF0PPNKio5ulpsblR2YkU=;
 b=zMWwfFTvTNLU2neuGsuRSfoIAUvm2sJW8QYQnu/6SU1HxK+l1J/liCKSpv+DNtChp0
 qZvsjzIHATKSECbwyK3Kd3IX3eTBNx1ksZNtSVH6R2muG4QFNWhOO8rHgfIoCKWN5eF9
 Si7rsp9ryIKCVcCS0EyWVGpHvcjPiBgBna//D11mUu4ZhvmwUqdeZ6tNzZglAnodXd85
 DfruFi/O9GySKcJrnoxlwc/rhHyE5WcZtTiQgyQ9W2JzdKheLp2VqnrbPREChP8/UU21
 C5iFFO6C9EHv5PmHmTzeTPrpzMRaOcTBmm9q2UsCQKP+XhswD5F9/OBRtfHfVdq6qV2z
 aqLg==
X-Gm-Message-State: ACrzQf2tI6sNkqCotYJ8AxP3p+fb0uw+hrdU1tgxLVU659C/GC+eEwF+
 tH1JFT27Bxh2ip/HVbXOD1Dckw==
X-Google-Smtp-Source: AMsMyM5GZq3tf2YlU8gcVv6ST9GNwzHB0E/rG81rx0lubQF/oLLBn8MuMxHENEZRYk46Jp9ER6c21g==
X-Received: by 2002:a17:90b:1b0a:b0:203:3947:1a73 with SMTP id
 nu10-20020a17090b1b0a00b0020339471a73mr2431777pjb.43.1665103102167; 
 Thu, 06 Oct 2022 17:38:22 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 z24-20020aa79498000000b0055fb19e27a8sm224772pfk.121.2022.10.06.17.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 17:38:21 -0700 (PDT)
Message-ID: <4e087808-e687-2bf5-db1d-2e4072f1c69f@linaro.org>
Date: Thu, 6 Oct 2022 17:38:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
Content-Language: en-US
To: Soichiro Isshiki <sisshiki@isshiki-clinic.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: sisshiki1969 <sisshiki@mac.com>
References: <20221006153841.10750-1-sisshiki@mac.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221006153841.10750-1-sisshiki@mac.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/22 08:38, Soichiro Isshiki wrote:
> From: sisshiki1969 <sisshiki@mac.com>
> 
> For now, qemu-x86_64 returns ENOMEM when mprotect() was called with an argument
> len is 0 from a guest process.
> This behavior is incompatible with the current Linux implementation,
> which mprotect() with len = 0 does nothing and returns 0,
> although it does not appear to be explicitly described in man.

You're right that the ordering of checks differs from the kernel.
The kernel has:

(1) validate prot !(growdown && growup)
(2) validate page aligned
(3) pass len == 0
(4) validate no wraparound
(5) validate prot for arch.
(6) validate vma valid.

while we have

(1) validate page aligned
(2) validate prot for arch
(3) validate vma valid
(4) pass len == 0.

My previous answer vs guest_range_valid_untagged is incorrect considering all of this: if 
start > GUEST_ADDR_MAX, that *should* fail vma valid, but the kernel will have returned 
success before that.

Although, sorta, this smells like a kernel bug.
Why should mprotect(-4096, 0, 0) succeed while mprotect(-4096, 4096, 0) fails?

But anyway, if we're going to fix len == 0 to match, we might as well fix all 3 test 
ordering bugs at the same time.


r~

