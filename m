Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B638E51B1C9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 00:25:49 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmNRM-0006hS-CO
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 18:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nmNOp-00057d-EH
 for qemu-devel@nongnu.org; Wed, 04 May 2022 18:23:11 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nmNOn-0005Np-CS
 for qemu-devel@nongnu.org; Wed, 04 May 2022 18:23:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id h1so2191557pfv.12
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 15:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kYPjshZPWZRxlyOXuRE0i0eYpRN407/bZgJI2j/y13A=;
 b=TGdx4OjT67TfDvR1hrCi4fDOrvdlNUGymmur+DNADiERpHTuyXnajjbOZkMM+6NsO5
 fhG9LS4ly1R292cU4G6kKlhkI5cesNE7mRnEfxv3POLUi6sejYKhHrLMvNSF+4eaPTFN
 0s7lRdezYScBPeLca6vggADHoWL+r4HjM18B6cw+yZss2P/06FiSeurWACi6jpjC2Og0
 NxlI287XkSZrhF3IwmY+SU1K/pderVT4wXhgxRvnqCuvvq3JNw2UyyOF8UJv73G1UjBh
 B0lS6K7TwC98PQRUosTwe43ig69RXOdL8njeoXaX3Fd184wwAhO9lmHZKu5TZTjJVt2k
 faTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kYPjshZPWZRxlyOXuRE0i0eYpRN407/bZgJI2j/y13A=;
 b=rDrNkvYq8txDO7vPjWauuatpWJeFge/aOqWgRJkwj9jkZv2B3iPBh1DvPya6+GZUyr
 oNPK6Z53vE5mQzvt8VjqqxrDmba6PbUi2Iodac/fnkAxE/2U6mDtZGkuLBUxSM2eC/MF
 lXof5Ak+H2P8f8QorEQZuT2C5hXhU6omAxroHSvJ3Ab0z0Yk66MQ9iJcDxOg5vKqeldw
 +EKjYufDV8r+XO30wFtFcsMSQ+kiDsmQTVTre2ffWVesHbFXG6O0fALIhr6DJdDbvN3H
 ek4tirA0cRwjfKuBwwGDkbjEdR7sth6pPDGm1EO6izkkbPPmyf8Q0kdiSd78e8cG5RqG
 zQUg==
X-Gm-Message-State: AOAM531cJ/KwPvD3rXDdYbTD2LPmOHaJ2+qjR6jKv9Z06DIt5yn6O61h
 YFoZiGeMQX/539utPww9c+g=
X-Google-Smtp-Source: ABdhPJzBrP7vU8o1Xyyb1tFlyFDyDQBvUGTHNDWxv3wj4jdX2VrM28VlZnJTms3kTCp5BKT977XdQg==
X-Received: by 2002:a65:524b:0:b0:383:1b87:2d21 with SMTP id
 q11-20020a65524b000000b003831b872d21mr19539514pgp.482.1651702987068; 
 Wed, 04 May 2022 15:23:07 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a17090a7f9300b001cd60246575sm3806415pjl.17.2022.05.04.15.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 15:23:06 -0700 (PDT)
Date: Thu, 5 May 2022 07:23:04 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, openrisc@lists.librecores.org,
 richard.henderson@linaro.org
Subject: Re: [PATCH v2] hw/openrisc: use right OMPIC size variable
Message-ID: <YnL8yLrfC0EcyFgy@antec>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <20220503094533.402157-1-Jason@zx2c4.com> <YnGPDumfp1+6DUQG@antec>
 <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 04, 2022 at 01:10:04PM +0200, Jason A. Donenfeld wrote:
> On Tue, May 3, 2022 at 10:22 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > On Tue, May 03, 2022 at 11:45:33AM +0200, Jason A. Donenfeld wrote:
> > > This appears to be a copy and paste error. The UART size was used
> > > instead of the much smaller OMPIC size. But actually that smaller OMPIC
> > > size is wrong too and doesn't allow the IPI to work in Linux. So set it
> > > to the old value.
> > >
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > ---
> > >  hw/openrisc/openrisc_sim.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > > index 99b14940f4..3218db6656 100644
> > > --- a/hw/openrisc/openrisc_sim.c
> > > +++ b/hw/openrisc/openrisc_sim.c
> > > @@ -78,7 +78,7 @@ static const struct MemmapEntry {
> > >      [OR1KSIM_DRAM] =      { 0x00000000,          0 },
> > >      [OR1KSIM_UART] =      { 0x90000000,      0x100 },
> > >      [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
> > > -    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
> > > +    [OR1KSIM_OMPIC] =     { 0x98000000,      0x100 },
> >
> > Right, I missed this as part of my series.  OMPIC will allocate 2 32-bit
> > registers per CPU.  I documented this here:
> >
> >   - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-ompic.c
> >
> > I think what we will want here is something like:
> >
> > [OR1KSIM_OMPIC] =     { 0x98000000, 8 * OR1KSIM_CPUS_MAX },
> 
> Do you want a v3 or are you going to fix it up yourself?

I'll fix it up.

-Stafford

