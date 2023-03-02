Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3016A7C37
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:06:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXdvg-0006xn-QD; Thu, 02 Mar 2023 03:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXdvd-0006xA-WE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:04:42 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXdvc-0005ku-3v
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:04:41 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 b10-20020a4aba0a000000b005200c0d4a2aso2513991oop.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677744279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y1Tl4bvARz9YvyUunhYgivnWInboT5SiOSVzBspEoYA=;
 b=IsU2C2VMnJUrSaJnKu4p5xcuRbHn5nXoB0awMmWhG/TdXWzm8T57SDCbCyj5Km3X4Y
 9wA+NtavYoT/zVTB77yU7ORjHQdzTn+ZiW+97mGplx2xEia4TPAHp3a1hEwTI8SWOih+
 JDjh4sCWX0lc+jw8XqfeDg0fQdX3LNTNkj1jCA49jUso9mtp0AIrgIYC73A9vOM12730
 KrxE4i5fcYvD2vpvbeAs/uBLtfvimiQon4IlUvksMzA4/p3AFctER0HC2GK92HHbvj7h
 JZh8ur4+FYvE7IzwxPNz55vh4/RXDBvRLoI9KjBlr/C+rK40HHA8M51IKP+m0TMbivdj
 CVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677744279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y1Tl4bvARz9YvyUunhYgivnWInboT5SiOSVzBspEoYA=;
 b=3Ix4xjrmxvNckYCS/7nEeFYfDvWLhEdWEnhXBdynRV9tAWX7bAB+IlpbtJRsusoFpE
 9G2TTw5Rq4hIWZSlZ3OosK08fUzgtCiFxHlbNhpluyKSMWRqR1OS4yaOcIAlbU9EKa2r
 YzWkmcQbJyNW9Js1720SfhE1/hHzW4qrqHzUq2poAYUze7SvBknX6Vqjag2tPTHLeG0Z
 GB5sfrP4xQYrWEyAx2hNTwxzKHIKGUJQymiizn/3G5Ngyp7yxdM3c7OJg3tpg1jnlam3
 KN1tLh1eJUZpkvrkU3ROJoUW04ECphPINGQhvQIUVIznIuk+E4pGPPerGO2wwh6YgMrO
 6G9A==
X-Gm-Message-State: AO0yUKWTlKYiZDpjTMpiSujnhac6BtqhzW55ZhG+m3ZXouXqcrs8rl8e
 WYUoSzn2MjJLz+7VWC/c2eNdpw==
X-Google-Smtp-Source: AK7set/XOAGu8td7bSdXPTenxJLE9Bg9buxYtH6D0/Gl0OznW/UI6Eq2+V2JNNgfK+rLkbAYwPZmMQ==
X-Received: by 2002:a4a:52d3:0:b0:525:32bf:57e2 with SMTP id
 d202-20020a4a52d3000000b0052532bf57e2mr4927374oob.2.1677744278793; 
 Thu, 02 Mar 2023 00:04:38 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0068bd5af9b82sm5828700otl.43.2023.03.02.00.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 00:04:38 -0800 (PST)
Message-ID: <8694610a-c209-8559-dcae-fb5f3722b6ef@ventanamicro.com>
Date: Thu, 2 Mar 2023 05:04:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 00/10] make write_misa a no-op and FEATURE_* cleanups
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <mhng-4f458d7a-5b65-415d-8d6d-2945db18b8d1@palmer-ri-x1c9a>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <mhng-4f458d7a-5b65-415d-8d6d-2945db18b8d1@palmer-ri-x1c9a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 3/1/23 20:43, Palmer Dabbelt wrote:
> On Wed, 22 Feb 2023 10:51:55 PST (-0800), dbarboza@ventanamicro.com wrote:
>> Hi,
>>
>> In this version we gave up removing all the write_misa() body and,
>> instead, we went back to something closer to what we were doing in v2.
>> write_misa() is now gated behind an experimental x-misa-w cfg option,
>> defaulted to false.
>>
>> The idea is that x-misa-w allow us to keep experimenting and testing the
>> code. Marking it as experimental will (hopefully) make users wary of the
>> fact that this feature is unstable. The expectation is that the flag will
>> be removed once write_misa() is ready to always write MISA.
>>
>> Changes from v6:
>> - patches without reviews/acks: patch 3
>> - patch 2: taken from version 3, acks and r-bs preserved
>> - patch 3:
>>   - rename 'misa-w' to 'x-misa-w' to be clearer about our intents with
>>     the cfg option
>> - v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05047.html
>>
>> Daniel Henrique Barboza (10):
>>   target/riscv: introduce riscv_cpu_cfg()
>>   target/riscv: do not mask unsupported QEMU extensions in write_misa()
>>   target/riscv: allow MISA writes as experimental
>>   target/riscv: remove RISCV_FEATURE_DEBUG
>>   target/riscv/cpu.c: error out if EPMP is enabled without PMP
>>   target/riscv: remove RISCV_FEATURE_EPMP
>>   target/riscv: remove RISCV_FEATURE_PMP
>>   hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
>>     create_fdt_socket_cpus()
>>   target/riscv: remove RISCV_FEATURE_MMU
>>   target/riscv/cpu: remove CPUArchState::features and friends
>>
>>  hw/riscv/virt.c           |  7 ++++---
>>  target/riscv/cpu.c        | 25 ++++++++++---------------
>>  target/riscv/cpu.h        | 29 ++++++-----------------------
>>  target/riscv/cpu_helper.c |  6 +++---
>>  target/riscv/csr.c        | 15 ++++++---------
>>  target/riscv/machine.c    | 11 ++++-------
>>  target/riscv/monitor.c    |  2 +-
>>  target/riscv/op_helper.c  |  2 +-
>>  target/riscv/pmp.c        |  8 ++++----
>>  9 files changed, 39 insertions(+), 66 deletions(-)
> 
> I just queued this up, using the text from the v1 as that's more of a description of the patch set.  I think that text is still sufficiently accurate, but let me know if I missed anything.  Here's what I ended up with
> 
>     Merge patch series "make write_misa a no-op and FEATURE_* cleanups"
>     Daniel Henrique Barboza <dbarboza@ventanamicro.com> says:
>     The RISCV_FEATURES_* enum and the CPUArchState::features attribute were
>     introduced 4+ years ago, as a way to retrieve the enabled hart features
>     that aren't represented via MISA CSR bits. Time passed on, and
>     RISCVCPUConfig was introduced. With it, we now have a centralized way of
>     reading all hart features that are enabled/disabled by the user and the
>     board. All recent features are reading their correspondent cpu->cfg.X
>     flag.
>     All but the 5 features in the RISCV_FEATURE_* enum. These features are
>     still operating in the same way: set it during riscv_cpu_realize() using
>     their cpu->cfg value, read it using riscv_feature() when needed. There
>     is nothing special about them in comparison with all the other features
>     and extensions to justify this special handling.
>     This series then is doing two things: first we're actually allowing
>     users to write the MISA CSR if they so choose. Then we're deprecate each
>     RISC_FEATURE_* usage until, in patch 11, we remove everything related to
>     it. All 5 existing RISCV_FEATURE_* features will be handled as everyone
>     else.

LGTM!


Thanks,


Daniel

> 
> Thanks!

