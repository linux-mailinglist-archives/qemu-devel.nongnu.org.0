Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625F3337FA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:57:50 +0100 (CET)
Received: from localhost ([::1]:41658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuf7-00011m-Hk
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWY-0008OM-SR; Wed, 10 Mar 2021 03:48:58 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWX-00081O-7z; Wed, 10 Mar 2021 03:48:58 -0500
Received: by mail-yb1-xb35.google.com with SMTP id u3so17043686ybk.6;
 Wed, 10 Mar 2021 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=koouiRNLR2fA0swHrE3rbmIlhmFJc5FxZSDb1Wvxn5c=;
 b=ZTcESi9XeECNoK0BfjI92cPmJh9uXdGiQXWvXBjZ8iUhSpcXdHmbdnAGads6m/jdi4
 Wc7aw4fK2lX8k5yLlIOCdL4eMydeg39TyRVHjF58cBPYWW3YEf2248wshRwnLhuVNQ3D
 oGLs3DO4ii4qEUZkeqjuQOX2echrjwnJ4EhBc0i8Knmls3qr36hiaDzZFYkLuCIecMgk
 T2i607sONjrOZQK2TX3ZsAy9xi5+Ytd6SleBYx4asAoFSdp7TkLgtNrUt5K1Df9WFYjw
 pIX77VuOHrGToK6VaM/HTIDsqBKQuw+pi7Q4gexUMSZ5DkDIyxqSvj61/PFx03y86qgQ
 w5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=koouiRNLR2fA0swHrE3rbmIlhmFJc5FxZSDb1Wvxn5c=;
 b=gQNj6oDGprbEMd6t5Aj+trGyyWC9KKxVII2YCuia3avhoSu/cUWj95Q6DqSYZDQq2y
 vxmpyg4xtvrcWZS1SxbMIA0uZfcppYwE7RoXhG+6WrZE/D4O18U1gS+xQ6224vrW/Psd
 kL2VHMEKUTiz/3/djBZppck2bvp4sB+LkCMkga09unWpOXUuG0/4NaxAF27Jcoc7vSrH
 YRaswMa2A6kVqY+9qpDiIcCTTqtmdFo3mloZynNZiwhcQ8RZPSL9BlrEUe1cQw2jOo+t
 fJ/VUp5CheKRjunENw/xDUY3uR6EOAUhlTCX2U7hRthUh3behYQlxgAzm6TxrOnddMSm
 QvFA==
X-Gm-Message-State: AOAM531i7RS/u3ywelnq0GGa4aubIvgiaVrvm7/zsxhG25SPdaLSmdEn
 XaxaY/effvcAaUrAhQm/gJmkFLjMOLA0P/heKME=
X-Google-Smtp-Source: ABdhPJzYZaYrh3BUVgY1l26v4tgrAPuSuJ6eh635DSPSyZooyFDIvO3WffPJhhoC/o/C8DobtvgT0I23uOpYcB7DZvU=
X-Received: by 2002:a25:8712:: with SMTP id a18mr2735957ybl.306.1615366135977; 
 Wed, 10 Mar 2021 00:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-8-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-8-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:44 +0800
Message-ID: <CAEUhbmXrFygOQ_7HnapLYsyUeRc7sXt9z03fQngAhom0qwkh9w@mail.gmail.com>
Subject: Re: [PATCH 7/9] hw/block/pflash_cfi02: Factor out DeviceReset method
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:55 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> There is multiple places doing a device reset. Factor that
> out in a common method which matches the DeviceReset prototype,
> so we can also remove the reset code from the DeviceRealize()
> handler. Explicit the device is set in "read array" mode on
> reset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 2ba77a0171b..484b056b898 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -193,6 +193,14 @@ static void pflash_mode_read_array(PFlashCFI02 *pfl)
>      memory_region_rom_device_set_romd(&pfl->orig_mem, true);
>  }
>
> +static void pflash_cfi02_reset(DeviceState *dev)
> +{
> +    PFlashCFI02 *pfl =3D PFLASH_CFI02(dev);
> +
> +    trace_pflash_reset();
> +    pflash_mode_read_array(pfl);
> +}
> +
>  static size_t pflash_regions_count(PFlashCFI02 *pfl)
>  {
>      return pfl->cfi_table[0x2c];
> @@ -330,8 +338,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)
>      default:
>          /* This should never happen : reset state & treat it as a read*/
>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
> -        pfl->wcycle =3D 0;
> -        pfl->cmd =3D 0;
> +        pflash_cfi02_reset(DEVICE(pfl));
>          /* fall through to the read code */
>      case 0x80: /* Erase (unlock) */
>          /* We accept reads during second unlock sequence... */
> @@ -710,10 +717,8 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>
>      /* Reset flash */
>   reset_flash:
> -    trace_pflash_reset();
>      pfl->bypass =3D 0;
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0;
> +    pflash_cfi02_reset(DEVICE(pfl));

The old codes did not set pfl->rom_mode to true, but the new codes
pflash_cfi02_reset() do. Is this correct?

>      return;
>
>   do_bypass:
> @@ -977,6 +982,7 @@ static void pflash_cfi02_class_init(ObjectClass *klas=
s, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->realize =3D pflash_cfi02_realize;
> +    dc->reset =3D pflash_cfi02_reset;
>      dc->unrealize =3D pflash_cfi02_unrealize;
>      device_class_set_props(dc, pflash_cfi02_properties);
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> --

Regards,
Bin

