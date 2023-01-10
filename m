Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A41664441
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:13:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFcW-0006sK-Nh; Tue, 10 Jan 2023 09:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathias.krause@opensrcsec.com>)
 id 1pFDSN-00049m-Nm
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:10:22 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathias.krause@opensrcsec.com>)
 id 1pFDSL-00057t-OS
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 07:10:19 -0500
Received: by mail-ej1-x62f.google.com with SMTP id tz12so28033879ejc.9
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gVc5jfW0tU6LKMV6osTzqESg4stytCoAR83GJOQq+e8=;
 b=Gf6xT4PsNimHFHc17k9pYQ9JLDCvvipCGT4JcmraLHJBhVI3LD0g+YtogCmv1JA+B5
 UlneEdMm2q1LvwxlVwwN6qDtmiwczuSsxADrTDVlCVyOcZ5Tcpqkqa7ItZgTus0yGzNI
 4Aa80m0vGAqdCPcZI/J3E2+2BUwPrqrG/4QLyUEJk6ajXs7sGjEiCQ/oyoDxHN+F1CIt
 tY2o+FDdrlp8jsBl2Vj0vdEpOI8LnDLDZ4IxiaDWqNWQZYuSTtKDeypAltrHmzY69ZDX
 PQOYvBTJmx2f0nBTnukf8K6eBlCdVMpttgwUARII35JuMV88czEI6WD9u2yZGKnMwENF
 UC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gVc5jfW0tU6LKMV6osTzqESg4stytCoAR83GJOQq+e8=;
 b=YpFDhEhM4sGoxAl3M/Zl8TDPWxexSMBBrYqtFKqUqrlrF2airoCT/THn3B+RtqhiPD
 apV00RtgF6KtgXMYFR+YhUMUKe/D80yGy5PUUgtDsDGkOXz7MlVDjYDbGw49LsZQo9Nn
 7JYx/plshTjHi8AtYowQzVHFaJGoCILkzAxfQgvkjRxlufNrb1wteBpXC8o5AKElFKtU
 fmqmR4dTG2LFGL/6wFrwl19WDH36QB3dKJ+UzOVWlFkM1nOWuok5ShwOIax8gMxznxmD
 gvceT3NV7ZekSym/W5M+PXVPqHf6Nq2ttbWiCv+1QnT8icg4pfLQrO3VXdqlhI4ufjT+
 6GTg==
X-Gm-Message-State: AFqh2kruF7CaYHuql1bxloxukkS3UG0TvcAevEGlP80HLEuoO3ez/CAm
 5JhYcKmeyshKzKkXDuPSfmkySQ==
X-Google-Smtp-Source: AMrXdXuKKVnZN4iZ2Sse+Ujg+xmzXmEVaV6M+UuE8weh75aeAVNhwBfU5ToZD9KtRV10VJgBtATUjg==
X-Received: by 2002:a17:907:20d6:b0:844:5d1f:95cc with SMTP id
 qq22-20020a17090720d600b008445d1f95ccmr54373072ejb.15.1673352615477; 
 Tue, 10 Jan 2023 04:10:15 -0800 (PST)
Received: from ?IPV6:2003:f6:af07:6c00:a421:1191:7df8:7628?
 (p200300f6af076c00a42111917df87628.dip0.t-ipconnect.de.
 [2003:f6:af07:6c00:a421:1191:7df8:7628])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056402150600b0049622a61f8fsm4890435edw.30.2023.01.10.04.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 04:10:15 -0800 (PST)
Message-ID: <ee8ff694-4a6b-b4da-9a80-c456fda9c99d@grsecurity.net>
Date: Tue, 10 Jan 2023 13:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 pbonzini@redhat.com, ebiggers@kernel.org, ardb@kernel.org,
 kraxel@redhat.com, hpa@zytor.com, bp@alien8.de, philmd@linaro.org
From: Mathias Krause <minipli@grsecurity.net>
In-Reply-To: <20221230220725.618763-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=mathias.krause@opensrcsec.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Jan 2023 09:28:42 -0500
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

Hi Jason!

Am 30.12.22 um 23:07 schrieb Jason A. Donenfeld:
> The setup_data links are appended to the compressed kernel image. Since
> the kernel image is typically loaded at 0x100000, setup_data lives at
> `0x100000 + compressed_size`, which does not get relocated during the
> kernel's boot process.
> 
> The kernel typically decompresses the image starting at address
> 0x1000000 (note: there's one more zero there than the compressed image
> above). This usually is fine for most kernels.
> 
> However, if the compressed image is actually quite large, then
> setup_data will live at a `0x100000 + compressed_size` that extends into
> the decompressed zone at 0x1000000. In other words, if compressed_size
> is larger than `0x1000000 - 0x100000`, then the decompression step will
> clobber setup_data, resulting in crashes.
> 
> Visually, what happens now is that QEMU appends setup_data to the kernel
> image:
> 
>           kernel image            setup_data
>    |--------------------------||----------------|
> 0x100000                  0x100000+l1     0x100000+l1+l2
> 
> The problem is that this decompresses to 0x1000000 (one more zero). So
> if l1 is > (0x1000000-0x100000), then this winds up looking like:
> 
>           kernel image            setup_data
>    |--------------------------||----------------|
> 0x100000                  0x100000+l1     0x100000+l1+l2
> 
>                                  d e c o m p r e s s e d   k e r n e l
>                      |-------------------------------------------------------------|
>                 0x1000000                                                     0x1000000+l3
> 
> The decompressed kernel seemingly overwriting the compressed kernel
> image isn't a problem, because that gets relocated to a higher address
> early on in the boot process, at the end of startup_64. setup_data,
> however, stays in the same place, since those links are self referential
> and nothing fixes them up.  So the decompressed kernel clobbers it.

I just ran into this very issue yesterday when trying to boot a 6.1
kernel. pipacs pointed me to some changes of yours[1] which confirmed,
the issue is related to the additional setup_data entries, as adding,
e.g., '-M pc-i440fx-7.0' to the QEMU command line made the bug vanish
(as QEMU then omits adding the random seed setup_data entries) .

[1] https://github.com/qemu/qemu/commit/67f7e426e538

After digging a while I found this thread and it fixes the issue for me,
thereby:

Tested-by: Mathias Krause <minipli@grsecurity.net>

Thanks,
Mathias

> [snip]

