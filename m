Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C75F36C15C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:56:20 +0200 (CEST)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJVz-0002Vd-L1
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1lbJUU-0001dh-4w; Tue, 27 Apr 2021 04:54:46 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1lbJUN-0000T6-6h; Tue, 27 Apr 2021 04:54:45 -0400
Received: by mail-lf1-x12b.google.com with SMTP id n138so92684063lfa.3;
 Tue, 27 Apr 2021 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=V1BgWFpb2A9gYMj9p/iW/1TiJ3d7NiM8nzIv+rPEZh4=;
 b=dbI8ecLMQ7Vu2aku0sH4Bk0zuJGwoxhU9LlLAbNIoqLPFYVgWmTFjZvWZ9O20Jblvb
 nepR9xBQDrVxtZStQBTsXDzvoJnUcj3EHileyvXUbG35xFWZCcDlMwjKa6vHw0hv2SSb
 aHfLIXJCOqGPlfbQVnTKiaWbYRv5vMeMsYikApdaZRPb515QuRZ96RfUJDuW6JPhmkeq
 fgvGFeucfT5LYil51ExftNf/2r44bIbnc0F4iflXq8guijG7O7qXD2CYhTNXlsB66qAK
 eGxL9rU6cx96azJPjFNvfUCXmYD4oxZ8LBN6Fw4rUoiunpmqPVOXRwN+4jPcvpGpuIE6
 r9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=V1BgWFpb2A9gYMj9p/iW/1TiJ3d7NiM8nzIv+rPEZh4=;
 b=Be2OdI+aXRD0vU1Kf6VPXSrd2GA3AwpNXxt8QQRuO9wCCuIhNUkEu5Xa3F4xT+2j+v
 8LfHNdmcr+YSksg7xpdXURth1RkwC5q93pF0rPceTIwTnOlsmVn1MgrD1p9CuDcBWNOp
 zvsoa6KD93rTZytELDROmOmrACrqYNcEpMoHlNoHhVR6PPn96T4YtVpxZTjraB3b/NVy
 EpMtfugkkeMepoLVC1e3+JWJFUZEh6GEvCBKSWj9uoBk44x0CeaopvEgXG+J2cT+ajqe
 lARNHoyxvHBD68GugtevtExi2BxIjg4lhLbrU5w0ebh/3MeXsI/qsVQJLHAdTndVhcdM
 xMiw==
X-Gm-Message-State: AOAM533++QXqAN+D1D6uqXeKPtJv+LOX4uHE7Ipt9Wgi4Zmig/XL+RGs
 T0ccX9recPF1fNQu1AqEExc=
X-Google-Smtp-Source: ABdhPJweDGW3qWXpHXv6YgTnVn0jnnCtRMAvMZxOmqsI9a/iSAlWR8FbdZVhsCWqxd7Nx2MuPff+dQ==
X-Received: by 2002:a05:6512:2088:: with SMTP id
 t8mr15328339lfr.55.1619513676142; 
 Tue, 27 Apr 2021 01:54:36 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 w15sm279257ljd.126.2021.04.27.01.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:54:35 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:54:33 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
