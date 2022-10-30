Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F031612BFD
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 18:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opCDN-0000AS-VU; Sun, 30 Oct 2022 13:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opCDJ-00008M-BH
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:35:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opCDG-0002rD-60
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667151308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eI1vIpA6G7sTas5c7d7OEXhzlpOHvpGNrmh2edfNaYs=;
 b=YxvAJ03h2dMLAScOLiklWdUGe4m26ZhvdS+DjCzedsmvJ9Jlrx75tShyOlyu2gOt8zFi4s
 BiF17Pl52Ksnzug9JQMIGpxl3uvoW2R7AgAC42Zw00TPdTno22djSObinqfVlKW86daDo0
 YqTjz3/aAVrx2OR/PkEpOmdqDFowX5I=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-fm7FDWDMPu6kI9XPjk8EbA-1; Sun, 30 Oct 2022 13:35:05 -0400
X-MC-Unique: fm7FDWDMPu6kI9XPjk8EbA-1
Received: by mail-il1-f200.google.com with SMTP id
 s2-20020a056e021a0200b0030087a59cf9so4735923ild.11
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 10:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eI1vIpA6G7sTas5c7d7OEXhzlpOHvpGNrmh2edfNaYs=;
 b=bk32hvmkRFboTW8YECjpXp37Fo4qyq6kVJVhpa17Z94IVeWUCMeRObSZJecwdE3sLZ
 p1KgsTAAcrDpGQdEcHwN2DGyzEy/LIBn3Sra1uQnhB3zaG5VQz3xStunki4QhaHPVq/U
 5UtYncjpQdPeJocW6Lb8uc4UKMzBAOCCNNW3GtEsnbkUOQbFpQ24uGRSUK47Gy6Up6bS
 TorcBoXwpoeu7zMWT0AujB15o+uosugaDPTUqyl/r1kZ37Uhoj/nDjWSwwljV+CrpU/R
 7Dd2kQtfF5kZ+78FR0rzusYIKmXle9fA4Bm/8ri0u1AP0vSzc5U4j2iSbvCFsNBSKUIi
 EO4g==
X-Gm-Message-State: ACrzQf1w2aa0IcOqUalixVYP53Q0qbRXmbZjpMUda+wTk/ZVKzoj1ElE
 qcfdvNJddHtMGmjiMgaAVdMDsB0t5aip6olIcGET7g4HT2h5Ir+aVI1wJrj2dovI5SRJ5znTSA9
 TMScIGcWpvNjIirM=
X-Received: by 2002:a05:6638:3711:b0:363:a1f2:df4e with SMTP id
 k17-20020a056638371100b00363a1f2df4emr5258712jav.226.1667151304408; 
 Sun, 30 Oct 2022 10:35:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6WATwlvmUYUbyA5RtP1erAy0QrB3X63geoPDBJDNjj7o/HJurVgzIfkIUfBLf3qoxCuXqdSA==
X-Received: by 2002:a05:6638:3711:b0:363:a1f2:df4e with SMTP id
 k17-20020a056638371100b00363a1f2df4emr5258704jav.226.1667151304124; 
 Sun, 30 Oct 2022 10:35:04 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w16-20020a056e0213f000b002faecf63c48sm1711709ilj.79.2022.10.30.10.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 10:35:03 -0700 (PDT)
Date: Sun, 30 Oct 2022 11:35:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v7 1/2] vfio: move function vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221030113502.5c2e5e63.alex.williamson@redhat.com>
In-Reply-To: <20221030164539.1374058-2-lulu@redhat.com>
References: <20221030164539.1374058-1-lulu@redhat.com>
 <20221030164539.1374058-2-lulu@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 00:45:38 +0800
Cindy Lu <lulu@redhat.com> wrote:

