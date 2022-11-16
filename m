Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A6562BB38
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:17:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGPQ-0005Wl-M3; Wed, 16 Nov 2022 06:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ovGPF-0005VN-1u; Wed, 16 Nov 2022 06:16:38 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ovGPC-0004wV-BY; Wed, 16 Nov 2022 06:16:36 -0500
Received: by mail-lj1-x22d.google.com with SMTP id h12so21390484ljg.9;
 Wed, 16 Nov 2022 03:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iP+wSlR8sYrwK9dTJPTqyMwyqUccDFKapiqtUi6QaVU=;
 b=ihC0+mmlQGIzi/8aymsKQXgKjSCE+QWOgCCGckIqDePZbOqR1yyCI8a7yGbcAm5dfJ
 DFxkGFLyVx0Y/gyllrqAJKUOKBPhNIzajiCbvwe9qLEV3b0bTDDSVQEuHUz253Ji32nY
 WFA9Sop0uQm90rz+rBUDqJN43SEXXFHAuxjs/IC99Rtz4EkloJrBDGEjZuhoIU75gJaz
 SaIq9vU9Tz99MeqmHCPVraLr/DbwCz552EOHAob9wmZjSTqn/9g/YSDLAEF8Wmbt+wSp
 8lxM0MobZYO7duyY3SWWXVOMhzsuDfTCXV36Nky9o51viE7orbjj5pN3gjQ2jlRQ++a5
 vdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iP+wSlR8sYrwK9dTJPTqyMwyqUccDFKapiqtUi6QaVU=;
 b=YXoZnUGMI3/kCg/0AZOXb7iKfHWGcHV9AmB2A3nT/uEVeA2h5u/1DgF4l4hn32viLF
 AUYIIBrzXB52FPTBn/fWl3SmdPj367+E01IhdL4t9rxMPkiP8ExgpazAQ4ycDBYASfBp
 KSf5oVTjDyEk1t/mfmCo0cZY8wp1fjfFrDyj7iMuo9kussciXvaBnbiZnWTOU3Z+pmOv
 1vQXIxGRdEr2zxZw2OUYVXkSJYZaSAAxY4yvLioyrz3ue9+I/7XQOnLYosuSVfAOO2t1
 i9UXXA5BO9sliRa2I1wouMyUGTpVPXSUD2fohjitnewl2/Dy6NDvoe1sN8DWkhasRQJ3
 LMEw==
X-Gm-Message-State: ANoB5pkPccT0SOYei4yZvot3eU/1EvP+k7fmE2s6+FVvKX5bBDGgr9nB
 bDfxGqgEAcb77sdHbN5bUk0=
X-Google-Smtp-Source: AA0mqf5pM0ab1Xcu3x3DLlhM9N+IgwGERobb82ch2wWFoGR+ZTDhj9rosAKNqDJwM53kbzhn7J8M9g==
X-Received: by 2002:a05:651c:1023:b0:26b:ddca:8642 with SMTP id
 w3-20020a05651c102300b0026bddca8642mr7189267ljm.149.1668597390360; 
 Wed, 16 Nov 2022 03:16:30 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a056512348300b004a6f66eed7fsm2552305lfr.165.2022.11.16.03.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 03:16:29 -0800 (PST)
Date: Wed, 16 Nov 2022 12:16:28 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size does
 not match the device
Message-ID: <20221116111627.GA10185@fralle-msi>
References: <20221115151000.2080833-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221115151000.2080833-1-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

On [2022 Nov 15] Tue 16:10:00, Cédric Le Goater wrote:
> Currently, when a block backend is attached to a m25p80 device and the
> associated file size does not match the flash model, QEMU complains
> with the error message "failed to read the initial flash content".
> This is confusing for the user.
> 
> Use blk_check_size_and_read_all() instead of blk_pread() to improve
> the reported error.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

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
> @@ -1614,8 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>          trace_m25p80_binding(s);
>          s->storage = blk_blockalign(s->blk, s->size);
>  
> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
> -            error_setg(errp, "failed to read the initial flash content");
> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
>              return;
>          }
>      } else {
> -- 
> 2.38.1
> 

