Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE363B2B36
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:18:52 +0200 (CEST)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLVb-0003rS-9T
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwLUX-00031D-K7
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:17:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwLUV-0005Sx-R6
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:17:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id h2so7531626edt.3
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6aARG5UmBOr5WQwTMY/Zp4erbf3+b/1CYQoU37+S8ek=;
 b=fgjvHkpMeKxGObxnCi5JZ7OdHyVxIMNuxTE+KqUs7Mo52gj7/L8JD6PmZJJTNgDWRW
 OyoufiuzoUjpHdYJS8nC5e5ms5TIYOjSr28pUiu9YfvMZQppFbIRLqskA4oePIc3ULSr
 GRt9avwG+yNDhabrNpOXv0yQK2eWHKRsMvQwZg4f3/XVM8zmdlT6yR7rnhPzY7jgx8+d
 QfsdKa/2K57NmwW8QerY2hiBJhF2M+PqoAkz6G2VvxbTI+8CE2l86ULpUzqv3ZNzQPg2
 6vpMTJPgO28qc25uIxj2+ByXV77pIeOS38qgBn9wG71XWmcN2fx+tLQQjWarJRAbkNIC
 53fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6aARG5UmBOr5WQwTMY/Zp4erbf3+b/1CYQoU37+S8ek=;
 b=brg+yLCLu6giDDgv5NZSGn8WgoD6WCm9zWp/SRo+rNpMrVR9q7uu6xzXn2VUnxagqq
 f/W4ULQ6Fp1piT6OrtAc6Nkd4L99Canuuu2Y6IsO9hNlX1el0injNmh6XHiPIheAKffW
 AU3esqf176Dax1XVOj+539p4DfKQcnh8Vgbn4VeGYFroef40DtTHi289Jpi9c4ZI6p48
 P+n7tta7bLyHXLmUckb5aUjzjWKB9qlh7gXsuuYbhV1e5wv9G915Hb+hXSMHSqNiaFZQ
 n+EXZ19rvutqSDMDf4TqvIr2zw+jfEaS1NHm8Oga8s6+NYmIBdUQyxRWpnvmmMLuXg3B
 QUcg==
X-Gm-Message-State: AOAM530Gicl7MVSJCNW140neNmH/tDa0Fws3DAIwlPBIJLUQN4SEfuHB
 kgey1SRl8X03bRxa5akxr8rg3uSwX+O6Pdsm4oRQ/g==
X-Google-Smtp-Source: ABdhPJxKweuXhCxFFPChTL25FZpqP6/tlVX8TuXZWPTl1pwOsrssK85XGR/U05WHFQEPkSGpVP69xiMTjwv+y9THF2M=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr5799473edz.44.1624526261551; 
 Thu, 24 Jun 2021 02:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200917135323.18022-1-kraxel@redhat.com>
 <20200917135323.18022-5-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-5-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 10:17:05 +0100
Message-ID: <CAFEAcA_7w2MrTBBafUe6CFDDuAK+vAUP2fdhPG1TzA70sJW+4w@mail.gmail.com>
Subject: Re: [PULL 04/21] acpi: ged: add control regs
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Sept 2020 at 14:53, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Add control regs (sleep, reset) for hw-reduced acpi.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Message-id: 20200915120909.20838-5-kraxel@redhat.com
> ---
>  include/hw/acpi/generic_event_device.h | 12 +++++++
>  hw/acpi/generic_event_device.c         | 44 ++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)

Hi; I've just run across this code because I found a bug in
a different device and was doing a grep to see if anybody
else had made the same mistake...

> +static void ged_regs_write(void *opaque, hwaddr addr, uint64_t data,
> +                           unsigned int size)
> +{
> +    bool slp_en;
> +    int slp_typ;
> +
> +    switch (addr) {
> +    case ACPI_GED_REG_SLEEP_CTL:
> +        slp_typ = (data >> 2) & 0x07;
> +        slp_en  = (data >> 5) & 0x01;
> +        if (slp_en && slp_typ == 5) {
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        }
> +        return;
> +    case ACPI_GED_REG_SLEEP_STS:
> +        return;
> +    case ACPI_GED_REG_RESET:
> +        if (data == ACPI_GED_RESET_VALUE) {
> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);

Here we call qemu_system_reset_request(), but we pass it a cause
value of GUEST_SHUTDOWN. Is this trying to do a reset (in which
case it should probably be SHUTDOWN_CAUSE_GUEST_RESET) or a shutdown
(in which case it needs to call qemu_system_shutdown_request()) ?

> +        }
> +        return;
> +    }
> +}

thanks
-- PMM

