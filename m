Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38732CDCE5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:59:30 +0100 (CET)
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkst7-0003yZ-Nc
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1kksr5-0003PG-My
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:57:23 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:46444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1kksr3-0006xU-W7
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:57:23 -0500
Received: by mail-io1-xd42.google.com with SMTP id 81so2931611ioc.13
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 09:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iwy1nxkNzsDK41E799mE0jnVk8uV5OT9jOHPDUmDqGM=;
 b=XoGEqufjqR3vkKZT6ohzTPHbYmQAEVrHwYWzKYVvuLrOnSG8qoPYZPMXRb/ZTV3+iM
 RFurA0Ji6TS47Z0GDIxGe5VtthNe510Edv7GZzMEej0XHD2l787mHzOkNms2m3qDcJMr
 zncZ3s4rmSlNTQqL1ZYTKd44SsHsjZfxo1H7x9Mf972v2F71ymXgMCjyhBZ5MAgCiZX4
 vF575s198IrH3oNRbIzmPIJqFivvO0Wnai2nACci34alJDGINGpU2o6cPiDkjBVGGkge
 t265fNI59yiryjJPNblz2LL95xlBbemJVqMeq+r0fdumnZI01qV7spshjQPGhwyJTbRI
 IrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iwy1nxkNzsDK41E799mE0jnVk8uV5OT9jOHPDUmDqGM=;
 b=csw3K1buSmIKyiCxZ32MNz1U2ZpDMmLwTbZj9jUQw1MhdvdlTtttDJ+i0niDzSnKYg
 ZXEx6K0sY7CXQUgyEEN6NpjV0SfYHo+FsGyBvp5AKmKlKFepinJlZ9ESCgF62cpzhFJR
 9Az/we7qyA0ZtITH5QCGTypNNkjjY4ZzKJN13YNyQ2+TKFb2/ugEHkaRhCGOOlLQMX9I
 jPdIo2FHO8PQEArGfbpJ0tPb/gfEwswxt4Ydx4qoco2AXr9jDJoSd2c/pNVDz6St6jVJ
 3eYVNwKyXiyGoBxdsoL+7dnxMp0LgmqJ7NC4GwL5a3JtPycs37ni+aQjp194+D1fCEvz
 QsSw==
X-Gm-Message-State: AOAM533PQkfKfbCxA8V106bSFOcVoDvNh3FA9kvL7IJOY/wBtTborz4o
 WdgeziXZCm2HMUUmxeFt3YZo0w4Y/O/VTjW24kU=
X-Google-Smtp-Source: ABdhPJwaPzSY4DqfjK75ViVJg/XJ88Har94J8tA+MecYJ1lx7QosnvxbdvszOgZKPN9eBNSFUvegAOpgiaZ4u9JdKhE=
X-Received: by 2002:a05:6602:152:: with SMTP id
 v18mr361343iot.187.1607018240352; 
 Thu, 03 Dec 2020 09:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20201203133236.222207-1-andrew@daynix.com>
In-Reply-To: <20201203133236.222207-1-andrew@daynix.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Thu, 3 Dec 2020 09:57:09 -0800
Message-ID: <CAKgT0UeoKDcDeMMG7KGMSKXP26txrwNuc73HKFPa57y=Vuo-kg@mail.gmail.com>
Subject: Re: [PATCH v2] e1000e: Added ICR clearing by corresponding IMS bit.
To: Andrew Melnychenko <andrew@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alexander.duyck@gmail.com; helo=mail-io1-xd42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: intel-wired-lan <intel-wired-lan@lists.osuosl.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 3, 2020 at 5:00 AM Andrew Melnychenko <andrew@daynix.com> wrote:
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1707441

So the bugzilla seems to be reporting that the NIC operstate is being
misreported when qemu has configured the link down. Based on the
description it isn't clear to me how this patch addresses that. Some
documentation on how you reproduced the issue, and what was seen
before and after this patch would be useful.

> Added ICR clearing if there is IMS bit - according to the note by

Should probably be "Add" instead of "Added". Same for the title of the patch.

> section 13.3.27 of the 8257X developers manual.
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  hw/net/e1000e_core.c | 10 ++++++++++
>  hw/net/trace-events  |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 095c01ebc6..9705f5c52e 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -2624,6 +2624,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
>          e1000e_clear_ims_bits(core, core->mac[IAM]);
>      }
>
> +    /*
> +     * PCIe* GbE Controllers Open Source Software Developer's Manual
> +     * 13.3.27 Interrupt Cause Read Register
> +     */
> +    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
> +        (core->mac[ICR] & core->mac[IMS])) {
> +        trace_e1000e_irq_icr_clear_icr_bit_ims(core->mac[ICR], core->mac[IMS]);
> +        core->mac[ICR] = 0;
> +    }
> +
>      trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
>      e1000e_update_interrupt_state(core);
>      return ret;

Changes like this have historically been problematic. I am curious
what testing had been done on this and with what drivers? Keep in mind
that we have to support several flavors of BSD, Windows, and Linux
with this.

> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 5db45456d9..2c3521a19c 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -237,6 +237,7 @@ e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
>  e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
>  e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"
>  e1000e_irq_icr_clear_iame(void) "Clearing ICR on read due to IAME"
> +e1000e_irq_icr_clear_icr_bit_ims(uint32_t icr, uint32_t ims) "Clearing ICR on read due corresponding IMS bit: 0x%x & 0x%x"
>  e1000e_irq_iam_clear_eiame(uint32_t iam, uint32_t cause) "Clearing IMS due to EIAME, IAM: 0x%X, cause: 0x%X"
>  e1000e_irq_icr_clear_eiac(uint32_t icr, uint32_t eiac) "Clearing ICR bits due to EIAC, ICR: 0x%X, EIAC: 0x%X"
>  e1000e_irq_ims_clear_set_imc(uint32_t val) "Clearing IMS bits due to IMC write 0x%x"
> --
> 2.29.2
>

