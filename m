Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ABE387A70
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:53:35 +0200 (CEST)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0AA-0006m3-Sa
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj092-0005Bo-7E
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:52:24 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj090-0005Gj-B9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:52:23 -0400
Received: by mail-ej1-x633.google.com with SMTP id l1so14692597ejb.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ja/d/Q+97Zk6pXltEKTyRT3wk4Xx8CBnNgj3Zz9dhMA=;
 b=tJkFsfjIzMGLqrorgI1P4wRHJQ0sL43K1p+o/9cPBVAioj0Aj3K+byG8nBPhnWCC2j
 bkj0ZXNCt7S5QVe8hMYt3IsLKs8D764JN8WeJT5Xx8rIqMsSNCnxG1BiJGjN43M3x01i
 0HGVenQKeiVfAtRfZyWHFiiZWnIKoggBsvkiNfC/6GDZIKkb2yzlFktLwH7Q5DInS6a+
 c5u95+eDOrewrl6f+S/jzhitX/zp8BkOKXAo5vgSTbOe6Tzg1ICR0+4sB3LI9rNmYkmC
 DBb2J+Vye61tJ4nTgTegzV0vZCDogdJu9BE6m41ur1P4lw0TvIJ3msOduRhyswI1rhwx
 L1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ja/d/Q+97Zk6pXltEKTyRT3wk4Xx8CBnNgj3Zz9dhMA=;
 b=mpFjiSziHzwWbh68ix6lQC3i7DWB7TXoXxD+5tpsERfUDgKr7tGxnUQjOmzrHvL9+r
 7tL5APjJvkazYMrUsgzW9CExw3Ux6WPusAF22qnvo1BPbnCVVbXr4CCVR0wF0JLe2j6d
 xEtejmUYzg5ZjuqpuATqeaAA4blKnAw+MZnSdr3upKCGdIbNcEX7OrJAgMWAzaULuCIX
 UWCe9pPlJA4exuFPAt6C8XMM5TlzWRMoJPNEXrzUJhm0v72cEh6rPWTlSR7LE3pR27t3
 LG0DvAdzRRFxm6Ntp19/B84BPV0bYPxA/S7/1+m71fVNpYKpshveYE3h+m96lAw2sfVT
 oO1Q==
X-Gm-Message-State: AOAM532lm2NedKchJE635PxlINkdtsLJM9dyi/cc0ZVi6/PFrlxrSkSt
 E/BIauzs4+AWOZ7KkNIsPqV9P2dG3A8hHBtB5I5oVQ==
X-Google-Smtp-Source: ABdhPJx1J2IrDQi6fDGAzwc0qXBzNSsbnAR0z4X0d/5izAAkuFFB2DeQf7yelzfgfA4BN4Ra7CtHbtMqlLN7daKg16s=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr6229605ejb.56.1621345940649; 
 Tue, 18 May 2021 06:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-2-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-2-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 14:52:04 +0100
Message-ID: <CAFEAcA_PGXKWy-u-cdOxEf+govTO1fLCoT0RRPQAyh=BkibnJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c                | 239 +++++++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |  11 +-
>  hw/intc/arm_gicv3_its_kvm.c            |   2 +-
>  hw/intc/gicv3_internal.h               |  88 +++++++--
>  hw/intc/meson.build                    |   1 +
>  include/hw/intc/arm_gicv3_its_common.h |  10 +-
>  6 files changed, 331 insertions(+), 20 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3_its.c
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> new file mode 100644
> index 0000000000..7b11330e01
> --- /dev/null
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -0,0 +1,239 @@
> +/*
> + * ITS emulation for a GICv3-based system
> + *
> + * Copyright Linaro.org 2021
> + *
> + * Authors:
> + *  Shashi Mallela <shashi.mallela@linaro.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/intc/arm_gicv3_its_common.h"
> +#include "gicv3_internal.h"
> +#include "qom/object.h"
> +
> +typedef struct GICv3ITSClass GICv3ITSClass;
> +/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
> +DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
> +                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
> +
> +struct GICv3ITSClass {
> +    GICv3ITSCommonClass parent_class;
> +    void (*parent_reset)(DeviceState *dev);
> +};
> +
> +static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
> +                               uint64_t data, unsigned size, MemTxAttrs attrs)

Your indentation on function prototypes is still messed up; please fix it.

> +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> +        /* set the ITS default features supported */
> +        s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
> +                                       GITS_TYPE_PHYSICAL);

More odd indentation. Second lines of function calls etc should line
up with the first character after the '(' on the first line.
Please fix this through the whole patchset.

> +type_init(gicv3_its_register_types)
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 66c4c6a188..b4dddb16b8 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -50,12 +50,13 @@ static int gicv3_its_post_load(void *opaque, int version_id)
>
>  static const VMStateDescription vmstate_its = {
>      .name = "arm_gicv3_its",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
>      .pre_save = gicv3_its_pre_save,
>      .post_load = gicv3_its_post_load,
>      .priority = MIG_PRI_GICV3_ITS,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(ctlr, GICv3ITSState),
> -        VMSTATE_UINT32(iidr, GICv3ITSState),
>          VMSTATE_UINT64(cbaser, GICv3ITSState),
>          VMSTATE_UINT64(cwriter, GICv3ITSState),
>          VMSTATE_UINT64(creadr, GICv3ITSState),

You can't change the vmstate like this, you break migration compatibility.
Why are you deleting the 'iidr' field anyway ?

If we do need to remove the 'iidr', there is a mechanism for saying
"ignore the UINT64 we get from a migration source, we don't need it".
If we need to do that it should be a standalone patch at the start of
the series.

> @@ -51,7 +56,7 @@ struct GICv3ITSState {
>
>      /* Registers */
>      uint32_t ctlr;
> -    uint32_t iidr;
> +    uint64_t typer;
>      uint64_t cbaser;
>      uint64_t cwriter;
>      uint64_t creadr;

This will break compilation of the KVM support code on aarch64 hosts,
which is still using the 'iidr' field.

thanks
-- PMM

