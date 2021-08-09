Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0C3E4330
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:49:32 +0200 (CEST)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1uV-0005KL-J1
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD1s9-0002Ge-5p
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:47:06 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD1s6-0000vm-73
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:47:04 -0400
Received: by mail-ed1-x52b.google.com with SMTP id k9so6353537edr.10
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Av62WqTWuSxfaSekdE9x+Be+QIeECv0DJqchEOSZRfE=;
 b=cFMxL1S8nHIE9Rgb1tUvCuKDWV+6y7qxLi7sBgYlK/lgrfWRrboDngsmDe+jkmkREr
 kjmSUFe4IW/Yb7vi3NNdEUukdh8ElbE/WEl0/M3q+TSnLjRKRztNbAmn/TrwgFE752gG
 wJjsito6YLcC9lVAWvvH1mROURabspalw+LoUJo425HI8ExlQWKst7X6W3mbStUYlM0N
 kLrsSEgMhcoOON3cjK88ng58C8RPASTG4nwJZpO0fUK8J0ZcQwmYbF0Sgfnd18eUPmdf
 zXHsi4Bw2ClTJmhXo4IVRj6cgfH5sH7+De/h1sEUeIz++7OJdZuYVx8+gBZnTASYWvu9
 0i3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Av62WqTWuSxfaSekdE9x+Be+QIeECv0DJqchEOSZRfE=;
 b=lmnQgY0ALoCuMY8j8Gib3aywTLOFdZiaQwBHAY7ttESj/G3pYvuBd6Vm6rn17xz7F9
 r5UaBMTQJ2jRufh80tE6FrJrors1O1VFwg05JeNlYhO726NlY1lPybYNC/Y8bMZYeN4H
 te8+4TWZjBu4mMIskv80K8JQzggOUw62PLxzlCsZlY+XU5vaoBeVUi7joQcaRLVKzk+4
 SM+IPGWMviZbiKv+MBHI1BRqnnA4rb/IkWXDL5wp8rff8s5KhYl0OP0+ol2RegoClXc6
 flWnNbDDViHBJKv4h3GZRhrxXp+zYPboykm4jNx5y4E18ogPBPmuEsWSLeJU27meMWes
 BNKg==
X-Gm-Message-State: AOAM530/PE7M+Q6uPZd0UGl6zqGKDk0UZ6QEtgWQ/A3hGvxaCwmLFa4R
 UAOOzIckvUvA74WYa7lUeK4shm0oSuQq0LiNE0hRHA==
X-Google-Smtp-Source: ABdhPJxxvI/AWMv/mTh+qAynH50g3Jt3KDQ9QKclOr2tEEETDinCePDKD6X9pF8vUqReGrn9hXmUSXUWzEo9xgFfpbA=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr18824993edu.100.1628502420257; 
 Mon, 09 Aug 2021 02:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200825184836.1282371-1-alistair.francis@wdc.com>
 <20200825184836.1282371-6-alistair.francis@wdc.com>
In-Reply-To: <20200825184836.1282371-6-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 10:46:16 +0100
Message-ID: <CAFEAcA94GQMqsRp3tQ7NF7+fA2BK+PdJZScHWgLM5x12RVOiZg@mail.gmail.com>
Subject: Re: [PULL 05/18] hw/riscv: virt: Allow creating multiple NUMA sockets
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <atish.patra@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Aug 2020 at 20:03, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> We extend RISC-V virt machine to allow creating a multi-socket
> machine. Each RISC-V virt machine socket is a NUMA node having
> a set of HARTs, a memory instance, a CLINT instance, and a PLIC
> instance. Other devices are shared between all sockets. We also
> update the generated device tree accordingly.

Hi; Coverity (CID 1460752) points out that this code has
a misunderstanding of the length argument to strncat().
(I think this patch is just doing code-movement of this block of code,
but it seemed like the easiest place to send an email about the issue.)

> +        /* Per-socket PLIC hart topology configuration string */
> +        plic_hart_config_len =
> +            (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
> +        plic_hart_config = g_malloc0(plic_hart_config_len);
> +        for (j = 0; j < hart_count; j++) {
> +            if (j != 0) {
> +                strncat(plic_hart_config, ",", plic_hart_config_len);
> +            }
> +            strncat(plic_hart_config, VIRT_PLIC_HART_CONFIG,
> +                plic_hart_config_len);
> +            plic_hart_config_len -= (strlen(VIRT_PLIC_HART_CONFIG) + 1);
> +        }

The length argument to strncat() is here being used as if it were
"do not write more than length bytes", but strncat() will write
length+1 bytes in the "source too long" case (length characters
from the source string plus the trailing NUL). This isn't actually
an issue here because we carefully precalculate the allocation length
to be exactly correct, but it means that the code looks like it has
a guard against accidental miscalculation and overrun but it doesn't.

It might be preferable to write this to use glib string methods
rather than raw strlen/strncat, for example:

    const char **vals;
    const char *hart_config = VIRT_PLIC_HART_CONFIG;
    int i;

    vals = g_new(char *, hart_count + 1);
    for (i = 0; i < hart_count; i++) {
         vals[i] = (gchar *)hart_config;
    }
    vals[i] = NULL;
    /* g_strjoinv() obliges us to discard 'const' here :-( */
    plic_hart_config = g_strjoinv(",", (char **)vals);

Untested, but same structure as used in ppc_compat_add_property()
and qemu_rbd_mon_host(). Relieves us of the obligation to
carefully calculate string lengths and makes it clearer that
we're constructing a comma-separated string.

thanks
-- PMM

