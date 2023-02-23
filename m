Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E66A119B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:07:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIn5-0001SA-Tv; Thu, 23 Feb 2023 16:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVIn4-0001Rz-6J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:06:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVImz-000565-56
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:06:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677186363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puam8LHw/yBPawQs6tY2FafCUxf+tk9F3KDoPDfGBFY=;
 b=SWGHbJges5FZdljiHE1lTZq6/AWbJov1EgmB6+9ES2ksX/zmYyjTdGcbnAlMPVjBYsPD0C
 oCqsjzMBuGgpIBGNV2hZfcW6J8BzziEcQ7iiDmMnzPrRr4krxgyfyxIP3BM5yWNq+aDsUs
 V2aavr/YkbPaMSUqK1u/AAV690RwH74=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-N3zXqfWdPROkscMeWJF_FQ-1; Thu, 23 Feb 2023 16:05:37 -0500
X-MC-Unique: N3zXqfWdPROkscMeWJF_FQ-1
Received: by mail-io1-f69.google.com with SMTP id
 h84-20020a6bb757000000b007404263f2faso6951483iof.21
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puam8LHw/yBPawQs6tY2FafCUxf+tk9F3KDoPDfGBFY=;
 b=vOj6mUEoaH8xIrZZy7LzkPT/DDd7Y2AFaRHAfwlbjlMGRFqRwaiTE0FIfF9MPFNxp6
 gqRZYsikIWZOpdRFKQXH9xHflRne4jFFSDzA+thLXzvhvSP/sTDQbDXqmZropYKi2/84
 jYKZia1yeO2r6xDb4UIS0LExZSBLted5arvL6xKnqiKc67LtdnL8Bfrb0DVs8QioK3tk
 +Z+BsNiJqgCV12T585FanwO7o8HleMKZZc42WDy25S4Y5jRumIHxjTffRb8CYAI4KqL4
 61lOMRhL7ET4jp/1qgzcpmdcaJt/C9PwrO7RtlhgD2Xru+HAG+zXv4FuUNzX5uHqZnQG
 8cLA==
X-Gm-Message-State: AO0yUKVFkr7JMQx7xIMmdl3qHqNFOYztuXZsjfqU6PantqMzalfmCoAy
 tQPpAQ67JzhYePgRSnaHY0RFusPYl69ON0YSR834k0VrFvFULC7HoLlV6Jn6OZIxYSrU7Iff8pZ
 06lWGndOQWVUboYw=
X-Received: by 2002:a6b:6c13:0:b0:74c:8a53:d07a with SMTP id
 a19-20020a6b6c13000000b0074c8a53d07amr6801946ioh.16.1677186330367; 
 Thu, 23 Feb 2023 13:05:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+KXAQrUy0C0NbJP5tGReIYZwjcuvOCpv9D00Lg9I6+BGc8GIPXT5/pToaLFMx5w97ajQLruA==
X-Received: by 2002:a6b:6c13:0:b0:74c:8a53:d07a with SMTP id
 a19-20020a6b6c13000000b0074c8a53d07amr6801931ioh.16.1677186330099; 
 Thu, 23 Feb 2023 13:05:30 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d4-20020a6b6804000000b0074578972b86sm2009988ioc.30.2023.02.23.13.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 13:05:29 -0800 (PST)
Date: Thu, 23 Feb 2023 14:05:27 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230223140527.096dc42b.alex.williamson@redhat.com>
In-Reply-To: <83238759-4808-1e41-824b-865c330a431a@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 23 Feb 2023 10:37:10 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 22/02/2023 22:10, Alex Williamson wrote:
> > On Wed, 22 Feb 2023 19:49:05 +0200
> > Avihai Horon <avihaih@nvidia.com> wrote:  
> >> From: Joao Martins <joao.m.martins@oracle.com>
> >> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
> >>          .iova = iova,
> >>          .size = size,
> >>      };
> >> +    int ret;
> >> +
> >> +    ret = vfio_record_mapping(container, iova, size, readonly);
> >> +    if (ret) {
> >> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
> >> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
> >> +                     iova, size, ret, strerror(-ret));
> >> +
> >> +        return ret;
> >> +    }  
> > 
> > Is there no way to replay the mappings when a migration is started?
> > This seems like a horrible latency and bloat trade-off for the
> > possibility that the VM might migrate and the device might support
> > these features.  Our performance with vIOMMU is already terrible, I
> > can't help but believe this makes it worse.  Thanks,
> >   
> 
> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
> that uses a max-iova based IOVA range. So this is really for iommu identity
> mapping and no-VIOMMU.

Ok, yes, there are no mappings recorded for any containers that have a
non-empty giommu_list.

> We could replay them if they were tracked/stored anywhere.

Rather than piggybacking on vfio_memory_listener, why not simply
register a new MemoryListener when migration is started?  That will
replay all the existing ranges and allow tracking to happen separate
from mapping, and only when needed.

> I suppose we could move the vfio_devices_all_device_dirty_tracking() into this
> patch and then conditionally call this vfio_{record,erase}_mapping() in case we
> are passing through a device that doesn't have live-migration support? Would
> that address the impact you're concerned wrt to non-live-migrateable devices?
> 
> On the other hand, the PCI device hotplug hypothetical even makes this a bit
> complicated as we can still attempt to hotplug a device before migration is even
> attempted. Meaning that we start with live-migrateable devices, and we added the
> tracking, up to hotpluging a device without such support (adding a blocker)
> leaving the mappings there with no further use. So it felt simpler to just track
> always and avoid any mappings recording if the vIOMMU is in active use?

My preference would be that there's no runtime overhead for migration
support until a migration is initiated.  I currently don't see why we
can't achieve that by dynamically adding a new MemoryListener around
migration for that purpose.  Do you?  Thanks,

Alex


