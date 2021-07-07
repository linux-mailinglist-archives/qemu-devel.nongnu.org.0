Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB33BF036
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:23:05 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1D8S-0007Kr-75
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1D74-0005Wy-Jm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:21:38 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1D71-0005sY-Dc
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:21:38 -0400
Received: by mail-ej1-x636.google.com with SMTP id b2so5054976ejg.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 12:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q29qmT+/GkZuNuV4lXMN56Bf0h4FFtQWwS5CH07XjoQ=;
 b=xqFEqYgmiyWITRqC8GJIKz41qpwvWFL4g/w9f974xnmQYzjN2wxQ59kBSh7IWnMay1
 iy3dfs6TZDMMvx8RxCJDVgZA/QHb194z2Q1Pg6kPW/n55FCk6D0m3vxgkZBF5+sIL7pI
 pTLzOb5HuL9UkFS+5u8orSy932Ra4GOj0FNpjUd2e0X10OmRBktDlsAQfwriiicyoa6Z
 R5Ml2ixJCqZbMwdGTQ6HSjKirPHM2tyx3u7ZL3LwXCGbTPCSAbRkNNWCmzKySTL+y701
 aIL4Oon9/eTYjKYhgFL47wTEPL4oFAoz8+dX36b9X1bWM9cb9pjDVjTtVpk+H3B1recL
 0qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q29qmT+/GkZuNuV4lXMN56Bf0h4FFtQWwS5CH07XjoQ=;
 b=LeutkVy6/LC+dNVlYkezYXrWJK+EzglD5aOug918Rl4ZcdogUKXwjRcGUAFr/SEfPt
 QeBhxE6dn4fcszVqExSmODeyNZOtJ60EcoFVz7BY9JJ6ibyNjldKqPxb2ZjEgA4qHahA
 rQ4VnzJMBc0DNaYqy9gtkpMxShfo+5nzbPhOD/msHDfZricMeStHQgpTd97M0CLbvW3P
 sx6b7qFhdwZJzasOUB1dLhCtRPXcEoVRTUF4M5t3oNtqKTxZ7VZQyZ90UggtiIbT7yvt
 2DT2jyQ0bZoVMWvj6LLwV2UtQSol1h9c83eE80H8Ss0oLEn4qtu+fM5h5gVgY2FAAXNJ
 07hw==
X-Gm-Message-State: AOAM533iCWNCK3Em7RC5/DPHoDEC0R7Mayba97u/ht+D0g6+Rj6plhxq
 pxqbuCjVLbKPj9Upvu+t9IHySZwosTMqRneIikDzkQ==
X-Google-Smtp-Source: ABdhPJzGcUXMmoVYdyByayjKMvTuE1VFTSNbxAq4irMKy6tB+B2RXFFODEFDB2X3mEzgchWdbVxR84a8/NE/L0lFv0M=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr25356907ejc.382.1625685693388; 
 Wed, 07 Jul 2021 12:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210707113937.72602-1-daniel.baluta@oss.nxp.com>
In-Reply-To: <20210707113937.72602-1-daniel.baluta@oss.nxp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Jul 2021 20:20:54 +0100
Message-ID: <CAFEAcA_L7nrw4zBV7pKYcV+H+4qJT60PFkJYA_w-8FSwOqNmXw@mail.gmail.com>
Subject: Re: [PATCH] hw: timer: Add i.MX sysctr timer implementation
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vioricamancas@yahoo.com, daniel.baluta@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021 at 12:39, Daniel Baluta <daniel.baluta@oss.nxp.com> wrot=
e:
>
> From: Viorica Mancas <vioricamancas@yahoo.com>
>
> The System Counter (SYS_CTR) is a programmable system counter, which prov=
ides a
> shared time base to multiple processors. It is intended for applications =
where the counter
> is always powered on, and supports multiple unrelated clocks.
>
> This system counter can be found on NXP i.MX8MN.
>
> Signed-off-by: Viorica Mancas <vioricamancas@yahoo.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Is there a board model or an update to an existing board that
would use this device? We don't usually take device models that
are completely unused upstream.

In the meantime, some high-level review notes below.

