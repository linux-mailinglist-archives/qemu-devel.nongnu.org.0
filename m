Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F48E204BBF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 09:56:21 +0200 (CEST)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jndn1-0005hh-LJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 03:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jndmA-00055j-P7
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 03:55:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44043
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jndm8-0003A9-7p
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 03:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592898922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cx7SEMt+NrtXD1GH9SKknbdAgUCMl5n5xMeIVJC11Dg=;
 b=LTkwnBwJS9ko2/NZA6J086ETYat+3ArkyHmtENgXjB9cddssLcKNfHb2XDsc/RkWrh45CT
 6MCGY2jenMVFX5wUZ3T8wIFFOptBFCmH4BxGrfcQt/GVXxhRxobmflY0rtLKAT3IjJLhsY
 j/iD962sJhCpbiA7oXlRY4Qxu7twf80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-YAmU_3MSOmuM5enWs7yOBQ-1; Tue, 23 Jun 2020 03:55:19 -0400
X-MC-Unique: YAmU_3MSOmuM5enWs7yOBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAEACA2F90;
 Tue, 23 Jun 2020 07:54:45 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69ECD19930;
 Tue, 23 Jun 2020 07:54:34 +0000 (UTC)
Date: Tue, 23 Jun 2020 09:54:31 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH QEMU v25 04/17] vfio: Add migration region
 initialization and finalize function
Message-ID: <20200623095431.30bdf9e3.cohuck@redhat.com>
In-Reply-To: <1592684486-18511-5-git-send-email-kwankhede@nvidia.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-5-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Sun, 21 Jun 2020 01:51:13 +0530
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
>  hw/vfio/Makefile.objs         |   2 +-
>  hw/vfio/migration.c           | 142 ++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |   3 +
>  include/hw/vfio/vfio-common.h |   9 +++
>  4 files changed, 155 insertions(+), 1 deletion(-)
>  create mode 100644 hw/vfio/migration.c

(...)

> +static int vfio_migration_region_init(VFIODevice *vbasedev, int index)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    Object *obj = NULL;
> +    int ret = -EINVAL;
> +
> +    if (!vbasedev->ops->vfio_get_object) {
> +        return ret;
> +    }
> +
> +    obj = vbasedev->ops->vfio_get_object(vbasedev);
> +    if (!obj) {
> +        return ret;
> +    }
> +
> +    ret = vfio_region_setup(obj, vbasedev, &migration->region, index,
> +                            "migration");
> +    if (ret) {
> +        error_report("%s: Failed to setup VFIO migration region %d: %s",
> +                     vbasedev->name, index, strerror(-ret));
> +        goto err;
> +    }
> +
> +    if (!migration->region.size) {
> +        ret = -EINVAL;
> +        error_report("%s: Invalid region size of VFIO migration region %d: %s",
> +                     vbasedev->name, index, strerror(-ret));

Instead of only checking for size != 0, should we also check that the
region has a certain expected size or minimum size?

> +        goto err;
> +    }
> +
> +    return 0;
> +
> +err:
> +    vfio_migration_region_exit(vbasedev);
> +    return ret;
> +}
> +

(...)

Else looks good to me.


