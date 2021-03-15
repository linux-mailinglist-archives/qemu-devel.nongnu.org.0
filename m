Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF5333B355
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:10:24 +0100 (CET)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmzG-0006GB-VM
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLmxz-0005mi-Oh
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLmxv-0001yy-0M
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615813736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzjKccJM8TyihCDznqFzsi+05dO8YPNU22/AMAukF6I=;
 b=R9SvkyHoKUnQUbSXWENgYGdjkHSZ/n0wlIXMmuDTgSuBQAq3dracv9SyDEB710A16DPZmi
 i13RLpPf+82nx4A6bSlfvAZK+h+6agi0JGaeKq6K8bLggEN/ruKaGQIZ9bUbh+xVPVL+8b
 YgmGXPTs2l5mSPdohs3oCACP32nYwJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-mAsrG95VPr-8Jw4Bvi23Tg-1; Mon, 15 Mar 2021 09:08:53 -0400
X-MC-Unique: mAsrG95VPr-8Jw4Bvi23Tg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0930611243A4;
 Mon, 15 Mar 2021 13:08:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0A8260240;
 Mon, 15 Mar 2021 13:08:14 +0000 (UTC)
To: Kirti Wankhede <kwankhede@nvidia.com>, alex.williamson@redhat.com,
 cjia@nvidia.com, dgilbert@redhat.com, quintela@redhat.com
References: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
 <1603704987-20977-18-git-send-email-kwankhede@nvidia.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v29 17/17] qapi: Add VFIO devices migration stats in
 Migration stats
Message-ID: <3ba4153d-7a81-c9e5-709d-60a10683b6ef@redhat.com>
Date: Mon, 15 Mar 2021 14:08:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1603704987-20977-18-git-send-email-kwankhede@nvidia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: zhi.wang.linux@gmail.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 eauger@redhat.com, artemp@nvidia.com, yi.l.liu@intel.com, eskultet@redhat.com,
 ziye.yang@intel.com, armbru@redhat.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, felipe@nutanix.com, Ken.Xue@amd.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 cohuck@redhat.com, zhi.a.wang@intel.com, jonathan.davies@nutanix.com,
 pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/10/2020 10.36, Kirti Wankhede wrote:
> Added amount of bytes transferred to the VM at destination by all VFIO
> devices
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/vfio/common.c              | 19 +++++++++++++++++++
>   hw/vfio/migration.c           |  9 +++++++++
>   include/hw/vfio/vfio-common.h |  3 +++
>   migration/migration.c         | 17 +++++++++++++++++
>   monitor/hmp-cmds.c            |  6 ++++++
>   qapi/migration.json           | 17 +++++++++++++++++
>   6 files changed, 71 insertions(+)
[...]
> diff --git a/migration/migration.c b/migration/migration.c
> index 0575ecb37953..995ccd96a774 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -57,6 +57,10 @@
>   #include "qemu/queue.h"
>   #include "multifd.h"
>   
> +#ifdef CONFIG_VFIO
> +#include "hw/vfio/vfio-common.h"
> +#endif
> +
>   #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>   
>   /* Amount of time to allocate to each "chunk" of bandwidth-throttled
> @@ -1002,6 +1006,17 @@ static void populate_disk_info(MigrationInfo *info)
>       }
>   }
>   
> +static void populate_vfio_info(MigrationInfo *info)
> +{
> +#ifdef CONFIG_VFIO
> +    if (vfio_mig_active()) {
> +        info->has_vfio = true;
> +        info->vfio = g_malloc0(sizeof(*info->vfio));
> +        info->vfio->transferred = vfio_mig_bytes_transferred();
> +    }
> +#endif
> +}

  Hi!

I'm afraid, but this #ifdef CONFIG_VFIO here likely does not work as 
expected: migration/migration.c is common code, i.e. it is compiled only 
once for all targets. But CONFIG_VFIO is a target-specific config switch, so 
this is only defined properly for target specific .c files. So depending on 
which target has been compiled first, the code might be included or not for 
all the other targets, no matter whether they have VFIO or not.
To fix this issue, I think it's likely best to move the function into a new 
file instead and include that via specific_ss.add() in the meson.build file.

  Thomas


