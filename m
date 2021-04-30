Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D65336FFEC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:49:26 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXGX-0001xp-7I
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcWwj-0001ty-RC
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:58 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcWwg-00045a-6z
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id u21so106436851ejo.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmzrusVgHN1xGIhbncWyo3D7BLhWREEULZqFB1i4l3c=;
 b=sYwOZkATFmjGxVGqpv7SPc6pkQf2PIfg9Nkke4A7ctZzHDY5uVLFKf18Hh8APnDn1v
 S1/LHOQuslY83JB3P5K+Foe53jx+Gil7tnrJGdnRJoIyad42TrzQoeVkvFYLMOEYQDkh
 PcGQAT9/NgO/a8BExH2Gv4ElV+IOnuOvesaVqS0bnh4zSKzBBEDkjizIkrX4SOaIynG7
 HiVMN0eZZszsVKW9aiY8nruxbH1ieGbMZRKFwBYluGbvfIsC8vGU0uiLKl/EtXRcgmyy
 c6KvyHEq4o9O1wbuCq0G1dlxepmFn/Lhw2NK2Z9Wng2csNcTQ860998bVI2U7mV4v5XZ
 2hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmzrusVgHN1xGIhbncWyo3D7BLhWREEULZqFB1i4l3c=;
 b=sMLl3P12B/Mpxsc/CG28UleUk4pFYHfsR/pn8bdOCG0V7P0bJA8cc9oPwWExCIGT1y
 3e3CyCepX4VSHcl+syARPBDqYAZwi8uRANVFyOQu+uKFOn+LPBohSn+HzEfu3q8sQkhc
 VLtg1imY7yL4CsOc1sbp5WwWEIDUXgqQYrrc8giCg7DSuP8a25SMKG0aIb2SrOJGHlqR
 Lm0v7rHcTBEMB70rL8hlD7vQbfMWifuApJvVDNTwnp5nk3Ru/evlt3MUwslKEFu56Tn/
 vCcovAHBLpwmU87HsE3/lQJQBOiIwbZmgae63ZgEpmFJrrVLwdalT+xnnqYtvlqo40k5
 y3Bg==
X-Gm-Message-State: AOAM5317871LsfSexQ/6dF01vQyYcWVuap0IjrdkWaBTQroJc3YBq5X6
 HWD5fO9RIXssRfab61qn1/1pgUYFT7ljLfi8kJlHhQ==
X-Google-Smtp-Source: ABdhPJyU4ebjd4sAjaCoHAF+QfnoYazT38unBGBECEfSeaCr3DBLjNb6XwD9gUnwkasThxzi7go2EYKAB+Cu6yDAeKk=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr2785495ejb.407.1619803732347; 
 Fri, 30 Apr 2021 10:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210430162212.825-1-peter.maydell@linaro.org>
 <c9ee41c0-deb1-28ac-3551-e9e03acfb476@linaro.org>
In-Reply-To: <c9ee41c0-deb1-28ac-3551-e9e03acfb476@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 18:27:49 +0100
Message-ID: <CAFEAcA_8neSedyEpVWZD-QMi5ih-iWdd_97CvjoEDkC08vAHJw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make WFI a NOP for userspace emulators
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 18:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/30/21 9:22 AM, Peter Maydell wrote:
> > The WFI insn is not system-mode only, though it doesn't usually make
> > a huge amount of sense for userspace code to execute it.  Currently
> > if you try it in qemu-arm then the helper function will raise an
> > EXCP_HLT exception, which is not covered by the switch in cpu_loop()
> > and results in an abort:
> >
> > qemu: unhandled CPU exception 0x10001 - aborting
> > R00=00000001 R01=408003e4 R02=408003ec R03=000102ec
> > R04=00010a28 R05=00010158 R06=00087460 R07=00010158
> > R08=00000000 R09=00000000 R10=00085b7c R11=408002a4
> > R12=408002b8 R13=408002a0 R14=0001057c R15=000102f8
> > PSR=60000010 -ZC- A usr32
> > qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x7fcbfa4f0a12
> >
> > Make the WFI helper function return immediately in the usermode
> > emulator. This turns WFI into a NOP, which is OK because:
> >   * architecturally "WFI is a NOP" is a permitted implementation
> >   * aarch64 Linux kernels use the SCTLR_EL1.nTWI bit to trap
> >     userspace WFI and NOP it (though aarch32 kernels currently
> >     just let WFI do whatever it would do)
> >
> > We could in theory make the translate.c code special case user-mode
> > emulation and NOP the insn entirely rather than making the helper
> > do nothing, but because no real world code will be trying to
> > execute WFI we don't care about efficiency and the helper provides
> > a single place where we can make the change rather than having
> > to touch multiple places in translate.c and translate-a64.c.
> >
> > Fixes:https://bugs.launchpad.net/qemu/+bug/1926759
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/op_helper.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
>
> You could also ifdef this out in translate, in tb_stop for  DISAS_WFI.

You'd need to do it in both translate.c and translate-a64.c if
you did it there, though.

thanks
-- PMM

