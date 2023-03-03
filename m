Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F236AA035
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:41:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYBGh-0001Lv-AZ; Fri, 03 Mar 2023 14:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pYBGc-0001H3-3m
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pYBGY-00025X-Kr
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677872429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0IiVimkfPlD/DOMvDa0uxZq1MWWHAwoGIUGtx1Xdnw=;
 b=OWHAa6qA30fBVRalP602KQ07DRBu37TmXor/8eJWmjIswu3XJrOb8NHeN9fppygqgKjCn/
 DW/Bijr8VR13zr6oCbxH7HNov2smxv2jfmtyTqFBInV9/aWpurtwg5CCnXQCPt+1yZr9cn
 Z4vW2UyfYu8ORe0QM5WB4fOj5JnWRTQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-7JbQmStXNy-SkPx4LSzwYw-1; Fri, 03 Mar 2023 14:40:28 -0500
X-MC-Unique: 7JbQmStXNy-SkPx4LSzwYw-1
Received: by mail-il1-f197.google.com with SMTP id
 k13-20020a056e021a8d00b0031bae68b383so737564ilv.18
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0IiVimkfPlD/DOMvDa0uxZq1MWWHAwoGIUGtx1Xdnw=;
 b=X0N7JQ3X7Vrp2lBoqmZaxmSnoYVwNTkFzQatikUEcLXpO+XbInj92mjQbEDSTe2K0/
 9BJG4Pc722IyuCfinG7wTczGst8j8cfFIG1uohgnpHaYpw2/arpNM+sOUM3sIXkHeTHy
 hzw33rPNWDzBM1t6SA9wpxSRIKW/bFDBf+H14bpi1bCT1thksZECEnSueWOdca6H1xfL
 1BcykIw4vOFJHIYxWCyJTA3IPhkEF/KF/zFyNpXrLWiyaoOqTsGHbdiZgsUweO/D7r/a
 FwHQsfLFXymlUvspxShI/B1yAYSakctFNOVpUoxQ7l9FxfrolMCgwE3YQnIZs99SYhY6
 ePoA==
X-Gm-Message-State: AO0yUKWaGBPkMlRHu7A61TBwavRXoPXHFlVTdFdNnlc3KFCekSibuP+C
 Z7FajY1l5JwWpukfonGge/kHwGaC0OCK5Yue9YLPxX5WzS33don+AnA1znrV6Iqsoti9ZOTglrr
 kfu3iSTsds7kkqqE=
X-Received: by 2002:a05:6e02:1447:b0:317:3f4:c5c7 with SMTP id
 p7-20020a056e02144700b0031703f4c5c7mr2660202ilo.3.1677872427905; 
 Fri, 03 Mar 2023 11:40:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+l3RvXTD3KNxa74MLwsp72YXie4HVfBwfAbBzr6RF9wt1wcfEcPSdS61pxNGEnEoFF3OJtVQ==
X-Received: by 2002:a05:6e02:1447:b0:317:3f4:c5c7 with SMTP id
 p7-20020a056e02144700b0031703f4c5c7mr2660172ilo.3.1677872427650; 
 Fri, 03 Mar 2023 11:40:27 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056e020d0700b00317f477b039sm842257ilj.4.2023.03.03.11.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 11:40:26 -0800 (PST)
Date: Fri, 3 Mar 2023 12:40:25 -0700
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
Message-ID: <20230303124025.64c35d87.alex.williamson@redhat.com>
In-Reply-To: <87b39028-4b65-36bb-6b41-9d8ac56164a9@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
 <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
 <20230228133653.2f911490.alex.williamson@redhat.com>
 <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
 <20230302114248.41b6c21b.alex.williamson@redhat.com>
 <c1e5fa47-7028-5e24-2158-2e64aa44006a@oracle.com>
 <9e219add-ec7c-4408-902f-fce8c5c64020@oracle.com>
 <20230303100551.435e8cd3.alex.williamson@redhat.com>
 <87b39028-4b65-36bb-6b41-9d8ac56164a9@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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

On Fri, 3 Mar 2023 19:14:50 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 03/03/2023 17:05, Alex Williamson wrote:
> > On Fri, 3 Mar 2023 16:58:55 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> On 03/03/2023 00:19, Joao Martins wrote:  
> >>> On 02/03/2023 18:42, Alex Williamson wrote:    
> >>>> On Thu, 2 Mar 2023 00:07:35 +0000
> >>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
> >>>>>      multiple_devices_migration_blocker = NULL;
> >>>>>  }
> >>>>>
> >>>>> +static bool vfio_have_giommu(VFIOContainer *container)
> >>>>> +{
> >>>>> +    return !QLIST_EMPTY(&container->giommu_list);
> >>>>> +}    
> >>>>
> >>>> I think it's the case, but can you confirm we build the giommu_list
> >>>> regardless of whether the vIOMMU is actually enabled?
> >>>>    
> >>> I think that is only non-empty when we have the first IOVA mappings e.g. on
> >>> IOMMU passthrough mode *I think* it's empty. Let me confirm.
> >>>     
> >> Yeap, it's empty.
> >>  
> >>> Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
> >>> the VM was configured with a vIOMMU or not. That is to create the LM blocker.
> >>>     
> >> I am trying this way, with something like this, but neither
> >> x86_iommu_get_default() nor below is really working out yet. A little afraid of
> >> having to add the live migration blocker on each machine_init_done hook, unless
> >> t here's a more obvious way. vfio_realize should be at a much later stage, so I
> >> am surprised how an IOMMU object doesn't exist at that time.  
> > 
> > Can we just test whether the container address space is system_memory?  
> 
> IIUC, it doesn't work (see below snippet).
> 
> The problem is that you start as a regular VFIO guest, and when the guest boot
> is when new mappings get established/invalidated and propagated into listeners
> (vfio_listener_region_add) and they morph into having a giommu. And that's when
> you can figure out in higher layers that 'you have a vIOMMU' as that's when the
> address space gets changed? That is without being specific to a particular IOMMU
> model. Maybe region_add is where to add, but then it then depends on the guest.

This doesn't seem right to me, look for instance at
pci_device_iommu_address_space() which returns address_space_memory
when there is no vIOMMU.  If devices share an address space, they can
share a container.  When a vIOMMU is present (not even enabled), each
device gets it's own container due to the fact that it's in its own
address space (modulo devices within the same address space due to
aliasing).  Thanks,

Alex


