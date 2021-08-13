Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88063EB97F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 17:49:34 +0200 (CEST)
Received: from localhost ([::1]:51930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEZR7-0003uy-7A
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 11:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mEZQB-0002YK-TH
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:48:36 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mEZQ7-00082E-Fb
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:48:35 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 108-20020a9d01750000b029050e5cc11ae3so12541452otu.5
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=6JZdrJ/l1EIlAcRJCZQSCmvgBLaip8y9ZHOuabJ/Zlg=;
 b=D37bzXQy3oVLl3sFe3xhJV935bLr/Z/23aPx7PXuY7ym+Bf2G7kGdS7KTPjgzhNDRA
 uEbxGfrVK6uoGX92wkLdcqwbzs83aeqO1qhJDfcUXOiBbmRGnjgRsY7Lceo60kYs70UF
 spM5hyBZd/jRbtfr9Clwg/2X7Z74ON0+g5qqWCHsoQMXNTdi2xd28WcbHPNzxf/K9iAx
 IsGKH80AjK5SDhF1FHKj4DEF5FYmsr5xUq/KXKDiyOdc9kR4prvxioiK3kT4Ublc4VQQ
 KA2M0VBbF+d3kVeI97hn7h2/9ARgJ20OvapL+SB8/B/J90p+cVkyEdbARKLmitEpvBCC
 LhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=6JZdrJ/l1EIlAcRJCZQSCmvgBLaip8y9ZHOuabJ/Zlg=;
 b=d5tip0tLItHHFO4SUPQkL9jG39vBcxbGlSiwLDeUAsrsx6UwglATnYmEipewAO1M+l
 DLCqlyW/S1swyqzF1UsbEMF+RHl0GWe1lNfCeyK/qHHz39E5QBYMyS0M2z2QwXBfkDHW
 Jlea4FnVksbCh5xygN7z1gDt9DmC35lOqsPdh9xYhVij2EGYpEZu/tXDc/WUSGxvp24Z
 09gKheE23hvzTnBjPPPphSGTiZO+vzRnNmYUUhuWYxD18ttVHdIiBb1xTWnQ4Da+HTb3
 h5rf5Ve40ZlmrElXrXdTl+NLWGCa+QIn3q6x98BrkB4OcKEzuXEzhqRHpJE65NsqTseN
 XLww==
X-Gm-Message-State: AOAM533xGUxWUzjfomYF90Nym1DcrXGda+r14QJpO0g7qTP66NpcK4jq
 kVLmXIaqaoHmDpNkoypYJgzd/w==
X-Google-Smtp-Source: ABdhPJxPJNxoxZDt+/Xkq6n3S4IhIfH7kZVsEVtKSDu1zChlr8LM1wuFI1AY9I6V6aUrItAeywWKrA==
X-Received: by 2002:a05:6830:9c7:: with SMTP id
 y7mr2601169ott.111.1628869708484; 
 Fri, 13 Aug 2021 08:48:28 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:f438:435c:47fc:5ccc])
 by smtp.gmail.com with ESMTPSA id e2sm370375otk.14.2021.08.13.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:48:28 -0700 (PDT)
Date: Fri, 13 Aug 2021 10:48:26 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Shengtan Mao <stmao@google.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 0/2] Add remote I2C device to support external I2C
 device
Message-ID: <20210813154826.GV3431@minyard.net>
References: <20210806234918.122457-1-stmao@google.com>
 <20210807015507.GE3431@minyard.net>
 <CAMiADQ8uZRZ-XjR9hrN5KazPgAFbsYCPOq9RU7Pkwqw+Y-vVBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMiADQ8uZRZ-XjR9hrN5KazPgAFbsYCPOq9RU7Pkwqw+Y-vVBg@mail.gmail.com>
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
Cc: Patrick Venture <venture@google.com>, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org, maoshengtan2011@gmail.com,
 Chris Rauer <crauer@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 13, 2021 at 10:37:00AM -0400, Shengtan Mao wrote:
> Hi Corey,
> Thank you so much for your feedback. I took some time to discuss these
> points with my team.
> 
> 1. Blocking QEMU I/O
> Thanks for bringing this to our attention. We acknowledge it as a drawback,
> but we hope that by indicating this clearly in an updated docs, the user
> will accept these drawbacks when they use it. In short, we hope that you
> will consider merging this patch despite this drawback.

I understand the complexity this will add.  I'm not sure of the general
QEMU policy on this.  Everything that I know of that relies on remote
responses is done with async I/O.  The way you have proposed it would be
ok for testing, I suppose, but I don't think it would be ok in a
production system.  Things like this have a way of sneaking in to more
uses than you imagined.  (Hey, we can use this to tie in to a real
TPM!).

