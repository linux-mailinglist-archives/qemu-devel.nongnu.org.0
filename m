Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2A621B30
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 18:53:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osSmG-0001Yz-Rp; Tue, 08 Nov 2022 12:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osSmF-0001Ya-3I; Tue, 08 Nov 2022 12:52:47 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osSmD-0003u8-7K; Tue, 08 Nov 2022 12:52:46 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A123A5E81D;
 Tue,  8 Nov 2022 20:52:32 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 1AR4AUNEzW-qTN0ucLM; Tue, 08 Nov 2022 20:52:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667929951; bh=HU2J0paJ8G9mnLxUVuNNEqBHNUGxiBKOYBagP++uSNo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=sqX0l0PVdH9UJJVplvCoPBmW8GTGn48PymdCStJZ3mm2Hv0goPJseUTUghhkgpuZL
 P3cRqAE/GspPyqLu0P0ghVqAKcUSOGVjharBllJ1TNdJzcP6YjDI+VAWIxtwYdDx7f
 eTTDcTjPskVT2Vt31Gb6LKRTBzfViU44N6KIdre0=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <fbf06ccb-c339-d323-c01e-455109bed372@yandex-team.ru>
Date: Tue, 8 Nov 2022 20:52:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 01/17] migration: Remove res_compatible parameter
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-2-avihaih@nvidia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221103161620.13120-2-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 19:16, Avihai Horon wrote:
> From: Juan Quintela <quintela@redhat.com>
> 
> It was only used for RAM, and in that case, it means that this amount
> of data was sent for memory. 

Not clear for me, what means "this amount of data was sent for memory"... That amount of data was not yet sent, actually.

> Just delete the field in all callers.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   hw/s390x/s390-stattrib.c       |  6 ++----
>   hw/vfio/migration.c            | 10 ++++------
>   hw/vfio/trace-events           |  2 +-
>   include/migration/register.h   | 20 ++++++++++----------
>   migration/block-dirty-bitmap.c |  7 +++----
>   migration/block.c              |  7 +++----
>   migration/migration.c          |  9 ++++-----
>   migration/ram.c                |  8 +++-----
>   migration/savevm.c             | 14 +++++---------
>   migration/savevm.h             |  4 +---
>   migration/trace-events         |  2 +-
>   11 files changed, 37 insertions(+), 52 deletions(-)
> 

[..]

> diff --git a/include/migration/register.h b/include/migration/register.h
> index c1dcff0f90..1950fee6a8 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
>       int (*save_setup)(QEMUFile *f, void *opaque);
>       void (*save_live_pending)(QEMUFile *f, void *opaque,
>                                 uint64_t threshold_size,
> -                              uint64_t *res_precopy_only,
> -                              uint64_t *res_compatible,
> -                              uint64_t *res_postcopy_only);
> +                              uint64_t *rest_precopy,
> +                              uint64_t *rest_postcopy);
>       /* Note for save_live_pending:
> -     * - res_precopy_only is for data which must be migrated in precopy phase
> -     *     or in stopped state, in other words - before target vm start
> -     * - res_compatible is for data which may be migrated in any phase
> -     * - res_postcopy_only is for data which must be migrated in postcopy phase
> -     *     or in stopped state, in other words - after source vm stop
> +     * - res_precopy is for data which must be migrated in precopy
> +     *     phase or in stopped state, in other words - before target
> +     *     vm start
> +     * - res_postcopy is for data which must be migrated in postcopy
> +     *     phase or in stopped state, in other words - after source vm
> +     *     stop
>        *
> -     * Sum of res_postcopy_only, res_compatible and res_postcopy_only is the
> -     * whole amount of pending data.
> +     * Sum of res_precopy and res_postcopy is the whole amount of
> +     * pending data.
>        */
>   
>   

[..]

> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc..20167e1102 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3435,9 +3435,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>   }
>   
>   static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
> -                             uint64_t *res_precopy_only,
> -                             uint64_t *res_compatible,
> -                             uint64_t *res_postcopy_only)
> +                             uint64_t *res_precopy, uint64_t *res_postcopy)
>   {
>       RAMState **temp = opaque;
>       RAMState *rs = *temp;
> @@ -3457,9 +3455,9 @@ static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
>   
>       if (migrate_postcopy_ram()) {
>           /* We can do postcopy, and all the data is postcopiable */
> -        *res_compatible += remaining_size;
> +        *res_postcopy += remaining_size;

That's seems to be not quite correct.

res_postcopy is defined as "data which must be migrated in postcopy", but that's not true here, as RAM can be migrated both in precopy and postcopy.

Still we really can include "compat" into "postcopy" just because in the logic of migration_iteration_run() we don't actually distinguish "compat" and "post". The logic only depends on "total" and "pre".

So, if we want to combine "compat" into "post", we should redefine "post" in the comment in include/migration/register.h, something like this:

- res_precopy is for data which MUST be migrated in precopy
   phase or in stopped state, in other words - before target
   vm start

- res_postcopy is for all data except for declared in res_precopy.
   res_postcopy data CAN be migrated in postcopy, i.e. after target
   vm start.


>       } else {
> -        *res_precopy_only += remaining_size;
> +        *res_precopy += remaining_size;
>       }
>   }
>   


-- 
Best regards,
Vladimir


