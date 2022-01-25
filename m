Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4049BA16
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 18:20:33 +0100 (CET)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCPUe-0007zE-50
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 12:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCPST-0006Ir-IY
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:18:17 -0500
Received: from [2a00:1450:4864:20::52c] (port=37882
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCPSR-00063R-Ev
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 12:18:17 -0500
Received: by mail-ed1-x52c.google.com with SMTP id c24so62438845edy.4
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Y9VMEWa9H0pf+42UoNVqVS4zeqbjbQp1/KTw6BBvYjQ=;
 b=k+hacKB1JNkWUt06j0MFO3fHma249npXlaXYW33blM5BtiOVGD+KpZHaEJ8XCRbiE5
 MxlKqLIIUXtINNaXHJwSq2eHkkM88DNAXGQ5gxagiU+Bs9bJm0XCiymLLvf4/r4OPlpz
 0QQlsKnmZfABA6vheAZiStClJs5eOJWHESTU/iHYoHLCKHwgaHRQUSu6021FaKUqSy8j
 egQJ62fs8ow76EkUVG0Wv2G5ubd738mIUAyTKFQ4VAfbLKAGrny5LjHfqJOQBHYo4nFu
 6iGWSe41rREa4HWdFF3x+3hgd77+VteAb3pGnCxbJDnwYkbc8+WVwmz4ZqJYfxkhvMFT
 15Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Y9VMEWa9H0pf+42UoNVqVS4zeqbjbQp1/KTw6BBvYjQ=;
 b=XBJOyF630AdVu71XRg7+QFveoF1Gg9YE74fj79ppf1BBaTr7k9Y2hj9RyNnEWnhy64
 GeDl07Ono1mttc8bTH1L6CpA9OQfFVgYQDYxV1jZebpXOcXjp9IDllO31J9jzNsq9pFq
 W/tCekBLugpgMGBnnAaw6j9ePYqDwVMJNe/bYkpnYV7tWY66t4w7y7eIQX9m7RpdJnXb
 T7JidNPkFqMskBEMLgNXQcETvTjYmp8wYfvi/e/uiBrH49XtX5tqqeBvu2+vxyZHIzTL
 PVI6TrJ4aCCHl3hByr+tx6VgEAznyrYm93IlWjGf4v0Sa3OC1ieXQ7g54ZkYLm6UwhK7
 MOIQ==
X-Gm-Message-State: AOAM530w9Djifm5HOZ3upIFBOHKlWfR/WDn7huKbsIBGiMHO1KvLGQCl
 Jr/DrDXb7F4uN4WrNAd77Pxjnw==
X-Google-Smtp-Source: ABdhPJygticXyEYjy7Zz41weq3cMbKrMWFppmNbnooHAMX4Omv8RIoM/nBCf8c+MdNq8EwA7CXNTMw==
X-Received: by 2002:a05:6402:450:: with SMTP id
 p16mr20973872edw.113.1643131090650; 
 Tue, 25 Jan 2022 09:18:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm8533693edh.75.2022.01.25.09.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 09:18:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D95091FFB7;
 Tue, 25 Jan 2022 17:18:08 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-32-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 31/42] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Date: Tue, 25 Jan 2022 17:15:58 +0000
In-reply-to: <20220124171705.10432-32-Jonathan.Cameron@huawei.com>
Message-ID: <87o83zd99r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> This adds code to instantiate the slightly extended ACPI root port
> description in DSDT as per the CXL 2.0 specification.
>
> Basically a cut and paste job from the i386/pc code.

This fails to build on all machines:

  FAILED: qemu-system-mips64el=20
  c++ -m64 -mcx16  -o qemu-system-mips64el qemu-system-mips64el.p/softmmu_m=
ain.c.o <snip> subprojects/libvhost-user/libvhost-user.a libmigration.fa li=
bhwcore.fa libqom.fa libio.fa libcrypto.fa libauthz.fa libblockdev.fa libbl=
ock.fa libchardev.fa libqmp.fa @block.syms @qemu.syms /usr/lib/x86_64-linux=
-gnu/libpixman-1.so -lepoxy /usr/lib/x86_64-linux-gnu/libcapstone.so /usr/l=
ib/x86_64-linux-gnu/libspice-server.so -Xlinker --dynamic-list=3D/home/alex=
/lsrc/qemu.git/plugins/qemu-plugins.symbols /usr/lib/x86_64-linux-gnu/libz.=
so /usr/lib/x86_64-linux-gnu/libpng16.so /usr/lib/x86_64-linux-gnu/libjpeg.=
so /usr/lib/x86_64-linux-gnu/libgnutls.so -lsasl2 /usr/lib/x86_64-linux-gnu=
/libpmem.so /usr/lib/x86_64-linux-gnu/libseccomp.so -lnuma -lgio-2.0 -lgobj=
ect-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lrdmacm -libverbs -l=
ibumad /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/libzstd.s=
o /usr/lib/x86_64-linux-gnu/libslirp.so /usr/lib/x86_64-linux-gnu/libglib-2=
.0.so -lvdeplug /usr/lib/x86_64-linux-gnu/libudev.so /usr/lib/x86_64-linux-=
gnu/libbpf.so /usr/lib/x86_64-linux-gnu/libasound.so /usr/lib/x86_64-linux-=
gnu/libpulse.so -lbrlapi /usr/lib/x86_64-linux-gnu/libvirglrenderer.so /usr=
/lib/x86_64-linux-gnu/libusb-1.0.so /usr/lib/x86_64-linux-gnu/libusbredirpa=
rser.so /usr/lib/x86_64-linux-gnu/libcacard.so -lncursesw -ltinfo -pthread =
-lgmodule-2.0 -lglib-2.0 /usr/lib/x86_64-linux-gnu/libgbm.so /usr/lib/x86_6=
4-linux-gnu/libgtk-3.so /usr/lib/x86_64-linux-gnu/libgdk-3.so /usr/lib/x86_=
64-linux-gnu/libpangocairo-1.0.so /usr/lib/x86_64-linux-gnu/libpango-1.0.so=
 /usr/lib/x86_64-linux-gnu/libharfbuzz.so /usr/lib/x86_64-linux-gnu/libatk-=
