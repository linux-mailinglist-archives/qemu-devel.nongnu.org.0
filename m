Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA85A4CC31C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:44:01 +0100 (CET)
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoYa-0007av-CD
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:44:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPoO1-0004Y2-Qk
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:33:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPoNy-0005e3-Ar
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646325181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRE8hhaVhX3gG/Zh6h+qtA7wfBDxKfbabbJfGtzy1N4=;
 b=JrqYpy5AaPjLu3oV84e5ZAGTporiUktJ6f3/o/HrF2vsHi74+LDw5q3nsQz13LEVx181DC
 xgv/oA3quxt0B/Y3rHoVAtd5Sa8fY/kWPuXASFYlnuVquZzLwekYldbpY/qWOtL64S3HOg
 QJnFXQdtpJ+4ImERauEHwUN6mRKcJ4c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-kAlLxeqyOCyRlHvokfUV6w-1; Thu, 03 Mar 2022 11:33:00 -0500
X-MC-Unique: kAlLxeqyOCyRlHvokfUV6w-1
Received: by mail-qv1-f69.google.com with SMTP id
 fw9-20020a056214238900b0043522aa5b81so4013261qvb.21
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 08:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fRE8hhaVhX3gG/Zh6h+qtA7wfBDxKfbabbJfGtzy1N4=;
 b=jER8bY8tFCxqCWXtXBxs1fAydvZchN1l1Zrw8Uq0776iRgQW4QpiqXsuYrAtAwL26R
 7WUSRlK/y1klgrQDQfcAhxfq/XUa4mFpfl9CaMiQOE1hjcvGvDbXtBtbACix7Q+2W3/P
 3F87ANwptCvdIklniJJHDKNliRTbCni3fo8V21pv6rw9mOIiettbGAyke/0SHUaKO0dl
 Cq7YK+Pcn/ve2TVSN7+wUgcf38PDiwuWRRaZYvDXRXs+2hYJrKH6Z3gqcm7mca2LxSPe
 bla23i+TIkLvTevI0KjoIcX5ftqjAf5CDFdmQ9vfJ4A36+pIqBDuKfl9QjwslP9B2JSU
 o+LQ==
X-Gm-Message-State: AOAM531wAPOVkCt6QAo0feIAKRkvfeS5cxs+6x/k29jbyITwUvsK+QRz
 Rnu9Eitzns6eZy1rraobJEshVhjlepXabAJM1QI+Duy+IQJ/qy+AS6gfuhlupPtX3JgSxYRwcZF
 KwKQ1g/4KE1CF7Z7SrVt0r6258oJX5sY=
X-Received: by 2002:a05:622a:1190:b0:2dc:915a:9ce4 with SMTP id
 m16-20020a05622a119000b002dc915a9ce4mr27215698qtk.221.1646325179407; 
 Thu, 03 Mar 2022 08:32:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdpsYh2jz+yE2kvYkySrwX2ucy2J+cOQfuWejpNLtNSectoDOBH/NmBfpT/o/z9WSEaqceW6DLBpKmgJYvebU=
X-Received: by 2002:a05:622a:1190:b0:2dc:915a:9ce4 with SMTP id
 m16-20020a05622a119000b002dc915a9ce4mr27215662qtk.221.1646325179104; Thu, 03
 Mar 2022 08:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-10-eperezma@redhat.com>
 <7f6f5118-4228-6dcb-f3d4-3e64aeb3608c@redhat.com>
