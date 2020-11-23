Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5A2C1059
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 17:33:42 +0100 (CET)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khEmb-0004u8-6V
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 11:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khEkF-0004El-A3
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khEkC-0006Eu-62
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606149070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNOwqIdxwIX+1fD/wHjrzhUN+oBJ52KhmkMlBQde7k4=;
 b=aK+/dkyj7mQLVdP51m5Iob/3Qdc5c1NwjIxYGIrjv6I3ikkzTQpm++O1pLAlOnnygzagYE
 prTDyWDFiov8207Q9wAaXtoWfwq3mrriX4o8y/PrAe3+uh0v7sZIL79hih/x9olir+ueUt
 C9qkt4Gr2nsnSWWq/D8OFOIEjLy5dIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-TfuIY5J4PLicNTzgxJ0tLQ-1; Mon, 23 Nov 2020 11:31:06 -0500
X-MC-Unique: TfuIY5J4PLicNTzgxJ0tLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 874918042AE;
 Mon, 23 Nov 2020 16:31:04 +0000 (UTC)
Received: from gondolin (ovpn-113-104.ams2.redhat.com [10.36.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A4AF5C1BD;
 Mon, 23 Nov 2020 16:30:59 +0000 (UTC)
Date: Mon, 23 Nov 2020 17:30:56 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [PATCH RFC] vfio: Set the priority of VFIO VM state change
 handler explicitly
Message-ID: <20201123173056.5b27ab5d.cohuck@redhat.com>
In-Reply-To: <20201117014050.1385-1-lushenming@huawei.com>
References: <20201117014050.1385-1-lushenming@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 09:40:50 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> In VFIO VM state change handler, VFIO devices are transitioned in
> _SAVING state, which should keep them from sending interrupts. Then
> we can save the pending states of all interrupts in GIC VM state
> change handler (on ARM).
> 
> So we have to set the priority of VFIO VM state change handler
> explicitly (like virtio devices) to ensure it is called before GIC's
> in saving.

I'm wondering whether this is the case for other irq chips as well, and
the GIC is just the first one where it was noticed.

> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>  hw/vfio/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 55261562d4..d0d30864ba 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -857,7 +857,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>                           vbasedev);
>  
> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> +                                                           vfio_vmstate_change,
>                                                             vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);

I think this patch does what the patch description says, but I'm
wondering whether we might miss other interdependencies as well (which
would also be fixed by pushing the vm state handling of vfio devices to
that point in the sequence?)


