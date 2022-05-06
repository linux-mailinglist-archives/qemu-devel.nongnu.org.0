Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9E51DA7D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:27:06 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyvA-0005Wc-Pz
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nmyst-0004Uv-Uc
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:24:43 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nmysr-00037Q-Rz
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:24:43 -0400
Received: by mail-qt1-x831.google.com with SMTP id e15so6076565qtp.3
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vBb35nuDvoGry9MbKVXK5aoCC8pfrmIKNKepBuEWZ3M=;
 b=fo/r8S1BQf1d1Dcu/PE6UEdzupJ9TE3jKuDYs/9SIewFhSxorrkJ6g943u4TKOeET9
 MGw8/d+o1qoTd+p43urj3IVDygt0ZBgKxLbhQtYxCLeDRDl/bNR3w5jvMhqrEUsSCV1Z
 R8U0OQ4ZG19/1U3QkUZ1+jh8+HJyCkT/MJyFxgQuxwvaWBTqCpJYk+8/Onn5dl2VNxtr
 XNU29FyvPp+fLsWzaA5PLuyaGeNJujPM8TeZZHjkXZYIPpctmYY8jUveqmXxLcOrbMhO
 C8xgRKkZu4Lu9EtP2S043Uix1kRhYasWXfdMxzcW6iWxSwu3/vS9LpBXIh3t6E6ABaQv
 tgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vBb35nuDvoGry9MbKVXK5aoCC8pfrmIKNKepBuEWZ3M=;
 b=TzllkSP3C9FfNqYmeW92gEW3Z/Q/JHcOA7IMK3YQ088DfccZLLX4CEO//XkR9DmkX2
 nRGj8aDIeQ/fhVKvlTeFGvJocClulQP1e6QHWSZjn1MAPMpTOdtWRdGgNHgLjY5hlkcr
 JNZCRknWn4X1VC2Dr06JhF0HpkPqrcdBfwa8AKuVMK29AWQwhXJDyLaLHiEzEx/c5TR4
 Z/xHqpiHnqCvJ1bqqdTfaPLoelLbMmg0KXLSwffg4+u6On+ZWmwmPQwSPDa3LJit7Zye
 lUhVELcYomXNvJvtNLLivCoiPi8f9kSgwRw5Qj+FHg6prESwb0uMGe6RnewFQCAltVKG
 hvXw==
X-Gm-Message-State: AOAM532kFJdflsAlMEJ9CPShb7leiQ2eXoK3bI4TxpLjIDeKPdz5QJKF
 mGlZ/hB9fnz8aXCSopmZYFA=
X-Google-Smtp-Source: ABdhPJwaN/WYTO/kDPE/kxI5e606KYt86yH+SxIUSG0KMHowA8Wg+/S+2Gt6wmE1K+dhd49g+HUp4A==
X-Received: by 2002:a05:622a:2c7:b0:2f3:b33d:363b with SMTP id
 a7-20020a05622a02c700b002f3b33d363bmr2972778qtx.36.1651847080464; 
 Fri, 06 May 2022 07:24:40 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 x74-20020a37634d000000b0069ff51425a2sm2472834qkb.120.2022.05.06.07.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:24:40 -0700 (PDT)
Date: Fri, 6 May 2022 15:24:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com
Cc: qemu-devel@nongnu.org, thuth@redhat.com, peter.maydell@linaro.org,
 Gautam Agrawal <gutamnagrawal@gmail.com>
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
Message-ID: <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FS/aCzulvTyM17l8"
Content-Disposition: inline
In-Reply-To: <20220501122505.29202-1-gautamnagrawal@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=stefanha@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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


--FS/aCzulvTyM17l8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 01, 2022 at 05:55:05PM +0530, Gautam Agrawal wrote:
> A global boolean variable "vga_interface_created"(declared in softmmu/glo=
bals.c)
> has been used to track the creation of vga interface. If the vga flag is =
passed
> in the command line "default_vga"(declared in softmmu/vl.c) variable is s=
et to 0.
> To warn user, the condition checks if vga_interface_created is false
> and default_vga is equal to 0. If "-vga none" is passed, this patch will =
not warn the
> user regarding the creation of VGA device.
>=20
> The warning "A -vga option was passed but this
> machine type does not use that option; no VGA device has been created"
> is logged if vga flag is passed but no vga device is created.
>=20
> This patch has been tested for x86_64, i386, sparc, sparc64 and arm board=
s.
>=20
> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
> ---
>  hw/hppa/machine.c         | 1 +
>  hw/isa/isa-bus.c          | 1 +
>  hw/mips/fuloong2e.c       | 1 +
>  hw/pci/pci.c              | 1 +
>  hw/ppc/spapr.c            | 1 +
>  hw/sparc/sun4m.c          | 2 ++
>  hw/sparc64/sun4u.c        | 1 +
>  hw/xenpv/xen_machine_pv.c | 1 +
>  include/sysemu/sysemu.h   | 1 +
>  softmmu/globals.c         | 1 +
>  softmmu/vl.c              | 6 ++++++
>  11 files changed, 17 insertions(+)

Gerd or Richard: do you want to merge this patch?

Thanks,
Stefan