> +#ifndef DEBUG_IMX_SYSCTR
> +#define DEBUG_IMX_SYSCTR 0
> +#endif
> +
> +#define DPRINTF(fmt, args...) \
> +    do { \
> +        if (DEBUG_IMX_SYSCTR) { \
> +            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_SYSCTR_TIMER, \
> +                                             __func__, ##args); \
> +        } \
> +    } while (0)

Avoid DPRINTF in new code, please; prefer tracepoints.

> +#define low(x) (x & 0xFFFFFFFFLL)
> +#define high(x) (x >> 32)
> +
> +#define CLEAR_LOW_MASK (0xFFFFFFFFUL << 32)
> +#define CLEAR_HIGH_MASK (0xFFFFFFFF)

Don't define your own access/masking stuff like this -- prefer
eg extract64(), deposit64(), or the FIELD macros from
registerfields.h.

> +static void imx_sysctr_timer_init(Object *obj)
> +{
> +    IMXSysctrState *t =3D IMX_SYSCTR_TIMER(obj);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &t->irq);

You might as well put this in realize with the mmio
init call, and avoid having to have an init method.

> +static void imx_sysctr_timer_realize(DeviceState *dev, Error **errp)
> +{
> +    IMXSysctrState *s =3D IMX_SYSCTR_TIMER(dev);
> +
> +    memory_region_init_io(&s->iomem,
> +                            OBJECT(s),
> +                            &timer_ops,
> +                            s,
> +                            TYPE_IMX_SYSCTR_TIMER,
> +                            0x20000);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> +
> +    s->timer =3D ptimer_init(imx_sysctr_timeout, s, PTIMER_POLICY_DEFAUL=
T);

Almost no device wants the default policy -- it is
defined as "the somewhat broken thing that ptimer has
traditionally done, to avoid changing behaviour of
existing device models". Have a look at the policy flags
to see which ones you want -- there's a comment in ptimer.h
explaining them.

> +
> +    /* the default freq is 24Mhz and divided by 3*/
> +    ptimer_transaction_begin(s->timer);
> +    ptimer_set_freq(s->timer, 24000000 / 3);
> +    ptimer_transaction_commit(s->timer);
> +}
> +
> +static void imx_sysctr_timer_reset(DeviceState *dev)
> +{
> +    IMXSysctrState *s =3D IMX_SYSCTR_TIMER(dev);
> +
> +    ptimer_transaction_begin(s->timer);
> +    /* stop timer */
> +    ptimer_stop(s->timer);
> +    s->cmpcr =3D 0;
> +    s->cmpcv =3D 0;
> +    s->cnt =3D 0;
> +
> +    s->next_timeout =3D SYSCTR_TIMER_MAX;
> +
> +    ptimer_set_limit(s->timer, SYSCTR_TIMER_MAX, 1);
> +
> +    /* if the timer is still enabled, restart it */
> +    if ((s->cmpcr & SYSCTR_CMPCR_EN)) {
> +        ptimer_run(s->timer, 1);

You just zeroed cmpcr, this can never happen.

> +    }
> +    ptimer_transaction_commit(s->timer);
> +
> +    DPRINTF("System counter was reset\n");
> +
> +}
> +
> +static void imx_sysctr_timer_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D imx_sysctr_timer_realize;
> +    dc->reset =3D imx_sysctr_timer_reset;

All new devices should have a vmstate struct so that snapshot
and migration work.

> +}
> +
> +static const TypeInfo imx_sysctr_timer_info =3D {
> +    .name          =3D TYPE_IMX_SYSCTR_TIMER,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(IMXSysctrState),
> +    .instance_init =3D imx_sysctr_timer_init,
> +    .class_init    =3D imx_sysctr_timer_class_init,
> +};
> +
> +static void imx_sysctr_timer_register_types(void)
> +{
> +    type_register_static(&imx_sysctr_timer_info);
> +}
> +
> +type_init(imx_sysctr_timer_register_types)
> +
> +static const char *imx_sysctr_timer_reg_name(uint32_t reg)

I would move this function further up -- the usual convention is
that the type_init stuff is the last thing in the file. If
you put it near the top of the file you won't need the
separate prototype for it that you currently have.

