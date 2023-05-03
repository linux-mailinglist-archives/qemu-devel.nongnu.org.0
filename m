Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9BC6F5B9A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:56:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEp2-0000fN-OB; Wed, 03 May 2023 11:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1puEoz-0000bw-Cz
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:55:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1puEox-0006OL-C2
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683129309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PY0pQlaYe1VEeuNXU0ejMuXsXvO/ds6cZLPWBSTtftM=;
 b=BbA2eHh9IaiT4C0jY6V8KGBjgXQf63NY2DejTSDkNCltyjeMCt69tkg2Fk4XlUfMn3usXA
 N7FOu1dvDKpQwfufFWPZyobjti++jlOswGOyRrTIi2WjKZ9sTM4XQR337NjbEVdpzQWP71
 GeHZuWg4vazTDLuHvLDFm4fQ/ecl/tM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-nz_S0KFFODG_bZEK_MLogw-1; Wed, 03 May 2023 11:55:08 -0400
X-MC-Unique: nz_S0KFFODG_bZEK_MLogw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ef44f554b1so31258651cf.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683129308; x=1685721308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PY0pQlaYe1VEeuNXU0ejMuXsXvO/ds6cZLPWBSTtftM=;
 b=MG7U9fupzccSoeNQdxT/gBQ3p5iMkXwcaI5Fi1RKRMbLO+T6cmoQuqqCJguJFB+v52
 yPGy2I2yYhaRC4kXjyJK4UybU/KEzrNL90a7tFwol3iJh7q+a10/pL59EV5FfZBFZ38u
 XECymdGseO1upheUu7nWSQ9is+jJhDg+zvFkWEUB7CojUxGnX3FGvpa32DEvPmu389e7
 UZo7wAoYsJhDLKmqtSLTfHjqAoY6Wd28LXn4vfzs8ofGnrCusFBKICveXMLkE8pA8/jS
 edtzxcbApczw9Ju8QYAYr8Teie6YNKN9+cqbPvho1i+W6op0zlXff/wCFfc9ewyDbl0W
 xE1Q==
X-Gm-Message-State: AC+VfDyrK7+8kEz4LsmVajVoD/k9gDxeBoRLctkDVe2WyJnDAFhQrcA0
 rZv04ckranfgbRwOxnQifPfhzDJ+r4xTmtgOdncyFrU96hUrKckiesQIkqbVfOoLg7WPEUb20fl
 OAy8M0VxLG+qcOK83seZ4e6+MQOzV4dc=
X-Received: by 2002:ac8:598c:0:b0:3e3:7e6f:423c with SMTP id
 e12-20020ac8598c000000b003e37e6f423cmr848792qte.34.1683129307802; 
 Wed, 03 May 2023 08:55:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dIQmwLHbAvZ947M9X2NScJLbfmjQL5FdrwUBGZL06sLI3EqZDNpCpzab8R/Hp08Xt4oTUGg6uGEk8l4G7sUs=
X-Received: by 2002:ac8:598c:0:b0:3e3:7e6f:423c with SMTP id
 e12-20020ac8598c000000b003e37e6f423cmr848773qte.34.1683129307527; Wed, 03 May
 2023 08:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230503002701.854329-1-leobras@redhat.com>
 <20230503103222.00003a89@Huawei.com>
In-Reply-To: <20230503103222.00003a89@Huawei.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 3 May 2023 12:54:54 -0300
Message-ID: <CAJ6HWG5WiKfWgff-Hn9NOMb4=oDvth+N_qTeamyyD7EZp-QW1A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 3, 2023 at 6:49=E2=80=AFAM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Tue,  2 May 2023 21:27:02 -0300
> Leonardo Bras <leobras@redhat.com> wrote:
>
> > Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
> > set for machine types < 8.0 will cause migration to fail if the target
> > QEMU version is < 8.0.0 :
> >
> > qemu-system-x86_64: get_pci_config_device: Bad config data: i=3D0x10a r=
ead: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> > qemu-system-x86_64: Failed to load PCIDevice:config
> > qemu-system-x86_64: Failed to load e1000e:parent_obj
> > qemu-system-x86_64: error while loading state for instance 0x0 of devic=
e '0000:00:02.0/e1000e'
> > qemu-system-x86_64: load of migration failed: Invalid argument
> >
> > The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2=
.0,
> > with this cmdline:
> >
> > ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> >
> > In order to fix this, property x-pcie-err-unc-mask was introduced to
> > control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
> > default, but is disabled if machine type <=3D 7.2.
> >
> > Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Thanks Leo, you are a star.
>
> LGTM
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>

Thanks!

> > ---
> >  include/hw/pci/pci.h |  2 ++
> >  hw/core/machine.c    |  1 +
> >  hw/pci/pci.c         |  2 ++
> >  hw/pci/pcie_aer.c    | 11 +++++++----
> >  4 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index 935b4b91b4..e6d0574a29 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -207,6 +207,8 @@ enum {
> >      QEMU_PCIE_EXTCAP_INIT =3D (1 << QEMU_PCIE_EXTCAP_INIT_BITNR),
> >  #define QEMU_PCIE_CXL_BITNR 10
> >      QEMU_PCIE_CAP_CXL =3D (1 << QEMU_PCIE_CXL_BITNR),
> > +#define QEMU_PCIE_ERR_UNC_MASK_BITNR 11
> > +    QEMU_PCIE_ERR_UNC_MASK =3D (1 << QEMU_PCIE_ERR_UNC_MASK_BITNR),
> >  };
> >
> >  typedef struct PCIINTxRoute {
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 47a34841a5..07f763eb2e 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -48,6 +48,7 @@ GlobalProperty hw_compat_7_2[] =3D {
> >      { "e1000e", "migrate-timadj", "off" },
> >      { "virtio-mem", "x-early-migration", "false" },
> >      { "migration", "x-preempt-pre-7-2", "true" },
> > +    { TYPE_PCI_DEVICE, "x-pcie-err-unc-mask", "off" },
> >  };
> >  const size_t hw_compat_7_2_len =3D G_N_ELEMENTS(hw_compat_7_2);
> >
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index 8a87ccc8b0..5153ad63d6 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -79,6 +79,8 @@ static Property pci_props[] =3D {
> >      DEFINE_PROP_STRING("failover_pair_id", PCIDevice,
> >                         failover_pair_id),
> >      DEFINE_PROP_UINT32("acpi-index",  PCIDevice, acpi_index, 0),
> > +    DEFINE_PROP_BIT("x-pcie-err-unc-mask", PCIDevice, cap_present,
> > +                    QEMU_PCIE_ERR_UNC_MASK_BITNR, true),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >
> > diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> > index 103667c368..374d593ead 100644
> > --- a/hw/pci/pcie_aer.c
> > +++ b/hw/pci/pcie_aer.c
> > @@ -112,10 +112,13 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver=
, uint16_t offset,
> >
> >      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
> >                   PCI_ERR_UNC_SUPPORTED);
> > -    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> > -                 PCI_ERR_UNC_MASK_DEFAULT);
> > -    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> > -                 PCI_ERR_UNC_SUPPORTED);
> > +
> > +    if (dev->cap_present & QEMU_PCIE_ERR_UNC_MASK) {
> > +        pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> > +                     PCI_ERR_UNC_MASK_DEFAULT);
> > +        pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> > +                     PCI_ERR_UNC_SUPPORTED);
> > +    }
> >
> >      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
> >                   PCI_ERR_UNC_SEVERITY_DEFAULT);
>