> - Move the function vfio_get_xlat_addr to softmmu/memory.c, and
> =C2=A0 change the name to memory_get_xlat_addr(). So we can use this
> =C2=A0 function on other devices, such as vDPA device.
> - Add a new bool arg in this function, which shows whether the memory is
> =C2=A0 backed by a discard manager. So the device can have its own warnin=
g.
>=20
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/vfio/common.c      | 107 +++++++++++-------------------------------
>  include/exec/memory.h |   4 ++
>  softmmu/memory.c      |  72 ++++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+), 79 deletions(-)
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9b..a934262f39 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -573,61 +573,20 @@ static bool vfio_listener_skipped_section(MemoryReg=
ionSection *section)
>              */
>             section->offset_within_address_space & (1ULL << 63);
>  }
> -
> -/* Called with rcu_read_lock held.  */
> -static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> -                               ram_addr_t *ram_addr, bool *read_only)
> +static inline void vfio_mr_discard_manager_warn(bool mr_has_discard_mana=
ger)
>  {
> -    MemoryRegion *mr;
> -    hwaddr xlat;
> -    hwaddr len =3D iotlb->addr_mask + 1;
> -    bool writable =3D iotlb->perm & IOMMU_WO;
> -
> -    /*
> -     * The IOMMU TLB entry we have just covers translation through
> -     * this IOMMU to its immediate target.  We need to translate
> -     * it the rest of the way through to memory.
> -     */
> -    mr =3D address_space_translate(&address_space_memory,
> -                                 iotlb->translated_addr,
> -                                 &xlat, &len, writable,
> -                                 MEMTXATTRS_UNSPECIFIED);
> -    if (!memory_region_is_ram(mr)) {
> -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> -                     xlat);
> -        return false;
> -    } else if (memory_region_has_ram_discard_manager(mr)) {
> -        RamDiscardManager *rdm =3D memory_region_get_ram_discard_manager=
(mr);
> -        MemoryRegionSection tmp =3D {
> -            .mr =3D mr,
> -            .offset_within_region =3D xlat,
> -            .size =3D int128_make64(len),
> -        };
> -
> -        /*
> -         * Malicious VMs can map memory into the IOMMU, which is expected
> -         * to remain discarded. vfio will pin all pages, populating memo=
ry.
> -         * Disallow that. vmstate priorities make sure any RamDiscardMan=
ager
> -         * were already restored before IOMMUs are restored.
> -         */
> -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> -            error_report("iommu map to discarded memory (e.g., unplugged=
 via"
> -                         " virtio-mem): %"HWADDR_PRIx"",
> -                         iotlb->translated_addr);
> -            return false;
> -        }
> -
> +    if (mr_has_discard_manager) {
>          /*
> -         * Malicious VMs might trigger discarding of IOMMU-mapped memory=
. The
> -         * pages will remain pinned inside vfio until unmapped, resultin=
g in a
> -         * higher memory consumption than expected. If memory would get
> -         * populated again later, there would be an inconsistency betwee=
n pages
> -         * pinned by vfio and pages seen by QEMU. This is the case until
> -         * unmapped from the IOMMU (e.g., during device reset).
> +         * Malicious VMs might trigger discarding of IOMMU-mapped memory.
> +         * The pages will remain pinned inside vfio until unmapped,
> +         * resulting in a higher memory consumption than expected. If me=
mory
> +         * would get populated again later, there would be an inconsiste=
ncy
> +         * between pages pinned by vfio and pages seen by QEMU. This is =
the
> +         * case until unmapped from the IOMMU (e.g., during device reset=
).
>           *
> -         * With malicious guests, we really only care about pinning more=
 memory
> -         * than expected. RLIMIT_MEMLOCK set for the user/process can ne=
ver be
> -         * exceeded and can be used to mitigate this problem.
> +         * With malicious guests, we really only care about pinning more
> +         * memory than expected. RLIMIT_MEMLOCK set for the user/process=
 can
> +         * never be exceeded and can be used to mitigate this problem.
>           */
>          warn_report_once("Using vfio with vIOMMUs and coordinated discar=
ding of"
>                           " RAM (e.g., virtio-mem) works, however, malici=
ous"
> @@ -635,31 +594,7 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb,=
 void **vaddr,
>                           " intended via an IOMMU. It's possible to mitig=
ate "
>                           " by setting/adjusting RLIMIT_MEMLOCK.");
>      }
> -
> -    /*
> -     * Translation truncates length to the IOMMU page size,
> -     * check that it did not truncate too much.
> -     */
> -    if (len & iotlb->addr_mask) {
> -        error_report("iommu has granularity incompatible with target AS"=
);
> -        return false;
> -    }
> -
> -    if (vaddr) {
> -        *vaddr =3D memory_region_get_ram_ptr(mr) + xlat;
> -    }
> -
> -    if (ram_addr) {
> -        *ram_addr =3D memory_region_get_ram_addr(mr) + xlat;
> -    }
> -
> -    if (read_only) {
> -        *read_only =3D !writable || mr->readonly;
> -    }
> -
> -    return true;
>  }
> -
>  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>  {
>      VFIOGuestIOMMU *giommu =3D container_of(n, VFIOGuestIOMMU, n);
> @@ -681,10 +616,17 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n,=
 IOMMUTLBEntry *iotlb)
> =20
>      if ((iotlb->perm & IOMMU_RW) !=3D IOMMU_NONE) {
>          bool read_only;
> +        bool mr_has_discard_manager;
> =20
> -        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
> +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only,
> +                                  &mr_has_discard_manager)) {
>              goto out;
>          }
> +        /*
> +         * if the mr has the discard_manager and the return value of
> +         * memory_get_xlat_addr() is ture then we need to warn
> +         */
> +        vfio_mr_discard_manager_warn(mr_has_discard_manager);


The wrapper should be around the memory_get_xlat_addr() function, not
a separate helper whose only purpose is to trigger the error report,
ie. extract all but the warn_report_once() into a shared
function, keep vfio_get_xlat_addr().  The vfio call sites should not
change.  Thanks,

Alex

