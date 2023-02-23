Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD556A12D8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:33:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVK9Y-0003Cf-5k; Thu, 23 Feb 2023 17:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVK9W-0003CM-7c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVK9U-0002dM-EZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677191602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPR4YB1kCUqK6pep585qFaM90MYgbOw5GdVtJJT/V5A=;
 b=cxqA8Snb/Kc/hPJlf52w7KPt9D1kdtbKzuXLtOETNkT3pteNHBm1rxK491PZyMNUeRa+qh
 QX4rVrKtKFCIm7CVIb0dnNy1zkCT1IiMyEiolDN+aHSQzcnInoRJTj8ZAsGBiyfhUxeLVb
 EBY51dYzgT+B6VYk3wd7QQwFXf88U6c=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-mSt-LRGMOXuNraOV6dKuCQ-1; Thu, 23 Feb 2023 17:33:14 -0500
X-MC-Unique: mSt-LRGMOXuNraOV6dKuCQ-1
Received: by mail-il1-f198.google.com with SMTP id
 k10-20020a92b70a000000b00316fed8644fso1679389ili.21
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPR4YB1kCUqK6pep585qFaM90MYgbOw5GdVtJJT/V5A=;
 b=5KCjiKIQOLWMB5ZZcognS0eCDf/aMA2RSPQXJ6mzhQGygEu2KE55ryH9UAzq3tmJkj
 8Lh4x2GsI2t2adhS8obo0JC9FUHxpmEh0zfkz/R13w3Wf4uGEYgNywiX73mN6lREUpnG
 CyvnAG6ebYwHLsuNI7okWdfqxUM8gWEzoLcz2z3pwpWgYTknUvQs4CYEGW6aAFsIBzVA
 2LMlFO6RE85hRMocH5iJoImmZMQpna/2K33MYA/QSuEwBy48HKbYPYgMQLp2tiV1sNxU
 OcyX1FwUjmZe2w8hIIE/zfcQgmtCrUqf5WMR0lDx9iqkOg/Mid+9FAbNhMqDnocW152h
 x3FA==
X-Gm-Message-State: AO0yUKUE76cQBIitkcGOwF4DKTXdyiCsWv1EQTBRHf5jk8SZpLqZ46/O
 s+sH3jL+wTyZrkvqxwcLjulujZ0CumJ6kNu744BovXKHq8D9JVPYzf3N+fqkDTGZ5pwalTJ/DSa
 trc2Iwc5x567YFwM=
X-Received: by 2002:a92:cd83:0:b0:316:f99d:93cb with SMTP id
 r3-20020a92cd83000000b00316f99d93cbmr4375173ilb.11.1677191593322; 
 Thu, 23 Feb 2023 14:33:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+lqUdogdC8QlTu3wUrT4j/q7mwGC8dxEv5AI/GjE7pyK3sHh/rudy8thFV4p+5uHCNGF9qSA==
X-Received: by 2002:a92:cd83:0:b0:316:f99d:93cb with SMTP id
 r3-20020a92cd83000000b00316f99d93cbmr4375144ilb.11.1677191593019; 
 Thu, 23 Feb 2023 14:33:13 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v25-20020a02b919000000b0039e98b2fe5dsm1895432jan.179.2023.02.23.14.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 14:33:12 -0800 (PST)
Date: Thu, 23 Feb 2023 15:33:09 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page
 tracking with vIOMMU
Message-ID: <20230223153309.298af6e1.alex.williamson@redhat.com>
In-Reply-To: <Y/fS2rX+JvYVC9jR@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
 <Y/fS2rX+JvYVC9jR@nvidia.com>
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

On Thu, 23 Feb 2023 16:55:54 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
> > > #2 is the presumption that the guest is using an identity map.  
> > 
> > This is a dangerous assumption.
> >   
> > > > I'd think the only viable fallback if the vIOMMU doesn't report its max
> > > > IOVA is the full 64-bit address space, otherwise it seems like we need
> > > > to add a migration blocker.    
> > > 
> > > This is basically saying vIOMMU doesn't work with migration, and we've
> > > heard that this isn't OK. There are cases where vIOMMU is on but the
> > > guest always uses identity maps. eg for virtual interrupt remapping.  
> > 
> > Yes, the vIOMMU can be automatically added to a VM when we exceed 255
> > vCPUs, but I don't see how we can therefore deduce anything about the
> > usage mode of the vIOMMU.    
> 
> We just loose optimizations. Any mappings that are established outside
> the dirty tracking range are permanently dirty. So at worst the guest
> can block migration by establishing bad mappings. It is not exactly
> production quality but it is still useful for a closed environment
> with known guest configurations.

That doesn't seem to be what happens in this series, nor does it really
make sense to me that userspace would simply decide to truncate the
dirty tracking ranges array.

> > nested assignment, ie. userspace drivers running within the guest,
> > where making assumptions about the IOVA extents of the userspace driver
> > seems dangerous.
> >
> > Let's backup though, if a device doesn't support the full address width
> > of the platform, it's the responsibility of the device driver to
> > implement a DMA mask such that the device is never asked to DMA outside
> > of its address space support.  Therefore how could a device ever dirty
> > pages outside of its own limitations?  
> 
> The device always supports the full address space. We can't enforce
> any kind of limit on the VM
> 
> It just can't dirty track it all.
> 
> > Isn't it reasonable to require that a device support dirty tracking for
> > the entire extent if its DMA address width in order to support this
> > feature?  
> 
> No, 2**64 is too big a number to be reasonable.

So what are the actual restrictions were dealing with here?  I think it
would help us collaborate on a solution if we didn't have these device
specific restrictions sprinkled through the base implementation.

> Ideally we'd work it the other way and tell the vIOMMU that the vHW
> only supports a limited number of address bits for the translation, eg
> through the ACPI tables. Then the dirty tracking could safely cover
> the larger of all system memory or the limited IOVA address space.

Why can't we do that?  Hotplug is an obvious issue, but maybe it's not
vHW telling the vIOMMU a restriction, maybe it's a QEMU machine or
vIOMMU option and if it's not set to something the device can support,
migration is blocked.
 
> Or even better figure out how to get interrupt remapping without IOMMU
> support :\

-machine q35,default_bus_bypass_iommu=on,kernel-irqchip=split \
-device intel-iommu,caching-mode=on,intremap=on

Thanks,
Alex


