Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720965957AE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 12:11:07 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNtXO-0001wl-Bp
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 06:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNtLl-0005F7-9i
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:59:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNtLj-0000zR-6K
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 05:59:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id bs25so12011138wrb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=tQ5ekVJWTkQAop5DwX2rN7IFyhbvyU8qg36JobC6lD0=;
 b=TIuG7jMF4lyFzZPT1t1hUMfnnWUj3NqEjFx/v00jO1zCINnMtjMAdpu2DHL4R+QTlE
 kN/fG41HbuqNxnbOXsBSZFexVUsIYqBnDqgAfGZPLHffogGiauY2HT1NKwm3es7yIe3l
 ergp7qR2C5xvbk1AXxNhTbR9MDe4t73ebZUm0BrjsJiLuLNHKBEDUGnjz/4mzFxIIsEL
 Qko/jVyPSHeE1QubO9meNpeqk/PpE+8/9VsTH8yEQE2NdLIcErwT6fWl6E+mCW3QA5AK
 amacW038wPKklntLf/o3CSWX7zVIrQo2d4MrncB9b0N0ac3gWrHmDltcztAUoG9++uPE
 896g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=tQ5ekVJWTkQAop5DwX2rN7IFyhbvyU8qg36JobC6lD0=;
 b=HXgpdwC9VByabulGHsxSDA53PVMHaZ3FukgDru9nTAKVKM1eJzmyGWnvB0s2/kTyCZ
 bGoiqv9qvQ0TUA2p3mRcsIpbLp1g1Yt3v1uYZbO4ivK+I/9kZ2+pD52jgmf9dWGn5QOs
 jCxc3It8EknliWu8CKMTMUE9gCvO/dzSfZCoGAnTUXIYczTZ+bz4qOoXXLncaarClkwd
 1yV0AtzK5pf7RvTryVBrBhMmHVV+S90bIGyfyV/BPg+fonIsRRnlSm1VydkkDhx4kmCv
 0hnS/S/hJRWE7U97pfqq6p9ierOqcvO9lfS31M3zMQpbVN9ZQVeo/nrmDki+yDRYqRmS
 ueew==
X-Gm-Message-State: ACgBeo2YnTO6fmjqlKEno5/1p6WXdTADJtWjUDkNTvfRm8yw/IldUlj4
 uT5cHv71+Vz+cVSdxLATocNqTg==
X-Google-Smtp-Source: AA6agR445breEFPBMAve6U5KVr2eEL5L/N89m8lhUKLnxMpVvzlAHgBFrgCgc9NEaxEcL5/zEztRcQ==
X-Received: by 2002:a5d:648b:0:b0:222:cb51:a57 with SMTP id
 o11-20020a5d648b000000b00222cb510a57mr11111636wri.287.1660643941558; 
 Tue, 16 Aug 2022 02:59:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a056000051000b00223b8168b15sm9599030wrf.66.2022.08.16.02.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 02:59:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D8E51FFB7;
 Tue, 16 Aug 2022 10:59:00 +0100 (BST)
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shiny Saana <shinysaana@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: Teensy 4.1 Implementation
Date: Tue, 16 Aug 2022 10:41:14 +0100
In-reply-to: <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
Message-ID: <87r11gbjbv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Shiny Saana <shinysaana@gmail.com> writes:

> Thank you very much for your answer!
>
> Apologies if I mess up the process of communicating via mailing lists,
> it's my first time communicating via this channel.

Don't worry about it - mailing lists are absolutely a good place to
discuss things ahead of time. I suspect because the devel list looks
to be mostly consisting of PATCHes and discussion of them that puts off
people from asking questions up front.

> The project that requires me to implement this board in QEMU currently wo=
uld require full USB interface and flash
> storage at the end of the day, and I feel on the same page that implement=
ing UART via USB would indeed be a good
> place to start.

