Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8D62B0F1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 03:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov7hL-0007mI-Pc; Tue, 15 Nov 2022 20:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ov7hH-0007lV-HH; Tue, 15 Nov 2022 20:58:39 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ov7hF-00037S-5X; Tue, 15 Nov 2022 20:58:39 -0500
Received: by mail-vs1-xe32.google.com with SMTP id i2so12156582vsc.1;
 Tue, 15 Nov 2022 17:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6qpH61rfLjNx2L8hpRSbpPoIBI6gA5qy+Cyt0Xmw3E=;
 b=GxBY4Cne9fRrfIpGpX3fLEgrKzYaWUzilVwDGRZUFAOmD9RSxVaL01C6Bj3CEZMBM6
 X6QJAD7Os6D1q2hyKiqta1a8weVg+P7YbIFPxfHRdv0yzM9MQcE54X5KtkjH8+nIkniQ
 sDn/XC0necC42TZ3yZYf571ddWl2AWsxQcVL1dCtZiEV53IbKRatPhdP5TKrqIBIjlOd
 XXnGV6QNVSQ6pn1gKNcWTGtlTRU/8JM0YkHWU+6xxLfJu237brh2r+fduY3q5ERxJGhu
 jsFE/KSMVEQhncT07ZAUHopZ5KrBA/S74RJp2Z6QTu29zJvdUd9JEuWID1z4ei3V94k0
 7jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6qpH61rfLjNx2L8hpRSbpPoIBI6gA5qy+Cyt0Xmw3E=;
 b=0TzZyB6WHbbnMWPCxCeGi/0Lj2xMWbTxru+zVPomvmlMiAZ0A5YqmIQd594OkXWvce
 1PK1wiu7TU+Bt424tcHNrIh/t6zEt2qiLVZTqfCPLXf8OkvwHCNfQFDhy5KoyMhh6/q1
 TpSF21gimCZxZgbUa4AmeEuWynOMAEbmmYt3JCiSkXb6JB73MWwd5GTSkoVoODscgcv6
 HO3ls8wFROXaWhyxL8QPs0kCXPkNHvktRV7e/dgX/mCh/V47LO3zzn4noi8NOXIVhRoJ
 nPMATSX2yjTnQKblF5sqtamqiqbbRcPQhmEPlhh6MRGB5gqgoF2EJCaY/xDtQPp31WZz
 YJqg==
X-Gm-Message-State: ANoB5pkXyRF22N0bMjGMkUcRp29y99MR6Sqflta2g8EdSaHJMnhBmqef
 y1BXf08UcMl/J5OwVqfMMnAGjNQhZrbOXbVYR/Y=
X-Google-Smtp-Source: AA0mqf48X1enJzvaMo8cgP7iVNhSbILnMDv3h2Ew4fzIccfabZNbI+Ie0fYznYmwqWYXMPoDGjkWuH5D6hFOMk1bKgM=
X-Received: by 2002:a05:6102:f07:b0:3ad:c930:b9bb with SMTP id
 v7-20020a0561020f0700b003adc930b9bbmr10485419vss.10.1668563915691; Tue, 15
 Nov 2022 17:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20221115151000.2080833-1-clg@kaod.org>
In-Reply-To: <20221115151000.2080833-1-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Nov 2022 11:58:09 +1000
Message-ID: <CAKmqyKPna6u6BAwseZf_scqHnarhJjwHno3Up7zs+WTrA+Ddmg@mail.gmail.com>
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size does
 not match the device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 1:13 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, when a block backend is attached to a m25p80 device and the
> associated file size does not match the flash model, QEMU complains
> with the error message "failed to read the initial flash content".
> This is confusing for the user.
>
> Use blk_check_size_and_read_all() instead of blk_pread() to improve
> the reported error.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/m25p80.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 02adc87527..68a757abf3 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "sysemu/block-backend.h"
> +#include "hw/block/block.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/ssi/ssi.h"
> @@ -1614,8 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error=
 **errp)
>          trace_m25p80_binding(s);
>          s->storage =3D blk_blockalign(s->blk, s->size);
>
> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
> -            error_setg(errp, "failed to read the initial flash content")=
;
> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, er=
rp)) {
>              return;
>          }
>      } else {
> --
> 2.38.1
>
>