> +{
> +    switch (reg) {
> +    case CMPCR:
> +        return "CMPCR";
> +    case CMPCV_LO:
> +        return "CMPCV_LO";
> +    case CMPCV_HI:
> +        return "CMPCV_HI";
> +    case CNTCV_HI:
> +        return "CNTCV_HI";
> +    case CNTCV_LO:
> +        return "CNTCV_LO";
> +    default:
> +        return "[?]";
> +    }
> +}
> \ No newline at end of file

Fix the missing newline :-)

> diff --git a/hw/timer/meson.build b/hw/timer/meson.build
> index 598d058506..b6cd52a0b1 100644
> --- a/hw/timer/meson.build
> +++ b/hw/timer/meson.build
> @@ -19,6 +19,7 @@ softmmu_ss.add(when: 'CONFIG_HPET', if_true: files('hpe=
t.c'))
>  softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i=
8254.c'))
>  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
>  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
> +softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_sysctr_timer.c'))
>  softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_timer.c=
'))
>  softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysct=
l.c'))
>  softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'=
))
> diff --git a/include/hw/timer/imx_sysctr_timer.h b/include/hw/timer/imx_s=
ysctr_timer.h
> new file mode 100644
> index 0000000000..c36ae9b393
> --- /dev/null
> +++ b/include/hw/timer/imx_sysctr_timer.h
> @@ -0,0 +1,84 @@
> +/*
> + * QEMU NXP Sysctr Timer
> + *
> + * Author: Viorica Mancas <vioricamancas@yahoo.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef IMX_SYSCTR_H
> +#define IMX_SYSCTR_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/ptimer.h"
> +#include "hw/misc/imx_ccm.h"
> +#include "qom/object.h"
> +
> +/*
> + * sysctr : System counter
> + *
> + * The System Counter inputs two counter clock sources and outputs a cou=
nter
> + * value and interrupt signals (one per compare frame) to the platform=
=E2=80=99s
> + * interrupt controller.
> + */
> +
> +/* The counter in the timer is 56 bits (first 8 are 0) */
> +#define SYSCTR_TIMER_MAX  0X00FFFFFFFFFFFFFFUL

defining this as MAKE_64BIT_MASK(0, 56) would save
people counting all those 'F's :-)

> +
> +/* addresses */
> +#define CMP_OFFSET     0x10000
> +
> +#define CNTCV_LO       0x8
> +#define CNTCV_HI       0xc
> +#define CMPCV_LO       (CMP_OFFSET + 0x20)
> +#define CMPCV_HI       (CMP_OFFSET + 0x24)
> +#define CMPCR          (CMP_OFFSET + 0x2c)

Not obligatory, but you might consider using the REG32() macro
from registerfields.h for defining register offset values.

Do these defines really need to be public, or could they be put
in the .c file ? Generally the .h file has the stuff that users
of the device need, and anything that's purely internal to the
implementation goes in the .c file.

> +
> +/* Control register.  Not all of these bits have any effect (yet) */
> +#define SYSCTR_CMPCR_EN        (1 << 0)  /*  Enable */
> +#define SYSCTR_CMPCR_IMASK     (1 << 1)  /*  Enable */
> +#define SYSCTR_CMPCR_ISTAT     (1 << 2)  /*  Compare (interrupt) status =
(read only) */
> +/* interupt condition: ISTAT =3D (CNTCV >=3D CMPCV) */
> +
> +#define CMPCR_WRITE (SYSCTR_CMPCR_IMASK | SYSCTR_CMPCR_EN)
> +
> +#define TYPE_IMX_SYSCTR_TIMER "imx.sysctr-timer"
> +
> +typedef struct IMXSysctrState IMXSysctrState;
> +DECLARE_INSTANCE_CHECKER(IMXSysctrState, IMX_SYSCTR_TIMER,
> +                         TYPE_IMX_SYSCTR_TIMER)

Prefer OBJECT_DECLARE_SIMPLE_TYPE, which will do the typedef
for you.

> +
> +struct IMXSysctrState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    ptimer_state *timer;
> +    MemoryRegion  iomem;
> +
> +    qemu_irq irq;
> +
> +    uint32_t cmpcr; /* Compare Control Register */
> +    uint64_t cnt;   /* Counter on 56 bits */
> +    uint64_t cmpcv; /* Compare Count Value */
> +
> +    uint64_t next_timeout;
> +};
> +
> +#endif /* IMX_SYSCTR_H */

thanks
-- PMM

