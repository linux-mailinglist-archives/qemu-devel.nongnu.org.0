Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE2204BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 10:11:56 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jne27-000674-Se
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 04:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jne10-0005hT-GX
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:10:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jne0y-0003o6-LU
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 04:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592899843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=run0MQ7fkIgQXSZb3Yjg/sNxdlglz1li+UKdJr9OYyc=;
 b=EKd2Nt5o6JDJ/gNG6d8rIUGpeOYFQhFUAOsUaICoOzRujOCINynvMl5HdxjcKq4pSFKmwC
 ULN4fT/QXyQjfOeVH/uP45Hi2tTjzCVxfioe1Po+hqymLUE8nUmAhIoTiQYHaBXeLasfI/
 JNn7qBqLs+rZ672sce+DO0X+hugWWi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-VeG26YkMOAy-0Dfhs7VaHw-1; Tue, 23 Jun 2020 04:10:41 -0400
X-MC-Unique: VeG26YkMOAy-0Dfhs7VaHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADBAE8018AB;
 Tue, 23 Jun 2020 08:10:39 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A2417168B;
 Tue, 23 Jun 2020 08:10:29 +0000 (UTC)
Date: Tue, 23 Jun 2020 10:10:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH QEMU v25 06/17] vfio: Add migration state change notifier
Message-ID: <20200623101026.1a1b6271.cohuck@redhat.com>
In-Reply-To: <1592684486-18511-7-git-send-email-kwankhede@nvidia.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-7-git-send-email-kwankhede@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
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

On Sun, 21 Jun 2020 01:51:15 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Added migration state change notifier to get notification on migration state
> change. These states are translated to VFIO device state and conveyed to vendor
> driver.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/vfio/migration.c           | 29 +++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |  5 +++--
>  include/hw/vfio/vfio-common.h |  1 +
>  3 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index fcecc0bb0874..e30bd8768701 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -154,6 +154,28 @@ static void vfio_vmstate_change(void *opaque, int running, RunState state)
>      }
>  }
>  
> +static void vfio_migration_state_notifier(Notifier *notifier, void *data)
> +{
> +    MigrationState *s = data;
> +    VFIODevice *vbasedev = container_of(notifier, VFIODevice, migration_state);
> +    int ret;
> +
> +    trace_vfio_migration_state_notifier(vbasedev->name,
> +                                        MigrationStatus_str(s->state));
> +
> +    switch (s->state) {
> +    case MIGRATION_STATUS_CANCELLING:
> +    case MIGRATION_STATUS_CANCELLED:
> +    case MIGRATION_STATUS_FAILED:
> +        ret = vfio_migration_set_state(vbasedev,
> +                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
> +                      VFIO_DEVICE_STATE_RUNNING);
> +        if (ret) {
> +            error_report("%s: Failed to set state RUNNING", vbasedev->name);

Also see https://lore.kernel.org/qemu-devel/20200505124639.56531df8.cohuck@redhat.com/.

> +        }
> +    }
> +}
> +
>  static int vfio_migration_init(VFIODevice *vbasedev,
>                                 struct vfio_region_info *info)
>  {


