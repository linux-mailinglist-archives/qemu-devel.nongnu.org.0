Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A492D4265
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:48:59 +0100 (CET)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmytt-0003ux-GB
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmyrf-0002ra-0b
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmyrc-0002iw-BG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607517995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LD8H6CUKIPGaBEoQu/VjYMXArMC4gfoh7GTu0kHur6I=;
 b=e+7ANV8R+bs8E+6SSgMEsDawpQnCueDNIu66U1bz3HFMUXudC5k1c3rZUSnukS0qMWcYub
 et7Q3rICktXnZD04GedCMuuJcU7Q/McRH/xxKgyQMIpVmw/eFOsIYXqqfn9rJXmQ8ozXMr
 7aSsbB4b5oj0KDKrYn8JqF6W296SnGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-Hzqg_MwOPv6TC4Votw4ZxQ-1; Wed, 09 Dec 2020 07:46:33 -0500
X-MC-Unique: Hzqg_MwOPv6TC4Votw4ZxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF11F1922057;
 Wed,  9 Dec 2020 12:46:09 +0000 (UTC)
Received: from gondolin (ovpn-113-135.ams2.redhat.com [10.36.113.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74C827092B;
 Wed,  9 Dec 2020 12:45:39 +0000 (UTC)
Date: Wed, 9 Dec 2020 13:45:37 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
Message-ID: <20201209134537.5c7ab401.cohuck@redhat.com>
In-Reply-To: <20201209080919.156-3-lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 16:09:18 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> In the VFIO VM state change handler, VFIO devices are transitioned
> in the _SAVING state, which should keep them from sending interrupts.
> Then we can save the pending states of all interrupts in the GIC VM
> state change handler (on ARM).
> 
> So we have to set the priority of the VFIO VM state change handler
> explicitly (like virtio devices) to ensure it is called before the
> GIC's in saving.

What this patch does is to make the priority of the vfio migration
state change handler depending on the position in the qdev tree. As all
state change handlers with no explicit priority are added at priority
0, this will make sure that this handler runs before (save) resp. after
(restore) nearly all other handlers, which will address your issue here
(and possibly similar ones).

So, this patch seems fine for now, but I'm wondering whether we need to
think more about priorities for handlers in general, and if there are
more hidden dependencies lurking in there.

> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  hw/vfio/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 3b9de1353a..97ea82b100 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>                           vbasedev);
>  
> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> +                                                           vfio_vmstate_change,
>                                                             vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);


