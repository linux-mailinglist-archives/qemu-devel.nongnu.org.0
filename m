Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0C4AC9F7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:59:06 +0100 (CET)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHAAC-0001b4-VU
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:59:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9mp-00010G-6e
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:34:56 -0500
Received: from [2a00:1450:4864:20::432] (port=36354
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9mn-0002Ut-4y
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:34:54 -0500
Received: by mail-wr1-x432.google.com with SMTP id i15so4301230wrb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 11:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+sJhwSAtSmNzVdEyA48Qj91xfHpZZGjNnK7M/PRWW8=;
 b=DAoru3kqkg8vPdqVx0Bgolmpt6NID60828DM2/O1n1y9ps7LU/8U3876BkNxKEtCFG
 lck6R9/4pkO6uc8fkN37nk8RG9BIDKBmjZf+dKmkCSMo94CIyL0rlnfLjRIFis8/D8c8
 zTCkMaC+LVT6czMQjnbXDPPwvduEyCzLWdJRgiXFVSTSpe72BLygqtN3lbZlcHHE0JXB
 Xxbn+otZquQEqmN1D7OeIfhlMLTtFZS15LSy6vtAN5C+mbkqEnggcEPktypp7Uk+UPiC
 kmPZM8v9ggkx6zn1hYPFmFMqJzoNQpr63FJqlWTSrgIPi3BloTtACpO+4/kL/9Zaoz79
 dU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+sJhwSAtSmNzVdEyA48Qj91xfHpZZGjNnK7M/PRWW8=;
 b=ReyMueFy0xTuRLmylWBb+mNs0hTQ3W2VUncVU7yv7SRGPx65rvmA+na+c+ICp8O0nL
 uVHM65x7Tckt1Hhvv8MS29PXZL4FexyakRjlKwzynqid6tsVbTJNrogekuZ4So1Aknw+
 SoaBuiye+lgDKCd6JKPFQftf2eGvtv+Mcr2CnTYouM8qqBneyh5LU7MkxQGtHievvI7p
 kNdnqK2EKn/KHK/mRcEScXjbWb2+i/VHwHlDtFkCT5woyzEZSQ6G1N1K7zBILt9Batwl
 09WMeSbX6kj8ipOQBgtxv1rb05OxKa0nL9ZAIXDAmPTO+7bD9uYnyLJPk45XLWltas80
 OEFA==
X-Gm-Message-State: AOAM531fg6NMZZ39Jl1ODUV1hvJtW+vptMeOKOQ/O0NrTrfZgF90kLvi
 e4Hi/0wmSVEQlDRfM+IzSGV2/vNGXf3J7HnLjj6iEg==
X-Google-Smtp-Source: ABdhPJx1MwzTxa7VVK/K+gV4DckuR8Tm/rgp9+5Hb+WXGK0VDzw4BfEk23WLoP4z7xnjNBp5vYq14yaqrpndlvdtlD4=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr829503wrz.2.1644262491366; 
 Mon, 07 Feb 2022 11:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 19:34:40 +0000
Message-ID: <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Markus Armbruster <armbru@redhat.com>, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This displays detailed information about the device registers and timers to aid
> debugging problems with timers and interrupts.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hmp-commands-info.hx | 12 ++++++
>  hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+)


I'm not sure how keen we are on adding new device-specific
HMP info commands, but it's not my area of expertise. Markus ?

(patch below for context)

thanks
-- PMM

>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index e90f20a107..4e714e79a2 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -879,3 +879,15 @@ SRST
>    ``info sgx``
>      Show intel SGX information.
>  ERST
> +
> +    {
> +        .name       = "via",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "show guest 6522 VIA devices",
> +    },
> +
> +SRST
> +  ``info via``
> +    Show guest 6522 VIA devices.
> +ERST
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index aaae195d63..cfa6a9c44b 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -30,6 +30,8 @@
>  #include "hw/misc/mos6522.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> +#include "monitor/monitor.h"
> +#include "qapi/type-helpers.h"
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"
>  #include "qemu/log.h"
> @@ -415,6 +417,95 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>      }
>  }
>
> +static int qmp_x_query_via_foreach(Object *obj, void *opaque)
> +{
> +    GString *buf = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_MOS6522)) {
> +        MOS6522State *s = MOS6522(obj);
> +        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        uint16_t t1counter = get_counter(s, &s->timers[0]);
> +        uint16_t t2counter = get_counter(s, &s->timers[1]);
> +
> +        g_string_append_printf(buf, "%s:\n", object_get_typename(obj));
> +
> +        g_string_append_printf(buf, "  Registers:\n");
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[0], s->b);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[1], s->a);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[2], s->dirb);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[3], s->dira);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[4], t1counter & 0xff);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[5], t1counter >> 8);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[6],
> +                               s->timers[0].latch & 0xff);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[7],
> +                               s->timers[0].latch >> 8);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[8], t2counter & 0xff);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[9], t2counter >> 8);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[10], s->sr);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[11], s->acr);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[12], s->pcr);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[13], s->ifr);
> +        g_string_append_printf(buf, "    %-*s:    0x%x\n", 4,
> +                               mos6522_reg_names[14], s->ier);
> +
> +        g_string_append_printf(buf, "  Timers:\n");
> +        g_string_append_printf(buf, "    Using current time now(ns)=%"PRId64
> +                                    "\n", now);
> +        g_string_append_printf(buf, "    T1 freq(hz)=%"PRId64
> +                               " mode=%s"
> +                               " counter=0x%x"
> +                               " latch=0x%x\n"
> +                               "       load_time(ns)=%"PRId64
> +                               " next_irq_time(ns)=%"PRId64 "\n",
> +                               s->timers[0].frequency,
> +                               ((s->acr & T1MODE) == T1MODE_CONT) ? "continuous"
> +                                                                  : "one-shot",
> +                               t1counter,
> +                               s->timers[0].latch,
> +                               s->timers[0].load_time,
> +                               get_next_irq_time(s, &s->timers[0], now));
> +        g_string_append_printf(buf, "    T2 freq(hz)=%"PRId64
> +                               " mode=%s"
> +                               " counter=0x%x"
> +                               " latch=0x%x\n"
> +                               "       load_time(ns)=%"PRId64
> +                               " next_irq_time(ns)=%"PRId64 "\n",
> +                               s->timers[1].frequency,
> +                               "one-shot",
> +                               t2counter,
> +                               s->timers[1].latch,
> +                               s->timers[1].load_time,
> +                               get_next_irq_time(s, &s->timers[1], now));
> +    }
> +
> +    return 0;
> +}
> +
> +static HumanReadableText *qmp_x_query_via(Error **errp)
> +{
> +    g_autoptr(GString) buf = g_string_new("");
> +
> +    object_child_foreach_recursive(object_get_root(),
> +                                   qmp_x_query_via_foreach, buf);
> +
> +    return human_readable_text_from_str(buf);
> +}
> +
>  static const MemoryRegionOps mos6522_ops = {
>      .read = mos6522_read,
>      .write = mos6522_write,
> @@ -547,6 +638,7 @@ static const TypeInfo mos6522_type_info = {
>  static void mos6522_register_types(void)
>  {
>      type_register_static(&mos6522_type_info);
> +    monitor_register_hmp_info_hrt("via", qmp_x_query_via);
>  }
>
>  type_init(mos6522_register_types)
> --
> 2.20.1