1.0.so /usr/lib/x86_64-linux-gnu/libcairo-gobject.so /usr/lib/x86_64-linux-=
gnu/libcairo.so /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so /usr/lib/x86=
_64-linux-gnu/libgio-2.0.so /usr/lib/x86_64-linux-gnu/libgobject-2.0.so /us=
r/lib/x86_64-linux-gnu/libvte-2.91.so /usr/lib/x86_64-linux-gnu/libX11.so @=
block.syms -lutil -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.=
0 -lglib-2.0 -lgmodule-2.0 -lglib-2.0 -lm -lgmodule-2.0 -lglib-2.0 /usr/lib=
/x86_64-linux-gnu/libiscsi.so -laio /usr/lib/x86_64-linux-gnu/libcurl.so -l=
gmodule-2.0 -lglib-2.0 -lbz2 /usr/lib/x86_64-linux-gnu/libacl.so /usr/lib/x=
86_64-linux-gnu/libgfapi.so /usr/lib/x86_64-linux-gnu/libglusterfs.so /usr/=
lib/x86_64-linux-gnu/libgfrpc.so /usr/lib/x86_64-linux-gnu/libgfxdr.so /usr=
/lib/x86_64-linux-gnu/libuuid.so /usr/lib/x86_64-linux-gnu/libnfs.so -lrbd =
-lrados /usr/lib/x86_64-linux-gnu/libssh.so -lstdc++ -Wl,--end-group
  /usr/bin/ld: /lib/x86_64-linux-gnu/libtirpc.so.3: warning: common of `rpc=
_createerr@@GLIBC_2.2.5' overridden by definition from /lib/x86_64-linux-gn=
u/libc.so.6
  /usr/bin/ld: libcommon.fa.p/hw_pci-host_gpex-acpi.c.o: in function `acpi_=
dsdt_add_gpex':
  /home/alex/lsrc/qemu.git/builds/all/../../hw/pci-host/gpex-acpi.c:191: un=
defined reference to `build_cxl_osc_method'
  collect2: error: ld returned 1 exit status
  [1600/2203] Linking target qemu-system-or1k


>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  hw/arm/Kconfig          |  1 +
>  hw/pci-host/gpex-acpi.c | 22 +++++++++++++++++++---
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2e0049196d..3df419fa6d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -29,6 +29,7 @@ config ARM_VIRT
>      select ACPI_APEI
>      select ACPI_VIOT
>      select VIRTIO_MEM_SUPPORTED
> +    select ACPI_CXL
>=20=20
>  config CHEETAH
>      bool
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index e7e162a00a..fb60aa517f 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -5,6 +5,7 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci/pcie_host.h"
> +#include "hw/acpi/cxl.h"
>=20=20
>  static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
>  {
> @@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig=
 *cfg)
>          QLIST_FOREACH(bus, &bus->child, sibling) {
>              uint8_t bus_num =3D pci_bus_num(bus);
>              uint8_t numa_node =3D pci_bus_numa_node(bus);
> +            bool is_cxl;
>=20=20
>              if (!pci_bus_is_root(bus)) {
>                  continue;
> @@ -153,9 +155,19 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfi=
g *cfg)
>                  nr_pcie_buses =3D bus_num;
>              }
>=20=20
> +            is_cxl =3D pci_bus_is_cxl(bus);
> +
>              dev =3D aml_device("PC%.02X", bus_num);
> -            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08"))=
);
> -            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03"))=
);
> +            if (is_cxl) {
> +                struct Aml *pkg =3D aml_package(2);
> +                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI00=
16")));
> +                aml_append(pkg, aml_eisaid("PNP0A08"));
> +                aml_append(pkg, aml_eisaid("PNP0A03"));
> +                aml_append(dev, aml_name_decl("_CID", pkg));
> +            } else {
> +                aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A0=
8")));
> +                aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A0=
3")));
> +            }
>              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
>              aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
>              aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Devic=
e")));
> @@ -175,7 +187,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfi=
g *cfg)
>                              cfg->pio.base, 0, 0, 0);
>              aml_append(dev, aml_name_decl("_CRS", crs));
>=20=20
> -            acpi_dsdt_add_pci_osc(dev);
> +            if (is_cxl) {
> +                build_cxl_osc_method(dev);

Either we need an #ifdef gate on CONFIG_ACPI_CXL or possibly a stub
implementation (with a g_assert_not_reached()).

> +            } else {
> +                acpi_dsdt_add_pci_osc(dev);
> +            }
>=20=20
>              aml_append(scope, dev);
>          }


--=20
Alex Benn=C3=A9e

