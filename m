Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60B4FF8EA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 16:27:45 +0200 (CEST)
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nedyC-0003pT-IQ
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 10:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nedwY-0002xz-9p
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 10:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nedwU-0005LT-Ns
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 10:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649859957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNct+UnPY7xN4B880I1y53wYH8m+9lhAyWGet5f0sZs=;
 b=B02sS7viWv283R3nJQkm+AIK/gz7/vG9ctMAU16Qzxf32E3ug9qu8BkxQZVGoMGkiJnGJ3
 9y0QWWAyPl3y31ApPTM81CQh6tw0TsjH6bHq2UJ7ZIJncb/x9FNfH1CEKzOJl1IHcMDI1c
 IyRA9CfPNfa/PFO70Cfjt8u4ZSMeYAg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-O1YkN6uJM6mwYJY1apq60g-1; Wed, 13 Apr 2022 10:25:54 -0400
X-MC-Unique: O1YkN6uJM6mwYJY1apq60g-1
Received: by mail-ed1-f72.google.com with SMTP id
 i4-20020aa7c9c4000000b00419c542270dso1167565edt.8
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 07:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNct+UnPY7xN4B880I1y53wYH8m+9lhAyWGet5f0sZs=;
 b=Emuqxln/WJ4vAtW3auUqw+FLcum28ete0kXnF9WXYfPjAebJXTlWTVvHoMwJAI6Ntp
 k86/r8gjYmFOzfmNqTOFvDtKJDdf8uW7GIe/tVLYGMIUYU4wseuR2Qqh5UYNEBQSja02
 z07caJpvfyts2jlg562EYGamMzNfvv8DizUXUQ6LT/8zPtfrXg2nx16jKglBfn9bebcX
 Pgy7tQpfenmnfqvZ9mWwIV74RnF+v2ZFoaXUSO+lft0YucgfMJrxrHqzaYu+Jp+ewbWB
 TJQBQfGxA/KINA/TkSZVxDa9bWGCDm+HpO0oiS0kIzSOUNCe8Mtzj9AO6qdB6i7CMF83
 BHew==
X-Gm-Message-State: AOAM533YWcZJHo+GjkapGr/n9dwRIUg+x9Y9qVBa/Kk1rpQV7pwNP4iy
 Ie4UcK22aeIHzuk4QLPwXKtsXrq3q0zrTCJCqodBGN95tDAkTZciJ1dcpQxDKh73jIsk2Vk/lQ0
 iEy4F9uhk/PkqvqA=
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id
 hd15-20020a170907968f00b006dba3c5ae3emr39491693ejc.770.1649859952964; 
 Wed, 13 Apr 2022 07:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEfzyNEIVkhP/j6iRbOcFSaa8bjW+5+dzwLfBOJ1rSK7IvZaLS8rWcn9joWfbSXfCuFqm3vA==
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id
 hd15-20020a170907968f00b006dba3c5ae3emr39491678ejc.770.1649859952777; 
 Wed, 13 Apr 2022 07:25:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a17090690c600b006e8a4cdb77dsm36918ejw.225.2022.04.13.07.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 07:25:52 -0700 (PDT)
Date: Wed, 13 Apr 2022 16:25:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <20220413162550.4a02be89@redhat.com>
In-Reply-To: <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, berrange@redhat.com,
 bleal@redhat.com, john.g.johnson@oracle.com, john.levon@nutanix.com,
 qemu-devel@nongnu.org, armbru@redhat.com, quintela@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, mst@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Mar 2022 15:19:41 -0400
Jagannathan Raman <jag.raman@oracle.com> wrote:

