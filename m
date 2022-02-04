Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FA4A993C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 13:26:05 +0100 (CET)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFxfA-0000m5-6x
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 07:26:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFxag-0006rj-EL
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:21:26 -0500
Received: from [2a00:1450:4864:20::52b] (port=46826
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFxae-0002Lj-R7
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 07:21:26 -0500
Received: by mail-ed1-x52b.google.com with SMTP id m11so12778805edi.13
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 04:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X3MxdLjvxskKpkNV+jZhRoDCF+k7mWHR1PfnYrNPXB0=;
 b=YOov5/AJt5BWxDYS0pZZQJpr9utYgr1/Uh8uofRXSzqMeFF8GPxd1ICOZI1dr8r8vS
 MYf4jJ+HgcYFt2nmj0bWRMY0XfFdKmYkZDd9NSBuiYUpL160pgLWMZQcFoiW5VeyZ6av
 2eWODUkNHtf4N8NpiOnA/oSC35SN3r19wOf6putB7yN37ZKNkLLJbWw4k/IuNiXelHYx
 3FeHw8NPXylfbOlRtrMHvU19EYyd6W25EIcDTgsh+VRt9XMbzKf3vN7WLhhRKVnX/Sqp
 HjUIxAMY+WnmYGEGIPBg7TLiKmfLu1Vui0JSo4d8On03fVTN7FxWJfRQ/cBWvJ8zHlDM
 NLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X3MxdLjvxskKpkNV+jZhRoDCF+k7mWHR1PfnYrNPXB0=;
 b=Mx765iSDyjqHdYc48lQTFnHT/FPIVsLWIEUQ4gSfK8yiPHhccdjcjt4JKR45zM9XJF
 15dGEflmdvZbIsadWHg6HPC6BnTZQfCM/bIzmuoVIRP/YASTfmGmwEPML38neX3motnp
 unU/WXORuk8C6x0NGybaRIlNgWsC/vswneMKEJ6KZu+JA8NqQ84oIIX1H5frI0mNtJRr
 D/4V6gLj4q92lnXusygwlKT2roOnmJPf44xc9P5Nldqg6ZbGyWsOJG0aKCS2Rs57wU0G
 OeZdv+Rq34VNRx7vMim1KEcXWtQ7u14ebnrIghe6kegY2ENPOXLbi26BnjKNeVeYNPsP
 oEvQ==
X-Gm-Message-State: AOAM532Lowm4cdnr9e+7Y4McyiuOngN1plmbqS7V05NCqO0FzOXeIW9X
 ujrRkF6qCIjhORSSVMSgaZk=
X-Google-Smtp-Source: ABdhPJyoVVc14T1+jAvuRZ3OY2T4WhsOuUigEe3mu7RVXjZSLwKi7/V0J6q8wUihjByKliZgXlS9Ew==
X-Received: by 2002:a05:6402:1910:: with SMTP id
 e16mr2724857edz.168.1643977283572; 
 Fri, 04 Feb 2022 04:21:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id l3sm602947ejg.44.2022.02.04.04.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 04:21:23 -0800 (PST)
Message-ID: <2bfd1308-0648-1930-4141-74aefcf1cabe@redhat.com>
Date: Fri, 4 Feb 2022 13:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/21] softmmu: Make various objects target agnostic
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 20:17, Philippe Mathieu-Daudé via wrote:
> This is a re-org accel/ and softmmu/ to have more target-agnostic
> objects.

Neat!  vl.c in particular bothered me.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> Since RFC:
> - Rework accel/meson (Richard)
> - Use vaddr in cpu_memory_rw_debug (Richard)
> - Introduce CONFIG_HAX_IS_POSSIBLE (Richard)
> - Introduce AccelOpsClass::cpu_thread_is_idle (Richard)
> - Introduce AccelOpsClass::cpus_are_resettable (Richard)
> - Add qemu_init_arch_modules (new)
> 
> Philippe Mathieu-Daudé (21):
>    accel: Restrict sysemu stubs to system emulation
>    accel/meson: Only build hw virtualization with system emulation
>    exec: Declare vaddr as a generic target-agnostic type
>    exec: Make cpu_memory_rw_debug() target agnostic
>    sysemu/memory_mapping: Become target-agnostic
>    sysemu/kvm: Make kvm_on_sigbus() / kvm_on_sigbus_vcpu() target
>      agnostic
>    accel/kvm: Simplify user-mode #ifdef'ry
>    accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
>    softmmu/cpus: Code movement
>    accel: Introduce AccelOpsClass::cpu_thread_is_idle()
>    accel: Introduce AccelOpsClass::cpus_are_resettable()
>    softmmu/globals: Remove unused 'hw/i386/*' headers
>    softmmu/runstate: Clean headers
>    softmmu/physmem: Remove unnecessary include
>    softmmu/cpu-timers: Remove unused 'exec/exec-all.h' header
>    misc: Remove unnecessary "sysemu/cpu-timers.h" include
>    misc: Add missing "sysemu/cpu-timers.h" include
>    exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu() target agnostic
>    exec/cpu: Make address_space_init/reloading_memory_map target agnostic
>    softmmu: Add qemu_init_arch_modules()
>    softmmu: Build target-agnostic objects once
> 
>   accel/kvm/kvm-accel-ops.c         | 12 ++++++++++
>   accel/meson.build                 | 12 ++++++----
>   accel/qtest/qtest.c               |  1 -
>   accel/stubs/hax-stub.c            |  2 ++
>   accel/stubs/kvm-stub.c            |  5 ----
>   accel/stubs/meson.build           | 11 +++++----
>   accel/tcg/tcg-accel-ops-icount.c  |  1 +
>   accel/tcg/tcg-accel-ops-mttcg.c   |  1 +
>   accel/tcg/tcg-accel-ops-rr.c      |  1 +
>   accel/tcg/tcg-accel-ops.c         |  1 +
>   cpu.c                             |  6 ++---
>   include/exec/cpu-all.h            |  4 ----
>   include/exec/cpu-common.h         | 39 +++++++++++++++++++++++++++++++
>   include/exec/exec-all.h           | 26 ---------------------
>   include/exec/gdbstub.h            | 23 +++++++++---------
>   include/hw/core/cpu.h             | 13 +----------
>   include/sysemu/accel-ops.h        |  3 +++
>   include/sysemu/arch_init.h        |  2 ++
>   include/sysemu/hax.h              | 18 +++++++++-----
>   include/sysemu/hw_accel.h         |  5 ----
>   include/sysemu/kvm.h              |  6 ++---
>   include/sysemu/memory_mapping.h   |  5 ++--
>   softmmu/arch_init.c               |  9 +++++++
>   softmmu/cpu-timers.c              |  1 -
>   softmmu/cpus.c                    | 23 +++++++++++-------
>   softmmu/globals.c                 |  2 --
>   softmmu/memory_mapping.c          |  1 +
>   softmmu/meson.build               | 24 +++++++++----------
>   softmmu/physmem.c                 |  7 +++---
>   softmmu/runstate.c                |  2 +-
>   softmmu/vl.c                      |  5 +---
>   target/alpha/translate.c          |  1 -
>   target/i386/hax/hax-all.c         |  7 +-----
>   target/i386/whpx/whpx-accel-ops.c |  6 +++++
>   target/riscv/csr.c                |  1 +
>   tests/unit/ptimer-test-stubs.c    |  1 -
>   36 files changed, 158 insertions(+), 129 deletions(-)
> 


