Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448ED355F9C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 01:41:19 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTvJt-000770-Te
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 19:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lTvI2-00065a-BX; Tue, 06 Apr 2021 19:39:22 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:38779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lTvI0-0006Kd-5r; Tue, 06 Apr 2021 19:39:22 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so16314572otk.5; 
 Tue, 06 Apr 2021 16:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5+Bzu284pB0TBuD58uAa6TVrLT+HRVQxqHHRrO0jjtw=;
 b=hLJjL15PBIuVs3rQuugJKNWPUz0Bxx6zymFYljmw/L84WVkifZ9Vr82HSs8ARYEmlf
 cqfUCD8n5mF/O4XMQLuH+4OYMrbIJBaYXxZSEf+R5zPH7Uh2RnW6gs6d4W9KZ6YXtz+y
 mP/9ApqwXvJIAxZm6K9EM9wxSjFRMehUSKshMzUybo+gbjqWpFX6odCsQ1hN/mbBIzCp
 HCCublfWohap8i8YX7GSNbXCVMvEq/0D8WVLNvXnx2jOZctZKOLuRdxYa4bc6LWAayF/
 /ljO6A0+ues8lVCdAZq75N95AdhgkiLJ9SJ+D1f7oyNdyywAfrnuvptK6Xvdmm6b8OQR
 USoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=5+Bzu284pB0TBuD58uAa6TVrLT+HRVQxqHHRrO0jjtw=;
 b=rHjxRI9LoruSxcJT7NZkHwnHNOuFhkW8unogFiOdJFziULiqI/CmQBhKNF27i1IvCx
 cU2gedXcnWEImT6CPKkdpU6h4qNxAabaLCEfTx0rFAxO8iJRfn32tnoSKUYIGdMumVro
 MLn6qfxy8EyDRFV5OpFdtT8EKczOyujF2izT/hjFZeNa1CWhUUcOQjJCQBetrdXGw3DW
 8gUKUj9ZA5ENF6o7n00A449n1P5aMrXBwcdFlk7oQzQ5raFo9t8uU8Q2deUSL7pTO+tT
 P8De4ft7jq6soakZF0yAATTt91jJpRn2CG5Dk5dgzQs3MkUd0YglB3l8qyi+j0t5pv8Y
 JGdg==
X-Gm-Message-State: AOAM5321lhkGracGclF7j41CWSKquLWxvXKuqIO99s3YRs80yrkybAt0
 VvFQKpuUtuV1r3rnkPiAQQ==
X-Google-Smtp-Source: ABdhPJx7JEqjARM0xmEMgtZWPhtVdyR1VxRGNX9IGDIRjrqL/InrOZo058rGmV91YA6bzqi5cHRZdA==
X-Received: by 2002:a9d:7453:: with SMTP id p19mr440430otk.271.1617752358538; 
 Tue, 06 Apr 2021 16:39:18 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id g11sm5021204ots.34.2021.04.06.16.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 16:39:17 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:f584:ff80:e7e9:e850])
 by serve.minyard.net (Postfix) with ESMTPSA id B09D0180053;
 Tue,  6 Apr 2021 23:39:16 +0000 (UTC)
Date: Tue, 6 Apr 2021 18:39:15 -0500
From: Corey Minyard <minyard@acm.org>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210406233915.GD7166@minyard.net>
References: <20210403222810.3481372-1-venture@google.com>
 <20210405195834.GF7167@minyard.net>
 <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
 <CAO=notyrcWX59UqVP4=jueUvenx9b4NiTzk-wifa1s7wPypJsQ@mail.gmail.com>
 <20210406183601.GB7166@minyard.net>
 <CAO=notyM82Xzco4gdpmJBJQxV_CkgH=9i8A_OXaksDdei8HebQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notyM82Xzco4gdpmJBJQxV_CkgH=9i8A_OXaksDdei8HebQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 03:21:18PM -0700, Patrick Venture wrote:
