Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880082B82A8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:07:45 +0100 (CET)
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQvo-0002w3-6P
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfQqE-00086j-7R
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:01:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfQq9-00084f-SN
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605718910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YSyHGBugllsAr8aKmi8t3RAK6+3C22WUhyNrUUD6pj8=;
 b=ixyzyZak4MtchmOWE53QpVPzaoP/83XVZLRUjhncxUlxdrWWGbP36opypBvlU73oXrz3l1
 QZSa4pTct8IejvSFysSnYsO8ZHqczotY1IttIPEZDTbRaNe1y3pMQJDfKSplpRgbuefk2z
 aCNfeoNd2nxZ5Djci/cwKQzE7a4e2cQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-iPJamaWtNDKz98mKCUVQ3A-1; Wed, 18 Nov 2020 12:01:48 -0500
X-MC-Unique: iPJamaWtNDKz98mKCUVQ3A-1
Received: by mail-qk1-f200.google.com with SMTP id q21so1975755qkq.11
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 09:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YSyHGBugllsAr8aKmi8t3RAK6+3C22WUhyNrUUD6pj8=;
 b=J092KxQX0xj0DkBA6haBioyBK838oUOxWtVrYNTq0+PbcaJ5Hie30RAzztW3JaIv8G
 G/gGBRzuKawNORZ5YedmBFxt3bBSGPZcLOPSKt+1VeLBqO8WVwywOao10T8B9EQtM54P
 RL/k50W7WiC4hP1xCfScd2xGDlsRPDlsQXmGGJPKSi9ha7Nq6sXL8zcycbRRwajAmFB7
 b+lXCPodT2rLKft1DU3vztYJO1Zat9iGIqOjuiWZ0I6jw4Xwb2GwezLdHVthilFc5W4F
 ooFnRsauHZGnEpFiMCm6uiY7WuCo44Zl/GkHUwuafIaAiE7VWhmxJ2ORlzRgFoYnUTk7
 RQ6w==
X-Gm-Message-State: AOAM533lPxiAE4IrR0nHwIyBGscb7QCmSq+hbOZlO4dmv6hrVwpcDJpu
 P/a5XOkT/DsfNslddF2Ew80wC6QN07ucHhij73Oke/ORqVuFlv21aGcVPVrcLdQc8EVNwMZUeB9
 LymNMKCmRzn6oomA=
X-Received: by 2002:aed:2051:: with SMTP id 75mr5043938qta.332.1605718906726; 
 Wed, 18 Nov 2020 09:01:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuvA58po3doa6FDlVNHBBnShjzPSSQN6tXeocKUIsTw9vzDZ27yC9g/hCKITh9/N4dIPXBYw==
X-Received: by 2002:aed:2051:: with SMTP id 75mr5043906qta.332.1605718906424; 
 Wed, 18 Nov 2020 09:01:46 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id h4sm17724257qkh.93.2020.11.18.09.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 09:01:45 -0800 (PST)
Date: Wed, 18 Nov 2020 12:01:43 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH PROTOTYPE 3/6] vfio: Implement support for sparse RAM
 memory regions
Message-ID: <20201118170143.GC29639@xz-x1>
References: <20200924160423.106747-1-david@redhat.com>
 <20200924160423.106747-4-david@redhat.com>
 <20201020194434.GD200400@xz-x1>
 <14aaf9f1-9aa4-3a6b-ff25-8a4c7e29c2a6@redhat.com>
 <20201020204443.GE200400@xz-x1>
 <fcbea24d-c56a-12b4-4a7b-d8faa1e04047@redhat.com>
 <20201118152311.GB29639@xz-x1>
 <6141422c-1427-2a8d-b3ff-3c49ab1b59d2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6141422c-1427-2a8d-b3ff-3c49ab1b59d2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Le Tan <tamlokveer@gmail.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, wei.huang2@amd.com,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 05:14:22PM +0100, David Hildenbrand wrote:
> That did the trick! Thanks!!!

Great!  At the meantime, I've a few questions majorly about memory unplugging
below, which could be naive - I know little on that, please bare with me.. :)

> 
> virtio-mem + vfio + iommu seems to work. More testing to be done.
> 
> However, malicious guests can play nasty tricks like
> 
> a) Unplugging plugged virtio-mem blocks while they are mapped via an
>    IOMMU
> 
> 1. Guest: map memory location X located on a virtio-mem device inside a
>    plugged block into the IOMMU
>    -> QEMU IOMMU notifier: create vfio DMA mapping
>    -> VFIO pins memory of unplugged blocks (populating memory)
> 2. Guest: Request to unplug memory location X via virtio-mem device
>    -> QEMU virtio-mem: discards the memory.
>    -> VFIO still has the memory pinned

When unplug some memory, does the user need to first do something to notify the
guest kernel that "this memory is going to be unplugged soon" (assuming echo
"offline" to some dev file)?  Then the kernel should be responsible to prepare
for that before it really happens, e.g., migrate anonymous pages out from this
memory block.  I don't know what would happen if some pages on the memblock
were used for DMA like this and we want to unplug it.  Ideally I thought it
should fail the "echo offline" operation with something like EBUSY if it can't
notify the device driver about this, or it's hard to.

IMHO this question not really related to vIOMMU, but a general question for
unplugging. Say, what would happen if we unplug some memory with DMA buffers
without vIOMMU at all?  The buffer will be invalid right after unplugging, so
the guest kernel should either fail the operation trying to unplug, or at least
tell the device drivers about this somehow?

> 
> We consume more memory than intended. In case virtio-memory would get
> replugged and used, we would have an inconsistency. IOMMU device resets/ fix
> it (whereby all VFIO mappings are removed via the IOMMU notifier).
> 
> 
> b) Mapping unplugged virtio-mem blocks via an IOMMU
> 
> 1. Guest: map memory location X located on a virtio-mem device inside an
>    unplugged block
>    -> QEMU IOMMU notifier: create vfio DMA mapping
>    -> VFIO pins memory of unplugged blocks (populating memory)

For this case, I would expect vfio_get_xlat_addr() to fail directly if the
guest driver force to map some IOVA onto an invalid range of the virtio-mem
device.  Even before that, since the guest should know that this region of
virtio-mem is not valid since unplugged, so shouldn't the guest kernel directly
fail the dma_map() upon such a region even before the mapping message reaching
QEMU?

Thanks,

> 
> Memory that's supposed to be discarded now consumes memory. This is similar
> to a malicious guest simply writing to unplugged memory blocks (to be
> tackled with "protection of unplugged memory" in the future) - however
> memory will also get pinned.
> 
> 
> To prohibit b) from happening, we would have to disallow creating the VFIO
> mapping (fairly easy).
> 
> To prohibit a), there would have to be some notification to IOMMU
> implementations to unmap/refresh whenever an IOMMU entry still points at
> memory that is getting discarded (and the VM is doing something it's not
> supposed to do).

-- 
Peter Xu


