Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377D364223B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 05:24:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p231C-00023r-I1; Sun, 04 Dec 2022 23:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2319-000234-UY
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:23:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p2315-0002q3-Ap
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670214222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=16FNkYMh+2XbM12YsiJDu5IX+R+EaCelhn86Et7G2GE=;
 b=U1GoQOYL2IbNyeQWUwecU2O6ZGFwfew9YsYEXQHsjkMH7sQNPv9LTaNwur8rhtLT076Uz9
 1mniFuqXDbsPjcdB1wqON93ASMxwczUdtBOL9k/eYxu5ZFWLuRxoEXIkDqqCapWUX24Lt8
 RwKBtO72ozT9/O/+SfnECU66tkorV3k=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-_J8ZPsOvNKGJLGqPk67Arw-1; Sun, 04 Dec 2022 23:23:32 -0500
X-MC-Unique: _J8ZPsOvNKGJLGqPk67Arw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-14459615659so1919570fac.1
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 20:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=16FNkYMh+2XbM12YsiJDu5IX+R+EaCelhn86Et7G2GE=;
 b=YH81RjZmTJnQnEK/G4+7oYPj0CGh225tN9teRlvr0s9m6bkoIg5i5r5645euaeMce/
 sxkGyJpjK7SKQqy2PYKIWkt35zWFIotgTlUOkbPz6vqZ2wJmJ0XS45sXQnvTYdxMxtbv
 dYAbAwe3AfklUwq+w0modffbWYvep9amkKRTx+SAQ3Aj6hCe+N0Rh7vyS+DMz1rSkAq8
 Lx37JH0RU7jKUYWIB5PEoKDW6QT3GljpI0H+XoCJECm88L1InCIDboBxy4YrBs0ma84g
 ZAOjeq85j6sqKDgmg25aWaIvzZrrdw33zEauzprAqLoTKDIaqtgV60mioUqIiPEbwHOw
 H5Dw==
X-Gm-Message-State: ANoB5pnohd4JYIDDAmIUuKf1SGpOWZ24iIKXSWO0FlQmHPYKwLXD4vgh
 8zibucJmWfssYl4TtGuQJWlFKdK0XpGcn7wJM6oqgTxldWpJ59F9OZHiU5vY3dtV+9eqKq3eyPc
 e1Pv/6wOKHZslaiZZhmafBMN9qnva0Og=
X-Received: by 2002:a4a:b145:0:b0:49f:449a:5f6c with SMTP id
 e5-20020a4ab145000000b0049f449a5f6cmr25633741ooo.93.1670214211774; 
 Sun, 04 Dec 2022 20:23:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5YjjUCvjT3Ns0icv1jDADvSjVsyTXETmJzsF08DW5hwgbuvx8CcdvuGvH52P0TeyUsQCItYTZ7TZENejyaQXA=
X-Received: by 2002:a4a:b145:0:b0:49f:449a:5f6c with SMTP id
 e5-20020a4ab145000000b0049f449a5f6cmr25633733ooo.93.1670214211513; Sun, 04
 Dec 2022 20:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20221201162501.3864692-1-peterx@redhat.com>
In-Reply-To: <20221201162501.3864692-1-peterx@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 5 Dec 2022 12:23:20 +0800
Message-ID: <CACGkMEu2NrYULRLZAUNbp5SAUVPb8nMZb9=3=JWFHciC7FAHkg@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: Document iova_tree
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Dec 2, 2022 at 12:25 AM Peter Xu <peterx@redhat.com> wrote:
>
> It seems not super clear on when iova_tree is used, and why.  Add a rich
> comment above iova_tree to track why we needed the iova_tree, and when we
> need it.
>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/hw/i386/intel_iommu.h | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
> index 46d973e629..8d130ab2e3 100644
> --- a/include/hw/i386/intel_iommu.h
> +++ b/include/hw/i386/intel_iommu.h
> @@ -109,7 +109,35 @@ struct VTDAddressSpace {
>      QLIST_ENTRY(VTDAddressSpace) next;
>      /* Superset of notifier flags that this address space has */
>      IOMMUNotifierFlag notifier_flags;
> -    IOVATree *iova_tree;          /* Traces mapped IOVA ranges */
> +    /*
> +     * @iova_tree traces mapped IOVA ranges.
> +     *
> +     * The tree is not needed if no MAP notifiers is registered with
> +     * current VTD address space, because all UNMAP (including iotlb or
> +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> +     * notifiers.

So this means the UNMAP notifier doesn't need to be as accurate as
MAP. (Should we document it in the notifier headers)?

For MAP[a, b] MAP[b, c] we can do a UNMAP[a. c].

> +     *
> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> +     * reasons.
> +     *
> +     * Firstly, there's no way to identify whether an PSI event is MAP or
> +     * UNMAP within the PSI message itself.  Without having prior knowledge
> +     * of existing state vIOMMU doesn't know whether it should notify MAP
> +     * or UNMAP for a PSI message it received.
> +     *
> +     * Secondly, PSI received from guest driver (or even a large PSI can
> +     * grow into a DSI at least with Linux intel-iommu driver) can be
> +     * larger in range than the newly mapped ranges for either MAP or UNMAP
> +     * events.

Yes, so I think we need a document that the UNMAP handler should be
prepared for this.

Thanks

> If it directly pass-throughs any such event it may confuse
> +     * the registered drivers (e.g. vfio-pci) on either: (1) trying to map
> +     * the same region more than once (for VFIO_IOMMU_MAP_DMA, -EEXIST will
> +     * trigger), or (2) trying to UNMAP a range that is still partially
> +     * mapped.  That accuracy is not required for UNMAP-only notifiers, but
> +     * it is a must-to-have for MAP-inclusive notifiers, because the vIOMMU
> +     * needs to make sure the shadow page table is always in sync with the
> +     * guest IOMMU pgtables for a device.
> +     */
> +    IOVATree *iova_tree;
>  };
>
>  struct VTDIOTLBEntry {
> --
> 2.37.3
>