In-Reply-To: <7f6f5118-4228-6dcb-f3d4-3e64aeb3608c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Mar 2022 17:32:23 +0100
Message-ID: <CAJaqyWchLxXTRBE9zT9ZrF7UT_CnNbD=E5yaK6NrF-gDauhSAg@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 8:06 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This tree is able to look for a translated address from an IOVA address=
.
> >
> > At first glance it is similar to util/iova-tree. However, SVQ working o=
n
> > devices with limited IOVA space need more capabilities, like allocating
> > IOVA chunks or performing reverse translations (qemu addresses to iova)=
.
> >
> > The allocation capability, as "assign a free IOVA address to this chunk
> > of memory in qemu's address space" allows shadow virtqueue to create a
> > new address space that is not restricted by guest's addressable one, so
> > we can allocate shadow vqs vrings outside of it.
> >
> > It duplicates the tree so it can search efficiently in both directions,
> > and it will signal overlap if iova or the translated address is present
> > in any tree.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-iova-tree.h |  27 +++++++
> >   hw/virtio/vhost-iova-tree.c | 155 +++++++++++++++++++++++++++++++++++=
+
> >   hw/virtio/meson.build       |   2 +-
> >   3 files changed, 183 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/virtio/vhost-iova-tree.h
> >   create mode 100644 hw/virtio/vhost-iova-tree.c
> >
> > diff --git a/hw/virtio/vhost-iova-tree.h b/hw/virtio/vhost-iova-tree.h
> > new file mode 100644
> > index 0000000000..6a4f24e0f9
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.h
> > @@ -0,0 +1,27 @@
> > +/*
> > + * vhost software live migration iova tree
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#ifndef HW_VIRTIO_VHOST_IOVA_TREE_H
> > +#define HW_VIRTIO_VHOST_IOVA_TREE_H
> > +
> > +#include "qemu/iova-tree.h"
> > +#include "exec/memory.h"
> > +
> > +typedef struct VhostIOVATree VhostIOVATree;
> > +
> > +VhostIOVATree *vhost_iova_tree_new(uint64_t iova_first, uint64_t iova_=
last);
> > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree);
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostIOVATree, vhost_iova_tree_delete);
> > +
> > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *iova_tree=
,
> > +                                        const DMAMap *map);
> > +int vhost_iova_tree_map_alloc(VhostIOVATree *iova_tree, DMAMap *map);
> > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *ma=
p);
> > +
> > +#endif
> > diff --git a/hw/virtio/vhost-iova-tree.c b/hw/virtio/vhost-iova-tree.c
> > new file mode 100644
> > index 0000000000..03496ac075
> > --- /dev/null
> > +++ b/hw/virtio/vhost-iova-tree.c
> > @@ -0,0 +1,155 @@
> > +/*
> > + * vhost software live migration iova tree
> > + *
> > + * SPDX-FileCopyrightText: Red Hat, Inc. 2021
> > + * SPDX-FileContributor: Author: Eugenio P=C3=A9rez <eperezma@redhat.c=
om>
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/iova-tree.h"
> > +#include "vhost-iova-tree.h"
> > +
> > +#define iova_min_addr qemu_real_host_page_size
> > +
> > +/**
> > + * VhostIOVATree, able to:
> > + * - Translate iova address
> > + * - Reverse translate iova address (from translated to iova)
> > + * - Allocate IOVA regions for translated range (linear operation)
> > + */
> > +struct VhostIOVATree {
> > +    /* First addressable iova address in the device */
> > +    uint64_t iova_first;
> > +
> > +    /* Last addressable iova address in the device */
> > +    uint64_t iova_last;
> > +
> > +    /* IOVA address to qemu memory maps. */
> > +    IOVATree *iova_taddr_map;
> > +
> > +    /* QEMU virtual memory address to iova maps */
> > +    GTree *taddr_iova_map;
> > +};
> > +
> > +static gint vhost_iova_tree_cmp_taddr(gconstpointer a, gconstpointer b=
,
> > +                                      gpointer data)
> > +{
> > +    const DMAMap *m1 =3D a, *m2 =3D b;
> > +
> > +    if (m1->translated_addr > m2->translated_addr + m2->size) {
> > +        return 1;
> > +    }
> > +
> > +    if (m1->translated_addr + m1->size < m2->translated_addr) {
> > +        return -1;
> > +    }
> > +
> > +    /* Overlapped */
> > +    return 0;
> > +}
> > +
> > +/**
> > + * Create a new IOVA tree
> > + *
> > + * Returns the new IOVA tree
> > + */
> > +VhostIOVATree *vhost_iova_tree_new(hwaddr iova_first, hwaddr iova_last=
)
> > +{
> > +    VhostIOVATree *tree =3D g_new(VhostIOVATree, 1);
> > +
> > +    /* Some devices do not like 0 addresses */
> > +    tree->iova_first =3D MAX(iova_first, iova_min_addr);
> > +    tree->iova_last =3D iova_last;
> > +
> > +    tree->iova_taddr_map =3D iova_tree_new();
> > +    tree->taddr_iova_map =3D g_tree_new_full(vhost_iova_tree_cmp_taddr=
, NULL,
> > +                                           NULL, g_free);
> > +    return tree;
> > +}
> > +
> > +/**
> > + * Delete an iova tree
> > + */
> > +void vhost_iova_tree_delete(VhostIOVATree *iova_tree)
> > +{
> > +    iova_tree_destroy(iova_tree->iova_taddr_map);
> > +    g_tree_unref(iova_tree->taddr_iova_map);
> > +    g_free(iova_tree);
> > +}
> > +
> > +/**
> > + * Find the IOVA address stored from a memory address
> > + *
> > + * @tree     The iova tree
> > + * @map      The map with the memory address
> > + *
> > + * Return the stored mapping, or NULL if not found.
> > + */
> > +const DMAMap *vhost_iova_tree_find_iova(const VhostIOVATree *tree,
> > +                                        const DMAMap *map)
> > +{
> > +    return g_tree_lookup(tree->taddr_iova_map, map);
> > +}
> > +
> > +/**
> > + * Allocate a new mapping
> > + *
> > + * @tree  The iova tree
> > + * @map   The iova map
> > + *
> > + * Returns:
> > + * - IOVA_OK if the map fits in the container
> > + * - IOVA_ERR_INVALID if the map does not make sense (like size overfl=
ow)
> > + * - IOVA_ERR_OVERLAP if the tree already contains that map
> > + * - IOVA_ERR_NOMEM if tree cannot allocate more space.
> > + *
> > + * It returns assignated iova in map->iova if return value is VHOST_DM=
A_MAP_OK.
> > + */
> > +int vhost_iova_tree_map_alloc(VhostIOVATree *tree, DMAMap *map)
> > +{
> > +    /* Some vhost devices do not like addr 0. Skip first page */
> > +    hwaddr iova_first =3D tree->iova_first ?: qemu_real_host_page_size=
;
> > +    DMAMap *new;
> > +    int r;
> > +
> > +    if (map->translated_addr + map->size < map->translated_addr ||
> > +        map->perm =3D=3D IOMMU_NONE) {
> > +        return IOVA_ERR_INVALID;
> > +    }
> > +
> > +    /* Check for collisions in translated addresses */
> > +    if (vhost_iova_tree_find_iova(tree, map)) {
> > +        return IOVA_ERR_OVERLAP;
> > +    }
> > +
> > +    /* Allocate a node in IOVA address */
> > +    r =3D iova_tree_alloc_map(tree->iova_taddr_map, map, iova_first,
> > +                            tree->iova_last);
> > +    if (r !=3D IOVA_OK) {
> > +        return r;
> > +    }
> > +
> > +    /* Allocate node in qemu -> iova translations */
> > +    new =3D g_malloc(sizeof(*new));
> > +    memcpy(new, map, sizeof(*new));
> > +    g_tree_insert(tree->taddr_iova_map, new, new);
>
>
> Can the caller map two IOVA ranges to the same e.g GPA range?
>

It shouldn't matter, because we are totally ignoring GPA here. HVA
could be more problematic.

We call it from two places: The shadow vring addresses and through the
memory listener. The SVQ vring addresses should already be on a
separated translated address from each one and guest's HVA because of
malloc semantics.

Regarding the listener, it should already report flattened memory with
no overlapping between the HVA chunks.
vhost_vdpa_listener_skipped_section should skip all problematic
sections if I'm not wrong.

But I may have missed some scenarios: vdpa devices only care about
IOVA -> HVA translation, so two IOVA could translate to the same HVA
in theory and we would not notice until we try with SVQ. To develop an
algorithm to handle this seems complicated at this moment: Should we
keep the bigger one? The last mapped? What happens if the listener
unmaps one of them, we suddenly must start translating from the not
unmapping? Seems that some kind of stacking would be needed.

Thanks!

> Thanks
>
>
> > +    return IOVA_OK;
> > +}
> > +
> > +/**
> > + * Remove existing mappings from iova tree
> > + *
> > + * @param  iova_tree  The vhost iova tree
> > + * @param  map        The map to remove
> > + */
> > +void vhost_iova_tree_remove(VhostIOVATree *iova_tree, const DMAMap *ma=
p)
> > +{
> > +    const DMAMap *overlap;
> > +
> > +    iova_tree_remove(iova_tree->iova_taddr_map, map);
> > +    while ((overlap =3D vhost_iova_tree_find_iova(iova_tree, map))) {
> > +        g_tree_remove(iova_tree->taddr_iova_map, overlap);
> > +    }
> > +}
> > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > index 2dc87613bc..6047670804 100644
> > --- a/hw/virtio/meson.build
> > +++ b/hw/virtio/meson.build
> > @@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vh=
ost-stub.c'))
> >
> >   virtio_ss =3D ss.source_set()
> >   virtio_ss.add(files('virtio.c'))
> > -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c', 'vhost-shadow-virtqueue.c'))
> > +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-b=
ackend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
> >   virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c=
'))
> >   virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c=
'))
> >   virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-b=
alloon.c'))
>


