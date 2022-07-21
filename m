Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF2A57D4BD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:22:38 +0200 (CEST)
Received: from localhost ([::1]:40148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcgv-0001JC-Fb
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEcfV-0007S5-UV
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 16:21:11 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:33914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oEcfT-000255-Gg
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 16:21:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8307B82675;
 Thu, 21 Jul 2022 20:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF38C3411E;
 Thu, 21 Jul 2022 20:21:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cXnJYQv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658434860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TIwW/FrqJ8Wc/sBRAAD+7S6FdY7aKopV8nsJos82+M=;
 b=cXnJYQv/R20uYUxLuxxPlIYf/9BLGgO0KlQ8rGhwb4JQWspEjIqAl+W4dZcO8jwW6++eJH
 N6aD6Gh+H2E3f+tMj2vTp0yGS1FneeNYAg0OYd5yqc/CPHrDTf6ZywrEN8gpGSWM3mRvgE
 Sm1COeGKrk4ZrOLN5ePGoLktCRknRkE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0b6a46ae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Jul 2022 20:21:00 +0000 (UTC)
Date: Thu, 21 Jul 2022 22:20:58 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Message-ID: <Ytm1KiyFGNqAo/Af@zx2c4.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com>
 <87tu7az28k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tu7az28k.fsf@linaro.org>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Thu, Jul 21, 2022 at 08:36:10PM +0100, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> >
> > If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
> > initialize early. Set this using the usual guest random number
> > generation function. This FDT node is part of the DT specification.
> >
> > Cc: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > Message-Id: <20220719121559.135355-1-Jason@zx2c4.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  hw/core/guest-loader.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> > index 391c875a29..4f8572693c 100644
> > --- a/hw/core/guest-loader.c
> > +++ b/hw/core/guest-loader.c
> > @@ -31,6 +31,7 @@
> >  #include "hw/qdev-properties.h"
> >  #include "qapi/error.h"
> >  #include "qemu/module.h"
> > +#include "qemu/guest-random.h"
> >  #include "guest-loader.h"
> >  #include "sysemu/device_tree.h"
> >  #include "hw/boards.h"
> > @@ -46,6 +47,7 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
> >      g_autofree char *node = g_strdup_printf("/chosen/module@0x%08" PRIx64,
> >                                              s->addr);
> >      uint64_t reg_attr[2] = {cpu_to_be64(s->addr), cpu_to_be64(size)};
> > +    uint8_t rng_seed[32];
> >  
> >      if (!fdt) {
> >          error_setg(errp, "Cannot modify FDT fields if the machine has none");
> > @@ -55,6 +57,9 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
> >      qemu_fdt_add_subnode(fdt, node);
> >      qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
> >  
> > +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> > +    qemu_fdt_setprop(fdt, node, "rng-seed", rng_seed, sizeof(rng_seed));
> > +
> 
> Why are we inserting this here? The guest-loader is only building on
> what the machine type has already constructed which in the case of -M
> virt for riscv and ARM already has code for this.

Wish you would have replied to the list patch before Paolo queued it.

I don't know this mechanism well but I assumed it would pass a unique
seed to each chained loader. Let me know if I'm misunderstanding the
purpose; I have no qualms about dropping this patch.

Jason

