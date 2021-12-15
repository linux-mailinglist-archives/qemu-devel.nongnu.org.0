Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BA4759DF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 14:45:37 +0100 (CET)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxUbA-0001yl-Rl
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 08:45:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mxU8Z-0001LQ-34
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:16:03 -0500
Received: from [2607:f8b0:4864:20::b30] (port=38679
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mxU8X-00050f-4f
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:16:02 -0500
Received: by mail-yb1-xb30.google.com with SMTP id v64so55055448ybi.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gM6mFIK2UrpQvcXb+mChAgCxKybKifKP5Azjm0zqeB8=;
 b=Pq5hksYVPGwo7Vw5mZTtqHXgjJQm803IxmjEt7WERURL5/keaPAIrKPDDuTYlXScK8
 zmWNSRl13eRdDivHBsUrPWJqw5Y9mPKIrssyGOselCWHMNIzPiaDBS/ZMaaqDymTggDC
 93X+QKQGumF2jWpfMySdAoJrcET/fp6MVIDbOG6NySsvSSLcvniMswp8kOhcAQNaLks3
 sm4njv3A04dlkigPcJJzTOMDI0A7SZDD4pr7SifN5e1H5e098L3ElZlt11rtqA0cEuhu
 eee/uIXGCcnx85WAZBarQkcQR0v7ah7sfswhEYWXVzPa1DYB7Ug5mSj8YDRIlx3cWA0B
 R7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gM6mFIK2UrpQvcXb+mChAgCxKybKifKP5Azjm0zqeB8=;
 b=YonQZcs1Xc/O2dzH+Y19y8HMeYMzv1PMkRutcpXA2hSsJqKt1Kn6F3lDM+zr+NHvKz
 bsjz2KTQCpCxQnxWR7DrDTVxn3VEYFpSESohNOv8Vs6uwxmHMMr2FfPL8i+NZ9n46Bls
 ZL2w03SOfMVmkCg/l5JPOsEy3MAsgo3Q4K5nM3YdVmC6hKpSQygoiglwoyD1qjrehMyq
 43QZRxJsEOX/hOIc5U30KMPOcbPpCe6D32NU1iJLFLQ/IG48eh09Gs8fNvSJvV91je1a
 8t5Tz/8jmv2AvGBCw1wwc/79ShVkMKZj1UiIAm/ic1EafIquTgs6GhqOdRfqx2Ve/HFS
 vsWA==
X-Gm-Message-State: AOAM530SHpGUn7QDcQIWApU1ZcYIDXQrP2hPWHDFhwxhYtRFGEc6cpIR
 JCDSCB/02KRU/CEJQIUfN5kTpyU8/wxYi9n2ysPLkQ==
X-Google-Smtp-Source: ABdhPJywNhvA3FVevV5ejsIO69dXayAfsk7pk3SadZxSgGfnWJ/JWLP/ORavyrGcZVHvRDNhjMcmZqmnHBq4HczOCzE=
X-Received: by 2002:a25:e792:: with SMTP id e140mr6189596ybh.426.1639574158977; 
 Wed, 15 Dec 2021 05:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
In-Reply-To: <20211215120926.1696302-1-alex.bennee@linaro.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 15 Dec 2021 15:15:22 +0200
Message-ID: <CAC_iWjL6x+qPmWSeeV1QWg=8X5XmXVaCJb99==_1uoyQsOps_w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=ilias.apalodimas@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jerome Forissier <jerome@forissier.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Wed, 15 Dec 2021 at 14:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Jerome Forissier <jerome@forissier.org>
> ---
>  docs/system/arm/virt.rst |  7 +++++++
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 850787495b..c86a4808df 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -121,6 +121,13 @@ ras
>    Set ``on``/``off`` to enable/disable reporting host memory errors to a=
 guest
>    using ACPI and guest external abort exceptions. The default is off.
>
> +kaslr-dtb-seed
> +  Set ``on``/``off`` to pass a random seed via the guest dtb to use for =
features
> +  like address space randomisation. The default is ``on``. You will want
> +  to disable it if your trusted boot chain will verify the DTB it is
> +  passed. It would be the responsibility of the firmware to come up
> +  with a seed and pass it on if it wants to.
> +
>  Linux guest kernel configuration
>  """"""""""""""""""""""""""""""""
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index dc6b66ffc8..acd0665fe7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -148,6 +148,7 @@ struct VirtMachineState {
>      bool virt;
>      bool ras;
>      bool mte;
> +    bool kaslr_dtb_seed;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 30da05dfe0..4496612e89 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -248,11 +248,15 @@ static void create_fdt(VirtMachineState *vms)
>
>      /* /chosen must exist for load_dtb to fill in necessary properties l=
ater */
>      qemu_fdt_add_subnode(fdt, "/chosen");
> -    create_kaslr_seed(ms, "/chosen");
> +    if (vms->kaslr_dtb_seed) {
> +        create_kaslr_seed(ms, "/chosen");
> +    }
>
>      if (vms->secure) {
>          qemu_fdt_add_subnode(fdt, "/secure-chosen");
> -        create_kaslr_seed(ms, "/secure-chosen");
> +        if (vms->kaslr_dtb_seed) {
> +            create_kaslr_seed(ms, "/secure-chosen");
> +        }
>      }
>
>      /* Clock node, for the benefit of the UART. The kernel device tree
> @@ -2236,6 +2240,20 @@ static void virt_set_its(Object *obj, bool value, =
Error **errp)
>      vms->its =3D value;
>  }
>
> +static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> +
> +    return vms->kaslr_dtb_seed;
> +}
> +
> +static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **err=
p)
> +{
> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> +
> +    vms->kaslr_dtb_seed =3D value;
> +}
> +
>  static char *virt_get_oem_id(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms =3D VIRT_MACHINE(obj);
> @@ -2765,6 +2783,13 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
>                                            "Set on/off to enable/disable =
"
>                                            "ITS instantiation");
>
> +    object_class_property_add_bool(oc, "kaslr-dtb-seed",
> +                                   virt_get_kaslr_dtb_seed,
> +                                   virt_set_kaslr_dtb_seed);
> +    object_class_property_set_description(oc, "kaslr-dtb-seed",
> +                                          "Set off to disable passing of=
 kaslr "
> +                                          "dtb node to guest");
> +
>      object_class_property_add_str(oc, "x-oem-id",
>                                    virt_get_oem_id,
>                                    virt_set_oem_id);
> @@ -2829,6 +2854,9 @@ static void virt_instance_init(Object *obj)
>      /* MTE is disabled by default.  */
>      vms->mte =3D false;
>
> +    /* Supply a kaslr-seed by default */
> +    vms->kaslr_dtb_seed =3D true;
> +
>      vms->irqmap =3D a15irqmap;
>
>      virt_flash_create(vms);
> --
> 2.30.2
>

This is particularly useful if the bootloader uses a TPM to measures
the DTB and end up with a measured boot flow.

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

