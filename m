Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F4612F05
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 03:32:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKZm-0005O4-NF; Sun, 30 Oct 2022 22:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opKZk-0005Nv-G8
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 22:30:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opKZi-0007Rk-Ia
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 22:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667183453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKwTNyIPjWIli+r1xnGKLEMT2MXZ6VZSuSyUx15upbI=;
 b=JKGsv5wQ+6SJLCoApoLUsxvjlmWd+8jBXrRD/JclhF2uTnWegTqAbKDWadaEkPk8f8Wlqu
 M6ma1CuBZQa3l/XVOAV0hOVm6HI81qYqOtrwGL6Hc5Guzf/OPvumGe5lcG3pf4mhXVBKcp
 MgWksJXa93uwJPBqeeiYrUK/pgc4xOI=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-YjQGLpYHNsCoWxiK2FMB5Q-1; Sun, 30 Oct 2022 22:30:52 -0400
X-MC-Unique: YjQGLpYHNsCoWxiK2FMB5Q-1
Received: by mail-io1-f70.google.com with SMTP id
 y26-20020a5d9b1a000000b006bc71505e97so7251239ion.16
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 19:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qKwTNyIPjWIli+r1xnGKLEMT2MXZ6VZSuSyUx15upbI=;
 b=7pSBtG46JqLYSpcfDzF0y86uK/Jx1/cU3+fzullhUimRaCyO/3OmixjVptO5dBlGL5
 sPxviWJC2NREVRNHIADGPQINZuxWbwe3olnGbepq0bZ9brIJUkvVUfKfPL0Ocq/VqMHf
 LX+2xOwpItS5m0EKvBrrIpMH0ymjGGLbsYkn2TwRysZ2AvtjIyqPD3KwloKjY0LkRHVy
 KBdmH5QB56LtvUw7TmcyzVwfGb367+kESTm8QFPKG7HpyBBNkreT13zfNo73M8GmZBh4
 KPAQXVqFeVIVgxiriIjdgSuPuH9aOPisz7Ey9KOKx56N9HQPcpU8Ot6iY9NpN8+hXcwy
 Q3DA==
X-Gm-Message-State: ACrzQf0xIf5i0cwc9IMBaiOgR5tB6sgJIjbBsOD7ch5dxoBYArC6Ns33
 NIOTSxvJZEv3MlNVa7w8SHCu0rBOrSJMA2XtVNICBFIauySOJmAxtDlIAWu0zFQVhVoPe8FPtGU
 dkenayrwEy4XsmIU=
X-Received: by 2002:a6b:5f1d:0:b0:6c5:247c:6763 with SMTP id
 t29-20020a6b5f1d000000b006c5247c6763mr5433752iob.65.1667183451534; 
 Sun, 30 Oct 2022 19:30:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7aG5QwTfl0x9RguVWifoU/eWL+eIutuc3q0otKmbYocRitLo+8aXuVGKckqBGTdz4VvUNzig==
X-Received: by 2002:a6b:5f1d:0:b0:6c5:247c:6763 with SMTP id
 t29-20020a6b5f1d000000b006c5247c6763mr5433739iob.65.1667183451166; 
 Sun, 30 Oct 2022 19:30:51 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j127-20020a026385000000b00375147442f3sm2281584jac.16.2022.10.30.19.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 19:30:50 -0700 (PDT)
Date: Sun, 30 Oct 2022 20:30:48 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 1/2] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221030203048.3f557509.alex.williamson@redhat.com>
In-Reply-To: <20221031015605.1396243-2-lulu@redhat.com>
References: <20221031015605.1396243-1-lulu@redhat.com>
 <20221031015605.1396243-2-lulu@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
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

On Mon, 31 Oct 2022 09:56:04 +0800
Cindy Lu <lulu@redhat.com> wrote:

> - Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
> =C2=A0 change the name to memory_get_xlat_addr(). So we can use this
> =C2=A0 function on other devices, such as vDPA device.
> - Add a new function vfio_get_xlat_addr in vfio/common.c, and it will che=
ck
>   whether the memory is backed by a discard manager. the device can
>   have its own warning.
>=20
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/vfio/common.c      | 101 +++++++++++-------------------------------
>  include/exec/memory.h |   4 ++
>  softmmu/memory.c      |  72 ++++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+), 75 deletions(-)

Some changes I'd like to see below, but otherwise

Acked-by: Alex Williamson <alex.williamson@redhat.com>

>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9b..5bfd55de86 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -578,86 +578,37 @@ static bool vfio_listener_skipped_section(MemoryReg=
ionSection *section)
>  static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>                                 ram_addr_t *ram_addr, bool *read_only)
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
> +    bool mr_has_discard_manager;
> +    if (memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
> +                             &mr_has_discard_manager)) {
>          /*
> -         * Malicious VMs can map memory into the IOMMU, which is expected
> -         * to remain discarded. vfio will pin all pages, populating memo=
ry.
> -         * Disallow that. vmstate priorities make sure any RamDiscardMan=
ager
> -         * were already restored before IOMMUs are restored.
> +         * if the mr has the discard_manager and the return value of
> +         * memory_get_xlat_addr() is ture then we need to warn

s/ture/true/

But then the comment below is really describing why we're generating a
warning, so the above additional comment is mostly just noise.

I'd also prefer to see this as:

{
    bool ret, mr_has_discard_manager;

    ret =3D memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
                               &mr_has_discard_manager));

    if (ret && mr_has_discard_manager) {
        // Unmodified comment and warn report from existing code
    }

    return ret;
}

>           */
> -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> -            error_report("iommu map to discarded memory (e.g., unplugged=
 via"
> -                         " virtio-mem): %"HWADDR_PRIx"",
> -                         iotlb->translated_addr);
> -            return false;
> +        if (mr_has_discard_manager) {
> +            /*
> +             * Malicious VMs might trigger discarding of IOMMU-mapped me=
mory.
> +             * The pages will remain pinned inside vfio until unmapped,
> +             * resulting in a higher memory consumption than expected. I=
f memory
> +             * would get populated again later, there would be an incons=
istency
> +             * between pages pinned by vfio and pages seen by QEMU. This=
 is the
> +             * case until unmapped from the IOMMU (e.g., during device r=
eset).
> +             *
> +             * With malicious guests, we really only care about pinning =
more
> +             * memory than expected. RLIMIT_MEMLOCK set for the user/pro=
cess can
> +             * never be exceeded and can be used to mitigate this proble=
m.
> +             */
> +            warn_report_once(
> +                "Using vfio with vIOMMUs and coordinated discarding of"
> +                " RAM (e.g., virtio-mem) works, however, malicious"
> +                " guests can trigger pinning of more memory than"
> +                " intended via an IOMMU. It's possible to mitigate "
> +                " by setting/adjusting RLIMIT_MEMLOCK.");
>          }
> =20
> -        /*
> -         * Malicious VMs might trigger discarding of IOMMU-mapped memory=
. The
> -         * pages will remain pinned inside vfio until unmapped, resultin=
g in a
> -         * higher memory consumption than expected. If memory would get
> -         * populated again later, there would be an inconsistency betwee=
n pages
> -         * pinned by vfio and pages seen by QEMU. This is the case until
> -         * unmapped from the IOMMU (e.g., during device reset).
> -         *
> -         * With malicious guests, we really only care about pinning more=
 memory
> -         * than expected. RLIMIT_MEMLOCK set for the user/process can ne=
ver be
> -         * exceeded and can be used to mitigate this problem.
> -         */
> -        warn_report_once("Using vfio with vIOMMUs and coordinated discar=
ding of"
> -                         " RAM (e.g., virtio-mem) works, however, malici=
ous"
> -                         " guests can trigger pinning of more memory tha=
n"
> -                         " intended via an IOMMU. It's possible to mitig=
ate "
> -                         " by setting/adjusting RLIMIT_MEMLOCK.");
> -    }
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
> +        return true;
>      }
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
> +    return false;
>  }
> =20
>  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
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


