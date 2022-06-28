Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2C55E59C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:16:49 +0200 (CEST)
Received: from localhost ([::1]:53426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6CxM-0001Vr-6g
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6CvG-0008HT-Qw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:14:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6CvF-0004VC-39
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:14:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id e2so18074510edv.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lXNlvyGhAaRTRb0F1Oifi2Fp7Fa5fpEVSMGQxsKPOZk=;
 b=PdqhaGGXF9hX59YEegwfxrS6H+NWZtA1sbNo7QJs4QMFAVrZkNq6TUbkLDS7LY3rzZ
 tPRg587Iy0f5Jm5tZKPQC5PUWdLgCB8wbw8tSpzNudxGf6j2yJVITT/vGlwJ7i4sKku5
 EGfr02pd3w5urGrNfvvYqpiqLTlI2o0OIaINYsddt7dHAWs9skUV93lry532rFMHbWCJ
 l5Ad1Yp0orUYCxXzfJUFtIgbyqRUXcpws37LuqikfnKtUIH0ihuOmLrrvlsag2T2H8xO
 VbfCPM3gSQt+e1hurbyB15O19lbq9DtfCdK8Rcj8wRf3/Xnl8DB5MMBNLr23AEx0Wlzm
 Q/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lXNlvyGhAaRTRb0F1Oifi2Fp7Fa5fpEVSMGQxsKPOZk=;
 b=k11cCHSXlc9+ta4ZQaMUnhG6lNE/ovC+iNecfywy+wHxVDIFIzvg1VXGZoaEZverF8
 5vxxoSEXlcPxDiWAkm6v2dm1KS8LMlYwSHLu73u0NLJLB6OQY8GtbrMJaUGh5lHHc3/e
 WrvF2ZNi9NOs0b1IF2e6SJPo/PuNkGmIuVwlu5rT9kttv8h8bLtszJbNSXU+YptLDI56
 wKqLxV/e1K+aF4UV3MXkHXxzEnce9BWjIBc9wJiGtGyB0W7pLc86saTrhtVWKMoqrIQb
 zOZ+Q3A7HYVpmb8gWQiVbMVK2JUqT+h2df3XhmB+Ac47yZqkGe+0R2kTUsnCD6Ren3+R
 qEHg==
X-Gm-Message-State: AJIora+3lUdyBv3E3uW19dpEBTAIEs1Fpg2dLbJFocYUHFdFf0aloVxJ
 df6zTEJqXyRbObs2e/R5vpaVGw==
X-Google-Smtp-Source: AGRyM1tERG3Q4/8eiHlVgdTfm32sYjm2aC3i3a8CHeOEOf8DO/7Us6gnfj75ynVsVuHKXpvgejTXAQ==
X-Received: by 2002:a05:6402:b48:b0:435:728c:d127 with SMTP id
 bx8-20020a0564020b4800b00435728cd127mr23713065edb.392.1656429275457; 
 Tue, 28 Jun 2022 08:14:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa7cd05000000b0042bc5a536edsm9536702edw.28.2022.06.28.08.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:14:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B15D01FFB7;
 Tue, 28 Jun 2022 16:14:32 +0100 (BST)
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: Slowness with multi-thread TCG?
Date: Tue, 28 Jun 2022 16:12:40 +0100
In-reply-to: <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
Message-ID: <87h744keg7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Frederic Barrat <fbarrat@linux.ibm.com> writes:

> On 28/06/2022 13:25, Matheus K. Ferst wrote:
>> On 27/06/2022 15:25, Frederic Barrat wrote:
>>> [ Resending as it was meant for the qemu-ppc list ]
>>>
>>> Hello,
>>>
>>> I've been looking at why our qemu powernv model is so slow when booting
>>> a compressed linux kernel, using multiple vcpus and multi-thread tcg.
>>> With only one vcpu, the decompression time of the kernel is what it is,
>>> but when using multiple vcpus, the decompression is actually slower. And
>>> worse: it degrades very fast with the number of vcpus!
>>>
>>> Rough measurement of the decompression time on a x86 laptop with
>>> multi-thread tcg and using the qemu powernv10 machine:
>>> 1 vcpu =3D> 15 seconds
>>> 2 vcpus =3D> 45 seconds
>>> 4 vcpus =3D> 1 min 30 seconds
>>>
>>> Looking in details, when the firmware (skiboot) hands over execution to
>>> the linux kernel, there's one main thread entering some bootstrap code
>>> and running the kernel decompression algorithm. All the other secondary
>>> threads are left spinning in skiboot (1 thread per vpcu). So on paper,
>>> with multi-thread tcg and assuming the system has enough available
>>> physical cpus, I would expect the decompression to hog one physical cpu
>>> and the time needed to be constant, no matter the number of vpcus.
<snip>
>>>
>>> Ironically, the behavior seen with single thread tcg is what I would
>>> expect: 1 thread decompressing in 15 seconds, all the other threads
>>> spinning for that same amount of time, all sharing the same physical
>>> cpu, so it all adds up nicely: I see 60 seconds decompression time with
>>> 4 vcpus (4x15). Which means multi-thread tcg is slower by quite a bit.
>>> And single thread tcg hogs one physical cpu of the laptop vs. 4 physical
>>> cpus for the slower multi-thread tcg.
>>>
>>> Does anybody have an idea of what might happen or have suggestion to
>>> keep investigating?
>>> Thanks for your help!
>>>
>>> =C2=A0=C2=A0 Fred
>>>
>>>
>> Hi Frederic,
>> I did some boot time tests recently and didn't notice this behavior.
>> Could you share your QEMU command line with us? Did you build QEMU
>> with any debug option or sanitizer enabled?
>
>
> You should be able to see it with:
>
> qemu-system-ppc64 -machine powernv10 -smp 4 -m 4G -nographic -bios
> <path to skiboot.lid> -kernel <path to compresses kernel>   -initrd
> <path to initd>  -serial mon:stdio
>
>
> -smp is what matters.
>
> When simplifying the command line above, I noticed something
> interesting: the problem doesn't show using the skiboot.lid shipped
> with qemu! I'm using something closer to the current upstream head and
> the idle code (the for loop in my initial mail) had been reworked in
> between. So, clearly, the way the guest code is written matters. But
> that doesn't explain it.
>
> I'm using a kernel in debug mode, so it's pretty big and that's why I
> was using a compressed image. The compressed image is about 8 MB.

If the debug mode on PPC enables live patching of kernel functions for
instrumentation that can certainly slow things down. You would see that
in tcg_optimize appearing in the perf log and "info jit" showing
constantly growing translation buffers.

>
> The initrd shouldn't matter, the issue is seen during kernel
> decompression, before the init ram is used.
>
> I can share my binaries if you'd like. Especially a recent version of
> skiboot showing the problem.
>
>   Fred


--=20
Alex Benn=C3=A9e

