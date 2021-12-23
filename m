Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5081447DDD0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 03:44:32 +0100 (CET)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0E5n-00041C-32
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 21:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0E4y-0003Kn-64
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:43:40 -0500
Received: from [2607:f8b0:4864:20::52f] (port=36550
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0E4w-0002mX-Gl
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:43:39 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 200so3647409pgg.3
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 18:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/acgfwDvL/Io0Y+V2Pc/ux5Vbq/tD4b3+hjC+En88Ms=;
 b=sMd11BbMFQuU4I3SMAxUOUaZsGBXopyEw3kIaQDn0CsgGy7iC6I3eWVIDcf7N4Xc0o
 FkKlmeRnjkZZeaK5C4xOXaWr8+/xVWcPAo0HkQujCKS2tk95VbHyf9wVKyd0R/Ox9P8c
 WAF9jKyXfX/PVoaw7WTVrRXDDTKX2RjEbpZQzS0qzx+un6eRnw7J593YEsLZAUFKQnKt
 5vuD+1c32g83wA4UNIoLOmvj+2MGRE/UYArZ9oH1sWerRRrIrOgxNsv13DV3rs4nwT6P
 QH0kh+5ZZuno13KxDKwGWlg7l+XEC7LAzDT7ZGZYbMKCUGpyQsevhpQiWxVBS/8tbEI5
 SuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/acgfwDvL/Io0Y+V2Pc/ux5Vbq/tD4b3+hjC+En88Ms=;
 b=H+xlEqEdmYiaELsWxRnWmiLDO3xI4rBYayV2mqYvOIBlFYnHjxf9pie0OPeS1e5yAz
 8krvcDXYzUkSRP9yANylTSBPXG4kfs+1kZ3cNtQT1Vk9rhv0aqn9NuZIAu06guWl1eo6
 JAt0fChn0kXjuQ3wu7qxaE+KqwRfz8kKToHhFQOxA6tEVRKPTQeUuDLWOHcVtYf7FvOR
 1/H55psKUouLRzKRD5vSvmwKNVoSrhx2cTNxBBmuGT0npjW+4A/AaNfmKGGBbe16YO7i
 tCoMAoDCVEMgsUc5ZKowIXZ116ECXga57xtPiGp3YGGGTOELOtCx6kmpJODQlOaBxRpy
 UFUg==
X-Gm-Message-State: AOAM530vN+s6ti54rAD/9t1UMcWyQ899LQfB01csa8VkUhxLAtdM5ehE
 /UPVpGlxwPHjUjShwDSQOjHK/w==
X-Google-Smtp-Source: ABdhPJzqDWZ0jwck+JgRK5AylyicATHBjWdWA8PlIpqrGoEzzWpC4sefcydlAh31xFrwxGrEbaTGhQ==
X-Received: by 2002:a63:91c2:: with SMTP id l185mr456053pge.395.1640227416981; 
 Wed, 22 Dec 2021 18:43:36 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b6sm129066pjk.29.2021.12.22.18.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 18:43:36 -0800 (PST)
Subject: Re: [PATCH 0/8] Re-write PPC64 PMU instruction count using TCG Ops
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211222134520.587877-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4185811-f0dc-8ee9-c254-ebb04d883cd6@linaro.org>
Date: Wed, 22 Dec 2021 18:43:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 5:45 AM, Daniel Henrique Barboza wrote:
> Hi,
> 
> Two days ago Richard Henderson reported test failures with Avocado and
> powernv8/9 due to timeouts [1]. The culprit ended up to be commit , a
> commit where I introduced PMU instruction counting for TCG PPC64.
> 
> For a reason that is still unclear to me these Avocado powernv tests are
> suffering a huge performance impact after that patch, something that I
> didn't verify in any other scenario I've tested. So one alternative to
> fix the situation is to understand this difference and try to solve it,
> which can take some time.
>   
> Another alternative is to optimize the code introduced by that commit.
> Today the instruction count is done by a TCG helper that is called after
> each TB exit. I was aware that calling a helper frequently isn't
> optimal, but that got the job done and didn't  hindered the use of
> pSeries and powernv machines.  Well, until [1] at least.
> 
> This series rewrites the PMU instruction counting using TCG Ops instead
> of a TCG helper. To do that we needed to write in TCG Ops not only the
> logic for increment the counters but also the logic to detect counter
> overflows.
> 
> A lot of code was added but the performance improvement is noticeable.
> Using my local machine I did some test runs with the 2 Avocado powernv
> tests that are timing out at this moment:

You generate a *lot* of inline code here.  Way too much, actually.

If you can get this performance improvement with this reorg, it merely means that your 
original C algorithm was poor.  The compiler should have been able to do better.

I've tested this theory here and...

> - failing Avocado powernv tests with current master:
> 
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (70.17 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (70.90 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (70.81 s)
>   
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (75.62 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (69.79 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (72.33 s)

boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (75.73 s)
boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (80.20 s)

> - after this series:
> 
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (39.90 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (38.25 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (37.99 s)
> 
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (43.17 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (43.64 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (44.21 s)

boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (39.66 s)
boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (43.02 s)

BTW, pre-power8-pmu, 29c4a3363b:

boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (36.62 s)
boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (39.69 s)

I'll post my series shortly.


r~

