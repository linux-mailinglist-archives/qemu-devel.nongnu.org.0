Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF87207BFC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 21:06:07 +0200 (CEST)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joAik-0001JT-QI
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 15:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1joAc3-0000Kk-Sx
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 14:59:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21002
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1joAc2-0004Cq-1H
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 14:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593025149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOztEBp/HM+Gf/njqciRF5+gXi48uZG2h3vo0+CdzZ4=;
 b=hgPKWGF6V2bpwpO/FJLK+/JEwitmTnuO3NzWuB9vqZOmWckJ00ZSIN6sBCWmjNNqAD8s5g
 ILNWOBczBSTrnE8nIPH78K4Cx0KADHDD05QqDFM52Na7AMgfEQ6leR6hd94o7Ev5Tb5izu
 GKLX8XG1o/Gq5wWXCEekJNXdsvYYIuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-WBkRWW6hMZCw7PTpr3dDrQ-1; Wed, 24 Jun 2020 14:59:07 -0400
X-MC-Unique: WBkRWW6hMZCw7PTpr3dDrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32A9C804002;
 Wed, 24 Jun 2020 18:59:05 +0000 (UTC)
Received: from x1.home (ovpn-112-156.phx2.redhat.com [10.3.112.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DA1761981;
 Wed, 24 Jun 2020 18:59:03 +0000 (UTC)
Date: Wed, 24 Jun 2020 12:55:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH QEMU v25 12/17] vfio: Add function to start and stop
 dirty pages tracking
Message-ID: <20200624125519.1e60c8a3@x1.home>
In-Reply-To: <1592684486-18511-13-git-send-email-kwankhede@nvidia.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-13-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81;
 envelope-from=alex.williamson@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
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
Cc: cohuck@redhat.com, cjia@nvidia.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, dgilbert@redhat.com, changpeng.liu@intel.com,
 eskultet@redhat.com, Ken.Xue@amd.com, jonathan.davies@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Jun 2020 01:51:21 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Call VFIO_IOMMU_DIRTY_PAGES ioctl to start and stop dirty pages tracking
> for VFIO devices.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/vfio/migration.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index faacea5327cb..e0fbb3a01855 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -11,6 +11,7 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/cutils.h"
>  #include <linux/vfio.h>
> +#include <sys/ioctl.h>
>  
>  #include "sysemu/runstate.h"
>  #include "hw/vfio/vfio-common.h"
> @@ -329,6 +330,32 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>      return qemu_file_get_error(f);
>  }
>  
> +static int vfio_start_dirty_page_tracking(VFIODevice *vbasedev, bool start)
> +{
> +    int ret;
> +    VFIOContainer *container = vbasedev->group->container;
> +    struct vfio_iommu_type1_dirty_bitmap dirty = {
> +        .argsz = sizeof(dirty),
> +    };
> +
> +    if (start) {
> +        if (vbasedev->device_state & VFIO_DEVICE_STATE_SAVING) {
> +            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
> +        } else {
> +            return -EINVAL;
> +        }
> +    } else {
> +            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
> +    }
> +
> +    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
> +    if (ret) {
> +        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
> +                     dirty.flags, errno);
> +    }
> +    return ret;
> +}

What happens when we have a device that supports a migration region
paired with an IOMMU that doesn't report dirty page tracking, shouldn't
we have tested container->dirty_pages_supported somewhere in the
process of determining if the device is migratable?  Thanks,

Alex


> +
>  /* ---------------------------------------------------------------------- */
>  
>  static int vfio_save_setup(QEMUFile *f, void *opaque)
> @@ -360,6 +387,11 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> +    ret = vfio_start_dirty_page_tracking(vbasedev, true);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>  
>      ret = qemu_file_get_error(f);
> @@ -375,6 +407,8 @@ static void vfio_save_cleanup(void *opaque)
>      VFIODevice *vbasedev = opaque;
>      VFIOMigration *migration = vbasedev->migration;
>  
> +    vfio_start_dirty_page_tracking(vbasedev, false);
> +
>      if (migration->region.mmaps) {
>          vfio_region_unmap(&migration->region);
>      }
> @@ -706,6 +740,8 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>          if (ret) {
>              error_report("%s: Failed to set state RUNNING", vbasedev->name);
>          }
> +
> +        vfio_start_dirty_page_tracking(vbasedev, false);
>      }
>  }
>  


