Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559831F9CE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:20:18 +0100 (CET)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5hh-0008JQ-75
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD5ZD-0002Ab-KC
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:11:31 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD5ZB-0005QN-W8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:11:31 -0500
Received: by mail-ed1-x52a.google.com with SMTP id l12so9890797edt.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jLawxaxRACKi/bSeus+nrGvtJMFvtv1odVT02Esxu88=;
 b=uBtRRGycNdzPfTKWAaDVzg9ueu8TJlJBx8wGObCmi0JlZ1eJFoon98Bi2zUo+GO6nP
 bEqMVuFSU+oB3pEFi+Rww/3tT6n9UWYglLvynFpqvWuYKaLmf2mC5K5WdAD08H2jOqTi
 LShC335QE5ldHwjvpid+x5Bje8udti+HRhaEkqPFabQ9BjBTSza4bIGFF64m9nfyGfo8
 UYbwF0/WLCqCOlHatYkz+EcCVqxhVdqk8M/UexoHiA3PX/f4SM/NlAJA6hO9HF+qc7c+
 TnzwPDRfny/ONrOG1wJYoo0XY+CPvldfQ9L/iF3e5uarO4sDmQQeVQky4N1WAiEiSr1c
 J5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLawxaxRACKi/bSeus+nrGvtJMFvtv1odVT02Esxu88=;
 b=EQbkdjDZA4K58F0i9EuGud2tWuqN7SMJSZQJUzv4WxoJArkJbppkfQ7a8cPUzqOpqB
 jHasS6IT9WX3kELYrbyFOD8Fp6Xa13u59ZU1HvW5JnyRmkXPe2264wZszlu04dhoIdKV
 Rb1wuGQh5acepfrczMfaX+cQGv9LqOopJrWhziIB2ByMQzH8oqRa+VW3iXUrubNctVK8
 xnM87JhcTxWQQ7RHSO/5j6pm3NdyKMfujTW4Hdz+sKom1uUV0q0nlA18ZW3vugbRWCut
 mgel68WfTegygcjWrwVByfkHAeSIf+lgiujKFJ1zrplav937osMuzu8rGYysTSj3gnoH
 ZZKw==
X-Gm-Message-State: AOAM532K9vkbEM2j2qPJjZG1vrQo5h3OMRwx6Po4sk8P5p7chWxQjNsC
 Nj/cd8xISuxEb/7k0Hg//MBoJgamwj/EyRv/ziEgP68qrAI=
X-Google-Smtp-Source: ABdhPJzYt6kkWr6lOPtP8c1txIDqWQ7cQXFhLrMf8SKCXGsa/xkNp6NpUhNhjbv+Y8j0g6uv/IM2kb2MWnR8fEEGL1g=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr9113583edx.36.1613740288341; 
 Fri, 19 Feb 2021 05:11:28 -0800 (PST)
MIME-Version: 1.0
References: <1613739127-61825-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1613739127-61825-1-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 13:11:17 +0000
Message-ID: <CAFEAcA_qpOXLXDkaYq6T+StUnSUEuV6+FL94bgzvkoRE6ShUMA@mail.gmail.com>
Subject: Re: [PATCH] Make ram_addr_t 64 bits unconditionally
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 12:52, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Currently machine->ram_size is a ram_addr_t, whose size is 64 bits
> if either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
> enabled, so it's effectively only 32 bits on 32-bit-not-x86.
>
> commit 4be403c8158e ("Make target_phys_addr_t 64 bits unconditionally")
> did the change for target_phys_addr_t which is now hwaddr to be 64 bits
> unconditionally. Let's do the same to ram_addr_t.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> --

As noted on the other thread, I like this in principle,
but I think it would be interesting to check whether it
has a measurable perf impact on the non-x86-32-bit hosts
that it affects.

-- PMM

