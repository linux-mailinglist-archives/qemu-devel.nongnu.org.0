Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9E3B2DD9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:28:19 +0200 (CEST)
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNWs-0000lT-9r
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwNCD-0002TC-AP
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:06:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwNCA-0003ZC-HY
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:06:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id q14so7927610eds.5
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nPjdvn534DHuYRyFN84RDyWfp4RUMETvlQKgpiTvnDU=;
 b=j81K7Z9S2QdFsbCcnUdhywEXrBIh3ZRJG2WQVQW18YyZsHFJhIAUeuUzsqxCZz5zwf
 igcKB1l5tJjJFMJb+YONuVxF9n6RbHcyQAhCWZ/34lCkUcrWn2Ey6HDEOxY5NceiHr/v
 lVVOpNOtnEaA5nF1iroPbB9xr6dQRLQDfLcOaPoGi7rg1F1o4rzsWYfLieJ1uFmSYRcK
 ZXyoagKDw7jqd4rTM0GLlwV7KQMLmysa3FowM8igbNeELdNxBl2NV43Y/CpigOeCcg/A
 Mf30qWBqYe20RT0NrxwQOPoSIKCu9uGVm+/UirreejdYL3bcUi28f7nnwr6Pn7uFfLiD
 GPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nPjdvn534DHuYRyFN84RDyWfp4RUMETvlQKgpiTvnDU=;
 b=euMfNEijhKeGpu8Bp2QczKn3qOLjMANs6vha5Mbvgibtj1MdJX6HH/Ej5ZUn8SN/qO
 ZTzE43Mpz5bUXIdkBdLfEPB2STK6UP6+6Lsx8g4zBSWmP6LnvbXk2RH9YSI485bFQ2QX
 w22CdzBAQtIBmtnM2QdLb8vBOmiOsktagGrWKkiR5ppHO9FUvrpl4fB6wXNRztwM5gqy
 8JYvkZHFpvDP8f5iekp5+TbUUAqsY4WsOajgQLXdGvXCwfqZAb+xNmFyCJuyBX7Mxc+Y
 cKn73zvDv5yf6RIHOKAa1kLdUx0+8wm30dTY8cxznu/MhjRHMTYlWSZZj1Y6mKeq+oJd
 SZ/w==
X-Gm-Message-State: AOAM5303pDYOhZZFgiImD1WwzF0LsNJRC2ancFeDA3v4OsL+W8aD6R8P
 58Ok4KwC/4rjZTAMKPfH1vHW8WE6tElwh6OUFQZ1Iw==
X-Google-Smtp-Source: ABdhPJyJHuAn/Rh5eq50JLj7dhs487Tt9iSA70Tr92HKvZMQHTm5qjgTnl1920IsG8wn76wtReUbHEuIdtlZdP+4goQ=
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr6302778edd.52.1624532810766; 
 Thu, 24 Jun 2021 04:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210624110057.2398779-1-kraxel@redhat.com>
In-Reply-To: <20210624110057.2398779-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 12:06:14 +0100
Message-ID: <CAFEAcA-fULMwcstO3eCAggktfD6vDP4TPDadyB0A9eAKAtnP-w@mail.gmail.com>
Subject: Re: [PATCH] acpi/ged: fix reset cause
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 12:01, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Reset requests should use SHUTDOWN_CAUSE_GUEST_RESET not
> SHUTDOWN_CAUSE_GUEST_SHUTDOWN.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/acpi/generic_event_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 39c825763ad8..e28457a7d103 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -207,7 +207,7 @@ static void ged_regs_write(void *opaque, hwaddr addr, uint64_t data,
>          return;
>      case ACPI_GED_REG_RESET:
>          if (data == ACPI_GED_RESET_VALUE) {
> -            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>          }
>          return;
>      }
> --
> 2.31.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