Does the board use a standardised host controller or something custom?
You can see all the current host controllers in hw/usb/meson.build:

  # usb host adapters
  softmmu_ss.add(when: 'CONFIG_USB_UHCI', if_true: files('hcd-uhci.c'))
  softmmu_ss.add(when: 'CONFIG_USB_OHCI', if_true: files('hcd-ohci.c'))
  softmmu_ss.add(when: 'CONFIG_USB_OHCI_PCI', if_true: files('hcd-ohci-pci.=
c'))
  softmmu_ss.add(when: 'CONFIG_USB_EHCI', if_true: files('hcd-ehci.c'))
  softmmu_ss.add(when: 'CONFIG_USB_EHCI_PCI', if_true: files('hcd-ehci-pci.=
c'))
  softmmu_ss.add(when: 'CONFIG_USB_EHCI_SYSBUS', if_true: files('hcd-ehci.c=
', 'hcd-ehci-sysbus.c'))
  softmmu_ss.add(when: 'CONFIG_USB_XHCI', if_true: files('hcd-xhci.c'))
  softmmu_ss.add(when: 'CONFIG_USB_XHCI_PCI', if_true: files('hcd-xhci-pci.=
c'))
  softmmu_ss.add(when: 'CONFIG_USB_XHCI_SYSBUS', if_true: files('hcd-xhci-s=
ysbus.c'))
  softmmu_ss.add(when: 'CONFIG_USB_XHCI_NEC', if_true: files('hcd-xhci-nec.=
c'))
  softmmu_ss.add(when: 'CONFIG_USB_MUSB', if_true: files('hcd-musb.c'))
  softmmu_ss.add(when: 'CONFIG_USB_DWC2', if_true: files('hcd-dwc2.c'))
  softmmu_ss.add(when: 'CONFIG_USB_DWC3', if_true: files('hcd-dwc3.c'))

  softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
  softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
  softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci=
.c'))
  specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-u=
sb2-ctrl-regs.c'))
  specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-=
subsystem.c'))

So hopefully you can just use an existing model. Search for the TYPE_FOO
variable for your given host controller to see how the board models
instantiate it.


> I personally don't need any of the GPIO interfaces, but if needed by some=
one else, that could be a good second step to
> work on once that part of the board is implemented.

Handling GPIOs in QEMU is fine (we have things like the qdev_init_gpio_*
functions to handle them). The problem is usually what to do with the
actual general purpose pins which aren't wired to something we emulate
in the board. Some boards expose their values via QMP properties but I
suspect whats really needed is a generic mechanism for exposing GPIO to
external scripts rather than have every board define it's own thing.

>
> I have jotted down a few lines based on the MPS2 implementation, which ma=
de me get a feel of how a board is
> implemented. I'll look at the board you recommended too, thanks a lot for=
 the recommendation!
>
> As for upstreaming, once (if?) I get a working "MVP", and if I cannot fig=
ure out the best way to submit the patches, I'll
> keep in touch to figure it out, if that's alright!

The submitting patches document has a lot of information on this
including a guide to using sourcehut to publish a branch as emails if
setting up local email is too tricky.

>
> Again, thanks a bunch!
>
> //Saana
>
> Le lun. 15 ao=C3=BBt 2022 =C3=A0 16:58, Peter Maydell <peter.maydell@lina=
ro.org> a =C3=A9crit :
>
>  On Sat, 13 Aug 2022 at 18:54, Shiny Saana <shinysaana@gmail.com> wrote:
>  > I'd like to implement support for emulating the teensy 4.1 board (
>  > https://www.pjrc.com/store/teensy41.html) to QEMU.
>  >
>  > I'm honestly quite lost as to where to start at the moment, since
>  > I can't really find any emulated Cortex-M7 that would be close to
>  > that board already implemented.
>
>  Hi! Yes, implementing a new board and SoC model is quite a bit of
>  work, and unfortunately the process isn't really documented, so
>  the best thing is to look for some other existing SoC model and
>  do something similar. In this case, we implement the Cortex-M7
>  CPU itself, but we don't implement the IMXRT1062 SoC that it uses,
>  or any similar SoC in that family. (We do have some of the older
>  A-profile IMX boards, so it's possible some device models are
>  reusable -- but equally they might be very different.)
>
>  As a pattern, I would look at the stm32vldiscovery machine.
>  This is a Cortex-M3 system based on the stm32f100 SoC, where
>  we have implemented a few of the SoC devices and have stub
>  implementations of most of the rest. That's a fairly recently
>  added M-profile SoC and it's written in the "modern" style we'd
>  recommend for new code, so it's a good pattern to copy, and
>  because it only has a few 'real' devices it's hopefully not an
>  overwhelmingly large amount of code.
>
>  An initial simple implementation would get a level of
>  functionality capable of basic "can run code and it will
>  be able to do serial port (UART) input and output".
>  (If you're hoping for/would need more than that, do say so,
>  so we can check how much effort what you're aiming for would be.
>  Some things QEMU doesn't really support very well, like
>  emulation of GPIO input/output line hardware lines being
>  connected to LEDs and switches... In any case "just a UART"
>  is a good first step.)
>
>  You'll need detailed documentation of both the board and the
>  SoC. Handily a lot of that is collected here:
>  https://www.pjrc.com/teensy/datasheets.html
>
>  If you're hoping to submit a new board model upstream you
>  should give some consideration to git commit structure
>  as you work on it -- for code review we need big changes like
>  a new board type to be broken up into smaller self-contained
>  pieces. It is possible to just write all the code first and
>  then split it into digestible pieces later, but personally
>  I find it much easier to try to keep the changes at least
>  roughly in a series of separate patches as I go along.
>
>  Our "submitting a patch" page has some general advice
>  and information on our patch processes:
>  https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>
>  thanks
>  -- PMM


--=20
Alex Benn=C3=A9e