Message-ID: <20210427085433.GA9656@fralle-msi>
References: <20210118100557.GA11373@fralle-msi>
 <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
 <20210119130113.GA28306@fralle-msi>
 <CAEUhbmUBAgF4D__jsfbE7yGd++5ZH3YOutTiOBOot52sNCV-eg@mail.gmail.com>
 <20210121085006.GA10391@fralle-msi>
 <CAEUhbmUh54vqXmtkjnTzk7Y6U+oZEbw-O3ode+CdKbfZ0Qs+9Q@mail.gmail.com>
 <20210121141844.GC10391@fralle-msi>
 <CAEUhbmWT9QPa-EFRdQme2L9hiUJSYWZWfmzQTShQN86WMW93ew@mail.gmail.com>
 <CAEUhbmXwq-7mwbuwp_29iXDT4AZYTBE4PFDxhaHoZkrCRumCaw@mail.gmail.com>
 <CAKmqyKMkgR6p7G3MscSvVHHZuYF2p4piq9W1o+Ye9SSuOqszOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKMkgR6p7G3MscSvVHHZuYF2p4piq9W1o+Ye9SSuOqszOA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
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
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Bin Meng <bmeng.cn@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2021 Apr 27] Tue 15:56:10, Alistair Francis wrote:
> On Fri, Apr 23, 2021 at 4:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Feb 8, 2021 at 10:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Thu, Jan 21, 2021 at 10:18 PM Francisco Iglesias
> > > <frasse.iglesias@gmail.com> wrote:
> > > >
> > > > Hi Bin,
> > > >
> > > > On [2021 Jan 21] Thu 16:59:51, Bin Meng wrote:
> > > > > Hi Francisco,
> > > > >
> > > > > On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias
> > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > >
> > > > > > Dear Bin,
> > > > > >
> > > > > > On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:
> > > > > > > Hi Francisco,
> > > > > > >
> > > > > > > On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
> > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Hi Bin,
> > > > > > > >
> > > > > > > > On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
> > > > > > > > > Hi Francisco,
> > > > > > > > >
> > > > > > > > > On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
> > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Bin,
> > > > > > > > > >
> > > > > > > > > > On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
> > > > > > > > > > > Hi Francisco,
> > > > > > > > > > >
> > > > > > > > > > > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
> > > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > >
> > > > > > > > > > > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
> > > > > > > > > > > > > Hi Francisco,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
> > > > > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi Bin,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
> > > > > > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > The m25p80 model uses s->needed_bytes to indicate how many follow-up
> > > > > > > > > > > > > > > bytes are expected to be received after it receives a command. For
> > > > > > > > > > > > > > > example, depending on the address mode, either 3-byte address or
> > > > > > > > > > > > > > > 4-byte address is needed.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > For fast read family commands, some dummy cycles are required after
> > > > > > > > > > > > > > > sending the address bytes, and the dummy cycles need to be counted
> > > > > > > > > > > > > > > in s->needed_bytes. This is where the mess began.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > As the variable name (needed_bytes) indicates, the unit is in byte.
> > > > > > > > > > > > > > > It is not in bit, or cycle. However for some reason the model has
> > > > > > > > > > > > > > > been using the number of dummy cycles for s->needed_bytes. The right
> > > > > > > > > > > > > > > approach is to convert the number of dummy cycles to bytes based on
> > > > > > > > > > > > > > > the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> > > > > > > > > > > > > > > I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > While not being the original implementor I must assume that above solution was
> > > > > > > > > > > > > > considered but not chosen by the developers due to it is inaccuracy (it
> > > > > > > > > > > > > > wouldn't be possible to model exacly 6 dummy cycles, only a multiple of 8,
> > > > > > > > > > > > > > meaning that if the controller is wrongly programmed to generate 7 the error
> > > > > > > > > > > > > > wouldn't be caught and the controller will still be considered "correct"). Now
> > > > > > > > > > > > > > that we have this detail in the implementation I'm in favor of keeping it, this
> > > > > > > > > > > > > > also because the detail is already in use for catching exactly above error.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > I found no clue from the commit message that my proposed solution here
> > > > > > > > > > > > > was ever considered, otherwise all SPI controller models supporting
> > > > > > > > > > > > > software generation should have been found out seriously broken long
> > > > > > > > > > > > > time ago!
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > The controllers you are referring to might lack support for commands requiring
> > > > > > > > > > > > dummy clock cycles but I really hope they work with the other commands? If so I
> > > > > > > > > > >
> > > > > > > > > > > I am not sure why you view dummy clock cycles as something special
> > > > > > > > > > > that needs some special support from the SPI controller. For the case
> > > > > > > > > > > 1 controller, it's nothing special from the controller perspective,
> > > > > > > > > > > just like sending out a command, or address bytes, or data. The
> > > > > > > > > > > controller just shifts data bit by bit from its tx fifo and that's it.
> > > > > > > > > > > In the Xilinx GQSPI controller case, the dummy cycles can either be
> > > > > > > > > > > sent via a regular data (the case 1 controller) in the tx fifo, or
> > > > > > > > > > > automatically generated (case 2 controller) by the hardware.
> > > > > > > > > >
> > > > > > > > > > Ok, I'll try to explain my view point a little differently. For that we also
> > > > > > > > > > need to keep in mind that QEMU models HW, and any binary that runs on a HW
> > > > > > > > > > board supported in QEMU should ideally run on that board inside QEMU aswell
> > > > > > > > > > (this can be a bare metal application equaly well as a modified u-boot/Linux
> > > > > > > > > > using SPI commands with a non multiple of 8 number of dummy clock cycles).
> > > > > > > > > >
> > > > > > > > > > Once functionality has been introduced into QEMU it is not easy to know which
> > > > > > > > > > intentional or untentional features provided by the functionality are being
> > > > > > > > > > used by users. One of the (perhaps not well known) features I'm aware of that
> > > > > > > > > > is in use and is provided by the accurate dummy clock cycle modeling inside
> > > > > > > > > > m25p80 is the be ability to test drivers accurately regarding the dummy clock
> > > > > > > > > > cycles (even when using commands with a non-multiple of 8 number of dummy clock
> > > > > > > > > > cycles), but there might be others aswell. So by removing this functionality
> > > > > > > > > > above use case will brake, this since those test will not be reliable.
> > > > > > > > > > Furthermore, since users tend to be creative it is not possible to know if
> > > > > > > > > > there are other use cases that will be affected. This means that in case [1]
> > > > > > > > > > needs to be followed the safe path is to add functionality instead of removing.
> > > > > > > > > > Luckily it also easier in this case, see below.
> > > > > > > > >
> > > > > > > > > I understand there might be users other than U-Boot/Linux that use an
> > > > > > > > > odd number of dummy bits (not multiple of 8). If your concern was
> > > > > > > > > about model behavior changes, sure I can update
> > > > > > > > > qemu/docs/system/deprecated.rst to mention that some flashes in the
> > > > > > > > > m25p80 model now implement dummy cycles as bytes.
> > > > > > > >
> > > > > > > > Yes, something like that. My concern is that since this functionality has been
> > > > > > > > in tree for while, users have found known or unknown features that got
> > > > > > > > introduced by it. By removing the functionality (and the known/uknown features)
> > > > > > > > we are riscing to brake our user's use cases (currently I'm aware of one
> > > > > > > > feature/use case but it is not unlikely that there are more). [1] states that
> > > > > > > > "In general features are intended to be supported indefinitely once introduced
> > > > > > > > into QEMU", to me that makes very much sense because the opposite would mean
> > > > > > > > that we were not reliable. So in case [1] needs to be honored it looks to be
> > > > > > > > safer to add functionality instead of removing (and riscing the removal of use
> > > > > > > > cases/features). Luckily I still believe in this case that it will be easier to
> > > > > > > > go forward (even if I also agree on what you are saying below about what I
> > > > > > > > proposed).
> > > > > > > >
> > > > > > >
> > > > > > > Even if the implementation is buggy and we need to keep the buggy
> > > > > > > implementation forever? I think that's why
> > > > > > > qemu/docs/system/deprecated.rst was created for deprecating such
> > > > > > > feature.
> > > > > >
> > > > > > With the RFC I posted all commands in m25p80 are working for both the case 1
> > > > > > controller (using a txfifo) and the case 2 controller (no txfifo, as GQSPI).
> > > > > > Because of this, I, with all respect, will have to disagree that this is buggy.
> > > > >
> > > > > Well, the existing m25p80 implementation that uses dummy cycle
> > > > > accuracy for those flashes prevents all SPI controllers that use tx
> > > > > fifo to work with those flashes. Hence it is buggy.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > don't think it is fair to call them 'seriously broken' (and else we should
> > > > > > > > > > > > probably let the maintainers know about it). Most likely the lack of support
> > > > > > > > > > >
> > > > > > > > > > > I called it "seriously broken" because current implementation only
> > > > > > > > > > > considered one type of SPI controllers while completely ignoring the
> > > > > > > > > > > other type.
> > > > > > > > > >
> > > > > > > > > > If we change view and see this from the perspective of m25p80, it models the
> > > > > > > > > > commands a certain way and provides an API that the SPI controllers need to
> > > > > > > > > > implement for interacting with it. It is true that there are SPI controllers
> > > > > > > > > > referred to above that do not support the portion of that API that corresponds
> > > > > > > > > > to commands with dummy clock cycles, but I don't think it is true that this is
> > > > > > > > > > broken since there is also one SPI controller that has a working implementation
> > > > > > > > > > of m25p80's full API also when transfering through a tx fifo (use case 1). But
> > > > > > > > > > as mentioned above, by doing a minor extension and improvement to m25p80's API
> > > > > > > > > > and allow for toggling the accuracy from dummy clock cycles to dummy bytes [1]
> > > > > > > > > > will still be honored as in the same time making it possible to have full
> > > > > > > > > > support for the API in the SPI controllers that currently do not (please reread
> > > > > > > > > > the proposal in my previous reply that attempts to do this). I myself see this
> > > > > > > > > > as win/win situation, also because no controller should need modifications.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I am afraid your proposal does not work. Your proposed new device
> > > > > > > > > property 'model_dummy_bytes' to select to convert the accurate dummy
> > > > > > > > > clock cycle count to dummy bytes inside m25p80, is hard to justify as
> > > > > > > > > a property to the flash itself, as the behavior is tightly coupled to
> > > > > > > > > how the SPI controller works.
> > > > > > > >
> > > > > > > > I agree on above. I decided though that instead of posting sample code in here
> > > > > > > > I'll post an RFC with hopefully an improved proposal. I'll cc you. About below,
> > > > > > > > Xilinx ZynqMP GQSPI should not need any modication in a first step.
> > > > > > > >
> > > > > > >
> > > > > > > Wait, (see below)
> > > > > > >
> > > > > > > > >
> > > > > > > > > Please take a look at the Xilinx GQSPI controller, which supports both
> > > > > > > > > use cases, that the dummy cycles can be transferred via tx fifo, or
> > > > > > > > > generated by the controller automatically. Please read the example
> > > > > > > > > given in:
> > > > > > > > >
> > > > > > > > >     table 24‐22, an example of Generic FIFO Contents for Quad I/O Read
> > > > > > > > > Command (EBh)
> > > > > > > > >
> > > > > > > > > in https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> > > > > > > > >
> > > > > > > > > If you choose to set the m25p80 device property 'model_dummy_bytes' to
> > > > > > > > > true when working with the Xilinx GQSPI controller, you are bound to
> > > > > > > > > only allow guest software to use tx fifo to transfer the dummy cycles,
> > > > > > > > > and this is wrong.
> > > > > > > > >
> > > > > > >
> > > > > > > You missed this part. I looked at your RFC, and as I mentioned above
> > > > > > > your proposal cannot support the complicated controller like Xilinx
> > > > > > > GQSPI. Please read the example of table 24-22. With your RFC, you
> > > > > > > mandate guest software's GQSPI driver to only use hardware dummy cycle
> > > > > > > generation, which is wrong.
> > > > > > >
> > > > > >
> > > > > > First, thank you very much for looking into the RFC series, very much
> > > > > > appreciated. Secondly, about above, the GQSPI model in QEMU transfers from 2
> > > > > > locations in the file, in 1 location the transfer referred to above is done, in
> > > > > > another location the transfer through the txfifo is done. The location where
> > > > > > transfer referred to above is done will not need any modifications (and will
> > > > > > thus work equally well as it does currently).
> > > > >
> > > > > Please explain this a little bit. How does your RFC series handle
> > > > > cases as described in table 24-22, where the 6 dummy cycles are split
> > > > > into 2 transfers, with one transfer using tx fifo, and the other one
> > > > > using hardware dummy cycle generation?
> > > >
> > > > Sorry, I missunderstod. You are right, that won't work.
> > >
> > > +Edgar E. Iglesias
> > >
> > > So it looks by far the only way to implement dummy cycles correctly to
> > > work with all SPI controller models is what I proposed here in this
> > > patch series.
> > >
> > > Maintainers are quite silent, so I would like to hear your thoughts.
> > >
> > > @Alistair Francis @Philippe Mathieu-Daudé @Peter Maydell would you
> > > please share your thoughts since you are the one who reviewed the
> > > existing dummy implementation (based on commits history)
> 
> I agree with Edgar, in that Francisco and Bin know this better than me
> and that modelling things in cycles is a pain.

