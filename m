Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21131A75E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:16:45 +0100 (CET)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgk0-00037U-3q
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgfr-0000hR-3b; Fri, 12 Feb 2021 17:12:27 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:38887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgfo-0002JE-Jf; Fri, 12 Feb 2021 17:12:26 -0500
Received: by mail-io1-xd34.google.com with SMTP id f6so765084ioz.5;
 Fri, 12 Feb 2021 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h/tAucvov96ZKz4T8OzmzmYiOOFfNo8wXHKCEGZsL2k=;
 b=hreWPpd5efrJdDp0HBfg8SCdwcD7S9pscqO9SczfWgSjIKlBrNAqXXP9K4MOAlo0gh
 QN7rqnoY0U8I01obXIOH9F5DOukbVzxQ91lqjnoDcsxNE/OI0LqqLm4I0ZBP9cK/1QB8
 bZj+aJX194a7Va5Bf2uu3AdPWT1+qO4dax5LLQdfMmQEnbkC8P+/vo+z2+f+IxP9DCK9
 UhulPv4Uedads+RhOehEHkOFl0QudAEY/gTsRIy/t3sztU8/63sSOoWhwwphxP/QPePP
 Jfh6kWrq/N4LyAo1qVYo9KoQgF7PsEst9iaQwnwNDCzV/XUCaHqNY0rLgdAhxyNeI+AK
 VhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h/tAucvov96ZKz4T8OzmzmYiOOFfNo8wXHKCEGZsL2k=;
 b=AmQSVISPoxIhHlSv1QQCekJ59H+L6e/rGCINOPfpQxLpp4tu61BQxxT6av02DOElfP
 Vmgi2baRnlXovkJFkjToVOqi1B99SykIwidjhFlDkOOuvYtpYEiyTkjcVPaKNVeZOxdk
 mGvd38++aCaF5z1xtpzD8Ijb7ux8XEM3RIEL4sicNW7wgfc0IgLCphe2Ai/Uir/m3XO3
 Lk9nJNanPTGe/UX+WiIL2ODVJA/0TlEr9d80v0pV4BSb3TeCcfrR1Jt8k1NboBnav4z8
 As+8OUqUKv4PAZe5drQFlR+Nk8JMvCoYsbUiUC1VqbRW7YKks0lBXP7lOFymhZeT/jcf
 bfRA==
X-Gm-Message-State: AOAM531bvBHeFOcFjaUkpAZlrNFd/hvJCe5a2z03Zgp8QSLYkNaWbEFw
 mT03kGKGOAW2ZQB5kSjbNZaVeVs061o9CX4h9EY=
X-Google-Smtp-Source: ABdhPJyIT3pl9D9ckE5QWMX0ktmLGvDc+oQNo7FK2WGXLpAQa4ZMeYQzhCtX3HlzZ/ACpxKeC4iRyZmIStERiKZh1iI=
X-Received: by 2002:a02:634b:: with SMTP id j72mr4520743jac.106.1613167939841; 
 Fri, 12 Feb 2021 14:12:19 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-14-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-14-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:11:39 -0800
Message-ID: <CAKmqyKMO8Reg4y5x0q8uUUK9iG_5=i9G46F6voQcMLVdWa5Jpg@mail.gmail.com>
Subject: Re: [RFC PATCH 13/15] sd: emmc: Subtract bootarea size from blk
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:25 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> The userdata size is derived from the file the user passes on the
> command line, but we must take into account the boot areas.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/sd.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 55c1104..a2f39c9 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -658,6 +658,11 @@ static void sd_reset(DeviceState *dev)
>      }
>      size =3D sect << 9;
>
> +    if (sd->emmc) {
> +        unsigned int boot_capacity =3D sd->ext_csd[EXT_CSD_BOOT_MULT] <<=
 17;
> +        size -=3D boot_capacity * 2;
> +    }
> +
>      sect =3D sd_addr_to_wpnum(size) + 1;
>
>      sd->state =3D sd_idle_state;
> --
> 2.7.4
>
>

