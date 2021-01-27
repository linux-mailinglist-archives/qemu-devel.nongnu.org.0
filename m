Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8872305E17
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:22:00 +0100 (CET)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4lho-0005hw-0W
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4lgb-00056b-J2
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:20:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4lgQ-00050B-NH
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611757233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PV28gQcNZLdGQSNdPYf9VNAdRCWLVY3IDHnJ2TlKBBw=;
 b=OBeGAf0ICN02H8cJw9ye5jbtduSy8QRDNJ6xQHNoiD2256BpYcBpbRcuSFy0T7qkQIRpRC
 K1GTzlGXF5I8qR7i0BiQ5JEOiIaPcJP2lknERwHuiL+h0rz6DCZKs1HLnalg1PhGwPNF23
 hY0CpJfo9ejKfziDDfb5jYgODh5xqL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-G8w1Ljf8Pda-x4Y9QHHnAg-1; Wed, 27 Jan 2021 09:20:29 -0500
X-MC-Unique: G8w1Ljf8Pda-x4Y9QHHnAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD7111014E63;
 Wed, 27 Jan 2021 14:20:27 +0000 (UTC)
Received: from x1.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE9C360C62;
 Wed, 27 Jan 2021 14:20:20 +0000 (UTC)
Date: Wed, 27 Jan 2021 07:20:14 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
Message-ID: <20210127072014.6ed9ff04@x1.home.shazbot.org>
In-Reply-To: <153c36e0-3c7d-cbce-3f37-9ba8c36ce1ca@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
 <20210126143605.4f9d5b25@omen.home.shazbot.org>
 <153c36e0-3c7d-cbce-3f37-9ba8c36ce1ca@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, 27 Jan 2021 19:20:06 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On 2021/1/27 5:36, Alex Williamson wrote:
> > On Wed, 9 Dec 2020 16:09:18 +0800
> > Shenming Lu <lushenming@huawei.com> wrote:
> >   
> >> In the VFIO VM state change handler, VFIO devices are transitioned
> >> in the _SAVING state, which should keep them from sending interrupts.  
> > 
> > Is this comment accurate?  It's my expectation that _SAVING has no
> > bearing on a device generating interrupts.  Interrupt generation must
> > be allowed to continue so long as the device is _RUNNING.  Thanks,
> >   
> 
> To be more accurate, the _RUNNING bit in device_state is cleared in the
> VFIO VM state change handler when stopping the VM. And if the device continues
> to send interrupts after this, how can we save the states of device interrupts
> in the stop-and-copy phase?...

Exactly, it's clearing the _RUNNING bit that makes the device stop,
including no longer generating interrupts.  Perhaps I incorrectly
inferred "_SAVING state" as referring to the _SAVING bit when you
actually intended:

   *  +------- _RESUMING
   *  |+------ _SAVING
   *  ||+----- _RUNNING
   *  |||
   *  000b => Device Stopped, not saving or resuming
   *  001b => Device running, which is the default state
-> *  010b => Stop the device & save the device state, stop-and-copy state

ie. the full state when only _SAVING is set.

Could we make the comment more clear to avoid this confusion?  Thanks,

Alex

> >> Then we can save the pending states of all interrupts in the GIC VM
> >> state change handler (on ARM).
> >>
> >> So we have to set the priority of the VFIO VM state change handler
> >> explicitly (like virtio devices) to ensure it is called before the
> >> GIC's in saving.
> >>
> >> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> >> Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
> >> ---
> >>  hw/vfio/migration.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> >> index 3b9de1353a..97ea82b100 100644
> >> --- a/hw/vfio/migration.c
> >> +++ b/hw/vfio/migration.c
> >> @@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
> >>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
> >>                           vbasedev);
> >>  
> >> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> >> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> >> +                                                           vfio_vmstate_change,
> >>                                                             vbasedev);
> >>      migration->migration_state.notify = vfio_migration_state_notifier;
> >>      add_migration_state_change_notifier(&migration->migration_state);  
> > 
> > .
> >   
> 