> Assign separate address space for each device in the remote processes.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/remote/iommu.h | 18 ++++++++
>  hw/remote/iommu.c         | 95 +++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS               |  2 +
>  hw/remote/meson.build     |  1 +
>  4 files changed, 116 insertions(+)
>  create mode 100644 include/hw/remote/iommu.h
>  create mode 100644 hw/remote/iommu.c
>=20
> diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
> new file mode 100644
> index 0000000000..8f850400f1
> --- /dev/null
> +++ b/include/hw/remote/iommu.h
> @@ -0,0 +1,18 @@
> +/**
> + * Copyright =C2=A9 2022 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef REMOTE_IOMMU_H
> +#define REMOTE_IOMMU_H
> +
> +#include "hw/pci/pci_bus.h"
> +
> +void remote_configure_iommu(PCIBus *pci_bus);
> +
> +void remote_iommu_del_device(PCIDevice *pci_dev);
> +
> +#endif
> diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
> new file mode 100644
> index 0000000000..13f329b45d
> --- /dev/null
> +++ b/hw/remote/iommu.c
> @@ -0,0 +1,95 @@
> +/**
> + * IOMMU for remote device
> + *
> + * Copyright =C2=A9 2022 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "hw/remote/iommu.h"
> +#include "hw/pci/pci_bus.h"
> +#include "hw/pci/pci.h"
> +#include "exec/memory.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
> +
> +struct RemoteIommuElem {
> +    AddressSpace  as;
> +    MemoryRegion  mr;
> +};
> +
> +struct RemoteIommuTable {
> +    QemuMutex lock;
> +    GHashTable *elem_by_bdf;
> +} remote_iommu_table;
> +
> +#define INT2VOIDP(i) (void *)(uintptr_t)(i)
> +
> +static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
> +                                              void *opaque, int devfn)
> +{
> +    struct RemoteIommuTable *iommu_table =3D opaque;
> +    struct RemoteIommuElem *elem =3D NULL;
> +    int pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_bus), devfn);
> +
> +    elem =3D g_hash_table_lookup(iommu_table->elem_by_bdf, INT2VOIDP(pci=
_bdf));
> +
> +    if (!elem) {
> +        g_autofree char *mr_name =3D g_strdup_printf("vfu-ram-%d", pci_b=
df);
> +        g_autofree char *as_name =3D g_strdup_printf("vfu-as-%d", pci_bd=
f);
> +
> +        elem =3D g_malloc0(sizeof(struct RemoteIommuElem));
> +
> +        memory_region_init(&elem->mr, NULL, mr_name, UINT64_MAX);
goes here:
   memory_region_do_init()
        if (!owner) {                                                      =
     =20
            owner =3D container_get(qdev_get_machine(), "/unattached");    =
       =20
        } =20

then

> +        address_space_init(&elem->as, &elem->mr, as_name);
> +
> +        qemu_mutex_lock(&iommu_table->lock);
> +        g_hash_table_insert(iommu_table->elem_by_bdf, INT2VOIDP(pci_bdf)=
, elem);
> +        qemu_mutex_unlock(&iommu_table->lock);
> +    }
> +
> +    return &elem->as;
> +}
> +
> +static void remote_iommu_del_elem(gpointer data)
> +{
> +    struct RemoteIommuElem *elem =3D data;
> +
> +    g_assert(elem);
> +
> +    memory_region_unref(&elem->mr);

here we call
      object_unref(mr->owner);=20
leaving dangling pointer in owner '(qdev_get_machine(), "/unattached")'
it doesn't look correct

I thought that memory_region_unref() should be always paired with memory_re=
gion_ref()

and looking at memory_region_init(...owner...) history it looks like
owner-less (NULL) regions are not meant to be deleted ever.

> +    address_space_destroy(&elem->as);
> +
> +    g_free(elem);
> +}
> +
> +void remote_iommu_del_device(PCIDevice *pci_dev)
> +{
> +    int pci_bdf;
> +
> +    if (!remote_iommu_table.elem_by_bdf || !pci_dev) {
> +        return;
> +    }
> +
> +    pci_bdf =3D PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev=
->devfn);
> +
> +    qemu_mutex_lock(&remote_iommu_table.lock);
> +    g_hash_table_remove(remote_iommu_table.elem_by_bdf, INT2VOIDP(pci_bd=
f));
> +    qemu_mutex_unlock(&remote_iommu_table.lock);
> +}
> +
> +void remote_configure_iommu(PCIBus *pci_bus)
> +{
> +    if (!remote_iommu_table.elem_by_bdf) {
> +        remote_iommu_table.elem_by_bdf =3D
> +            g_hash_table_new_full(NULL, NULL, NULL, remote_iommu_del_ele=
m);
> +        qemu_mutex_init(&remote_iommu_table.lock);
> +    }
> +
> +    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, &remote_iommu_tab=
le);
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7b0297a63..21694a9698 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3599,6 +3599,8 @@ F: hw/remote/iohub.c
>  F: include/hw/remote/iohub.h
>  F: subprojects/libvfio-user
>  F: hw/remote/vfio-user-obj.c
> +F: hw/remote/iommu.c
> +F: include/hw/remote/iommu.h
> =20
>  EBPF:
>  M: Jason Wang <jasowang@redhat.com>
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index 534ac5df79..bcef83c8cc 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files=
('message.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'=
))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
> +remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
>  remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user=
-obj.c'))
> =20
>  remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)


