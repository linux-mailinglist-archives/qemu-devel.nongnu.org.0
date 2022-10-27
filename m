Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B160FC1F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:37:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo4qA-0001o6-Ul; Thu, 27 Oct 2022 11:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oo4q8-0001ku-JS
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oo4q4-0006tx-7Z
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666884634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6cduf/SH6bPqy5Ru7eNncvgDNSJG2fN5Zr+yU3X4tX8=;
 b=LBiSreoUm/lgsoh6Ytbvxvz3yQoM4NK36/Nd4L1X9CxJo5n+7VSF7xEh0RDUKCIQ6GynZ8
 DFK1yxrEBCuMaAL7MNG5T9Ux/NmKbZ6ExjrP0W7Hy/yoCe7SAWED9F7qp0hQTu7QUSYBGA
 7GyfvFXKnN1jYHc8qNpcVXq+WdsnETQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-_nw4QrlwMHqNNEvyiUV0iw-1; Thu, 27 Oct 2022 11:30:30 -0400
X-MC-Unique: _nw4QrlwMHqNNEvyiUV0iw-1
Received: by mail-qv1-f71.google.com with SMTP id
 mo15-20020a056214330f00b004b96d712bccso1122351qvb.22
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 08:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cduf/SH6bPqy5Ru7eNncvgDNSJG2fN5Zr+yU3X4tX8=;
 b=WdHvGlJ2AQ2pYZZk3okFMGMXPDX8r+lIxmCFquf1n2wLuRV1QuDKUXO0pbiRi+4e7S
 WZ3oJPSxW0nf2Q+Ah+6a29FPI6Ps810/dLREIcfVJzJH7djWxomc0c9iQ/+YlD4Al6CD
 VYAn49wU+VmJ0Byw008OvMjN6c5o/jq/xRLxVgxyUwT/nKGNuXavin77V6D5Q5QkynSj
 rNF/1HMeVTSUXR8a35RFef3f3vDvWEgWruzJD08+VE8g0vC7FLjeSORzhd7f4MyiP0Pg
 mYTMvZUm8XbZQtMFjEF2BkHh9XohSZoJaeA7Qo2Q4mOeW5Mgvaw8B81VGP0tqrJBKCTH
 5XkA==
X-Gm-Message-State: ACrzQf3Q8AaIwoEmqVKw/c5NMnC7q3+WDr2YhZyWNdyzhKOy6qoTDATw
 7+GKql6DNOG/tHXdJZjeTbTJm9KSGKsSnQWp2Bau7XrakqV7EXE63ttuCtojbQlq9m2zfqUnbu5
 bL1Wu/c03oqRsWE0=
X-Received: by 2002:ae9:eb8e:0:b0:6f9:4861:ed15 with SMTP id
 b136-20020ae9eb8e000000b006f94861ed15mr5866237qkg.102.1666884630038; 
 Thu, 27 Oct 2022 08:30:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ZijB3t5LWK/yhljQJnRZV6ZX9GDQ5nY1tk3teiaPTRp6fsHJJ7LeCPxZnnt6EZEHpLVuw7Q==
X-Received: by 2002:ae9:eb8e:0:b0:6f9:4861:ed15 with SMTP id
 b136-20020ae9eb8e000000b006f94861ed15mr5866211qkg.102.1666884629739; 
 Thu, 27 Oct 2022 08:30:29 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 g1-20020a05620a40c100b006eea461177csm1192111qko.29.2022.10.27.08.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:30:28 -0700 (PDT)
Date: Thu, 27 Oct 2022 11:30:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/2] vfio: move the function vfio_get_xlat_addr() to
 memory.c
Message-ID: <Y1qkE/aGvXbYLUAU@x1n>
References: <20221027074032.1101939-1-lulu@redhat.com>
 <20221027074032.1101939-2-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221027074032.1101939-2-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Thu, Oct 27, 2022 at 03:40:31PM +0800, Cindy Lu wrote:
> Move the function vfio_get_xlat_addr to softmmu/memory.c, and
> change the name to memory_get_xlat_addr().So we can use this
> function in other devices,such as vDPA device.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

Trivial nit below.

[...]

> +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                          ram_addr_t *ram_addr, bool *read_only,
> +                          AddressSpace *as)
> +{
> +    MemoryRegion *mr;
> +    hwaddr xlat;
> +    hwaddr len = iotlb->addr_mask + 1;
> +    bool writable = iotlb->perm & IOMMU_WO;
> +
> +    /*
> +     * The IOMMU TLB entry we have just covers translation through
> +     * this IOMMU to its immediate target.  We need to translate
> +     * it the rest of the way through to memory.
> +     */
> +    mr = address_space_translate(as, iotlb->translated_addr, &xlat, &len,
> +                                 writable, MEMTXATTRS_UNSPECIFIED);

Can "as" be anything not address_space_memory in this case?

I had a feeling that you wanted to check iotlb->target_as only by peeking
at the next patch, but that can also be checked in this function too, and
the new parameter may not be needed.  Another benefit is we can also drop
the same check in vfio_iommu_map_notify() and
vfio_iommu_map_dirty_notify():

    if (iotlb->target_as != &address_space_memory) {
        error_report("Wrong target AS \"%s\", only system memory is allowed",
                     iotlb->target_as->name ? iotlb->target_as->name : "none");
        return;
    }

Thanks,

-- 
Peter Xu


