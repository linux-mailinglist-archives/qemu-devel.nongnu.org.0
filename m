Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F943559A5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:51:20 +0200 (CEST)
Received: from localhost ([::1]:49764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTov9-0001x3-VT
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lTorj-0008VE-RY
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:47:49 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lTorX-0004Y7-An
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:47:41 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so15218050oty.12
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=54k8ybEfFP/EwdazS/Kud92L2x6SkrCy85DL6k2J0Qo=;
 b=YQL7QL++Ppn5lncOMdDHybsnZ8UjGNDrlMaeDq7ebyUDFYiQF3R0O/VbMPJAwlievM
 3UgdzrDhISRitjHN8pWU5VTKRHe1jherCksm7M7coSChqLVkWAcpqmah1xK8R/xhqJUE
 uAmACDOj1rNGCP+d6x0U2BLvL0kq2RdPocQjgVwa1T+NSQfKqBX2JLfK3ZxX3JmaGDre
 QGZ0zKPE15KU1HgkOlcH99Kc8cbYLVVItIMZllA9O3pRBwbzfmQ3NI4r4oKOsc+E1EG1
 zV6GZVsOGkMLs67uLMMgCA8bsIZ2FnmEiyH2dUKjsb56NtuKuAEhKpjBWjxNDCB/HFR8
 RkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=54k8ybEfFP/EwdazS/Kud92L2x6SkrCy85DL6k2J0Qo=;
 b=nWlI/IRg4/GM4P9Zq4oZra6T818TgC6j8Vlo/55l4kR6WMoUot5k3AChGZX1x784La
 mKPOsR12wPLZEsWWyWJvkBxmwefan5CWurvxcpKJMDBBCIwzYbqN+ZYneJqz8sBBE5/W
 i/xfgiaBx9/Or62vTgFRi6smjZMghvCjNJQi8e9Ig5xkUqZlIB2z4uKjAzf204qPplNF
 nYSfhf4+iSWAzVczse87vBZk8JMkr2CbkcfIUw1yzy8itbXRAJTWpl9P1eriTdiPvKr6
 GPbewwUnNyCwQr7dDfpikXACwuZ4Sj6nV4EtVpIvlAx+ZWndAggW07sqv7o7a84ph5xz
 9BbA==
X-Gm-Message-State: AOAM5313Z4WCd6Zc7UOOE8Ng0V8lC71xD+hLhnRm/YsiXcRsV51E17No
 6RTe46uuIW7ogt/nbTp6afXbxA==
X-Google-Smtp-Source: ABdhPJxWTg43k697GczujbgIQWfFxQnXuRjNUpeQN+GRq5oHcMxms9H+fOG2wM6D0IatLmAS1Yubvg==
X-Received: by 2002:a05:6830:22f4:: with SMTP id
 t20mr28311120otc.45.1617727653147; 
 Tue, 06 Apr 2021 09:47:33 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:f584:ff80:e7e9:e850])
 by smtp.gmail.com with ESMTPSA id s83sm3728205oif.43.2021.04.06.09.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:47:32 -0700 (PDT)
Date: Tue, 6 Apr 2021 11:47:31 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210406164731.GP7167@minyard.net>
References: <20210403222810.3481372-1-venture@google.com>
 <20210405195834.GF7167@minyard.net>
 <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 08:41:50AM -0700, Patrick Venture wrote:
> On Mon, Apr 5, 2021 at 12:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> >
> > On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> > > The i2c mux device pca954x implements two devices:
> > >  - the pca9546 and pca9548.
> > >
> > > Patrick Venture (2):
> > >   hw/i2c/core: add reachable state boolean
> > >   hw/i2c: add pca954x i2c-mux switch
> >
> > Looking this over, the code looks good, but I have a few general
> > questions:
> >
> > * Can you register the same slave address on different channels?  That's
> >   something you could do with real hardware and might be required at
> >   some time.  It looks like to me that you can't with this patch set,
> >   but maybe I'm missing something.
> 
> If I understand the hardware's implementation properly you can have
> collisions, and this allows for collisions.  I'm not sure what you
> mean by having both accessible.  For instance, on hardware you can
> have a switch with N channels, and on two of the channels there is an
> eeprom at 50.  But you're unable to talk to both eeproms at the same
> time, because the addresses collide -- so how would the hardware know
> which you're talking to?  My understanding of the behavior in this
> collision case is that it just talks to the first one that responds
> and can lead to unexpected things.

I wasn't talking about the collision case, I was talking about two
devices at the same address on two different channels.  (In a collision,
BTW, both devices will generaly be active and you will get undefined
results.)

My understanding of what you are doing, and I may be wrong, is that you
are adding the devices to the main bus and using an enable/disable to
turn the devices on/off depending on which channel is enabled.

It does look like you can add multiple devices to the same bus at the
same address, so I do think that works.

> 
> There is a board, the quanta-q71l where we had to set the
> idle-disconnect because there were two muxes on the same bus, with
> conflicting addresses, and so we had to use idle disconnect explicitly
> to make the software happy talking to the hardware -- not ideal as
> having two devices behind different channels, but ultimately it's the
> same idea because the devices are conflicting.
> 
> >
> > * Can you add devices to the secondary I2C busses on the mux using the
> >   standard QEMU device model, or is the function call required?
> 
> I added the function call because I didn't see a clean way to bridge
> the issue as well as, the quasi-arbitrary bus numbering used by the
> kernel isn't how the hardware truly behaves, and my goal was to
> implement closer to the hardware.  I thought about adding an I2cBus to
> the device and then you'd be able to access it, but wasn't sure of a
> nice clean way to plumb that through -- I considered adding/removing
> devices from the parent i2c bus instead of the boolean reachable, but
> that seemed way less clean - although do-able.

The only way I can think of with the method that you are using would be
to add a mux and channel to the i2c device, but that's not very natural.

The patch I did implements it by plumbing through, like you say.  It's a
little bit of a hack, but not too bad.

> 
> >
> > I ask because I did a pca9540 and pca9541 device, but I've never
> > submitted it because I didn't think it would ever be needed.  It takes a
> > different tack on the problem; it creates the secondary busses as
> > standard QEMU I2C busses and bridges them.  You can see it at
> >
> >    github.com:cminyard/qemu.git master-i2c-rebase
> >
> 
> I'll have to take a look at your approach, but the idea that it
> wouldn't be needed sounds bizarre to me as nearly all BMC-based qemu
> boards leverage i2c muxes to handle their PCIe slot i2c routing.

Yeah, I don't work in that world :).  I can see the need there, and
nobody has asked up til now.  I wish I had pushed it in earlier, then
your job would have been a lot easier.

-corey

> 
> > If you design can do the things I ask, then it's better.  If not, then
> > I'm not sure.
> >
> > -corey
> >
> > >
> > >  MAINTAINERS                      |   6 +
> > >  hw/i2c/Kconfig                   |   4 +
> > >  hw/i2c/core.c                    |   6 +
> > >  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
> > >  hw/i2c/meson.build               |   1 +
> > >  hw/i2c/trace-events              |   5 +
> > >  include/hw/i2c/i2c.h             |   3 +
> > >  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
> > >  8 files changed, 267 insertions(+)
> > >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> > >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> > >
> > > --
> > > 2.31.0.208.g409f899ff0-goog
> > >