So I don't know.  I'll add Peter to the To: and see if he can speak to
this.

> 
> 2. Error Handling
> We will add them for the next version.
> 
> 3. Remote end NACK
> It  would be helpful to have a bit more information on this. The remote I2C
> in QEMU redirects the return value (which can indicate NACK / ACK) from the
> external device, so the remote end should be able to NACK if prompted by
> the external device. If you are saying that the remote I2C should be able
> to NACK independently, then no, it doesn't support that, but we can take
> steps to add it.

I believe you will eventually need the ability to get a remote NACK.
You may also need the ability to signal an interrupt from the remote
device (though that will require async input).  The information back
from the remote needs some sort of tag to make it extensible.

> 
> I am leaving google, so I will be passing this project to my team. Thank
> you again for your feedback.

Well, bummer.  This is a good idea hopefully we can see it through.

Thanks,

-corey


> 
> best,
> Shengtan
> 
> On Fri, Aug 6, 2021 at 9:55 PM Corey Minyard <cminyard@mvista.com> wrote:
> 
> > On Fri, Aug 06, 2021 at 11:49:16PM +0000, Shengtan Mao wrote:
> > > This patch implements the remote I2C device.  The remote I2C device
> > allows an
> > > external I2C device to communicate with the I2C controller in QEMU
> > through the
> > > remote I2C protocol.  Users no longer have to directly modify QEMU to
> > add new
> > > I2C devices and can instead implement the emulated device externally and
> > > connect it to the remote I2C device.
> >
> > I got to spend some time on this today, and I like the concept, but
> > there is one major issue.  When you do a read, you are blocking the
> > entire qemu I/O system until the read returns, which may result in
> > issues.  At least that's may understanding of how the qemu I/O system
> > works, which may be dated or wrong.
> >
> > If you look at the IPMI code, it as an external BMC that can handle
> > async I/O from the chardev.  But the IPMI subsystem is designed to
> > handle this sort of thing.
> >
> > Unfortunately, the I2C code really isn't set up to handle async
> > operations.  I'm not sure how hard it would be to modify the I2C core to
> > handle this, but it doesn't look trivial.  Well, the changes to the core
> > wouldn't be terrible, but all the host devices are set up for
> > synchronous operation.  You could add a separate asynchronous interface,
> > and only host devices that were modified could use it, and your device
> > would only work on those host devices.
> >
> > Another issue is that you aren't handling errors from the chr read/write
> > calls.  If the remote connection dies, this isn't going to be good.  You
> > have to do error handling.
> >
> > There is also no way for the remote end to return a NACK.  That's pretty
> > important, I think.  It will, unfortunately, complicate your nice simple
> > protocol.
> >
> > Sorry to be the bearer of bad news.  Maybe I'm wrong about the blocking
> > thing, I'd be happy to be wrong.
> >
> > -corey
> >
> > >
> > > Previous work by Wolfram Sang
> > > (
> > https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough
> > )
> > > was referenced.  It shares the similar idea of redirecting the actual
> > I2C device
> > > functionalities, but Sang focuses on physical devices, and we focus on
> > emulated devices.
> > > The work by Sang mainly utilizes file descriptors while ours utilizes
> > character
> > > devices, which offers better support for emulated devices. The work by
> > Sang is
> > > not meant to offer full I2C device support; it only implements the
> > receive
> > > functionality.  Our work implements full support for I2C devices: send,
> > recv,
> > > and event (match_and_add is not applicable for external devices).
> > >
> > > v1 -> v2
> > >     fixed terminology errors in the description comments.
> > > v2 -> v3
> > >     corrected patch set emailing errors.
> > > v3 -> v4
> > >     added remote I2C protocol description in docs/specs
> > >
> > > Shengtan Mao (2):
> > >   hw/i2c: add remote I2C device
> > >   docs/specs: add remote i2c docs
> > >
> > >  docs/specs/index.rst          |   1 +
> > >  docs/specs/remote-i2c.rst     |  51 ++++++++
> > >  hw/arm/Kconfig                |   1 +
> > >  hw/i2c/Kconfig                |   4 +
> > >  hw/i2c/meson.build            |   1 +
> > >  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
> > >  tests/qtest/meson.build       |   1 +
> > >  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
> > >  8 files changed, 392 insertions(+)
> > >  create mode 100644 docs/specs/remote-i2c.rst
> > >  create mode 100644 hw/i2c/remote-i2c.c
> > >  create mode 100644 tests/qtest/remote-i2c-test.c
> > >
> > > --
> > > 2.32.0.605.g8dce9f2422-goog
> > >
> >

