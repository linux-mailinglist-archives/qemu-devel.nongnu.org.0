Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6135654D00
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 08:49:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8cmz-0006hJ-D0; Fri, 23 Dec 2022 02:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8cmv-0006h6-TG
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 02:48:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8cmt-0002iD-Qy
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 02:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671781695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ut71GVZdky5GoFTyDRtoLelKTPuzuxuqmkJLdEazWAI=;
 b=XvLD5zq35bLWTRGaLfnjOBB9NxeZ7bL+NbyzgwiNPveJhZdGymtOCEsx9N1W5Otxo567lx
 papJsJzBlDnM9nb0OpFJL3d2oiF2cQiaOlVOKFzj+QyPdRjmWmBFP4yWovxTnVbGdfd0Pj
 a/H9XpfDr8ipgzQOr52D5I9Q62D9q8g=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-dxf5Eh_DO9G5MM6WKmsYmA-1; Fri, 23 Dec 2022 02:48:13 -0500
X-MC-Unique: dxf5Eh_DO9G5MM6WKmsYmA-1
Received: by mail-oo1-f69.google.com with SMTP id
 l22-20020a4a8556000000b004ad9f50165fso1668680ooh.10
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 23:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ut71GVZdky5GoFTyDRtoLelKTPuzuxuqmkJLdEazWAI=;
 b=vfPpB7mrs7d2jp4m/mBaTmI8/fqEpyghqppIL4rqYRhjdpFchYrzomgSKS8JQdU9dy
 rg7QybUDOPsKvL2LKF5UDzP3oK+Ek+76fd+3Y4lEmTOcP44DakpiK12G0CcSg1bLYWcQ
 oREFxzk0QvWNpyw/z7YqCy1m8vQCqo0XSxVKfcI1DpI8yb9EMvwItDfvr2V/lEQ03/kM
 h42dcHSevJbh5+p4PuUF7y0THz5K9VjeK4f7ZAt19/f4bYVwBfmi0+u4PdGRlw63+IyC
 NF7Q6W+Tzp6jDd4jy0u0wvYfeFHT6WpY0IDNaBGI7tP6QcS98qCt2J5AFrnvh+uUQe2d
 j+cQ==
X-Gm-Message-State: AFqh2kpWAl7fz72mN3XKbLLs/ZAtStpYnj1wgy3v2aiqg9Tx43Ue/6ao
 KMi4D2+enZ2tiNXHxRD5gWrfJrFQg8d//rKConL6ePCtDi2IUIIKFM1H5vp4wFd6yYv4mgOYY2n
 R4rIXxWQJUZr3AARV4JJDrtDRgouovd8=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr460844oah.35.1671781692974; 
 Thu, 22 Dec 2022 23:48:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXukXR3nc+gmUGqTUKTy/OEt73mBaehvKydt+LvuvcsgJlaAy+A1YT0C71EL7RLmDH7IgjnaMb3gmZhIj+Ps/lY=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr460840oah.35.1671781692688; Thu, 22 Dec
 2022 23:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20221206221348.396020-1-peterx@redhat.com>
