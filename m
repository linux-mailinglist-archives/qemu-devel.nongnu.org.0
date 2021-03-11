Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C59336A70
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:10:50 +0100 (CET)
Received: from localhost ([::1]:49030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBir-0005yL-CG
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdh-0001OM-G5; Wed, 10 Mar 2021 22:05:30 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:41298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdb-0004lT-PR; Wed, 10 Mar 2021 22:05:29 -0500
Received: by mail-yb1-xb35.google.com with SMTP id m9so20199745ybk.8;
 Wed, 10 Mar 2021 19:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qlyQW8KnBNv+kj4zH4VF/s+BdTHr7XIgYCYoRhILOLQ=;
 b=QokMsCSXzavo/J7c519qCcMyTqkHVyv5UsFkRWTj0qLWXoZ/Zgos13yb7oRU+lmLOQ
 NKyw6hPsbSjzLygwkUaHDBxByz8b5vUaqoSf/mbV/RmGJL/a+FszcU++ThIliYvDm/jw
 pIZd9ImwTsVhZ92FI4MrxJRj04uJKr1sDFTot52R8dn0YbV0m9Pm4VBjik6V2vrW1M1s
 SJwd6yLts18ss6+aHy1Evr6iYtFmFN3GAWc/pE7Ra7f2FUeogVIom6OVF8DbA2sPM6yE
 evUQq/R/FxEubajVMpryxCsHB+MUojvqMFkj2nqIb2E40VAL6/XHiv8xdTaDBfSP5XeP
 Wsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qlyQW8KnBNv+kj4zH4VF/s+BdTHr7XIgYCYoRhILOLQ=;
 b=m1E3wci43M+mCH+Sq0RFymxqlJ6WVDZxcI3KJ/90ngVbbKutWEGAQa27YZvS3UUq4t
 40o2E/pCg3ebLWMDIdgdUQMM4mGGAe6iktov64hkr40eQPmUJUQY1rCrAjWn7d2r27Ch
 LHOLA8Wd68YLBmG4Q2iXjWo4jeASiuatZFf70zV/8idskbflsv+8n/4yt+u7ggfrYh31
 mcerzQoR7w5PmIADNVd3S4cLLFfdLOfzcWx5OlegGGcL7B7xk16xtBsoh4pDPp2d7xDz
 4Oin5HkdbeESJJQGW40qUqIq8tymexDMunZlasuOGnvGlePduv1PTe9JpkQUc+YCUYkA
 ywvw==
X-Gm-Message-State: AOAM5332xiVL/W+LhhHioaKjsgYJJAqFuelJ4ea66HQHJzlWRT2SRhe0
 S0MVGlUv79Nc04bcDGhsLIZlDWiwaYAB1tNVoXg=
X-Google-Smtp-Source: ABdhPJxaAE0nfyWTHyKM9xSLRGL28iSedP2DiKmjTSacFq21jO/1awb5r644bSZcWmREpvQ61MQhYYzF5ZCjT9OtyuY=
X-Received: by 2002:a25:abce:: with SMTP id v72mr9434132ybi.152.1615431922485; 
 Wed, 10 Mar 2021 19:05:22 -0800 (PST)
MIME-Version: 1.0
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-11-philmd@redhat.com>
In-Reply-To: <20210310170528.1184868-11-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 11:05:10 +0800
Message-ID: <CAEUhbmXUOqKxcTEHan588RLUzOzUkp47vfKd3zht8B6o9A3P_g@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] hw/block/pflash_cfi01: Extract
 pflash_mode_read_array()
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

On Thu, Mar 11, 2021 at 1:37 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The same pattern is used when setting the flash in READ_ARRAY mode:
> - Set the state machine command to READ_ARRAY
> - Reset the write_cycle counter
> - Reset the memory region in ROMD
>
> Refactor the current code by extracting this pattern.
> It is used three times:
>
> - On a read access (on invalid command).
>
> - On a write access (on command failure, error, or explicitly asked)
>
> - When the device is initialized. Here the ROMD mode is hidden
>   by the memory_region_init_rom_device() call.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 40 +++++++++++++++++-----------------------
>  1 file changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 2618e00926d..32c9b289715 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -115,6 +115,19 @@ static const VMStateDescription vmstate_pflash =3D {
>      }
>  };
>
> +static void pflash_mode_read_array(PFlashCFI01 *pfl)
> +{
> +    trace_pflash_mode_read_array();

Duplicated trace calls

> +    /*
> +     * The command 0x00 is not assigned by the CFI open standard,
> +     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> +     */
> +    trace_pflash_mode_read_array();
> +    pfl->cmd =3D 0x00;
> +    pfl->wcycle =3D 0;
> +    memory_region_rom_device_set_romd(&pfl->mem, true);
> +}
> +
>  /*
>   * Perform a CFI query based on the bank width of the flash.
>   * If this code is called we know we have a device_width set for
> @@ -283,12 +296,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr=
 offset,
>      default:
>          /* This should never happen : reset state & treat it as a read *=
/
>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
> -        pfl->wcycle =3D 0;
> -        /*
> -         * The command 0x00 is not assigned by the CFI open standard,
> -         * but QEMU historically uses it for the READ_ARRAY command (0xf=
f).
> -         */
> -        pfl->cmd =3D 0x00;
> +        pflash_mode_read_array(pfl);

This adds a memory_region_rom_device_set_romd() call compared to the
original codes. Please double check if this is correct.

>          /* fall through to read code */
>      case 0x00: /* This model reset value for READ_ARRAY (not CFI complia=
nt) */
>          /* Flash area read */
> @@ -663,10 +671,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr of=
fset,
>                    "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
>
>   mode_read_array:
> -    trace_pflash_mode_read_array();
> -    memory_region_rom_device_set_romd(&pfl->mem, true);
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0x00; /* This model reset value for READ_ARRAY (not CFI=
) */
> +    pflash_mode_read_array(pfl);
>  }
>
>
> @@ -872,13 +877,8 @@ static void pflash_cfi01_realize(DeviceState *dev, E=
rror **errp)
>          pfl->max_device_width =3D pfl->device_width;
>      }
>
> -    pfl->wcycle =3D 0;
> -    /*
> -     * The command 0x00 is not assigned by the CFI open standard,
> -     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> -     */
> -    pfl->cmd =3D 0x00;
>      pfl->status =3D 0x80; /* WSM ready */
> +    pflash_mode_read_array(pfl);

ditto

>      pflash_cfi01_fill_cfi_table(pfl);
>  }
>
> @@ -887,13 +887,7 @@ static void pflash_cfi01_system_reset(DeviceState *d=
ev)
>      PFlashCFI01 *pfl =3D PFLASH_CFI01(dev);
>
>      trace_pflash_reset();
> -    /*
> -     * The command 0x00 is not assigned by the CFI open standard,
> -     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> -     */
> -    pfl->cmd =3D 0x00;
> -    pfl->wcycle =3D 0;
> -    memory_region_rom_device_set_romd(&pfl->mem, true);
> +    pflash_mode_read_array(pfl);
>      /*
>       * The WSM ready timer occurs at most 150ns after system reset.
>       * This model deliberately ignores this delay.

Regards,
Bin

