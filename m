Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B5306146
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:52:12 +0100 (CET)
Received: from localhost ([::1]:35952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4o39-0002KP-CC
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4o0X-0001Pi-PB
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l4o0U-0002xY-Mv
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611766165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYKlbKa73Cu1UEPZvBrzw+SW5v4u9juiqmtXfyF4jvU=;
 b=GQq9Ocd/gysm2lgdNrMZKrsUSRf7bI1LOa7CWOQzy0bH9ZAhDOtG7/jFG6ZsUHj4O33Vhg
 CcFa9F0mKpSNZENC1P0PxZ8H08KZMUC9XfAOgJ6MTzOJrziwTCyp47+7IOtJ9Akxj5vcMd
 9cZx6tOsCOPRT2K3an0/wzCT+9654xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-DZcOOkpEPseN2Ocy3bn6VQ-1; Wed, 27 Jan 2021 11:49:23 -0500
X-MC-Unique: DZcOOkpEPseN2Ocy3bn6VQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BF08802B42;
 Wed, 27 Jan 2021 16:49:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-75.ams2.redhat.com
 [10.36.114.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A20519D9D;
 Wed, 27 Jan 2021 16:49:15 +0000 (UTC)
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
To: Stefan Hajnoczi <stefanha@redhat.com>, lagarcia@linux.ibm.com
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210127111938.GH299797@stefanha-x1.localdomain>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6e8d0352-8418-ebb4-2562-13d3920093b5@redhat.com>
Date: Wed, 27 Jan 2021 17:49:14 +0100
MIME-Version: 1.0
In-Reply-To: <20210127111938.GH299797@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/27/21 12:19, Stefan Hajnoczi wrote:
> On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> Currently, as IOMMU and ATS are not supported, if a user mistakenly set
>> any of them and tries to mount the vhost-user filesystem inside the
>> guest, whenever the user tries to access the mount point, the system
>> will hang forever.
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>> ---
>>  hw/virtio/vhost-user-fs-pci.c | 7 +++++++
>>  hw/virtio/vhost-user-fs.c     | 5 +++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
>> index 2ed8492b3f..564d1fd108 100644
>> --- a/hw/virtio/vhost-user-fs-pci.c
>> +++ b/hw/virtio/vhost-user-fs-pci.c
>> @@ -11,6 +11,8 @@
>>   * top-level directory.
>>   */
>>  
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>>  #include "qemu/osdep.h"
>>  #include "hw/qdev-properties.h"
>>  #include "hw/virtio/vhost-user-fs.h"
>> @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>          vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
>>      }
>>  
>> +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
>> +        error_setg(errp, "ATS is currently not supported with vhost-user-fs-pci");
>> +        return;
>> +    }
> 
> Why is this check needed in addition to VIRTIO_F_IOMMU_PLATFORM?
> 
> What needs to be added to support ATS?
> 
>> +
>>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>>  }
>>  
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index ac4fc34b36..914d68b3ee 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>  
>> +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>> +        error_setg(errp, "IOMMU is currently not supported with vhost-user-fs");
>> +        return;
>> +    }
>> +
>>      if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
> 
> I thought IOMMU support depends on the vhost-user device backend (e.g.
> virtiofsd), so the vhost-user backend should participate in advertising
> this feature.

... I had the same thought when a few weeks earlier I tried to use
virtio-fs with an SEV guest (just OVMF), and virtiofsd crashed,
apparently :)

(I didn't report it because, well, SEV wants to prevent sharing between
host and guest, and virtio-fs works precisely in the opposite direction;
so the use case may not have much merit.)

Thanks
Laszlo

> 
> Perhaps the check should be:
> 
>     ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                          VHOST_BACKEND_TYPE_USER, 0);
>     if (ret < 0) {
>         error_setg_errno(errp, -ret, "vhost_dev_init failed");
>         goto err_virtio;
>     }
> +
> +   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
> +       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFORM))) {
> +       error_setg(errp, "IOMMU is not supported by the vhost-user device backend");
> +       goto err_iommu_needed;
> +   }
> 
> Also, can this logic be made generic for all vhost-user devices? It's
> not really specific to vhost-user-fs.
> 
> Stefan
> 