> On Tue, Apr 6, 2021 at 11:36 AM Corey Minyard <minyard@acm.org> wrote:
> >
> > On Tue, Apr 06, 2021 at 08:55:14AM -0700, Patrick Venture wrote:
> > > On Tue, Apr 6, 2021 at 8:41 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > On Mon, Apr 5, 2021 at 12:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> > > > >
> > > > > On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> > > > > > The i2c mux device pca954x implements two devices:
> > > > > >  - the pca9546 and pca9548.
> > > > > >
> > > > > > Patrick Venture (2):
> > > > > >   hw/i2c/core: add reachable state boolean
> > > > > >   hw/i2c: add pca954x i2c-mux switch
> > > > >
> > > > > Looking this over, the code looks good, but I have a few general
> > > > > questions:
> > > > >
> > > > > * Can you register the same slave address on different channels?  That's
> > > > >   something you could do with real hardware and might be required at
> > > > >   some time.  It looks like to me that you can't with this patch set,
> > > > >   but maybe I'm missing something.
> > > >
> > > > If I understand the hardware's implementation properly you can have
> > > > collisions, and this allows for collisions.  I'm not sure what you
> > > > mean by having both accessible.  For instance, on hardware you can
> > > > have a switch with N channels, and on two of the channels there is an
> > > > eeprom at 50.  But you're unable to talk to both eeproms at the same
> > > > time, because the addresses collide -- so how would the hardware know
> > > > which you're talking to?  My understanding of the behavior in this
> > > > collision case is that it just talks to the first one that responds
> > > > and can lead to unexpected things.
> > > >
> > > > There is a board, the quanta-q71l where we had to set the
> > > > idle-disconnect because there were two muxes on the same bus, with
> > > > conflicting addresses, and so we had to use idle disconnect explicitly
> > > > to make the software happy talking to the hardware -- not ideal as
> > > > having two devices behind different channels, but ultimately it's the
> > > > same idea because the devices are conflicting.
> > > >
> > > > >
> > > > > * Can you add devices to the secondary I2C busses on the mux using the
> > > > >   standard QEMU device model, or is the function call required?
> > > >
> > > > I added the function call because I didn't see a clean way to bridge
> > > > the issue as well as, the quasi-arbitrary bus numbering used by the
> > > > kernel isn't how the hardware truly behaves, and my goal was to
> > > > implement closer to the hardware.  I thought about adding an I2cBus to
> > > > the device and then you'd be able to access it, but wasn't sure of a
> > > > nice clean way to plumb that through -- I considered adding/removing
> > > > devices from the parent i2c bus instead of the boolean reachable, but
> > > > that seemed way less clean - although do-able.
> > > >
> > > > >
> > > > > I ask because I did a pca9540 and pca9541 device, but I've never
> > > > > submitted it because I didn't think it would ever be needed.  It takes a
> > > > > different tack on the problem; it creates the secondary busses as
> > > > > standard QEMU I2C busses and bridges them.  You can see it at
> > > > >
> > > > >    github.com:cminyard/qemu.git master-i2c-rebase
> > > > >
> > > >
> > > > I'll have to take a look at your approach, but the idea that it
> > > > wouldn't be needed sounds bizarre to me as nearly all BMC-based qemu
> > > > boards leverage i2c muxes to handle their PCIe slot i2c routing.
> > > >
> > > > > If you design can do the things I ask, then it's better.  If not, then
> > > > > I'm not sure.
> > >
> > > Corey,
> > >
> > > looking at your design, I should be able to do something similar with
> > > a small tweak.
> > >
> > > I think my design follows the hardware where there can be conflicts,
> > > etc, but what I didn't know how to do was add the faux I2cBuses in a
> > > useful way -- but if I add the I2cBuses to the device, and then on
> > > add/remove it registers the device on the parent bus -- i can still
> > > use the reachable boolean to control whether it's present.  The faux
> > > I2cBuses would be a simplification for adding/removing i2c devices --
> > > and would act as the device list in my object.  So then setting the
> > > channels would change to walking the devices held by the bus that
> > > corresponds with the bit -- but _still_ using the reachable boolean.
> > >
> > > If you'd like, I can update my patchset to use an i2cbus for the
> > > purpose above, then it would satisfy the requirement of leveraging the
> > > normal device process and no longer require the special function call.
> >
> > That sounds reasonable.  Your implementation is quite a bit simpler than
> > mine, which is a bonus.
> 
> Corey;
> 
> I will send out the updated patches tomorrow, but I had to cherry-pick
> your patch: https://github.com/cminyard/qemu/commit/c7f696d09af2d55f221a5c22900c8f71bc2244be
> so that I can get the callbacks for the bus actions, in this case, did
> you want to send that patch to the mailing list ahead?  Otherwise,
> I'll try to incorporate it as a predecessor patch.

Go ahead and incorporate it in your set so the reviewers can see why
it's necessary.

It would also be possible to do this by modifying the i2c bus code, but
I'm not sure what the maintainers there would like.

-corey

> 
> Patrick
> 
> >
> > -corey
> >
> > >
> > > Patrick
> > >
> > > > >
> > > > > -corey
> > > > >
> > > > > >
> > > > > >  MAINTAINERS                      |   6 +
> > > > > >  hw/i2c/Kconfig                   |   4 +
> > > > > >  hw/i2c/core.c                    |   6 +
> > > > > >  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
> > > > > >  hw/i2c/meson.build               |   1 +
> > > > > >  hw/i2c/trace-events              |   5 +
> > > > > >  include/hw/i2c/i2c.h             |   3 +
> > > > > >  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
> > > > > >  8 files changed, 267 insertions(+)
> > > > > >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> > > > > >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> > > > > >
> > > > > > --
> > > > > > 2.31.0.208.g409f899ff0-goog
> > > > > >
> > >

