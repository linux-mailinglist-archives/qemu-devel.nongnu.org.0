Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A40472009
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 05:38:45 +0100 (CET)
Received: from localhost ([::1]:37396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwd6p-0001mm-Hn
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 23:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwd5b-0000zS-Kz
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:37:27 -0500
Received: from [2a00:1450:4864:20::429] (port=33672
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwd5U-0007YQ-O5
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:37:27 -0500
Received: by mail-wr1-x429.google.com with SMTP id d24so25038722wra.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 20:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKCr2ecM6VBsb8ohhcbuab5U65Dp3oJzfYpYi0gNHbE=;
 b=17LM5XvH8e1cnkvKk5Ew22eudYjKMtrCHBWvTQUqJFsDE661jcJD2TKWb80TCT82J1
 zD2avhRsUSKGkyuda4nkVyvIdSOdI/5fL0JKGgOnOYtlPvSzGgfK/NSEXXG8rUXUgaqC
 eKp7DVK/WHNVzS5jdCg08iKivOtdT6KWVYI6VpiMl9CYFvWjj8+N1YHfNv/FJvBRy+MR
 WogxgARlHi5RYOr/XbRmih4oaS0MKyAqlYktyFK+hXoCRXNYMgT4MKCr08YPgo7Glgwy
 yMELnvRvWop20UaiZpMs892PdWCEQpA18yetfDo1WbrxM+DjbySKt1aa0wc4kBXllzIB
 wXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKCr2ecM6VBsb8ohhcbuab5U65Dp3oJzfYpYi0gNHbE=;
 b=D9qNhUrTxqAINMcbTV0BzyboXbYxjdwvRxBfVjgxrJrzxGwrmjh1SzRgQiMp/8wHfy
 ooRw34NvGmXp2EC39wHUtGjnZBX7O1Uo0aUTsCtdRvwvK0Y9Qp0IAOygFlE288jkOI1g
 9hGoITBpCi9rWdcnfAduACMejSDiAaCPSqeaLxw4WRf3fMbLogZi16DhtrBLaKIdNSXr
 3brBhaXrcIQwEgFtXG8zQPsYkgu7tjxZKqSNa6VOG0NodSYadQtyQXXmISm+3/kODjVc
 9lgJFO3cPrNG73OASucK+y0bYbzrzqnBxkGWfTdqQMj+DmoV2Bp9+1rrpKVWhC9awj0H
 lorA==
X-Gm-Message-State: AOAM531fTcbxcuC6lZt/opfHM7SGbx+JsZEBUqUHmjS/cbs2VXyJ3csP
 fFZUrqo/g4ZpkmSJoeMo+QuqOXUfxnPwnRHaBe3MBQ==
X-Google-Smtp-Source: ABdhPJyPjhB3U7Dgrq0pcHpZV9ySNICkS4hCSXx3Z88oXhFwRhpHQx1egn3yO1EQpj8GellDGtX5XzovPmsjQVEEniI=
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr29349165wrx.86.1639370235926; 
 Sun, 12 Dec 2021 20:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-9-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-9-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 10:07:04 +0530
Message-ID: <CAAhSdy2yif18ewN_-77eRRkhsO-7iZGev0J6cs_DKg5Uq+=V=g@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mingwang Li <limingwang@huawei.com>, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wanbo13@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 fanliang@huawei.com, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Use char-fe to handle console sbi call, which implement early
> console io while apply 'earlycon=sbi' into kernel parameters.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/kvm.c                 | 38 +++++++++++++++-
>  target/riscv/sbi_ecall_interface.h | 72 ++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/sbi_ecall_interface.h
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0027f11f45..171a32adf9 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,8 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_riscv.h"
> +#include "sbi_ecall_interface.h"
> +#include "semihosting/console.h"
>
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -365,9 +367,43 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
>      return true;
>  }
>
> +static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
> +{
> +    int ret = 0;
> +    unsigned char ch;
> +    switch (run->riscv_sbi.extension_id) {
> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> +        ch = run->riscv_sbi.args[0];
> +        qemu_semihosting_log_out((const char *)&ch, sizeof(ch));
> +        break;
> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> +        run->riscv_sbi.args[0] =
> +            (unsigned long)qemu_semihosting_console_inc(cs->env_ptr);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: un-handled SBI EXIT, specific reasons is %lu\n",
> +                      __func__, run->riscv_sbi.extension_id);
> +        ret = -1;
> +        break;
> +    }
> +    return ret;
> +}
> +
>  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>  {
> -    return 0;
> +    int ret = 0;
> +    switch (run->exit_reason) {
> +    case KVM_EXIT_RISCV_SBI:
> +        ret = kvm_riscv_handle_sbi(cs, run);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
> +                      __func__, run->exit_reason);
> +        ret = -1;
> +        break;
> +    }
> +    return ret;
>  }
>
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
> new file mode 100644
> index 0000000000..fb1a3fa8f2
> --- /dev/null
> +++ b/target/riscv/sbi_ecall_interface.h
> @@ -0,0 +1,72 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#ifndef __SBI_ECALL_INTERFACE_H__
> +#define __SBI_ECALL_INTERFACE_H__
> +
> +/* clang-format off */
> +
> +/* SBI Extension IDs */
> +#define SBI_EXT_0_1_SET_TIMER           0x0
> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1
> +#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
> +#define SBI_EXT_0_1_CLEAR_IPI           0x3
> +#define SBI_EXT_0_1_SEND_IPI            0x4
> +#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID 0x7
> +#define SBI_EXT_0_1_SHUTDOWN            0x8
> +#define SBI_EXT_BASE                    0x10
> +#define SBI_EXT_TIME                    0x54494D45
> +#define SBI_EXT_IPI                     0x735049
> +#define SBI_EXT_RFENCE                  0x52464E43
> +#define SBI_EXT_HSM                     0x48534D
> +
> +/* SBI function IDs for BASE extension*/
> +#define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> +#define SBI_EXT_BASE_GET_IMP_ID         0x1
> +#define SBI_EXT_BASE_GET_IMP_VERSION    0x2
> +#define SBI_EXT_BASE_PROBE_EXT          0x3
> +#define SBI_EXT_BASE_GET_MVENDORID      0x4
> +#define SBI_EXT_BASE_GET_MARCHID        0x5
> +#define SBI_EXT_BASE_GET_MIMPID         0x6
> +
> +/* SBI function IDs for TIME extension*/
> +#define SBI_EXT_TIME_SET_TIMER          0x0
> +
> +/* SBI function IDs for IPI extension*/
> +#define SBI_EXT_IPI_SEND_IPI            0x0
> +
> +/* SBI function IDs for RFENCE extension*/
> +#define SBI_EXT_RFENCE_REMOTE_FENCE_I       0x0
> +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA    0x1
> +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA   0x3
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x4
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA   0x5
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x6
> +
> +/* SBI function IDs for HSM extension */
> +#define SBI_EXT_HSM_HART_START          0x0
> +#define SBI_EXT_HSM_HART_STOP           0x1
> +#define SBI_EXT_HSM_HART_GET_STATUS     0x2
> +
> +#define SBI_HSM_HART_STATUS_STARTED     0x0
> +#define SBI_HSM_HART_STATUS_STOPPED     0x1
> +#define SBI_HSM_HART_STATUS_START_PENDING   0x2
> +#define SBI_HSM_HART_STATUS_STOP_PENDING    0x3
> +
> +#define SBI_SPEC_VERSION_MAJOR_OFFSET   24
> +#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff
> +#define SBI_EXT_VENDOR_START            0x09000000
> +#define SBI_EXT_VENDOR_END              0x09FFFFFF
> +/* clang-format on */
> +
> +#endif
> --
> 2.19.1
>

