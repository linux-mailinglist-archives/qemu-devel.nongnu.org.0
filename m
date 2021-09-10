Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A7407356
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 00:26:22 +0200 (CEST)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOoyT-0008Rt-8i
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 18:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mOoww-0007fP-Ec
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 18:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mOows-0002U7-Nt
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 18:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631312680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfeoIy2n2aawgNdQlmeOS/MF8eJE0e5Ge4thWOvS1kI=;
 b=DVTXkA5u7pvjLcqeTowun5RsSgYN/yTHfO1/WAzGNHFPED6gMsVrCLIIp/spaSOMTVnVBl
 rAzuaSpCnyTGtCZ8H/sPW8qB8On7LFt900QKoCtMLR5KjWOvLVKTVJ4Cj+0XqCdGNUfLR6
 6MR924GrM6peYOXIb/ht7Daqd1utGGQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-qcMWnDefNzCrIwOOQmrpFg-1; Fri, 10 Sep 2021 18:24:39 -0400
X-MC-Unique: qcMWnDefNzCrIwOOQmrpFg-1
Received: by mail-oo1-f70.google.com with SMTP id
 w20-20020a4a7654000000b002917fdff67fso2117071ooe.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 15:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=AYv94WU58Pm070/l+zhT6QfIf2GOWLbWoNN/feYQnhU=;
 b=AVtgDZ/LY7bHDG66hDEKz3WoL0h2QXaF2MHYf9Ag4O8X4ykI4+ynZRQXcnq3f71Xaf
 5kVgiofecbP4nOwvNHhNupnSrXuxPIW9si+9McmWsdWHSYWq5Oko6dXEUoB9zbSuMaGT
 OCKhxMB7mFpj1HGj5LVIlb9zOKw4Jpli6IKrkbKF1jlIaxwXeEIE9lRV6wjuh95FgGgO
 XEMtt9Re7XikuzM47F+jCwioyd64GwjEbYCTZ2u6hJSRC1YQggpxXNC4JCJITuaMvzjn
 wAx7cFG3fV2q3W3Xjg4VhtR9SBm9yLVlHQia7fqDhD57VWT4eESXUrwAIL4EYiPX2iIA
 Rrjg==
X-Gm-Message-State: AOAM533Ih7FZGVN2Y/xq8Tus1/ROVyCXL1W6Hvv2N+YqmsuSBHAQqOPl
 Hc3YDxp2s9AlXfegnryoT1shnB929sDGCPpW3pvzxnRTVItN/wz+eAHlo7UrVouUEK0GgzXRm/t
 Xz+gmg/FZ18x+lFE=
X-Received: by 2002:a05:6808:56:: with SMTP id v22mr10619oic.49.1631312677729; 
 Fri, 10 Sep 2021 15:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5fkbKkcFLLMiPeHRit9o6cD8iRQl29rmnzeP4csmm5RuFKCXZ7NyRfLbEMLUM/jJ5QfuqBw==
X-Received: by 2002:a05:6808:56:: with SMTP id v22mr10604oic.49.1631312677498; 
 Fri, 10 Sep 2021 15:24:37 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id z25sm3583oic.24.2021.09.10.15.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 15:24:37 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:24:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in
 live migration
Message-ID: <20210910162435.7dfadf96.alex.williamson@redhat.com>
In-Reply-To: <10e2296d-5bf4-7b83-c2a6-42f3e37ceb95@huawei.com>
References: <20210903093611.1159-1-jiangkunkun@huawei.com>
 <20210903093611.1159-2-jiangkunkun@huawei.com>
 <20210908144535.66463b6c.alex.williamson@redhat.com>
 <10e2296d-5bf4-7b83-c2a6-42f3e37ceb95@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 tangnianyao@huawei.com, ganqixin@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sep 2021 16:33:12 +0800
Kunkun Jiang <jiangkunkun@huawei.com> wrote:

