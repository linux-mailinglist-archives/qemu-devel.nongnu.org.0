Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA85BFC73
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 12:37:01 +0200 (CEST)
Received: from localhost ([::1]:48120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oax6B-0007gw-Nt
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 06:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oax2H-0005n0-EF
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:33:00 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:34246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org>)
 id 1oax2F-0003Q1-9N
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 06:32:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 274A5622FE
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6176CC43470
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:32:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="b5RhHUTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663756370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T35rTOoR43Yv3dXUbKISH0AP2K/vDm47m4Kl9axjdNA=;
 b=b5RhHUTJDnrx5bOGJx2SjH46AucQeCX7EO0S86aoamMTD3b+wogVaoRe4RHit0lFCmtwed
 neclLnQUASj+rkdfXZO1j1r30zIDst7gXH2oll1NnyUmEl+InyAT5EvctoM1DbM1WTEWjb
 JMYr1rVze+dAjLADfqpWkrEpiQtUsCE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ef49012a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 21 Sep 2022 10:32:50 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id u14so2196185ual.3
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 03:32:49 -0700 (PDT)
X-Gm-Message-State: ACrzQf3XitObTslWVzka01Nnhldz4z54VCsLldfLufyJTM1I4GmVNrMC
 gjqSyu39P3KhM0VrEH/+wAmy8DQ8iLBTXyvCcCc=
X-Google-Smtp-Source: AMsMyM4TtIvGWJiFYrKK6U7+N9rQJY7f5+QxNGfTb3kWJLEMvkj6xytjra3oygfPBlCuzL0wyXwrIQgeFXpOEIsLnWc=
X-Received: by 2002:ab0:6035:0:b0:3bf:2e26:699 with SMTP id
 n21-20020ab06035000000b003bf2e260699mr4587081ual.102.1663756369120; Wed, 21
 Sep 2022 03:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAJy5ezp-x2R=4yg=S6Tq2U67N8J2mkXNJ=wkv1oqB3r37hiunQ@mail.gmail.com>
 <20220908094030.189665-1-Jason@zx2c4.com>
In-Reply-To: <20220908094030.189665-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Sep 2022 12:32:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9rQWr5CTePKBT5nRi8OZXaBaRWQYDyNeSiSPwdzqBx2Hw@mail.gmail.com>
Message-ID: <CAHmME9rQWr5CTePKBT5nRi8OZXaBaRWQYDyNeSiSPwdzqBx2Hw@mail.gmail.com>
Subject: Re: [PATCH RESEND] hw/microblaze: pass random seed to fdt
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=I7lL=ZY=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 8, 2022 at 11:40 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> initialize early. Set this using the usual guest random number
> generation function. This FDT node is part of the DT specification.
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/microblaze/boot.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 8b92a9801a..25ad54754e 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -30,6 +30,7 @@
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> +#include "qemu/guest-random.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/reset.h"
>  #include "hw/boards.h"
> @@ -75,6 +76,7 @@ static int microblaze_load_dtb(hwaddr addr,
>      int fdt_size;
>      void *fdt = NULL;
>      int r;
> +    uint8_t rng_seed[32];
>
>      if (dtb_filename) {
>          fdt = load_device_tree(dtb_filename, &fdt_size);
> @@ -83,6 +85,9 @@ static int microblaze_load_dtb(hwaddr addr,
>          return 0;
>      }
>
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
> +
>      if (kernel_cmdline) {
>          r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
>                                      kernel_cmdline);
> --
> 2.37.3
>

Bumping this patch. Could somebody queue this up?

