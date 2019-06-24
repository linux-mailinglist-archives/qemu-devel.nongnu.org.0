Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E950D3E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 16:06:17 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfPbs-00011E-KJ
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 10:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hfPXq-0007OX-1Q
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:02:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hfPXk-0004Nj-Tp
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:02:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hfPXj-0003sK-OE
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:02:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 438F622388D;
 Mon, 24 Jun 2019 14:00:59 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0B7260156;
 Mon, 24 Jun 2019 14:00:40 +0000 (UTC)
Date: Mon, 24 Jun 2019 16:00:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190624160038.5a116930.cohuck@redhat.com>
In-Reply-To: <1561041461-22326-5-git-send-email-kwankhede@nvidia.com>
References: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
 <1561041461-22326-5-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 24 Jun 2019 14:01:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 04/13] vfio: Add migration region
 initialization and finalize function
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
Cc: yulei.zhang@intel.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 cjia@nvidia.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 alex.williamson@redhat.com, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jun 2019 20:07:32 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> - Migration functions are implemented for VFIO_DEVICE_TYPE_PCI device in this
>   patch series.
> - VFIO device supports migration or not is decided based of migration region
>   query. If migration region query is successful then migration is supported
>   else migration is blocked.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/Makefile.objs         |   2 +-
>  hw/vfio/migration.c           | 137 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/vfio/vfio-common.h |  14 +++++
>  3 files changed, 152 insertions(+), 1 deletion(-)
>  create mode 100644 hw/vfio/migration.c

(...)

> +static int vfio_migration_region_init(VFIODevice *vbasedev)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    Object *obj = NULL;
> +    int ret = -EINVAL;
> +
> +    if (!migration) {
> +        return ret;
> +    }
> +
> +    /* Migration support added for PCI device only */
> +    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI) {
> +        obj = vfio_pci_get_object(vbasedev);
> +    }

Hm... what about instead including an (optional) callback in
VFIODeviceOps that returns the object embedding the VFIODevice? No need
to adapt this code if we introduce support for a non-pci device, and the
callback function also allows to support migration in a more
finegrained way than by device type.

> +
> +    if (!obj) {
> +        return ret;
> +    }
> +
> +    ret = vfio_region_setup(obj, vbasedev, &migration->region.buffer,
> +                            migration->region.index, "migration");
> +    if (ret) {
> +        error_report("Failed to setup VFIO migration region %d: %s",
> +                      migration->region.index, strerror(-ret));
> +        goto err;
> +    }
> +
> +    if (!migration->region.buffer.size) {
> +        ret = -EINVAL;
> +        error_report("Invalid region size of VFIO migration region %d: %s",
> +                     migration->region.index, strerror(-ret));
> +        goto err;
> +    }
> +
> +    return 0;
> +
> +err:
> +    vfio_migration_region_exit(vbasedev);
> +    return ret;
> +}

(...)