>=20
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index f7595c0857..2e37349347 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -192,6 +192,7 @@ static void machine_hppa_init(MachineState *machine)
> =20
>      /* Graphics setup. */
>      if (machine->enable_graphics && vga_interface_type !=3D VGA_NONE) {
> +        vga_interface_created =3D true;
>          dev =3D qdev_new("artist");
>          s =3D SYS_BUS_DEVICE(dev);
>          sysbus_realize_and_unref(s, &error_fatal);
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 0ad1c5fd65..cd5ad3687d 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -166,6 +166,7 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bu=
s, Error **errp)
> =20
>  ISADevice *isa_vga_init(ISABus *bus)
>  {
> +    vga_interface_created =3D true;
>      switch (vga_interface_type) {
>      case VGA_CIRRUS:
>          return isa_create_simple(bus, "isa-cirrus-vga");
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 7b13098f9b..5ee546f5f6 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -320,6 +320,7 @@ static void mips_fuloong2e_init(MachineState *machine)
> =20
>      /* GPU */
>      if (vga_interface_type !=3D VGA_NONE) {
> +        vga_interface_created =3D true;
>          pci_dev =3D pci_new(-1, "ati-vga");
>          dev =3D DEVICE(pci_dev);
>          qdev_prop_set_uint32(dev, "vgamem_mb", 16);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index e99417e501..9c58f02853 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2037,6 +2037,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus =
*rootbus,
> =20
>  PCIDevice *pci_vga_init(PCIBus *bus)
>  {
> +    vga_interface_created =3D true;
>      switch (vga_interface_type) {
>      case VGA_CIRRUS:
>          return pci_create_simple(bus, -1, "cirrus-vga");
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 22569305d2..9df493cfe2 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1742,6 +1742,7 @@ static void spapr_rtc_create(SpaprMachineState *spa=
pr)
>  /* Returns whether we want to use VGA or not */
>  static bool spapr_vga_init(PCIBus *pci_bus, Error **errp)
>  {
> +    vga_interface_created =3D true;
>      switch (vga_interface_type) {
>      case VGA_NONE:
>          return false;
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index fccaed1eb4..b693eea0e0 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -920,6 +920,7 @@ static void sun4m_hw_init(MachineState *machine)
>              /* sbus irq 5 */
>              cg3_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
>                       graphic_width, graphic_height, graphic_depth);
> +            vga_interface_created =3D true;
>          } else {
>              /* If no display specified, default to TCX */
>              if (graphic_depth !=3D 8 && graphic_depth !=3D 24) {
> @@ -935,6 +936,7 @@ static void sun4m_hw_init(MachineState *machine)
> =20
>              tcx_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
>                       graphic_width, graphic_height, graphic_depth);
> +            vga_interface_created =3D true;
>          }
>      }
> =20
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 6fd08e2298..7c461d194a 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -632,6 +632,7 @@ static void sun4uv_init(MemoryRegion *address_space_m=
em,
>      switch (vga_interface_type) {
>      case VGA_STD:
>          pci_create_simple(pci_busA, PCI_DEVFN(2, 0), "VGA");
> +        vga_interface_created =3D true;
>          break;
>      case VGA_NONE:
>          break;
> diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
> index 8df575a457..20c9611d71 100644
> --- a/hw/xenpv/xen_machine_pv.c
> +++ b/hw/xenpv/xen_machine_pv.c
> @@ -63,6 +63,7 @@ static void xen_init_pv(MachineState *machine)
>      if (vga_interface_type =3D=3D VGA_XENFB) {
>          xen_config_dev_vfb(0, "vnc");
>          xen_config_dev_vkbd(0);
> +        vga_interface_created =3D true;
>      }
> =20
>      /* configure disks */
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 10e283c170..360a408edf 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -34,6 +34,7 @@ typedef enum {
>  } VGAInterfaceType;
> =20
>  extern int vga_interface_type;
> +extern bool vga_interface_created;
> =20
>  extern int graphic_width;
>  extern int graphic_height;
> diff --git a/softmmu/globals.c b/softmmu/globals.c
> index 3ebd718e35..98b64e0492 100644
> --- a/softmmu/globals.c
> +++ b/softmmu/globals.c
> @@ -40,6 +40,7 @@ int nb_nics;
>  NICInfo nd_table[MAX_NICS];
>  int autostart =3D 1;
>  int vga_interface_type =3D VGA_NONE;
> +bool vga_interface_created;
>  Chardev *parallel_hds[MAX_PARALLEL_PORTS];
>  int win2k_install_hack;
>  int singlestep;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 06a0e342fe..8411cb15af 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2734,6 +2734,12 @@ static void qemu_machine_creation_done(void)
>      if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
>          exit(1);
>      }
> +    if (!vga_interface_created && !default_vga &&
> +        vga_interface_type !=3D VGA_NONE) {
> +        warn_report("A -vga option was passed but this machine "
> +                    "type does not use that option; "
> +                    "No VGA device has been created");
> +    }
>  }
> =20
>  void qmp_x_exit_preconfig(Error **errp)
> --=20
> 2.34.1
>=20

--FS/aCzulvTyM17l8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJ1L6YACgkQnKSrs4Gr
c8gVdAf/SY+t+rzL3QQn2BbOJmSZlllg2DHcj0WEkKKWoL1bg4WEghGwJm2GzzbF
pN3HHhclVwsPzTlfgPt81Myecm+E0iY0SujMKkBhHfKRvTjmXF382t7wSSKNPc0f
I8S+q5rxNTEJKPvFrGFb7wVBQNj4/IDtzzQNrbR6C5FwpynLkCS+XHx2gmbTuqTG
mKJmCwmyYtU0tWCklRWCkDTByr0eK+YSEjzSX6og0LVDAqoGOku68HRdhSwi4z87
9z/0hIxn8h613LaANUrhd+l345swEhYS/REurkZGwtyAeZyCg2xBGyaRF5vib2i/
3rR0NciPXc3lCqxgr6fECkXvIv/smw==
=uN7r
-----END PGP SIGNATURE-----

--FS/aCzulvTyM17l8--

