Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7850B776
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:35:55 +0200 (CEST)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsVu-000779-7h
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhroc-00058q-4y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhroZ-0004lH-Pc
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650628266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DfYUO6LZXiif9xY3Ubc+dYcU/79MyBrcT7CSALpOGg=;
 b=FzIj4UUy5hEOB0mUb2EP1ro2w9uEnq1HVIGF/Cu+xqNOZC9hx7dUdeQ+uKmry3FcPHXAx/
 DE0rWVZM2vkNVnhO8JQXv0u4lJDO//EkWDXpm9NumdXZ3cuOC3khdLpPevzZBIRGuufJuJ
 +xtZuQPU0mBEkYjarjNGAIYfv2x21oc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-69zI8ZxRM5Slt4jhwwVjOQ-1; Fri, 22 Apr 2022 07:51:05 -0400
X-MC-Unique: 69zI8ZxRM5Slt4jhwwVjOQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso488620wrg.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3DfYUO6LZXiif9xY3Ubc+dYcU/79MyBrcT7CSALpOGg=;
 b=Xl2tfbn00fx2NQG/soGvLiJQnvG+Up2pF4HWCrzgj2qdck64c9qoW13xveJ870TtwO
 /0AdKSbWhp/CgKTScE8zhsQVm09kgSNm/D0z3Q9cnhBCBnSsp7AzJFpcD0q1U6EGAZko
 b42oWisyOm2mtA1nlKmDnH0gZT/fY7R8TTIZLPLZFR2XuW6xgBDWvw4G5md3IziCnyai
 X99nllRC1VMXKh8DPDYP7r5lPEY2sTdxVqqAutrSkOxsyJ2HkGmkgiWDZWOMmsCOEjJG
 GwLQ7SDSKiyn5RxIpyV68Wy5rnKrM39yP3QCM8Rxs6un9A9UdAkZ9sRK3D6iRjMgGXKD
 Ok0g==
X-Gm-Message-State: AOAM533FYzxgfbXMTN3eiIu0lkH1pj5luT81B1ovL+BFOkrFO+Hw/AYT
 SZGgpAbp5/+OdNPi24VjNW64MnWwUpFz//QeMKn14Yhk2sgxOKSJGARKLRx/xsKj4jpBoDsBDkf
 14zCSFDTT/xCRXfM=
X-Received: by 2002:a1c:3bd6:0:b0:38f:4e30:6c2f with SMTP id
 i205-20020a1c3bd6000000b0038f4e306c2fmr3895521wma.66.1650628264210; 
 Fri, 22 Apr 2022 04:51:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJP14xkUzpBP+15ckd0dyWCL59KwA10T/J0P+IexMm63/z38hyaWyg5iiVnhGgxPE2JSZH2A==
X-Received: by 2002:a1c:3bd6:0:b0:38f:4e30:6c2f with SMTP id
 i205-20020a1c3bd6000000b0038f4e306c2fmr3895500wma.66.1650628263951; 
 Fri, 22 Apr 2022 04:51:03 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a1c4406000000b0039229d3c4eesm1512797wma.12.2022.04.22.04.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:51:03 -0700 (PDT)
Date: Fri, 22 Apr 2022 13:51:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Ren <renzhengeek@gmail.com>
Subject: Re: Is it possible to support hotplug device to PXB bridge?
Message-ID: <20220422135101.65796823@redhat.com>
In-Reply-To: <CAKM4AeydH7gAmZtR432uYw2jNqdokyJY4qpVvc+KN12bxtBggg@mail.gmail.com>
References: <CAKM4Aewqpfy3AGFi3Y+roA4jDigYOEbW6oBb3XpsVyxFCYne7g@mail.gmail.com>
 <YmJnYCMxG1S9pt4U@redhat.com> <20220422105745.7a20256e@redhat.com>
 <CAKM4AeydH7gAmZtR432uYw2jNqdokyJY4qpVvc+KN12bxtBggg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcel@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 17:33:08 +0800
Eric Ren <renzhengeek@gmail.com> wrote:

> Hi Igor, Daniel:
>=20
> Thanks for the hints!
>=20
> In the PXB doc (https://github.com/qemu/qemu/blob/master/docs/pci_expande=
r_bridge.txt),
> PXB device internally adds a pci bridge, according to the impl brief:
>=20
> ```
> The PXB is composed by:
> ...
> - PCIBridgeDev(TYPE_PCI_BRIDGE_DEV)
> Created automatically as part of init sequence.
> When adding a device to PXB it is attached to the bridge for two reasons:
> - Using the bridge will **enable hotplug support**
> - All the devices behind the bridge will use bridge's IO/MEM windows comp=
acting
> the PCI address space.
> ```
>=20
> A PXB device already takes 2 bus nr: 1 for the added root bus via host
> bridge, 1 for the pci bridge.
> If statically adding 1 more pci bridge, it takes 1 more pci bus...
>=20
> Anyway, will try to figure out the reason why the doc says "Using the
> bridge will enable hotplug support",
> but in fact not :-)
>=20
> The start point seemingly is, to generate correct ACPI SSDT table
> having hotplug devices/methods for slots behind the PXB
> internal pci bridge.
It doesn't look like a trivial thing to impl.

The easiest approach is what Daniel has suggested (provided guest
OS supports SHPC):

 -device pxb,id=3Dbridge1,bus=3Dpci.0,bus_nr=3D1 \
 -device pci-bridge,id=3Dhpbridge,bus=3Dbridge1,chassis_nr=3D1,shpc=3Don

then you can hotplug devices on hpbridge

Alternatively allow shpc on builtin pxb bridge, by adding a property
that could turn it on, as it's explicitly disabled at the moment:

  pxb_dev_realize_common():
     qdev_prop_set_bit(bds, PCI_BRIDGE_DEV_PROP_SHPC, false);

=20
> Regards,
> Eric Ren
>=20
> On Fri, 22 Apr 2022 at 16:57, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Fri, 22 Apr 2022 09:29:20 +0100
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > =20
> > > On Fri, Apr 22, 2022 at 03:17:11PM +0800, Eric Ren wrote: =20
> > > > Hi Marcel and all,
> > > >
> > > > It fails when I want to hotplug device to PXB bus. Then, I find this
> > > > commit that explicitely declares the fact that PXB bus does not sup=
port
> > > > hotplug device onto it.
> > > >
> > > > 7b346c742cd9 ("hw/pxb: declare pxb devices as not hot-pluggable")
> > > >
> > > > Could you please help confirm the possibility to make PXB bus hotpl=
uggable,
> > > > and the main work to achieve it if possible? =20
> > >
> > > Instead of trying to hotplug into the PXB, attach a 'pci-bridge' to t=
he
> > > PXB and then you can hotplug into the latter instead. =20
> >
> > there is no ACPI based hotplug for devices on pxb if I'm not mistaken, =
so
> > you'll likely need to enable shpc on pci-bridge.
> > =20
> > > > Yes, pxb-pcie with Q35 do support hotplug, but we use i440 machine =
a long way,
> > > > not  willing to change machine type to have it. =20
> > >
> > > With regards,
> > > Daniel =20
> > =20
>=20
>=20


