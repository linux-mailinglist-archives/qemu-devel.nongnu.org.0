Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043B4862A1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:03:55 +0100 (CET)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Pcf-0001QN-J6
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5PO3-0002LX-C2
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5PO1-00071c-RH
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641462525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T86Aa10GIdZo+iVInMWZF1Y/sIUkwx3UYu2Q7BLvmTA=;
 b=MW52XC1NxLdTN3239kiGoOEO2DRj8Sqjn0cMxq0AC2gcjZXMhLQD2lss5El3+/N/1rNcxp
 ZF6kZrAp2CV1nB/ALrpz8rdxTqxhO1V4H8PJjZScaHPnCRk57WkbVgFexnBEHZByS6lmJ/
 COexZl9162G+rH6IWRYt7jPKkdZfk6o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-TG0GGI_3NQyI3WlQYnWQSg-1; Thu, 06 Jan 2022 04:48:42 -0500
X-MC-Unique: TG0GGI_3NQyI3WlQYnWQSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 a68-20020a1c9847000000b00346939a2d7cso712756wme.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 01:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T86Aa10GIdZo+iVInMWZF1Y/sIUkwx3UYu2Q7BLvmTA=;
 b=QEbncp4wH8d/QTWAcuE4gVFr78S2px/3YwuvOYvMD+GIidhk+WjqsJdV9PekJ6uBUm
 WuozL5FTqN6xAtkVOeyLlup3C8MHTNtpklyBEsp3H2BXGmhUjt4n99K+NycrC0pjRxDL
 Cr+yD+SFhfIE4XeVPxtE+0F9Z1sbxA3v5kUtZBfuIzG0AZ9XXgg3un1WWHb95YOMcKSW
 i0qCJCbgyv485kx6fplM/b/mPd3Y/XNMmajIMllFVkIjskKrgTfZxYgZtF7fhzWsPZwL
 /sP3+G6p/MLQQ9sJRWfxgIpP1vyWtF4p3IniLA8MYIPHuWnqsjLUM0R+mLDUwTwS2NiZ
 vclQ==
X-Gm-Message-State: AOAM531jAgiZwt760UJGRSBwOPePnqgF+DVQUrQRPppQs27zzjCMAuP1
 oN/pQTVC00j13mRT2MqZX5a5cPTz7g/MI83QPar5hbCybS7uvYncSm30m2GTcH8WOWfprm1LQge
 gPYJ7/MXbdP2FCXs=
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr50078157wrq.65.1641462521175; 
 Thu, 06 Jan 2022 01:48:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLB0xD8+wjzjGIDj0zHGwgVLeRVbM3Ez/h7oQvHLt8+7EcC2m7f1/f8htues9wpqHh92yA1Q==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr50078141wrq.65.1641462520919; 
 Thu, 06 Jan 2022 01:48:40 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id d10sm1772305wri.57.2022.01.06.01.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 01:48:40 -0800 (PST)
Date: Thu, 6 Jan 2022 04:48:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH 2/2] virtio: Add shared memory capability
Message-ID: <20220106044116-mutt-send-email-mst@kernel.org>
References: <20211110164220.273641-1-antonio.caggiano@collabora.com>
 <20211110164220.273641-3-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20211110164220.273641-3-antonio.caggiano@collabora.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 05:42:20PM +0100, Antonio Caggiano wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG'
> and the data structure 'virtio_pci_shm_cap' to go with it.
> They allow defining shared memory regions with sizes and offsets
> of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by a device-specific 'id'.
> 
> v2: Remove virtio_pci_shm_cap as virtio_pci_cap64 is used instead.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> (cherry picked from commit a5d628a3a3c5e60b98b15ffff197c36a77056115)

Where's that commit? I think we should drop this, right?

> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/virtio/virtio-pci.c | 19 +++++++++++++++++++
>  hw/virtio/virtio-pci.h |  4 ++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 750aa47ec1..8152d3c1b3 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1162,6 +1162,25 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
>      return offset;
>  }
>  
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id)
> +{
> +    struct virtio_pci_cap64 cap = {
> +        .cap.cap_len = sizeof cap,
> +        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
> +    };
> +    uint32_t mask32 = ~0;
> +
> +    cap.cap.bar = bar;
> +    cap.cap.length = cpu_to_le32(length & mask32);
> +    cap.length_hi = cpu_to_le32((length >> 32) & mask32);
> +    cap.cap.offset = cpu_to_le32(offset & mask32);
> +    cap.offset_hi = cpu_to_le32((offset >> 32) & mask32);
> +    cap.cap.id = id;
> +    return virtio_pci_add_mem_cap(proxy, &cap.cap);


You don't need & mask32 I think. cpu_to_le32 will truncate
the value.


> +}
> +
>  static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>                                         unsigned size)
>  {
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 2446dcd9ae..5e5c4a4c6d 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -252,4 +252,8 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
>   */
>  unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
>  
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id);
> +
>  #endif

So it's a new API, but where's the user?
I guess just include this patch with where-ever it's actually used.

> -- 
> 2.32.0


