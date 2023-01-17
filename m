Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FC66E6E3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:23:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHrWQ-0000ED-MP; Tue, 17 Jan 2023 14:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pHrWL-0000Bx-D1; Tue, 17 Jan 2023 14:21:21 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pHrWJ-0006XX-Iu; Tue, 17 Jan 2023 14:21:21 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 g2-20020a9d6b02000000b006864bf5e658so1198327otp.1; 
 Tue, 17 Jan 2023 11:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=D4twTMKb3JyjqbVoT7/O+DFX4BsAdZj9XTMyT83V8Jk=;
 b=X+DXPzDQc0Unc9wFYrNJ2OaUxSth/qztTLqKgTvPLgeLIxR5mg4JWXtvIzkggT3cXh
 IoRoU3PHopCG1qDHgAwKjQk4n53fc7uiYv+xYVnBTPn8frps37ohFLBjL9HnxYBvXvS/
 /qSHIksxB1ALttDc6Yp0ML2qLv8+r+cOccK8C0hy+Jeah3KXfHveaVqB26CC/BGmI1gh
 uKe4cLdXJJAjcEQptIJdHKfpV1eXgekko56VxLqski/ramUo7+zUuCdzvI0gKG6AUFKd
 DiwBFtdirJWVJN7fYCql40I+bPAAy+9IJWDTp+VrtXtmKfCmun2g2raAvQg4Hr/oGHDI
 sRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4twTMKb3JyjqbVoT7/O+DFX4BsAdZj9XTMyT83V8Jk=;
 b=FMeGHdwp/KD4S6PUP6jgCFoO/prpQpp0aSCkho1whCmYs3dflC8p01DtCTKty3Mg5X
 QdSSB3hwFK7QSlulclcZvP1ZMEVU6coV69ZVSZjOSe4NzhRsrsvdkMVRP4eOpWTRsqGg
 TznNhSlFUE5VoJDxChnr07Cj9gBa21Oaw+3drbIhI/ySiQVZWU2kIBHrZHZWTSdIPmp8
 VDjyNFse8yhzisFo21JFDTELCweoZzpaY9aKuZqaog4lxhq10ORbVAUe7b9kikeJGbAb
 xwxMXLnqwuXeW7Qr+5F9X7DypIt/q7ZED7u+b74tvEZ48eNdM1U0hlRxuqqDvfvUS9Fd
 HV1w==
X-Gm-Message-State: AFqh2krg0spTmF1B3n2G6pgJwxddnkaLMwS41UzwkNM991jav2SxHN4l
 Xl+afOeBmbFp22tGf7fj4UM=
X-Google-Smtp-Source: AMrXdXslZVdiS3b9jmQugdSudYkYZ9aDkDx/D+mpUI6H5/Ezhv209ZXjIPOuZvACYh51OpaAGPTTFw==
X-Received: by 2002:a05:6830:39c4:b0:684:e745:6304 with SMTP id
 bt4-20020a05683039c400b00684e7456304mr2170896otb.9.1673983277987; 
 Tue, 17 Jan 2023 11:21:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a544e12000000b00363760f96dcsm14785685oiy.42.2023.01.17.11.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 11:21:17 -0800 (PST)
Date: Tue, 17 Jan 2023 11:21:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <20230117192115.GA2958104@roeck-us.net>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8W+H6T9DOZ08SoF@cormorant.local> <Y8Yq5faCjAKzMa9O@kbusch-mbp>
 <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Jan 17, 2023 at 04:18:14PM +0000, Peter Maydell wrote:
> On Tue, 17 Jan 2023 at 16:10, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Mon, Jan 16, 2023 at 09:58:13PM -0700, Keith Busch wrote:
> > > On Mon, Jan 16, 2023 at 10:14:07PM +0100, Klaus Jensen wrote:
> > > > I noticed that the Linux driver does not use the INTMS/INTMC registers
> > > > to mask interrupts on the controller while processing CQEs. While not
> > > > required by the spec, it is *recommended* in setups not using MSI-X to
> > > > reduce the risk of spurious and/or missed interrupts.
> > >
> > > That's assuming completions are deferred to a bottom half. We don't do
> > > that by default in Linux nvme, though you can ask the driver to do that
> > > if you want.
> > >
> > > > With the patch below, running 100 boot iterations, no timeouts were
> > > > observed on QEMU emulated riscv64 or mips64.
> > > >
> > > > No changes are required in the QEMU hw/nvme interrupt logic.
> > >
> > > Yeah, I can see why: it forces the irq line to deassert then assert,
> > > just like we had forced to happen within the device side patches. Still,
> > > none of that is supposed to be necessary, but this idea of using these
> > > registers is probably fine.
> >
> > There is still no answer why this would be necessary in the first place,
> > on either side. In my opinion, unless someone can confirm that the problem
> > is seen with real hardware, we should assume that it happens on the qemu
> > side and address it there.
> 
> Sure, but that means identifying what the divergence
> between QEMU's implementation and the hardware is first. I don't
> want a fudged fix in QEMU's code any more than you want one in
> the kernel's driver code :-)
> 

I actually prefer it in qemu because that means I can test nvme support
on all active LTS releases of the Linux kernel, but that is POV and
secondary. This has been broken ever since I started testing nvme
support with qemu, so it doesn't make much of a difference if fixing
the problem for good takes a bit longer. Plus, I run my own version
of qemu anyway, so carrying the fix (hack) in qemu doesn't make much
of a difference for me.

Anyway - any idea what to do to help figuring out what is happening ?
Add tracing support to pci interrupt handling, maybe ?

Guenter