In-Reply-To: <20221206221348.396020-1-peterx@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Dec 2022 15:48:01 +0800
Message-ID: <CACGkMEtK8w2OkeZR=Ebp3t8t6bfaJusTRyC0eB3BGyA7KuX5-g@mail.gmail.com>
Subject: Re: [PATCH v3] intel-iommu: Document iova_tree
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Dec 7, 2022 at 6:13 AM Peter Xu <peterx@redhat.com> wrote:
>
> It seems not super clear on when iova_tree is used, and why.  Add a rich
> comment above iova_tree to track why we needed the iova_tree, and when we
> need it.
>
> Also comment for the map/unmap messages, on how they're used and
> implications (e.g. unmap can be larger than the mapped ranges).
>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> v3:
> - Adjust according to Eric's comment
> ---
>  include/exec/memory.h         | 28 ++++++++++++++++++++++++++
>  include/hw/i386/intel_iommu.h | 38 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 91f8a2395a..269ecb873b 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -129,6 +129,34 @@ struct IOMMUTLBEntry {
>  /*
>   * Bitmap for different IOMMUNotifier capabilities. Each notifier can
>   * register with one or multiple IOMMU Notifier capability bit(s).
> + *
> + * Normally there're two use cases for the notifiers:
> + *
> + *   (1) When the device needs accurate synchronizations of the vIOMMU page
> + *       tables, it needs to register with both MAP|UNMAP notifies (which
> + *       is defined as IOMMU_NOTIFIER_IOTLB_EVENTS below).
> + *
> + *       Regarding to accurate synchronization, it's when the notified
> + *       device maintains a shadow page table and must be notified on each
> + *       guest MAP (page table entry creation) and UNMAP (invalidation)
> + *       events (e.g. VFIO). Both notifications must be accurate so that
> + *       the shadow page table is fully in sync with the guest view.
> + *
> + *   (2) When the device doesn't need accurate synchronizations of the
> + *       vIOMMU page tables, it needs to register only with UNMAP or
> + *       DEVIOTLB_UNMAP notifies.
> + *
> + *       It's when the device maintains a cache of IOMMU translations
> + *       (IOTLB) and is able to fill that cache by requesting translations
> + *       from the vIOMMU through a protocol similar to ATS (Address
> + *       Translation Service).
> + *
> + *       Note that in this mode the vIOMMU will not maintain a shadowed
> + *       page table for the address space, and the UNMAP messages can be
> + *       actually larger than the real invalidations (just like how the
> + *       Linux IOMMU driver normally works, where an invalidation can be
> + *       enlarged as long as it still covers the target range).  The IOMMU

Just spot this when testing your fix for DSI:

        assert(entry->iova >= notifier->start && entry_end <= notifier->end);

Do we need to remove this (but it seems a partial revert of
03c7140c1a0336af3d4fca768de791b9c0e2b128)?

Thanks

> + *       notifiee should be able to take care of over-sized invalidations.
>   */
>  typedef enum {
>      IOMMU_NOTIFIER_NONE = 0,
> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> index 46d973e629..89dcbc5e1e 100644
> --- a/include/hw/i386/intel_iommu.h
> +++ b/include/hw/i386/intel_iommu.h
> @@ -109,7 +109,43 @@ struct VTDAddressSpace {
>      QLIST_ENTRY(VTDAddressSpace) next;
>      /* Superset of notifier flags that this address space has */
>      IOMMUNotifierFlag notifier_flags;
> -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> +    /*
> +     * @iova_tree traces mapped IOVA ranges.
> +     *
> +     * The tree is not needed if no MAP notifier is registered with current
> +     * VTD address space, because all guest invalidate commands can be
> +     * directly passed to the IOMMU UNMAP notifiers without any further
> +     * reshuffling.
> +     *
> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> +     * reasons.
> +     *
> +     * Firstly, there's no way to identify whether an PSI (Page Selective
> +     * Invalidations) or DSI (Domain Selective Invalidations) event is an
> +     * MAP or UNMAP event within the message itself.  Without having prior
> +     * knowledge of existing state vIOMMU doesn't know whether it should
> +     * notify MAP or UNMAP for a PSI message it received when caching mode
> +     * is enabled (for MAP notifiers).
> +     *
> +     * Secondly, PSI messages received from guest driver can be enlarged in
> +     * range, covers but not limited to what the guest driver wanted to
> +     * invalidate.  When the range to invalidates gets bigger than the
> +     * limit of a PSI message, it can even become a DSI which will
> +     * invalidate the whole domain.  If the vIOMMU directly notifies the
> +     * registered device with the unmodified range, it may confuse the
> +     * registered drivers (e.g. vfio-pci) on either:
> +     *
> +     *   (1) Trying to map the same region more than once (for
> +     *       VFIO_IOMMU_MAP_DMA, -EEXIST will trigger), or,
> +     *
> +     *   (2) Trying to UNMAP a range that is still partially mapped.
> +     *
> +     * That accuracy is not required for UNMAP-only notifiers, but it is a
> +     * must-to-have for notifiers registered with MAP events, because the
> +     * vIOMMU needs to make sure the shadow page table is always in sync
> +     * with the guest IOMMU pgtables for a device.
> +     */
> +    IOVATree *iova_tree;
>  };
>
>  struct VTDIOTLBEntry {
> --
> 2.37.3
>


