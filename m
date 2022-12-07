Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59A6456DE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 10:52:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2r5T-0000CA-Js; Wed, 07 Dec 2022 04:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2r5S-0000BR-2e
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2r5P-0006yg-Sl
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:51:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670406690;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fVMiy/C44XMCZKXTjWc2pJ9iGTttNrOky9ArPJNZmAM=;
 b=PP4++9kg4+GGhvZNkvAK4Lb37vS22wKNEf2v2s7bVC4LnI7WyNd5fkT+xVrWartZr3vA2e
 BQWOcA8e+JY7CoS+VxK7EBFELbAOsUvLt26TU2VOGdOvISHYPDjWqXI4rO5zMSgT/dcvj3
 WEtsTiFmycpH9v6+KYuQbhMDmFkfuI8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154--HTV5lH0Poy3MM_iZzoNTQ-1; Wed, 07 Dec 2022 04:51:29 -0500
X-MC-Unique: -HTV5lH0Poy3MM_iZzoNTQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 mr7-20020a056214348700b004c6806b646dso36803973qvb.14
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 01:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fVMiy/C44XMCZKXTjWc2pJ9iGTttNrOky9ArPJNZmAM=;
 b=Vd1BN12BQUsOL3g9vaM34ZXJjZcLLxXUcKEjy9whZCBl68Dv/hFsFIMKbboifu9+U8
 BTmGcW/TsWK++605h9/iMlqYCcyahm+gQN6YPFtuEsot5XJHlgtCpJu1MyblYFx95ud3
 RpvryQsEcC/GKbHpMAWFSRIBvUiuyW91VNBXaw6bqu+XXhm2Mfwsb6gsvc+gkHBeL7Q4
 o3wKfwqHPe8gUyFAKjMkBzTuiirXfw47rWB5r1r/y++pjjXB/obmbdi0tQyQR+7C9lMZ
 /UC2kClunzv6B3ZSds1gVazd5JlZFGYiKt4j0xl12C/YntlAiw6wfTIonRKkHR6yxAbK
 7D1w==
X-Gm-Message-State: ANoB5pnxu6YPObTWtDOUEk1cu4Al3j8tsa55LAJB6PLwqCoKOGZfSCbp
 xDdse6nK8l4ry++ucgB6A6nSFTAnOGYw5EIIPzcghzgPAwtsJXlxfSj+CGDDjm6/nlSoe66rpR2
 ekVOIWFyQDUY4hPk=
X-Received: by 2002:a05:6214:4a41:b0:4bb:68f5:74ee with SMTP id
 ph1-20020a0562144a4100b004bb68f574eemr2653182qvb.85.1670406689148; 
 Wed, 07 Dec 2022 01:51:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5CBQbhr1bt65RXneHQ91RAMonra1Wn9Bo+2SS9CfoMIu8Q8JxgN9eQKTJqx9etVHJ/Vtw9jA==
X-Received: by 2002:a05:6214:4a41:b0:4bb:68f5:74ee with SMTP id
 ph1-20020a0562144a4100b004bb68f574eemr2653175qvb.85.1670406688884; 
 Wed, 07 Dec 2022 01:51:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006ec62032d3dsm16840698qkp.30.2022.12.07.01.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 01:51:27 -0800 (PST)
Message-ID: <366b0a12-b672-7e54-2bcd-c5917c66fe74@redhat.com>
Date: Wed, 7 Dec 2022 10:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] intel-iommu: Document iova_tree
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Jason Wang <jasowang@redhat.com>
References: <20221206221348.396020-1-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221206221348.396020-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

On 12/6/22 23:13, Peter Xu wrote:
> It seems not super clear on when iova_tree is used, and why.  Add a rich
> comment above iova_tree to track why we needed the iova_tree, and when we
> need it.
>
> Also comment for the map/unmap messages, on how they're used and
> implications (e.g. unmap can be larger than the mapped ranges).
>
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
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


