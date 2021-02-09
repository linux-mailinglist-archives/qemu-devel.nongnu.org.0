Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CFA314BB5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:36:36 +0100 (CET)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PRi-0008RO-Ie
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l9PQO-0007l9-DB; Tue, 09 Feb 2021 04:35:12 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1l9PQL-0005u6-GJ; Tue, 09 Feb 2021 04:35:12 -0500
Received: by mail-lj1-x233.google.com with SMTP id r23so19539395ljh.1;
 Tue, 09 Feb 2021 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=FskOPh5wEB2DaxwNjo7cOq9d8SHcTlq4OVCtCfSPb+s=;
 b=BhCB7/ymr7cvQsJW50pSu4e8FGtS5do76MTgTRHr96hXRa3eBn711GB7PH+bBmKT3e
 gk/ENMBAZTmjhR5J4j28rw7fmRSAHJYU9wqukxRhP329QotQL5Xg7lDk/jJxim6iujxs
 OPGablsMTfRM6JFgS/atz05wJznctdrzd1n7OjHAUNySNC5sxSN+aw8yLkd2P6UMN+s+
 20A6rQNOpW6skZtQJoYk6vsYkMV5TihYZlb9AlPLK1Xh6rfAQ/DrY8Ky7Oecxbb6bZdd
 vTVKMW52IXLjzN9OwfAbP+DypPizRC8f3GaoW31nlZvCe0Npt3YxYhnQjvc/mdq1gT/f
 TU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FskOPh5wEB2DaxwNjo7cOq9d8SHcTlq4OVCtCfSPb+s=;
 b=JYhmiPs372/qtECxldQXCaYoGWuAlnqC77kQ5XEOFq2z92RFCMJ9V6l+a3GOC8rv6X
 p+3enOY+QZdQgf/aSW9WieRhZ/rJbljrNTd7ofO6mhmMuJwhrjdV2SBcjPfXNfeqBui/
 NqKMeR+f2dv1DzACZWXUcZxS4DfcAsWvW7L1jgITRJFB2SBn15Z6IE8AJul+baA9s+H/
 LGhfvcw+xWL99l8VR1FvkCrFWfnNwqiew2ugTOn7P6aLDoV/Oyupq/NVo1QNlT4F+H+r
 f+M5uKqKqdYFasCq/5mdnpFa3RVucedv2H2NdNPh/L1FyLzFHTMlSDPr5WNzHwfIwusR
 eDZA==
X-Gm-Message-State: AOAM533b8Tzh2xQ4fSrXhh6H9FZu8aXLJFtFh+5Md6ZAXes3bQxXAVU5
 0H3uyFhyeA310gAdF2Bkw0U=
X-Google-Smtp-Source: ABdhPJyYchJUO/vQ9Xm4qwVLt065DFg+IulmYlC7/ZwZhq9XJZ0gm/NECQ/eDnylm+1quV6/isu+ZA==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr9077072ljk.303.1612863305655; 
 Tue, 09 Feb 2021 01:35:05 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 d10sm455143lji.17.2021.02.09.01.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 01:35:04 -0800 (PST)
Date: Tue, 9 Feb 2021 10:35:02 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
Message-ID: <20210209093501.GA19920@fralle-msi>
References: <CAEUhbmVYgP063iqY0c10y9zKBmx00Z6vr3BO3RjoRo-CXQpYDw@mail.gmail.com>
 <20210118100557.GA11373@fralle-msi>
 <CAEUhbmWT50o8OV_QAimhs5itWq3pFd6CTKup6PFpvSs2KYpf2w@mail.gmail.com>
 <20210119130113.GA28306@fralle-msi>
 <CAEUhbmUBAgF4D__jsfbE7yGd++5ZH3YOutTiOBOot52sNCV-eg@mail.gmail.com>
 <20210121085006.GA10391@fralle-msi>
 <CAEUhbmUh54vqXmtkjnTzk7Y6U+oZEbw-O3ode+CdKbfZ0Qs+9Q@mail.gmail.com>
 <20210121141844.GC10391@fralle-msi>
 <CAEUhbmWT9QPa-EFRdQme2L9hiUJSYWZWfmzQTShQN86WMW93ew@mail.gmail.com>
 <CAJy5ezp8+AeiOUoicGMz=GspoeUT2i0bAi3FrCEoEhuGkf1JxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJy5ezp8+AeiOUoicGMz=GspoeUT2i0bAi3FrCEoEhuGkf1JxQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x233.google.com
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joe Komlodi <komlodi@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Edgar,

