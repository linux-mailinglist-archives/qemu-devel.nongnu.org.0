Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38992298D75
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 14:06:53 +0100 (CET)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX2D6-0004WL-00
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 09:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX27g-0000uc-4g
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX27a-0002Pp-Si
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603717268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EofRE6LdoJGE7xHHb5ol7OLbdgmNvbQHrdVO6LrfsCk=;
 b=elW8eOpGlECZTkljHOhzipHdRhgQMb3A5ocPg6zXV08kXcpZgWUIwosNijB2JIc29pUgsw
 M1jHwdWjusUiwptkqMBW4PPBNMxwg/p1aciZdPKTU4ROpKqETkmLmc4BuLwwduXFyx1990
 0ktLa9gP0GM7vUrFA/iaWC8UzCTkRGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-TsTuwTQkNSmPCIDS8j1bAw-1; Mon, 26 Oct 2020 09:01:07 -0400
X-MC-Unique: TsTuwTQkNSmPCIDS8j1bAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F2568064BF;
 Mon, 26 Oct 2020 13:01:03 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 570855C1BB;
 Mon, 26 Oct 2020 13:00:57 +0000 (UTC)
Date: Mon, 26 Oct 2020 07:00:56 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v29 05/17] vfio: Add VM state change handler to know
 state of VM
Message-ID: <20201026070056.42bb04de@w520.home>
In-Reply-To: <1603704987-20977-6-git-send-email-kwankhede@nvidia.com>
References: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
 <1603704987-20977-6-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: cohuck@redhat.com, cjia@nvidia.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Oct 2020 15:06:15 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> VM state change handler is called on change in VM's state. Based on
> VM state, VFIO device state should be changed.
> Added read/write helper functions for migration region.
> Added function to set device_state.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/vfio/migration.c           | 158 ++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |   2 +
>  include/hw/vfio/vfio-common.h |   4 ++
>  3 files changed, 164 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index fd7faf423cdc..65ce735d667b 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
[snip]
> @@ -64,6 +216,9 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>          ret = -EINVAL;
>          goto err;
>      }
> +
> +    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> +                                                           vbasedev);
>      return 0;
>  
>  err:

Fails to build, @migration is not defined.  We could use
vbasedev->migration or pull defining and setting @migration from patch
06.  Thanks,

Alex


