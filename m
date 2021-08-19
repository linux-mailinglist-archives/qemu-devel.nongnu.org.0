Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1046E3F1CB6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:27:56 +0200 (CEST)
Received: from localhost ([::1]:43910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjxT-0000di-5Z
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjwb-0008Nc-Mk
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:27:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjwY-00056G-Nm
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:27:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id g21so9439547edw.4
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M51Tng5ob8Rcm1Rew5cYwD08IZVVNAUPJe+VHuOFxLA=;
 b=HklsIKLvNhPac0Ua+kx2X0kXFH4M3zRnPKfq1H1rRp48jl+dajGnwiMVFf6hqMYhWn
 fLES8kSkvj3aneaFTzZCMS3DU+t4nWsd5bKTYOFgxNg3OHqsMu5oFF1pW6iwPX86+38m
 PAvOt15oMrA5jItSkv1ilU+iZ0ajTfV4/ZwhDu3YfoQ+zPSesW9bwe2aggIM2Qw/nIsJ
 KlQNJNroZjmWANJ7aembA/QgC24qP89n1UDgfNcayT+Ns8PBSpv2t++xMQkFDaWw4J2Z
 EDduXFN9dH3tSmqVpmBb/0lyw4GF+aQEIIdXj5H3OsoggaT2g9s+tlrT00TO9ItiWHtH
 Pvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M51Tng5ob8Rcm1Rew5cYwD08IZVVNAUPJe+VHuOFxLA=;
 b=JQsLQNpTNSpzB4H6OeiSXoPM5OtNE6qcKuzr+o0VkG1yrf2ySKqvlM2inht3x4LcNG
 C33Ava+slDWFzyGbdLZ++NmyUxqZ2McJryaVau4cx6FmVF+CR+dxGRKbHXLxOmRmCiba
 EpPKdd5sT54OuXwWtS6Q0kPn/1ZkWfvbOwmllm4mKQFAbklFpl9CTIn8kQI2HbiRtW2/
 toUS/P65H8iLNnWPbrJnn2gz9WW/ASH4msbfWOftdIUDy7AUfE9GcW/Zi/eDCUcg1sXT
 uid1zbDSFe+c6T7c1zKyTmgv6sNkh6IDLJm8poFoqtPUWCU7lSwqvniOGu2IFZqypD1W
 /39A==
X-Gm-Message-State: AOAM531WP6C01dB3NXQN7PLGr8PRmmOTP/yLTiWsvybH0xW+nLSZ2Epl
 KCT9toM6Hq4eTosK1SL/XuCwADGVmGGoD5mZizkHrg==
X-Google-Smtp-Source: ABdhPJxWgWBFWaFYGOqbjt/c+BbpMmcDju1kk454jFMrn94KFXoCVPZVUESFbfWrxU0BEPZSAS4BFBDwsNK/V3k2/Ro=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr16926578edb.52.1629386816822; 
 Thu, 19 Aug 2021 08:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-51-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:26:10 +0100
Message-ID: <CAFEAcA9Wdriiz-8Km2s9c3cZCVnov3Z2OY6wpP6o3e6cA2qRxw@mail.gmail.com>
Subject: Re: [PATCH v3 50/66] hw/core/cpu: Move cpu properties to cpu-sysemu.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 21:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The comment in cpu-common.c is absolutely correct, we can't
> rely on the ifdef in a file built once.  This was only "working"
> because we used ifndef.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Fixes: 1b36e4f5a5de585

which moved the properties out of cpu.c and into cpu-common.c
with the remark "There's no reason to keep the property list
separate from the CPU class code" despite there being a big
fat warning comment saying why it can't go in a compiled-once
source file !

Is there a reason to prefer this patch over just reverting
1b36e4f5a5de585 ?

thanks
-- PMM

(patch below for context)

> ---
>  hw/core/cpu-common.h | 17 +++++++++++++++++
>  hw/core/cpu-common.c | 18 ++----------------
>  hw/core/cpu-sysemu.c | 24 ++++++++++++++++++++++++
>  hw/core/cpu-user.c   | 22 ++++++++++++++++++++++
>  hw/core/meson.build  |  4 ++++
>  5 files changed, 69 insertions(+), 16 deletions(-)
>  create mode 100644 hw/core/cpu-common.h
>  create mode 100644 hw/core/cpu-user.c
>
> diff --git a/hw/core/cpu-common.h b/hw/core/cpu-common.h
> new file mode 100644
> index 0000000000..9049f74e67
> --- /dev/null
> +++ b/hw/core/cpu-common.h
> @@ -0,0 +1,17 @@
> +/*
> + * QEMU CPU model
> + *
> + * Copyright (c) 2014 SUSE LINUX Products GmbH
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_CORE_CPU_COMMON_H
> +#define HW_CORE_CPU_COMMON_H
> +
> +void cpu_class_init_props(DeviceClass *dc);
> +
> +#endif
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index e2f5a64604..6406ea79f0 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -34,6 +34,7 @@
>  #include "hw/qdev-properties.h"
>  #include "trace/trace-root.h"
>  #include "qemu/plugin.h"
> +#include "cpu-common.h"
>
>  CPUState *cpu_by_arch_id(int64_t id)
>  {
> @@ -257,21 +258,6 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
>      return cpu->cpu_index;
>  }
>
> -static Property cpu_common_props[] = {
> -#ifndef CONFIG_USER_ONLY
> -    /* Create a memory property for softmmu CPU object,
> -     * so users can wire up its memory. (This can't go in hw/core/cpu.c
> -     * because that file is compiled only once for both user-mode
> -     * and system builds.) The default if no link is set up is to use
> -     * the system address space.
> -     */
> -    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
> -                     MemoryRegion *),
> -#endif
> -    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>  static void cpu_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -286,7 +272,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>      dc->realize = cpu_common_realizefn;
>      dc->unrealize = cpu_common_unrealizefn;
>      dc->reset = cpu_common_reset;
> -    device_class_set_props(dc, cpu_common_props);
> +    cpu_class_init_props(dc);
>      /*
>       * Reason: CPUs still need special care by board code: wiring up
>       * IRQs, adding reset handlers, halting non-first CPUs, ...
> diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
> index 00253f8929..5a62960f3c 100644
> --- a/hw/core/cpu-sysemu.c
> +++ b/hw/core/cpu-sysemu.c
> @@ -20,8 +20,11 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "exec/memory.h"
>  #include "hw/core/cpu.h"
>  #include "hw/core/sysemu-cpu-ops.h"
> +#include "hw/qdev-properties.h"
> +#include "cpu-common.h"
>
>  bool cpu_paging_enabled(const CPUState *cpu)
>  {
> @@ -143,3 +146,24 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
>      }
>      return res;
>  }
> +
> +/*
> + * This can't go in hw/core/cpu-common.c because that file is compiled only
> + * once for both user-mode and system builds.
> + */
> +static Property cpu_sysemu_props[] = {
> +    /*
> +     * Create a memory property for softmmu CPU object, so users can wire
> +     * up its memory. The default if no link is set up is to use the
> +     * system address space.
> +     */
> +    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +void cpu_class_init_props(DeviceClass *dc)
> +{
> +    device_class_set_props(dc, cpu_sysemu_props);
> +}
> diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
> new file mode 100644
> index 0000000000..62037e8669
> --- /dev/null
> +++ b/hw/core/cpu-user.c
> @@ -0,0 +1,22 @@
> +/*
> + * QEMU CPU model (user-only emulation specific)
> + *
> + * Copyright (c) 2021 Linaro, Ltd.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/core/cpu.h"
> +#include "cpu-common.h"
> +
> +/*
> + * This can't go in hw/core/cpu-common.c because that file is compiled only
> + * once for both user-mode and system builds.
> + */
> +void cpu_class_init_props(DeviceClass *dc)
> +{
> +}
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 18f44fb7c2..4b3de4e247 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -43,3 +43,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>    'machine-qmp-cmds.c',
>    'numa.c',
>  ))
> +
> +specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files(
> +  'cpu-user.c'
> +))
> --

