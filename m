Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF4F4FC90D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:06:27 +0200 (CEST)
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne438-0001eS-1x
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne40o-0008NM-9d
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:04:02 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ne40m-0005pJ-Oh
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:04:01 -0400
Received: by mail-io1-xd30.google.com with SMTP id 125so20561776iov.10
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJT7HXlPDg+91XaBznKcMr8OgsnBkqEg6edSnCh82qo=;
 b=d5Ap/NWbkLqx/Ms6MZNKN/2KRnqin46hVptetQPdAIP39or0BJ8o1yjZeA9eMg5NOL
 NVWtq5D2pacVS7cfixUCtbTyxoZNhAmtl2Dp1jWAUA510Lr9twlBhYyhRdPnLVrT9vta
 aJZXED2P7Q5jHnHrbNZH0Crdd7FoIem1RoLsM7cTcinOesCU35fS6v7Ic9sc5aQS3VLK
 5EeBmTS/hFTsLwAPHWr6Mz5yyD8YONXrT5V9wUwn8/b4XEyN5Ygiq9fxxqDgmt8L/jIE
 5BUGdyRYNRTrNfOR4d6MShGdptOlsT/VzoeGVuv+4fVULSvrBaAAGWs+ToUgUjOXcfaS
 O4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJT7HXlPDg+91XaBznKcMr8OgsnBkqEg6edSnCh82qo=;
 b=jW2mVI+akdPrgrqBfnjGyhRjFWLKJ2xB+utmwfmMUNIY5oHPDFD59+RlIc5/j67FhW
 504X4cPdP8/clElFrtRroANqTz1ITyVYQ9DrlRuKgNOvLBkRO4z30vC2WJcfgGG/Omt2
 kFRFamMc5QltRipsGCzCWpWrFe+HZLbiGwfVcywhcphpFFczMmBIOgpQyAgfizSGZLb8
 MHYjToNoYeI7yc9PkRS7158+/a2WFhLcjSvwnhVpQFeicVOotHoI1cATiTjjDN/bCJEn
 zI+mI/eCgu0p6t8H33lDemDNRRig0T826Qku2bHioLMDsdJtFLlCWpwk1VsbuB0+bnNM
 hRVg==
X-Gm-Message-State: AOAM531gKYMcHvsWv+d2oRwZdYB8fAopBvErnQ8gcj5omyaweZwlngc0
 bW7lQ7RJIzomGNW60IYhyzoHd00J95o721aaPf8=
X-Google-Smtp-Source: ABdhPJyRVPEShy1IP+IzAr5+qUEXKLYBULC/aBsDfTiwUQNYP+bo2Bpp8MYPqdsB9YPS5EyebSbcA8ApDtcvkgrfNe4=
X-Received: by 2002:a05:6638:3720:b0:324:2e9b:1851 with SMTP id
 k32-20020a056638372000b003242e9b1851mr10229950jav.267.1649721839116; Mon, 11
 Apr 2022 17:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Apr 2022 10:03:33 +1000
Message-ID: <CAKmqyKP1SWt-qgMydudrsXp2GuizgcY5eO35CVyE6Xj3g2-y-w@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Exit if the user provided -bios in
 combination with KVM
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 10:18 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> The -bios option is silently ignored if used in combination with -enable-kvm.
> The reason is that the machine starts in S-Mode, and the bios typically runs in
> M-Mode.
>
> Better exit in that case to not confuse the user.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..09609c96e8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1308,12 +1308,18 @@ static void virt_machine_init(MachineState *machine)
>
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
> -     * so the "-bios" parameter is ignored and treated like "-bios none"
> -     * when KVM is enabled.
> +     * so the "-bios" parameter is not supported when KVM is enabled.
>       */
>      if (kvm_enabled()) {
> -        g_free(machine->firmware);
> -        machine->firmware = g_strdup("none");
> +        if (machine->firmware) {
> +            if (strcmp(machine->firmware, "none")) {
> +                error_report("Machine mode firmware is not supported in "
> +                             "combination with KVM.");
> +                exit(1);
> +            }
> +        } else {
> +            machine->firmware = g_strdup("none");
> +        }
>      }
>
>      if (riscv_is_32bit(&s->soc[0])) {
> --
> 2.32.0
>