> Hi Alex,
>=20
> On 2021/9/9 4:45, Alex Williamson wrote:
> > On Fri, 3 Sep 2021 17:36:10 +0800
> > Kunkun Jiang <jiangkunkun@huawei.com> wrote:
> > =20
> >> We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
> >> vfio_pci_write_config to improve IO performance.
> >> The MemoryRegions of destination VM will not be expanded
> >> successful in live migration, because their addresses have
> >> been updated in vmstate_load_state (vfio_pci_load_config). =20
> > What's the call path through vfio_pci_write_config() that you're
> > relying on to get triggered to enable this and why wouldn't we just
> > walk all sub-page BARs in vfio_pci_load_config() to resolve the issue
> > then?  It's my understanding that we do this update in write-config
> > because it's required that the VM sizes the BAR before using it, which
> > is not the case when we resume from migration.  Thanks, =20
> Let's take an example:
>=20
> AArch64
> host page granularity: 64KB
> PCI device: *Bar2 size 32KB* [mem 0x8000200000-0x800020ffff 64bit pref]
>=20
> When enable Command register bit 1(Memory Space), the code flow is
> as follows:
>=20
> vfio_pci_write_config (addr: 4 val: 2 len: 2)
>  =C2=A0=C2=A0=C2=A0 // record the old address of each bar, 0xffffffffffff=
ffff
>  =C2=A0=C2=A0=C2=A0 old_addr[bar] =3D pdev->io_regions[bar].addr;
>  =C2=A0=C2=A0=C2=A0 pci_default_write_config
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_update_mappings
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_a=
ddr =3D pci_bar_address=C2=A0=C2=A0=C2=A0 // 0x8000200000
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r->ad=
dr =3D new_addr;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memor=
y_region_addr_subregion_overlap
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ...
> *vfio_listener_region_add*
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alignment check of the ram secti=
on address and size=20
> fail, return
> *kvm_region_add*
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_set_phys_mem
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alignmen=
t check of the ram section address and=20
> size fail, return
>=20
>  =C2=A0=C2=A0=C2=A0 // old_addr[bar] !=3D pdev->io_regions[bar].addr &&
>  =C2=A0=C2=A0=C2=A0 // 0 < vdev->bars[bar].region.size < qemu_real_host_p=
age_size
>  =C2=A0=C2=A0=C2=A0 vfio_sub_page_bar_update_mapping
> *bar size =3D qemu_real_host_page_size*
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfio_=
listener_region_add
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 map success
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_r=
egion_add
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 kvm_set_phys_mem
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 map success
>=20
> In live migration, only pci config data is sent to the destination VM.
> Therefore, we need to update the bar's size before destination VM
> using it.
>=20
> In vfio_pci_load_config, the code flow is as follows:
>=20
> vfio_pci_load_config
>  =C2=A0=C2=A0=C2=A0 vmstate_load_state
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *get_pci_config_device*
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_u=
pdate_mappings
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ...
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 // bar's addr is updated(0x8000200000), but bar's size=
=20
> is still 32KB, so map failed
>  =C2=A0=C2=A0=C2=A0 vfio_pci_write_config
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // bar's addr will not be cha=
nged, so=20
> vfio_sub_page_bar_update_mapping won't be called
>=20
> My idea is that removing the check 'old_addr[bar] !=3D=20
> pdev->io_regions[bar].addr' doesn't
> affect the previous process. There's also a bar size check. In=20
> vfio_sub_page_bar_update_mapping,
> it will check if bar is mapped and page aligned.
> 1) If bar's addr is 0xffffffffffffffff, it will not pass the=20
> vfio_sub_page_bar_update_mapping check.
> 2) If bar's size has been updated, it will not pass the bar size check=20
> in vfio_pci_write_config.

The bar size check in vfio_pci_write_config() only tests if the vfio
region is >0 and <qemu_real_host_page_size, afaict our sub-page support
affects the size of the MemoryRegions mapping the vfio region, but we
never change the vfio region size itself.  So if you're expecting
(vdev->bars[bar].region.size =3D=3D qemu_real_host_page_size) once we setup
the sub-page support, I'm not convinced that's true.

So yes, sub-page-update can reject invalid addresses and we already
rely on it to do so, but the code being removed avoids that redundant
writes to the BAR won't trigger redundant MemoryRegion manipulation.
Maybe those are harmless, but that's not your argument for allowing it.

OTOH, why wouldn't vfio_pci_load_config() iterate sub-page BARs and try
to update them at that time?  Thanks,

Alex


> >    =20
> >> Remove the restriction on base address change in
> >> vfio_pci_write_config for correct mmapping sub-page MMIO
> >> BARs. Accroding to my analysis, the remaining parameter
> >> verification is enough.
> >>
> >> Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI dev=
ices)
> >> Reported-by: Nianyao Tang <tangnianyao@huawei.com>
> >> Reported-by: Qixin Gan <ganqixin@huawei.com>
> >> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> >> ---
> >>   hw/vfio/pci.c | 8 +-------
> >>   1 file changed, 1 insertion(+), 7 deletions(-)
> >>
> >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> >> index e1ea1d8a23..891b211ddf 100644
> >> --- a/hw/vfio/pci.c
> >> +++ b/hw/vfio/pci.c
> >> @@ -1189,18 +1189,12 @@ void vfio_pci_write_config(PCIDevice *pdev,
> >>           }
> >>       } else if (ranges_overlap(addr, len, PCI_BASE_ADDRESS_0, 24) ||
> >>           range_covers_byte(addr, len, PCI_COMMAND)) {
> >> -        pcibus_t old_addr[PCI_NUM_REGIONS - 1];
> >>           int bar;
> >>  =20
> >> -        for (bar =3D 0; bar < PCI_ROM_SLOT; bar++) {
> >> -            old_addr[bar] =3D pdev->io_regions[bar].addr;
> >> -        }
> >> -
> >>           pci_default_write_config(pdev, addr, val, len);
> >>  =20
> >>           for (bar =3D 0; bar < PCI_ROM_SLOT; bar++) {
> >> -            if (old_addr[bar] !=3D pdev->io_regions[bar].addr &&
> >> -                vdev->bars[bar].region.size > 0 &&
> >> +            if (vdev->bars[bar].region.size > 0 &&
> >>                   vdev->bars[bar].region.size < qemu_real_host_page_si=
ze) {
> >>                   vfio_sub_page_bar_update_mapping(pdev, bar);
> >>               } =20
> > . =20
>=20
>=20


