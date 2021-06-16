Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71283A9A8E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:36:53 +0200 (CEST)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUmq-0001G6-Gg
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ltUkm-0000Kb-BL; Wed, 16 Jun 2021 08:34:44 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ltUkb-0004Dp-KY; Wed, 16 Jun 2021 08:34:43 -0400
Received: by mail-io1-xd2e.google.com with SMTP id a6so2894992ioe.0;
 Wed, 16 Jun 2021 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYWISUZZqja988RnrGVa4SCJFCIq9ozVCNTSQp+03Z4=;
 b=I4JhzrnfdldTtCJDtYByuV3XBeTrmyza4awoz90qa+asPlf8AvOgHMQjS/7K1VeOR5
 756szpFHwg2ktxPGi72DJetjPhgSHwqtHOCBS33oyTs56yzWau2oRYSPdhpy/hIJn8JD
 5Fypq87GVZZgjcvXdjC9x1BGMNxO7GrJ6yUbK2E19hJydIgX6TO+5VJjm9WH8nfm+DIP
 uFGgiOMKUlZfIHTWqTO0nNcGCO27pAirnUoK+cGmO+iao0Pw6Nxj23AI45Aygm9e+DON
 yc5veR5C7w/qnF9SL2SzdivfLvStwhGuSzX5TxedfA906ecjaJ8dYXp4JuVIwQcYhn+y
 weKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYWISUZZqja988RnrGVa4SCJFCIq9ozVCNTSQp+03Z4=;
 b=H/xq8+aZB5GfH5heEu89NyEGhPD+FqpvtjGUX7OI7lJbUMzXIKz+LYXf5Uffmr+/jN
 DpOCDLXerRJgjpAflYSGrLLNfMmCCfO1W2mNkkyXkVV0JcrOR+LyLShr07rmLbdyTbQk
 aBoWdyPoqWDgZF0TPCm8vDJHk6G9fzQ6Xo7jooruIA3mDvbV30xHFnp906xkU2E+sJmM
 xnt3Lecb9uVuZtmi/wsVwCPWHAcaVwIjtCaIqG4/OMF+Is4AeCMZR8AzXogP8LhXyNwY
 895QE9TL/FHm67cWhmm9OXExI35ZXlnlPDbiQ/Tz6bt6jQauKJ1P7HE5JXEd3NXm1mN/
 h5Pg==
X-Gm-Message-State: AOAM533mjb3VF6KW4wC8gVOILa8qQRSpVe6i3KAaoXSt2K5AWV2LtPq1
 Wh2cHf/bJ9T8uF15MZq1u8lO/gfFkRc45bS/e1M=
X-Google-Smtp-Source: ABdhPJw4nrTUE5k4zfpPG4K4PeaTfrpzze9erOMgP2RANOWpdYxvCHFswgiJcbD/lpYOVeKSD1OkyykKAcIoq6ZZ6jY=
X-Received: by 2002:a05:6638:3393:: with SMTP id
 h19mr263571jav.11.1623846872366; 
 Wed, 16 Jun 2021 05:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-6-pl@kamp.de>
In-Reply-To: <20210519142359.23083-6-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 16 Jun 2021 14:34:25 +0200
Message-ID: <CAOi1vP8AFWaS7Qwu8DVQP0EGZh48CcsrYnTfCWU2J6ZctGA2EQ@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] block/rbd: add write zeroes support
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 4:28 PM Peter Lieven <pl@kamp.de> wrote:
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 0d8612a988..ee13f08a74 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -63,7 +63,8 @@ typedef enum {
>      RBD_AIO_READ,
>      RBD_AIO_WRITE,
>      RBD_AIO_DISCARD,
> -    RBD_AIO_FLUSH
> +    RBD_AIO_FLUSH,
> +    RBD_AIO_WRITE_ZEROES
>  } RBDAIOCmd;
>
>  typedef struct BDRVRBDState {
> @@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>          }
>      }
>
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;

I wonder if we should also set BDRV_REQ_NO_FALLBACK here since librbd
does not really have a notion of non-efficient explicit zeroing.

Thanks,

                Ilya

