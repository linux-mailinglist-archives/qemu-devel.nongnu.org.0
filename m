Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2431E296DB7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 13:32:10 +0200 (CEST)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVvIn-0002Ly-4w
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 07:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVv4b-00039x-B0
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kVv4Z-0007z1-5N
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 07:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603451845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8kGKiCGjRHRD9l9AsHcZtlemP0WaHl0g8HTrxc33yg=;
 b=WM/gGofEQW2EUbQ7g9g6sZmsmDgTkdBRfJ14pkxVAkT12dXTPPs0qvoBT1N8S0b43tUrlp
 rW38wi9n5uSPnrAAXuBi6xMgKVTVu4BkXDyNHvVGbzhjwAcAX23+buEiHhFfG7X5uvgzpC
 zkMKl2StO1g8OiLSALMerfY9OaPN8BQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-ImgMnEHeNyO5NusQXRVjCw-1; Fri, 23 Oct 2020 07:17:24 -0400
X-MC-Unique: ImgMnEHeNyO5NusQXRVjCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C8551009E21;
 Fri, 23 Oct 2020 11:17:21 +0000 (UTC)
Received: from gondolin (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734C17512A;
 Fri, 23 Oct 2020 11:17:08 +0000 (UTC)
Date: Fri, 23 Oct 2020 13:17:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v27 04/17] vfio: Add migration region initialization and
 finalize function
Message-ID: <20201023131706.1a11b0ed.cohuck@redhat.com>
In-Reply-To: <1603365127-14202-5-git-send-email-kwankhede@nvidia.com>
References: <1603365127-14202-1-git-send-email-kwankhede@nvidia.com>
 <1603365127-14202-5-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: cjia@nvidia.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com,
 dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 16:41:54 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Whether the VFIO device supports migration or not is decided based of
> migration region query. If migration region query is successful and migration
> region initialization is successful then migration is supported else
> migration is blocked.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/vfio/meson.build           |   1 +
>  hw/vfio/migration.c           | 129 ++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |   3 +
>  include/hw/vfio/vfio-common.h |   9 +++
>  4 files changed, 142 insertions(+)
>  create mode 100644 hw/vfio/migration.c

(...)

> +static int vfio_migration_init(VFIODevice *vbasedev,
> +                               struct vfio_region_info *info)
> +{
> +    int ret;
> +    Object *obj;
> +    VFIOMigration *migration;
> +
> +    if (!vbasedev->ops->vfio_get_object) {
> +        return -EINVAL;
> +    }
> +
> +    obj = vbasedev->ops->vfio_get_object(vbasedev);
> +    if (!obj) {
> +        return -EINVAL;
> +    }
> +
> +    migration = g_new0(VFIOMigration, 1);
> +
> +    ret = vfio_region_setup(obj, vbasedev, &migration->region,
> +                            info->index, "migration");
> +    if (ret) {
> +        error_report("%s: Failed to setup VFIO migration region %d: %s",
> +                     vbasedev->name, info->index, strerror(-ret));
> +        goto err;
> +    }
> +
> +    if (!migration->region.size) {
> +        error_report("%s: Invalid zero-sized of VFIO migration region %d",

s/of //

> +                     vbasedev->name, info->index);
> +        ret = -EINVAL;
> +        goto err;
> +    }
> +
> +    vbasedev->migration = migration;
> +    return 0;
> +
> +err:
> +    vfio_migration_region_exit(vbasedev);
> +    g_free(migration);
> +    return ret;
> +}

(...)


