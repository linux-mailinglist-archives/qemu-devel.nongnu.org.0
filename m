Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E738FD69
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:06:13 +0200 (CEST)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llT0u-0001P4-9Y
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llSzs-0000ce-Ja
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:05:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llSzo-0006hG-LX
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:05:08 -0400
Received: by mail-ed1-x52c.google.com with SMTP id r11so35182813edt.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iZj4ureDstJNAcDABmJhFqZ4Gedlsh8yxGBLi0FUME4=;
 b=ey7Eg4Ejl3K7wsafEmxa38njQqRjtsIFrNscU61j+f8A/kwdbw3FqllEYLkIMgcWmc
 ayVTDPJ73+mDk5i8vh5J2EpFeSrMtsCm78GURGsGaihDG4g5rVcXh6eFvb8P7nDkAN+d
 R/eigWGryG2550NWJnQY5sitIgelGAf5tj/w8Xc3gCn9qqUQj/4q3WZq6Vw3veY6Fzii
 9un6An2f28xBoIMyTVbT0hPXQBx5bJgr1qcrj6lsKzt9k0Eih72fxDfPDGincgU1en0x
 Vu6CB8soBa+f1v2bzMO9Iiz/DqMWgdwepkpWmBEcso8KeBET7zeoWj4Zaz49fAJZyHqT
 Us7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZj4ureDstJNAcDABmJhFqZ4Gedlsh8yxGBLi0FUME4=;
 b=BRoL543JQIa7TI6YYBa4ZD2ta6gwBc1w0BHfNWPLRfs4KvAskjuGRx3BJl6kwSNFU2
 7qyWviZigXiDmNh8308VTFu5SC0i0dsZpOkeibuBNrjgblfOWUrtz3lnsTTvvQWYJRxe
 cG9dV+Q8bK53gTe6qHNgo6pp0hKzDxLKGq1WS+EMnm+4InVLHyGwoFMIFqpsPTFZo54q
 3iWIPg95AqANWSp/gQuDyrYfKuVw3zlPaS0D7x3sBE4b/bHEBeCjUdnbJ+Z/outWAl5L
 ahjYOVroSGpovxU6SRXbJgjvy/nNYFTmS5TotPl1BTqqVSa9fRVba8ntxTZNFO5KIj9M
 GmkA==
X-Gm-Message-State: AOAM531Z87CZ3KVp1Rj0ghJVLyu5uNZn69iDNQEyGOvnykSFkGGp7N/f
 7l2MUSuBzTsEQVqtXFDtZUGtbu58NaU6JDHCI/8Riw==
X-Google-Smtp-Source: ABdhPJwlYj9fsLd4/Lv/mHQzakfPnG5py2Rwixz/NUmWcWCr4GaMlpx2qUelWETKeDvgL3fKUuW0w/32AKSFR4g5IUI=
X-Received: by 2002:a05:6402:8d0:: with SMTP id
 d16mr17212537edz.36.1621933502749; 
 Tue, 25 May 2021 02:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210525025823.3208218-1-swethajoshi139@gmail.com>
 <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
In-Reply-To: <331a819e-1745-4d4b-cc4a-82521a58186a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 10:04:39 +0100
Message-ID: <CAFEAcA8RbVafdjn2hkXifAPUF=wxZup20PqPcRpQ1ivtnWCxww@mail.gmail.com>
Subject: Re: [PATCH_V3] Adding ifdefs to call the respective routines only
 when their configs are enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Swetha Joshi <swethajoshi139@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 at 04:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/24/21 7:58 PM, Swetha Joshi wrote:
> > Signed-off-by: Swetha Joshi <swethajoshi139@gmail.com>
> > ---
> >   target/arm/kvm64.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
>
> You're still missing the commit message.
>
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index dff85f6db9..47a4d9d831 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -1403,7 +1403,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> >       hwaddr paddr;
> >       Object *obj = qdev_get_machine();
> >       VirtMachineState *vms = VIRT_MACHINE(obj);
> > -    bool acpi_enabled = virt_is_acpi_enabled(vms);
> > +    bool acpi_enabled = false;
> > +#ifdef CONFIG_ARM_VIRT
> > +    acpi_enabled = virt_is_acpi_enabled(vms);
> > +#endif /* CONFIG_ARM_VIRT */
> >
> >       assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
> >
> > @@ -1426,12 +1429,13 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> >                */
> >               if (code == BUS_MCEERR_AR) {
> >                   kvm_cpu_synchronize_state(c);
> > -                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
> > -                    kvm_inject_arm_sea(c);
> > -                } else {
> > +#ifdef CONFIG_ACPI_APEI
> > +                if (acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
> >                       error_report("failed to record the error");
> >                       abort();
> >                   }
> > +#endif /* CONFIG_ACPI_APEI */
> > +                kvm_inject_arm_sea(c);
> >               }
>
> Otherwise the actual patch looks ok.

I feel like the underlying problem here is that we let a virt-board-specific
bit of code slip into what should be generic Arm/KVM code here. We do
need to know "does the board actually have an ACPI table we can record the
memory error into", but that shouldn't be a specific query to virt board
code. I think (but have not tested) that a nicer solution would look like:

bool acpi_ghes_present(void)
{
    return object_resolve_path_type("", TYPE_ACPI_GED, NULL) != NULL;
}

in hw/acpi/ghes.c, and then using that function instead of
virt_is_acpi_enabled().

That avoids the CONFIG_ARM_VIRT specific reference and the need for ifdefs,
and means that any future Arm board that wants to can support memory errors
via ACPI tables by creating the ACPI_GED device and setting up the ACPI
tables as virt does.

(You will also need: a stub "return false" version in a new ghes-stub.c file,
in an if_false clause in the meson.build line for ghes.c similar to the way
ipmi.c/ipmi-stub.c are done; a prototype in include/hw/acpi/ghes.h with a
doc-comment block documenting the function; possibly to add a stub for
acpi_ghes_record_errors() in the new ghes-stub.c.)

thanks
-- PMM

