Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DCB204BF3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 10:09:08 +0200 (CEST)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jndzP-00054k-4E
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 04:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jndyf-0004e0-Pr
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:08:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44795
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jndyd-0002SX-AD
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592899698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adTNezjqdlouET/msBezLh2166idvYVpEAdodKuqh4E=;
 b=LDZZG/OQdAhmY4bSDP/eNjwEiSQd95PFyn/LthsdcLy6gLbPjY+UPVeDidntF70jvEuq3n
 uRrZAWmu2npNRvEOi0YBhsstzdvTn8e4u0IxYgL5wJro1jE8a043NPgzSDQMRE213+xU5T
 whULzLYywfO9HDvPnO6rsc9Z2Y34nR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-UkvhhN0RNKGaehDGNFpWcQ-1; Tue, 23 Jun 2020 04:08:14 -0400
X-MC-Unique: UkvhhN0RNKGaehDGNFpWcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E6A9184D14E;
 Tue, 23 Jun 2020 08:08:12 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F24160CD3;
 Tue, 23 Jun 2020 08:07:58 +0000 (UTC)
Date: Tue, 23 Jun 2020 10:07:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH QEMU v25 05/17] vfio: Add VM state change handler to
 know state of VM
Message-ID: <20200623100755.1a41197a.cohuck@redhat.com>
In-Reply-To: <1592684486-18511-6-git-send-email-kwankhede@nvidia.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-6-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: cjia@nvidia.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 eauger@redhat.com, yi.l.liu@intel.com, quintela@redhat.com,
 ziye.yang@intel.com, armbru@redhat.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, felipe@nutanix.com, zhi.a.wang@intel.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Jun 2020 01:51:14 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> VM state change handler gets called on change in VM's state. This is used to set
> VFIO device state to _RUNNING.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/vfio/migration.c           | 87 +++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |  2 +
>  include/hw/vfio/vfio-common.h |  4 ++
>  3 files changed, 93 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 48ac385d80a7..fcecc0bb0874 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -10,6 +10,7 @@
>  #include "qemu/osdep.h"
>  #include <linux/vfio.h>
>  
> +#include "sysemu/runstate.h"
>  #include "hw/vfio/vfio-common.h"
>  #include "cpu.h"
>  #include "migration/migration.h"
> @@ -74,6 +75,85 @@ err:
>      return ret;
>  }
>  
> +static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
> +                                    uint32_t value)

I commented on this interface already in
https://lore.kernel.org/qemu-devel/20200505120459.62bd0b16.cohuck@redhat.com/,
but I did not see any reply... I guess my comments still apply (here
and below).

> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    VFIORegion *region = &migration->region;
> +    uint32_t device_state;
> +    int ret;
> +
> +    ret = pread(vbasedev->fd, &device_state, sizeof(device_state),
> +                region->fd_offset + offsetof(struct vfio_device_migration_info,
> +                                              device_state));
> +    if (ret < 0) {
> +        error_report("%s: Failed to read device state %d %s",
> +                     vbasedev->name, ret, strerror(errno));
> +        return ret;
> +    }
> +
> +    device_state = (device_state & mask) | value;
> +
> +    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
> +        return -EINVAL;
> +    }
> +
> +    ret = pwrite(vbasedev->fd, &device_state, sizeof(device_state),
> +                 region->fd_offset + offsetof(struct vfio_device_migration_info,
> +                                              device_state));
> +    if (ret < 0) {
> +        error_report("%s: Failed to set device state %d %s",
> +                     vbasedev->name, ret, strerror(errno));
> +
> +        ret = pread(vbasedev->fd, &device_state, sizeof(device_state),
> +                region->fd_offset + offsetof(struct vfio_device_migration_info,
> +                device_state));
> +        if (ret < 0) {
> +            error_report("%s: On failure, failed to read device state %d %s",
> +                    vbasedev->name, ret, strerror(errno));
> +            return ret;
> +        }
> +
> +        if (VFIO_DEVICE_STATE_IS_ERROR(device_state)) {
> +            error_report("%s: Device is in error state 0x%x",
> +                         vbasedev->name, device_state);
> +            return -EFAULT;

E.g., why -EFAULT here?

> +        }
> +    }
> +
> +    vbasedev->device_state = device_state;
> +    trace_vfio_migration_set_state(vbasedev->name, device_state);
> +    return 0;
> +}
> +
> +static void vfio_vmstate_change(void *opaque, int running, RunState state)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    if ((vbasedev->vm_running != running)) {
> +        int ret;
> +        uint32_t value = 0, mask = 0;
> +
> +        if (running) {
> +            value = VFIO_DEVICE_STATE_RUNNING;
> +            if (vbasedev->device_state & VFIO_DEVICE_STATE_RESUMING) {
> +                mask = ~VFIO_DEVICE_STATE_RESUMING;
> +            }
> +        } else {
> +            mask = ~VFIO_DEVICE_STATE_RUNNING;
> +        }
> +
> +        ret = vfio_migration_set_state(vbasedev, mask, value);
> +        if (ret) {
> +            error_report("%s: Failed to set device state 0x%x",
> +                         vbasedev->name, value & mask);
> +        }
> +        vbasedev->vm_running = running;
> +        trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> +                                  value & mask);
> +    }
> +}
> +
>  static int vfio_migration_init(VFIODevice *vbasedev,
>                                 struct vfio_region_info *info)
>  {