On [2021 Feb 08] Mon 16:30:00, Edgar E. Iglesias wrote:
>    On Mon, Feb 8, 2021 at 3:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> 
>      On Thu, Jan 21, 2021 at 10:18 PM Francisco Iglesias
>      <frasse.iglesias@gmail.com> wrote:
>      >
>      > Hi Bin,
>      >
>      > On [2021 Jan 21] Thu 16:59:51, Bin Meng wrote:
>      > > Hi Francisco,
>      > >
>      > > On Thu, Jan 21, 2021 at 4:50 PM Francisco Iglesias
>      > > <frasse.iglesias@gmail.com> wrote:
>      > > >
>      > > > Dear Bin,
>      > > >
>      > > > On [2021 Jan 20] Wed 22:20:25, Bin Meng wrote:
>      > > > > Hi Francisco,
>      > > > >
>      > > > > On Tue, Jan 19, 2021 at 9:01 PM Francisco Iglesias
>      > > > > <frasse.iglesias@gmail.com> wrote:
>      > > > > >
>      > > > > > Hi Bin,
>      > > > > >
>      > > > > > On [2021 Jan 18] Mon 20:32:19, Bin Meng wrote:
>      > > > > > > Hi Francisco,
>      > > > > > >
>      > > > > > > On Mon, Jan 18, 2021 at 6:06 PM Francisco Iglesias
>      > > > > > > <frasse.iglesias@gmail.com> wrote:
>      > > > > > > >
>      > > > > > > > Hi Bin,
>      > > > > > > >
>      > > > > > > > On [2021 Jan 15] Fri 22:38:18, Bin Meng wrote:
>      > > > > > > > > Hi Francisco,
>      > > > > > > > >
>      > > > > > > > > On Fri, Jan 15, 2021 at 8:26 PM Francisco Iglesias
>      > > > > > > > > <frasse.iglesias@gmail.com> wrote:
>      > > > > > > > > >
>      > > > > > > > > > Hi Bin,
>      > > > > > > > > >
>      > > > > > > > > > On [2021 Jan 15] Fri 10:07:52, Bin Meng wrote:
>      > > > > > > > > > > Hi Francisco,
>      > > > > > > > > > >
>      > > > > > > > > > > On Fri, Jan 15, 2021 at 2:13 AM Francisco Iglesias
>      > > > > > > > > > > <frasse.iglesias@gmail.com> wrote:
>      > > > > > > > > > > >
>      > > > > > > > > > > > Hi Bin,
>      > > > > > > > > > > >
>      > > > > > > > > > > > On [2021 Jan 14] Thu 23:08:53, Bin Meng wrote:
>      > > > > > > > > > > > > From: Bin Meng <bin.meng@windriver.com>
>      > > > > > > > > > > > >
>      > > > > > > > > > > > > The m25p80 model uses s->needed_bytes to
>      indicate how many follow-up
>      > > > > > > > > > > > > bytes are expected to be received after it
>      receives a command. For
>      > > > > > > > > > > > > example, depending on the address mode, either
>      3-byte address or
>      > > > > > > > > > > > > 4-byte address is needed.
>      > > > > > > > > > > > >
>      > > > > > > > > > > > > For fast read family commands, some dummy cycles
>      are required after
>      > > > > > > > > > > > > sending the address bytes, and the dummy cycles
>      need to be counted
>      > > > > > > > > > > > > in s->needed_bytes. This is where the mess
>      began.
>      > > > > > > > > > > > >
>      > > > > > > > > > > > > As the variable name (needed_bytes) indicates,
>      the unit is in byte.
>      > > > > > > > > > > > > It is not in bit, or cycle. However for some
>      reason the model has
>      > > > > > > > > > > > > been using the number of dummy cycles for
>      s->needed_bytes. The right
>      > > > > > > > > > > > > approach is to convert the number of dummy
>      cycles to bytes based on
>      > > > > > > > > > > > > the SPI protocol, for example, 6 dummy cycles
>      for the Fast Read Quad
>      > > > > > > > > > > > > I/O (EBh) should be converted to 3 bytes per the
>      formula (6 * 4 / 8).
>      > > > > > > > > > > >
>      > > > > > > > > > > > While not being the original implementor I must
>      assume that above solution was
>      > > > > > > > > > > > considered but not chosen by the developers due to
>      it is inaccuracy (it
>      > > > > > > > > > > > wouldn't be possible to model exacly 6 dummy
>      cycles, only a multiple of 8,
>      > > > > > > > > > > > meaning that if the controller is wrongly
>      programmed to generate 7 the error
>      > > > > > > > > > > > wouldn't be caught and the controller will still
>      be considered "correct"). Now
>      > > > > > > > > > > > that we have this detail in the implementation I'm
>      in favor of keeping it, this
>      > > > > > > > > > > > also because the detail is already in use for
>      catching exactly above error.
>      > > > > > > > > > > >
>      > > > > > > > > > >
>      > > > > > > > > > > I found no clue from the commit message that my
>      proposed solution here
>      > > > > > > > > > > was ever considered, otherwise all SPI controller
>      models supporting
>      > > > > > > > > > > software generation should have been found out
>      seriously broken long
>      > > > > > > > > > > time ago!
>      > > > > > > > > >
>      > > > > > > > > >
>      > > > > > > > > > The controllers you are referring to might lack
>      support for commands requiring
>      > > > > > > > > > dummy clock cycles but I really hope they work with
>      the other commands? If so I
>      > > > > > > > >
>      > > > > > > > > I am not sure why you view dummy clock cycles as
>      something special
>      > > > > > > > > that needs some special support from the SPI controller.
>      For the case
>      > > > > > > > > 1 controller, it's nothing special from the controller
>      perspective,
>      > > > > > > > > just like sending out a command, or address bytes, or
>      data. The
>      > > > > > > > > controller just shifts data bit by bit from its tx fifo
>      and that's it.
>      > > > > > > > > In the Xilinx GQSPI controller case, the dummy cycles
>      can either be
>      > > > > > > > > sent via a regular data (the case 1 controller) in the
>      tx fifo, or
>      > > > > > > > > automatically generated (case 2 controller) by the
>      hardware.
>      > > > > > > >
>      > > > > > > > Ok, I'll try to explain my view point a little
>      differently. For that we also
>      > > > > > > > need to keep in mind that QEMU models HW, and any binary
>      that runs on a HW
>      > > > > > > > board supported in QEMU should ideally run on that board
>      inside QEMU aswell
>      > > > > > > > (this can be a bare metal application equaly well as a
>      modified u-boot/Linux
>      > > > > > > > using SPI commands with a non multiple of 8 number of
>      dummy clock cycles).
>      > > > > > > >
>      > > > > > > > Once functionality has been introduced into QEMU it is not
>      easy to know which
>      > > > > > > > intentional or untentional features provided by the
>      functionality are being
>      > > > > > > > used by users. One of the (perhaps not well known)
>      features I'm aware of that
>      > > > > > > > is in use and is provided by the accurate dummy clock
>      cycle modeling inside
>      > > > > > > > m25p80 is the be ability to test drivers accurately
>      regarding the dummy clock
>      > > > > > > > cycles (even when using commands with a non-multiple of 8
>      number of dummy clock
>      > > > > > > > cycles), but there might be others aswell. So by removing
>      this functionality
>      > > > > > > > above use case will brake, this since those test will not
>      be reliable.
>      > > > > > > > Furthermore, since users tend to be creative it is not
>      possible to know if
>      > > > > > > > there are other use cases that will be affected. This
>      means that in case [1]
>      > > > > > > > needs to be followed the safe path is to add functionality
>      instead of removing.
>      > > > > > > > Luckily it also easier in this case, see below.
>      > > > > > >
>      > > > > > > I understand there might be users other than U-Boot/Linux
>      that use an
>      > > > > > > odd number of dummy bits (not multiple of 8). If your
>      concern was
>      > > > > > > about model behavior changes, sure I can update
>      > > > > > > qemu/docs/system/deprecated.rst to mention that some flashes
>      in the
>      > > > > > > m25p80 model now implement dummy cycles as bytes.
>      > > > > >
>      > > > > > Yes, something like that. My concern is that since this
>      functionality has been
>      > > > > > in tree for while, users have found known or unknown features
>      that got
>      > > > > > introduced by it. By removing the functionality (and the
>      known/uknown features)
>      > > > > > we are riscing to brake our user's use cases (currently I'm
>      aware of one
>      > > > > > feature/use case but it is not unlikely that there are more).
>      [1] states that
>      > > > > > "In general features are intended to be supported indefinitely
>      once introduced
>      > > > > > into QEMU", to me that makes very much sense because the
>      opposite would mean
>      > > > > > that we were not reliable. So in case [1] needs to be honored
>      it looks to be
>      > > > > > safer to add functionality instead of removing (and riscing
>      the removal of use
>      > > > > > cases/features). Luckily I still believe in this case that it
>      will be easier to
>      > > > > > go forward (even if I also agree on what you are saying below
>      about what I
>      > > > > > proposed).
>      > > > > >
>      > > > >
>      > > > > Even if the implementation is buggy and we need to keep the
>      buggy
>      > > > > implementation forever? I think that's why
>      > > > > qemu/docs/system/deprecated.rst was created for deprecating such
>      > > > > feature.
>      > > >
>      > > > With the RFC I posted all commands in m25p80 are working for both
>      the case 1
>      > > > controller (using a txfifo) and the case 2 controller (no txfifo,
>      as GQSPI).
>      > > > Because of this, I, with all respect, will have to disagree that
>      this is buggy.
>      > >
>      > > Well, the existing m25p80 implementation that uses dummy cycle
>      > > accuracy for those flashes prevents all SPI controllers that use tx
>      > > fifo to work with those flashes. Hence it is buggy.
>      > >
>      > > >
>      > > > >
>      > > > > > >
>      > > > > > > > >
>      > > > > > > > > > don't think it is fair to call them 'seriously broken'
>      (and else we should
>      > > > > > > > > > probably let the maintainers know about it). Most
>      likely the lack of support
>      > > > > > > > >
>      > > > > > > > > I called it "seriously broken" because current
>      implementation only
>      > > > > > > > > considered one type of SPI controllers while completely
>      ignoring the
>      > > > > > > > > other type.
>      > > > > > > >
>      > > > > > > > If we change view and see this from the perspective of
>      m25p80, it models the
>      > > > > > > > commands a certain way and provides an API that the SPI
>      controllers need to
>      > > > > > > > implement for interacting with it. It is true that there
>      are SPI controllers
>      > > > > > > > referred to above that do not support the portion of that
>      API that corresponds
>      > > > > > > > to commands with dummy clock cycles, but I don't think it
>      is true that this is
>      > > > > > > > broken since there is also one SPI controller that has a
>      working implementation
>      > > > > > > > of m25p80's full API also when transfering through a tx
>      fifo (use case 1). But
>      > > > > > > > as mentioned above, by doing a minor extension and
>      improvement to m25p80's API
>      > > > > > > > and allow for toggling the accuracy from dummy clock
>      cycles to dummy bytes [1]
>      > > > > > > > will still be honored as in the same time making it
>      possible to have full
>      > > > > > > > support for the API in the SPI controllers that currently
>      do not (please reread
>      > > > > > > > the proposal in my previous reply that attempts to do
>      this). I myself see this
>      > > > > > > > as win/win situation, also because no controller should
>      need modifications.
>      > > > > > > >
>      > > > > > >
>      > > > > > > I am afraid your proposal does not work. Your proposed new
>      device
>      > > > > > > property 'model_dummy_bytes' to select to convert the
>      accurate dummy
>      > > > > > > clock cycle count to dummy bytes inside m25p80, is hard to
>      justify as
>      > > > > > > a property to the flash itself, as the behavior is tightly
>      coupled to
>      > > > > > > how the SPI controller works.
>      > > > > >
>      > > > > > I agree on above. I decided though that instead of posting
>      sample code in here
>      > > > > > I'll post an RFC with hopefully an improved proposal. I'll cc
>      you. About below,
>      > > > > > Xilinx ZynqMP GQSPI should not need any modication in a first
>      step.
>      > > > > >
>      > > > >
>      > > > > Wait, (see below)
>      > > > >
>      > > > > > >
>      > > > > > > Please take a look at the Xilinx GQSPI controller, which
>      supports both
>      > > > > > > use cases, that the dummy cycles can be transferred via tx
>      fifo, or
>      > > > > > > generated by the controller automatically. Please read the
>      example
>      > > > > > > given in:
>      > > > > > >
>      > > > > > >     table 24‐22, an example of Generic FIFO Contents for
>      Quad I/O Read
>      > > > > > > Command (EBh)
>      > > > > > >
>      > > > > > > in
>      https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
>      > > > > > >
>      > > > > > > If you choose to set the m25p80 device property
>      'model_dummy_bytes' to
>      > > > > > > true when working with the Xilinx GQSPI controller, you are
>      bound to
>      > > > > > > only allow guest software to use tx fifo to transfer the
>      dummy cycles,
>      > > > > > > and this is wrong.
>      > > > > > >
>      > > > >
>      > > > > You missed this part. I looked at your RFC, and as I mentioned
>      above
>      > > > > your proposal cannot support the complicated controller like
>      Xilinx
>      > > > > GQSPI. Please read the example of table 24-22. With your RFC,
>      you
>      > > > > mandate guest software's GQSPI driver to only use hardware dummy
>      cycle
>      > > > > generation, which is wrong.
>      > > > >
>      > > >
>      > > > First, thank you very much for looking into the RFC series, very
>      much
>      > > > appreciated. Secondly, about above, the GQSPI model in QEMU
>      transfers from 2
>      > > > locations in the file, in 1 location the transfer referred to
>      above is done, in
>      > > > another location the transfer through the txfifo is done. The
>      location where
>      > > > transfer referred to above is done will not need any modifications
>      (and will
>      > > > thus work equally well as it does currently).
>      > >
>      > > Please explain this a little bit. How does your RFC series handle
>      > > cases as described in table 24-22, where the 6 dummy cycles are
>      split
>      > > into 2 transfers, with one transfer using tx fifo, and the other one
>      > > using hardware dummy cycle generation?
>      >
>      > Sorry, I missunderstod. You are right, that won't work.
> 
>      +Edgar E. Iglesias
> 
>      So it looks by far the only way to implement dummy cycles correctly to
>      work with all SPI controller models is what I proposed here in this
>      patch series.
> 
>      Maintainers are quite silent, so I would like to hear your thoughts.
> 
>      @Alistair Francis @Philippe Mathieu-Daudé @Peter Maydell would you
>      please share your thoughts since you are the one who reviewed the
>      existing dummy implementation (based on commits history)
> 
>    Francisco really knows this stuff better than me....
>    I would tend to agree that it's unfortunate to model things in cycles, if
>    we could abstract things at a higher level that would be nice. Without
>    breaking existing use-cases.
>    Francisco, is it impossible to bring up the abstraction level to bytes and
>    keep existing use-cases?

Great question, I'm leaning on that it shouldn't be impossible to be
honest (but I haven't been able to try anything yet though).

Best regards,
Francisco Iglesias


>    We have a bunch of test-cases, We'll publish some of them in source code,
>    others we can't publish since they use proprietary SW we're not allowed to
>    publish at all, but we can run tests and Ack if things work.
>    Best regards,
>    Edgar

