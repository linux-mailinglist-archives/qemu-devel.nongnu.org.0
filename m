Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C92CC700
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 20:53:21 +0100 (CET)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkYBk-0004jf-EQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 14:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kkYAz-0003xX-GP; Wed, 02 Dec 2020 14:52:33 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:36983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kkYAx-0002oi-SE; Wed, 02 Dec 2020 14:52:33 -0500
Received: by mail-io1-xd44.google.com with SMTP id p187so3218258iod.4;
 Wed, 02 Dec 2020 11:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t0wdGZdB/zB/vzOJCV0NV9KTxMFSduT1lCOWlTsuM44=;
 b=s+nKjmqOkvcDfgeUeVgnfzPs3bQn7kExpvGXbOInkMl5YRFI4Hfeq2qT86JURxorjm
 BnAMSzReoigW3GYr00lsH5AMwbe0v9eWHhKtfrvVdHmpRQPifJxFjYPiKLeGTHQ83u+g
 2ZVTL056g11RwlZuY69cGTqms1V+QOsaGQHx5Att627lsaoMGedLTgnm+AJj4pwpba4H
 /2OYiWAaOTZPUy4ZByOhKHWM059yfjX4YOQrQYVOZ+EURlgdZfEYcsMfRaP9kQBMcsyV
 8/tSm6VS7UTve3YKJiQZa3IaiEx+31xufnCJuYSclD4buN2n16bTEHO6MDbFHXSrlffE
 B5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t0wdGZdB/zB/vzOJCV0NV9KTxMFSduT1lCOWlTsuM44=;
 b=WqQdoMbuDNTNzDdMzKDNYUfG58WNOiB7CK9qW9jYDFnkPs3iD1F4d0cjtH8Cu644yt
 vKBUiMGyBgDQT4WQlYViTmm1x4nSZ/kzTQ9/70BBk/2PJNr2UxIKFx3VFadwwpztgfyX
 Xw0wtWEHIHHkb2k0TiWMxLK7XJTKltG3rk/vdV3nQOCCOKPCNbwQretgibUUlMnC/5Qt
 g/u5i07VPOe3ubaFiO0KEDnQ5xS+fC/0LzM0oJ+vJEuEL1RtFUbeYUo0U3CFaVYK0yK0
 13IoeWxkfv3M8ISmzDKWMX7HWlJX4CCaWZn934nZGzXLCE6tTzkiL+1mkYoA4LnILLjt
 T31Q==
X-Gm-Message-State: AOAM531SgxNKbzc1ACaEXtgc6/0kaGPTQMUBt5GVMUNzoMDfW3IaYzvZ
 kdyg/dlDXrmkX2znRQYJNh4egrxNctNgfoXvX6A=
X-Google-Smtp-Source: ABdhPJwRDuJ716hNhlZJLZLxbJXP78trtHoxMDphbUN0DzUR1pbCfxo40QLoodwXyweoRd1vBOHl6iMEFX08f2Ty3HE=
X-Received: by 2002:a02:a419:: with SMTP id c25mr3656232jal.91.1606938749987; 
 Wed, 02 Dec 2020 11:52:29 -0800 (PST)
MIME-Version: 1.0
References: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1606704602-59435-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Dec 2020 11:40:11 -0800
Message-ID: <CAKmqyKOWRENRYr0iz-bX7gGmksQdtTc_uMy_iY1YNvvRFr-PLg@mail.gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Fix fast read for SST flashes
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 29, 2020 at 6:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> SST flashes require a dummy byte after the address bits.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

I couldn't find a datasheet that says this... But the actual code
change looks fine, so:

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/block/m25p80.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 483925f..9b36762 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -825,6 +825,9 @@ static void decode_fast_read_cmd(Flash *s)
>      s->needed_bytes = get_addr_length(s);
>      switch (get_man(s)) {
>      /* Dummy cycles - modeled with bytes writes instead of bits */
> +    case MAN_SST:
> +        s->needed_bytes += 1;
> +        break;
>      case MAN_WINBOND:
>          s->needed_bytes += 8;
>          break;
> --
> 2.7.4
>
>

