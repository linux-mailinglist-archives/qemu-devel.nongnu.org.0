Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015A62C5DD7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:32:10 +0100 (CET)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPo8-0000ZS-Va
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPlN-00080L-1S
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:29:18 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPlJ-000263-SD
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:29:16 -0500
Received: by mail-ed1-x542.google.com with SMTP id q3so3748086edr.12
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 14:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0AgxtJT2//cCNtxGrXcBVnUgwFsB4l+CrENK8Ao06s0=;
 b=ghxLT+GNsbF0Bpc9TdwqTx3wP4acz9v4bRTChTsKRwT272S8daFnfkCdrcbLDVpgEm
 q08CFWSZlXoOrGir3/mxR/ScMybK2W1deLKYuaHRKPF9yn9qje85rh6NgArAwFAzUQdp
 TnFJA+sjYpstjhc48+C+onlbq1i4hFrdjSUpwa7UtIMs6Ilj24sCt0ZHXFFr3kXM+Jhx
 ITNgh6VRqRmyOSvlU5SKkEbKsClnIsrViq6miG/hOYsLXusG3dTN/7xuNLmc/ec2RG4h
 rgCjZFmAiQcHPh2Ly9dEW7DpCJhL2H5PY6bJbuzAimdMl7C+CSJCtjPtxCpQHHsGLMIs
 Exjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0AgxtJT2//cCNtxGrXcBVnUgwFsB4l+CrENK8Ao06s0=;
 b=VxHq80ixuExH8ins/uYmi+ktFMS0jJrBt9AXJx5k5zLcHWZrgW2MFx5b+PPb6NL1Dh
 PzPwbR1AmEcdT6ATFgI8Th7wePtVjBGbYCU9oJd+N3UID5Mr+jII4rpaSjFdBDlMtXyi
 YWltUZsrmK78OtZzmISNgohzsJNWGp+xh2JvEmJKomcETDAkWAnbvtI03SLZYVvgp4SM
 slP11XO8VJBAycjihgomBqYfhNr1Gwrt+/XmkktD5AD4WAvD1H6Ya9vbK35AjiDCmnRo
 hFSIcbbNRR13q4MmXKH2grme88Y2h241y7IUQnlkQbowqkWEJ5Wd839nUneKMoUaa7x3
 rsLQ==
X-Gm-Message-State: AOAM530iZJhzWxA5/3hO5o18/A+jmwtlMoF3uvoevxsp5n6PWI9WKnNO
 QZqlFS129oAxP4nZk7yfD0XSHjd2yoRcDFeBGeuAzA==
X-Google-Smtp-Source: ABdhPJwrXURBV/5TwxE+/Y1ICd9tmNJpqy9XwzBGVDHdqe9YZBgDZANJARP8jDu8Bkwil+5ZaRJh6t/22nGnpfrBJ2s=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr4439287edy.251.1606429752418; 
 Thu, 26 Nov 2020 14:29:12 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
In-Reply-To: <20201126221405.GT2271382@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 22:29:01 +0000
Message-ID: <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 22:14, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Thu, Nov 26, 2020 at 10:50:17PM +0100, Alexander Graf wrote:
> > The Apple M1 only supports up to 36 bits of physical address space. That
> > means we can not fit the 64bit MMIO BAR region into our address space.
> >
> > To fix this, let's not expose a 64bit MMIO BAR region when running on
> > Apple Silicon.
> >
> > I have not been able to find a way to enumerate that easily, so let's
> > just assume we always have that little PA space on hypervisor.framework
> > systems.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > ---
> >  hw/arm/virt.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 27dbeb549e..d74053ecd4 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -45,6 +45,7 @@
> >  #include "hw/display/ramfb.h"
> >  #include "net/net.h"
> >  #include "sysemu/device_tree.h"
> > +#include "sysemu/hvf.h"
> >  #include "sysemu/numa.h"
> >  #include "sysemu/runstate.h"
> >  #include "sysemu/sysemu.h"
> > @@ -1746,6 +1747,14 @@ static void machvirt_init(MachineState *machine)
> >      unsigned int smp_cpus = machine->smp.cpus;
> >      unsigned int max_cpus = machine->smp.max_cpus;
> >
> > +    /*
> > +     * On Hypervisor.framework capable systems, we only have 36 bits of PA
> > +     * space, which is not enough to fit a 64bit BAR space
> > +     */
> > +    if (hvf_enabled()) {
> > +        vms->highmem = false;
> > +    }
>
> Direct checks for *_enabled() are a pain to clean up later when
> we add support to new accelerators.  Can't this be implemented as
> (e.g.) a AccelClass::max_physical_address_bits field?

It's a property of the CPU (eg our emulated TCG CPUs may have
varying supported numbers of physical address bits). So the
virt board ought to look at the CPU, and the CPU should be
set up with the right information for all of KVM, TCG, HVF
(either a specific max_phys_addr_bits value or just ensure
its ID_AA64MMFR0_EL1.PARange is right, not sure which would
be easier/nicer).

thanks
-- PMM