>          /*
>           * vaddr is only valid until rcu_read_unlock(). But after
>           * vfio_dma_map has set up the mapping the pages will be
> @@ -1349,6 +1291,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifi=
er *n, IOMMUTLBEntry *iotlb)
>      VFIOContainer *container =3D giommu->container;
>      hwaddr iova =3D iotlb->iova + giommu->iommu_offset;
>      ram_addr_t translated_addr;
> +    bool mr_has_discard_manager;
> =20
>      trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
> =20
> @@ -1359,9 +1302,9 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifi=
er *n, IOMMUTLBEntry *iotlb)
>      }
> =20
>      rcu_read_lock();
> -    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
> +    if (memory_get_xlat_addr(iotlb, NULL, &translated_addr, NULL,
> +                             &mr_has_discard_manager)) {
>          int ret;
> -
>          ret =3D vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask =
+ 1,
>                                      translated_addr);
>          if (ret) {
> @@ -1370,6 +1313,12 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotif=
ier *n, IOMMUTLBEntry *iotlb)
>                           container, iova,
>                           iotlb->addr_mask + 1, ret);
>          }
> +
> +        /*
> +         * if the mr has the discard_manager and the return value of
> +         * memory_get_xlat_addr() is ture then we need to warn
> +         */
> +        vfio_mr_discard_manager_warn(mr_has_discard_manager);
>      }
>      rcu_read_unlock();
>  }
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index bfb1de8eea..d1e79c39dc 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscar=
dManager *rdm,
>  void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
>                                               RamDiscardListener *rdl);
> =20
> +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                          ram_addr_t *ram_addr, bool *read_only,
> +                          bool *mr_has_discard_manager);
> +
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
>  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
> =20
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..bc0be3f62c 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -33,6 +33,7 @@
>  #include "qemu/accel.h"
>  #include "hw/boards.h"
>  #include "migration/vmstate.h"
> +#include "exec/address-spaces.h"
> =20
>  //#define DEBUG_UNASSIGNED
> =20
> @@ -2121,6 +2122,77 @@ void ram_discard_manager_unregister_listener(RamDi=
scardManager *rdm,
>      rdmc->unregister_listener(rdm, rdl);
>  }
> =20
> +/* Called with rcu_read_lock held.  */
> +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                          ram_addr_t *ram_addr, bool *read_only,
> +                          bool *mr_has_discard_manager)
> +{
> +    MemoryRegion *mr;
> +    hwaddr xlat;
> +    hwaddr len =3D iotlb->addr_mask + 1;
> +    bool writable =3D iotlb->perm & IOMMU_WO;
> +
> +    if (mr_has_discard_manager) {
> +        *mr_has_discard_manager =3D false;
> +    }
> +    /*
> +     * The IOMMU TLB entry we have just covers translation through
> +     * this IOMMU to its immediate target.  We need to translate
> +     * it the rest of the way through to memory.
> +     */
> +    mr =3D address_space_translate(&address_space_memory, iotlb->transla=
ted_addr,
> +                                 &xlat, &len, writable, MEMTXATTRS_UNSPE=
CIFIED);
> +    if (!memory_region_is_ram(mr)) {
> +        error_report("iommu map to non memory area %" HWADDR_PRIx "", xl=
at);
> +        return false;
> +    } else if (memory_region_has_ram_discard_manager(mr)) {
> +        RamDiscardManager *rdm =3D memory_region_get_ram_discard_manager=
(mr);
> +        MemoryRegionSection tmp =3D {
> +            .mr =3D mr,
> +            .offset_within_region =3D xlat,
> +            .size =3D int128_make64(len),
> +        };
> +        if (mr_has_discard_manager) {
> +            *mr_has_discard_manager =3D true;
> +        }
> +        /*
> +         * Malicious VMs can map memory into the IOMMU, which is expected
> +         * to remain discarded. vfio will pin all pages, populating memo=
ry.
> +         * Disallow that. vmstate priorities make sure any RamDiscardMan=
ager
> +         * were already restored before IOMMUs are restored.
> +         */
> +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> +            error_report("iommu map to discarded memory (e.g., unplugged=
 via"
> +                         " virtio-mem): %" HWADDR_PRIx "",
> +                         iotlb->translated_addr);
> +            return false;
> +        }
> +    }
> +
> +    /*
> +     * Translation truncates length to the IOMMU page size,
> +     * check that it did not truncate too much.
> +     */
> +    if (len & iotlb->addr_mask) {
> +        error_report("iommu has granularity incompatible with target AS"=
);
> +        return false;
> +    }
> +
> +    if (vaddr) {
> +        *vaddr =3D memory_region_get_ram_ptr(mr) + xlat;
> +    }
> +
> +    if (ram_addr) {
> +        *ram_addr =3D memory_region_get_ram_addr(mr) + xlat;
> +    }
> +
> +    if (read_only) {
> +        *read_only =3D !writable || mr->readonly;
> +    }
> +
> +    return true;
> +}
> +
>  void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
>  {
>      uint8_t mask =3D 1 << client;