Hi Alistair,

> 
> As Bin points out it seems like currently we should be modelling bytes
> (from the variable name) so it makes sense to keep it in bytes. I
> would be in favour of this series in that case. Do we know what use
> cases this will break? I know it's hard to answer but I don't think
> there are too many SSI users in QEMU so it might not be too hard to
> test most of the possible use cases.

The use case I'm aware of is regression testing of drivers. Ex: if a
driver is using 10 dummy clock cycles with the commands and a patch
accidentaly changes the driver to use 11 dummy clock cycles QEMU currently
finds the problem, that won't be possible with this series. It's difficult
to say but it is not impossible there are other use cases also.

More importantly IMO though is that the current use cases can be keept
while still providing support for commands with dummy clock cycles into
the QEMU SPI controllers lacking at the moment.

(If I recall correctly this series might also have another issue regarding
the GQSPI SPI mode configuration, with that it is possible transmit 8
dummy clock cycles as 1 data byte, 2 data bytes or 4 data bytes, so I
think some form of calculation might be needed inside m25p80).

Best regards,
Francisco


> 
> Alistair
> 
> >
> > Hello maintainers,
> >
> > We apparently missed the 6.0 window to address this mess of the m25p80
> > model. Please provide your inputs on this before I start working on
> > the v2.
> >
> > Regards,
> > Bin
> >

