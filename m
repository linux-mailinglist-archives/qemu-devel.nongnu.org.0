Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B980304B96
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 22:37:54 +0100 (CET)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4W25-0007yu-EK
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 16:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0b-0006s8-Pc
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:36:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0a-0003fH-77
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 16:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611696979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zROVib14jRHiRaqR1JRMjDC84FjzPeimMkA3lXVDz/0=;
 b=IcWaY3XRSQhpfW0Lul3M3hsSyo8vcKcCwdyqRAJ6zjs++kbCF6AeL0AY3Sxu6Cj7EdET+N
 s5YcclJb2Y/yTARGpuICKV+1tr93SjwMc1IK83zQ2qwDwY4uciUjr779fJv5EamJ8bo+OJ
 EmNkoN3CoSnOjbXd9f+ALfqV6Tq96E8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-k6PKxcmzPAKsgtvhZyZMvg-1; Tue, 26 Jan 2021 16:36:11 -0500
X-MC-Unique: k6PKxcmzPAKsgtvhZyZMvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CDA107ACF7;
 Tue, 26 Jan 2021 21:36:09 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA7036F978;
 Tue, 26 Jan 2021 21:36:02 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:36:02 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
Message-ID: <20210126143602.0dac239f@omen.home.shazbot.org>
In-Reply-To: <3f7db9e7-3c98-5022-e907-e6214815fae9@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
 <20201209132947.3177f130.cohuck@redhat.com>
 <20201209113431.5b252e93@omen.home>
 <3f7db9e7-3c98-5022-e907-e6214815fae9@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 10:21:21 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On 2020/12/10 2:34, Alex Williamson wrote:
> > On Wed, 9 Dec 2020 13:29:47 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> >> On Wed, 9 Dec 2020 16:09:17 +0800
> >> Shenming Lu <lushenming@huawei.com> wrote:
> >>  
> >>> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
> >>> setup, if the restoring of the VFIO PCI device config space is
> >>> before the VGIC, an error might occur in the kernel.
> >>>
> >>> So we move the saving of the config space to the non-iterable
> >>> process, so that it will be called after the VGIC according to
> >>> their priorities.
> >>>
> >>> As for the possible dependence of the device specific migration
> >>> data on it's config space, we can let the vendor driver to
> >>> include any config info it needs in its own data stream.
> >>> (Should we note this in the header file linux-headers/linux/vfio.h?)    
> >>
> >> Given that the header is our primary source about how this interface
> >> should act, we need to properly document expectations about what will
> >> be saved/restored when there (well, in the source file in the kernel.)
> >> That goes in both directions: what a userspace must implement, and what
> >> a vendor driver can rely on.  
> 
> Yeah, in order to make the vendor driver and QEMU cooperate better, we might
> need to document some expectations about the data section in the migration
> region...
> >>
> >> [Related, but not a todo for you: I think we're still missing proper
> >> documentation of the whole migration feature.]  
> > 
> > Yes, we never saw anything past v1 of the documentation patch.  Thanks,
> >   
> 
> By the way, is there anything unproper with this patch? Wish your suggestion. :-)

I'm really hoping for some feedback from Kirti, I understand the NVIDIA
vGPU driver to have some dependency on this.  Thanks,

Alex

> >>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> >>> ---
> >>>  hw/vfio/migration.c | 25 +++++++++++++++----------
> >>>  1 file changed, 15 insertions(+), 10 deletions(-)    
> > 
> > .
> >   
> 


