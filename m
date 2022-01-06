Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A933648685C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:23:26 +0100 (CET)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5WU1-0003iD-Ki
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:23:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5WSD-0001XV-JM
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:21:33 -0500
Received: from [2a00:1450:4864:20::435] (port=46063
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5WSB-0008D5-NI
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:21:33 -0500
Received: by mail-wr1-x435.google.com with SMTP id q8so6105921wra.12
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 09:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o9TN8PffARdFKUreCcj6V8Ev1eYnWuOCBWna3DEzGZc=;
 b=exeaDta3GCjiVb7YOAg7oUZiQaZn+il7cS1RTIm4fJXnoKxihM9HRL70Af1pyrI5bO
 fWY4e9sd4IzB61VhnFBf7BxPEhVi32+im5UCxmz0PSyIYp2FoKDmpIH7LhWjGflN8Vlj
 iLunB03JgAq/wWBLdK4OfMgUJ6s2t3vGuhNs2JUxtfJC+LdtT30DCMV920YZ3WfQJ8sm
 Uahpo/T6z+vv2eG+I6RWm6scsuMq4Joj5vKuKlFuLC6hkaBWF6nCyq2lORG/uuGJG+1h
 mu77/fMqiT03HchxRPTRQr/VC65qqQz0eZSE1OcnmTxaEmdEtRur/WQTMN/ys0EoNOw+
 +Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o9TN8PffARdFKUreCcj6V8Ev1eYnWuOCBWna3DEzGZc=;
 b=yJS5Y6+mXKcgJHrnCMn4aveONzc/yiAyhwoGje8iGCbgwGoVHEzhnEcpjFOdtCgDmi
 Usq0eH1JhCABHJmApqjrQcftYRU70kwR7m46QLfwSu6EkYpFeyBRJ0cdap1Dr556nabU
 cpLsCx7vnvE0KKLigPSo8U6wUMbGuje6ZXLtt5+yVmH+4IwwzF2ur+9ISREh8bhuk1d+
 SXwAYmWwfQYXWK0S+O+HuFnOXBZE4CInCphxppsgkwFf+KXipJ1/bDDh9J19RkBBzyWi
 SHsA5b+5AfPuobyYs2V7pFrbb672zQAmdk9vLWUaJyyOZd9f0bLIoWU/Ur0XODjtzMOd
 K4mw==
X-Gm-Message-State: AOAM531HSObyIdAFVv8mhl6yx3FerToOwESlgM6TizLftOCI1QP8Ci+1
 CsaUz/Ua9yfKE23ZgMlJfm9IsNNA/dTr2NV4qzBgGQ==
X-Google-Smtp-Source: ABdhPJygGwcXtlw0w2snWzwx/m1GZEqRTBmS4x2nvyS/rdIx7Nx5zrch+MVqI5+QKqmiXY+r00qZVxSFU8r3lMtvjZA=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr30136904wrv.521.1641489690180; 
 Thu, 06 Jan 2022 09:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-22-alex.bennee@linaro.org>
In-Reply-To: <20220105135009.1584676-22-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 17:21:19 +0000
Message-ID: <CAFEAcA8p69Ws5F+LP9bNYCcw2xpfdHJNh2a-_Cg+KmRr9rthjg@mail.gmail.com>
Subject: Re: [PATCH v1 21/34] hw/arm: add control knob to disable kaslr_seed
 via DTB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, Jerome Forissier <jerome@forissier.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, "open list:Virt" <qemu-arm@nongnu.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Jan 2022 at 14:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Acked-by: Jerome Forissier <jerome@forissier.org>
> Message-Id: <20211215120926.1696302-1-alex.bennee@linaro.org>
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

We should say what the name of the DTB node is here: it is "kaslr-seed"
(in the "/chosen" and /secure-chosen nodes, if we want to get that
specific).

Side note: it's odd that in naming this proporty we've inserted "dtb" into
the middle of the node name we're controlling the creation of. Maybe
use "dtb-kaslr-seed" ?

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
> index 6bce595aba..1781e47c76 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -247,11 +247,15 @@ static void create_fdt(VirtMachineState *vms)
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
> @@ -2235,6 +2239,20 @@ static void virt_set_its(Object *obj, bool value, =
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
> @@ -2764,6 +2782,13 @@ static void virt_machine_class_init(ObjectClass *o=
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

"kaslr-seed", not just "kaslr".

> +                                          "dtb node to guest");
> +
>      object_class_property_add_str(oc, "x-oem-id",
>                                    virt_get_oem_id,
>                                    virt_set_oem_id);
> @@ -2828,6 +2853,9 @@ static void virt_instance_init(Object *obj)

-- PMM

