Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6822CF561
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:18:28 +0100 (CET)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHX9-0005UF-5K
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klExm-0001nk-Mn
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:33:57 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klExB-0002Yu-UD
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:33:32 -0500
Received: by mail-oi1-x244.google.com with SMTP id p126so6961283oif.7
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zix5yg8BY5Vd2yK0fKpVFjrIsiSXh3m348evVK1e0Es=;
 b=KbmCMHmd/VejOOJK5IhwP1q6I0YvtRI0Kt7As4tuqsNfpmd/jEFouPQiIvLSOtATJJ
 OSi3Q3Hsh7I1++6jPmEK1NmKXuH5YGXSPashDsRwOmka+fwY2wSuw39HKIj9YFWAhTWY
 Jnq6UzO8jzxXclK8TA61w6jDO5qgyWXrstsvbxbtWIg7UXEPN90QrENThjWFbiH0UjO8
 clH4YT6bpTyEKCi+zRtOVUk2x5bjtvEE7MLQSE6ZJBf8aYVN7PDwjAbGSXZHUjV5Dkx+
 +ygGsM/Xz2eSEYuO/rnwzZM0h/KYHVTzZuW+D9dD+GUK6wS/+Hzq8pl01BtZ8m5Qg/4i
 cv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zix5yg8BY5Vd2yK0fKpVFjrIsiSXh3m348evVK1e0Es=;
 b=m0pW1DW2qxAQPA23pslT8iU4aN6EzoJmSf1aWgxsqDfZwLvZ9qOXbni1CKfOKiqUS+
 eM4TmZGQqupzgfLE+Z87chygZZn4tkDB3LYiacLkOsSQSgOcJbQ4AAVaFChhE/syiRaF
 Vfxmboo2C2a3PqOBU9eavIPHyFVy9F3irCwoBLuxb3KerNs7/EuD5sxaoMGgoIw+UQQs
 lzxzis1HwPeuDwck1fAMoW9OENn/vuM8utpJKkdeNcLm/T/p7FvMcuv9cKFWxG1K19L2
 7cTUCEtgFwsmGtItCJqvrtteZQWpratsiuuUFoX74H9WKWeQ87g0AunTAHgQ1Pv9ls6Q
 4PfQ==
X-Gm-Message-State: AOAM533FHBwL06fX+9ZRJE3lYdYtQqYzihIWNvmknCU51poOEXBB58R3
 OvJJwEoZk+769ynQTG6XxyRM6X59pi9uOTsg
X-Google-Smtp-Source: ABdhPJxBvUAgxFaQCEUJ0GlO5QSE+1rkwA6QXa16farIKMdOqUQ3Vl6seid/2o0k/6VtdDVXTkKFdA==
X-Received: by 2002:aca:72c1:: with SMTP id p184mr4000016oic.86.1607102921294; 
 Fri, 04 Dec 2020 09:28:41 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 30sm127085oth.7.2020.12.04.09.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:28:40 -0800 (PST)
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
 <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
 <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
 <CAFEAcA_ATUZ+v8VE8q34mmi3pLhg3qFDHgi7mQB-JJKDEZuzaw@mail.gmail.com>
 <3ab6b7fb-51cf-0ec4-2c70-e86bb01dcc3f@ispras.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05e61e91-c983-4952-ee31-859961cc9120@linaro.org>
Date: Fri, 4 Dec 2020 11:28:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ab6b7fb-51cf-0ec4-2c70-e86bb01dcc3f@ispras.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 12:17 AM, Pavel Dovgalyuk wrote:
> On 03.12.2020 19:14, Peter Maydell wrote:
>> On Thu, 3 Dec 2020 at 16:10, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
>>>
>>> On 03.12.2020 15:30, Philippe Mathieu-Daudé wrote:
>>>> Cc'ing Pavel
>>>>
>>>> On 12/1/20 4:55 PM, Peter Maydell wrote:
>>>>> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
>>>>> <richard.henderson@linaro.org> wrote:
>>>>>>
>>>>>> As reported in https://bugs.launchpad.net/bugs/1905356
>>>>>>
>>>>>> Not implementing SCTLR.A, but all of the other required
>>>>>> alignment for SCTLR.A=0 in Table A3-1.
>>>>>
>>>>> Something in this series breaks the 'make check-acceptance'
>>>>> record-and-replay test:
>>>>>
>>>>>    (30/40)
>>>>> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
>>>>> PASS (9.14 s)
>>>>>    (31/40)
>>>>> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
>>>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>>>> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt',
>>>>> 'logdir':
>>>>> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/result...
>>>>> (90.19 s)
>>>>>
>>>>> The log shows the "recording execution" apparently hanging,
>>>>> with the last output from the guest
>>>>> [    3.183662] Registering SWP/SWPB emulation handler
>>>
>>> I looked through the patches and it does not seem that they can break
>>> anything.
>>> Could it be the same avocado/chardev socket glitch as in some previous
>>> failures?
>>> What happens when re-running this test?
>>
>> I ran it a couple of times with the patchset and it failed the same
>> way each time. Without is fine.
> 
> I applied the patches and got no failures on my local machine.
> 
> Do you have any ideas on debugging this bug?
> What does "arm-clang" means? Is the host compiler is clang?

I have reproduced it:

qemu-system-arm: /home/rth/qemu/qemu/include/tcg/tcg.h:339: get_alignment_bits:
Assertion `(((1 << (10 - 1)) | (1 << (10 - 2)) | (1 << (10 - 3)) | (1 << (10 -
4)) | (1 << (10 - 5)) | (1 << (10 - 6))) & ((1 << a) - 1)) == 0' failed.
Aborted (core dumped)

You need --enable-debug-tcg for this assert.

It's incredibly stupid of avocado to report SIGABRT as a timeout.


r~

