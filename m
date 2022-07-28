Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA83C583EFC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:38:03 +0200 (CEST)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2mA-00071n-9V
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH2eL-0000x7-IH
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:30:11 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:46809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH2eI-0003Oz-VJ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:29:57 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31f445bd486so17207717b3.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tdQgOXVlib+4Buxyf9ah7n/E2k+KRsoAMZUwpHlZ4FI=;
 b=h2xj+7uoXj2pD4vuzWRTnHpZ6sB7APa4aHNGk/uubhvoZDScjUiwnNw9q3exQ3DMh1
 oDYjDqNpISjXRmXGJY+tS/bb8V4uiM/Kr+/U2i1i+U6/Tg+xIx16DNEibPIR0k0CpT9f
 weitUvIhoHZX0htjD9aQVEI9Aapt2oOCmUmCGXYVlP814x2jfyb3qbGRYAD33mfyhJsb
 OVcG15X7HcUGSMSI/bwxUPvqt2eU1P72a/O59/cCj+a6nbwajrNN6oX1DHiBm1LU7YTY
 8l2WjV8fNDdTwME9Mj5pDIRnhhC41pEB9O+q8D/q99NoUnlmx7U6hBGYMO9lBoRAnnwC
 dWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tdQgOXVlib+4Buxyf9ah7n/E2k+KRsoAMZUwpHlZ4FI=;
 b=hn0LeGGHwAN+8lAWo200k8edSHvZY36fgNxe+p8swlENxTasSnDvGK7X8z1+/M3FaB
 JF0ye61WF4zLgSzyqX8nD1UHqPF7KSNG7ntoMuiy2Gl4gB+FhabtVcSFPhP1NCclSMr2
 RKrCpW/sjMzpB70q5tvxYXvbdkJsPq91lwRj8mkCCk+Q0HGw7dZnndHgo6BACg8GchPR
 1kaAAtorQ2PCrXDBwdWvoLH+oT52wLWSI4pzHusfMtBYv+9R9NxInW1vugbS84ls8HMh
 iPVxLCZaoroWPcSwGlyQ6aqot6oDJEi1oViDErPy697r4K00+Spz5hgJ0uzHS1kZ//pm
 6g9w==
X-Gm-Message-State: AJIora+sSd53hXylxVNDwVmPQVs/YFy59j1CqPfUQzhAkR+aTgjV3qRr
 AseWz7EmzmDukilejTjIjeE2c0zeszXCZJfbJ7LcLQ==
X-Google-Smtp-Source: AGRyM1s4xlvMsuKQp7heWpn7YblQBoOxfzktRma1LU/aZ/NcFuXLzOeeDQOnSD/wvmMGi4QE2PG2h7AOyNeQskzQlaM=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr23367277ywg.469.1659011387308; Thu, 28
 Jul 2022 05:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
In-Reply-To: <20220728115034.1327988-1-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 13:29:07 +0100
Message-ID: <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net, 
 jiaxun.yang@flygoat.com, ani@anisinha.ca, dgilbert@redhat.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com> wrote:
>
> QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
>   $ qemu-system-mips -monitor stdio
>   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>   Segmentation fault (core dumped)
>
> It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> which are valid only for x86 and not for MIPS (as it requires ACPI
> tables support which is not existent for ithe later)
>
> Issue was probably exposed by trying to cleanup/compile out unused
> ACPI bits from MIPS target (but forgetting about migration bits).
>
> Disable compiled out features using compat properties as the least
> risky way to deal with issue.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995

> ---
> PS:
> another approach could be setting defaults to disabled state and
> enabling them using compat props on PC machines (which is more
> code to deal with => more risky) or continue with PIIX4_PM
> refactoring to split x86-shism out (which I'm not really
> interested in due to risk of regressions for not much of
> benefit)
> ---
>  hw/mips/malta.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 7a0ec513b0..0e932988e0 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
>      .instance_init = mips_malta_instance_init,
>  };
>
> +GlobalProperty malta_compat[] = {
> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> +};

Is there an easy way to assert in hw/acpi/piix4.c that if
CONFIG_ACPI_PCIHP was not set then the board has initialized
all these properties to the don't-use-hotplug state ?
That would be a guard against similar bugs (though I suppose
we probably aren't likely to add new piix4 boards...)

> +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
> +
>  static void mips_malta_machine_init(MachineClass *mc)
>  {
>      mc->desc = "MIPS Malta Core LV";
> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
>      mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
>  #endif
>      mc->default_ram_id = "mips_malta.ram";
> +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
>  }
>
>  DEFINE_MACHINE("malta", mips_malta_machine_init)
> --
> 2.31.1

thanks
-- PMM

