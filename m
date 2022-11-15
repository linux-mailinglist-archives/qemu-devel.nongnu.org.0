Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDE62AFCA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 00:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov5n1-00015v-IL; Tue, 15 Nov 2022 18:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ov5my-000159-V4
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:56:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ov5mw-0005MJ-HB
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 18:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668556581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2SBCjZFBqRztntvR0co9yeGV0qjdPkeIvhv920PEiM=;
 b=Ch/OWXeszadV1SifT4e5sAAkQZRVjNnXt9eQCfjykToQix3yCAK7uuXBcS6icGDEO/JRzL
 1pH3vuiDuNoEZxNRBssK9ddOQqIRYLoOP1uKvgUdnYHswFi9uEe5mGaYjDAmDa0v/fkJFr
 0DqwZZO9I91CwbgFuYNkntgly2szV0E=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-m3cXe_3LMbixjq7TM4pBaQ-1; Tue, 15 Nov 2022 18:56:20 -0500
X-MC-Unique: m3cXe_3LMbixjq7TM4pBaQ-1
Received: by mail-il1-f200.google.com with SMTP id
 l4-20020a056e021aa400b00300ad9535c8so12135547ilv.1
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 15:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2SBCjZFBqRztntvR0co9yeGV0qjdPkeIvhv920PEiM=;
 b=cFSp72pmdAXeV8ObmZDsiyedSg2lBwGnMfM0oJrE29uRHOQzAmkEo6XI+ZKQzDjqSr
 G91QBQo41+lnAk+RsQ3JNSoQNXmXDZP0B79mBf+suCumsk7bhh6YU7FOqhi2ZHmbPBfl
 tgGSeVo4UrGaA85upXISdeNvumJdHrJgAdtKKCvkL6nXQ7JKk0zqzYKFPTBwaXK8JNhj
 415BFDCuFbS5+oZ1ojTSm3j2f2NZp+OpH8oUstOPeAvT+gpZAQmNKieRap4/84ONo68g
 z4+gUKsvGrUsUB4jCGOGS7bmaerCAKTa6jWRIrRwZb++lfNEDq651hWD6FxVGKwuhzKQ
 Xtnw==
X-Gm-Message-State: ANoB5pmmtSsFh5OdH4PdNPdtUGQSKm5oFS/kPK++lW8rQWvM1V33ORir
 q0kTP3ce3GHbkTIzxur+/qzYOTrB1Ajjq+LWr38EmtqNdD86XgwwOsSaSnOKJS49QlFyikq5yOX
 SkAVK6kvpiKUUtU8=
X-Received: by 2002:a05:6e02:c0a:b0:302:56e8:e5ab with SMTP id
 d10-20020a056e020c0a00b0030256e8e5abmr6311055ile.40.1668556579794; 
 Tue, 15 Nov 2022 15:56:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6P1lQ/LaHgrldbcchNABhVtOumGN6TQEWATW/hb9tFHNf4QYYAS/Kpm3MN+YN4crOyB7vwPA==
X-Received: by 2002:a05:6e02:c0a:b0:302:56e8:e5ab with SMTP id
 d10-20020a056e020c0a00b0030256e8e5abmr6311028ile.40.1668556579547; 
 Tue, 15 Nov 2022 15:56:19 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056e021bc800b00300d658f4b6sm5681349ilv.19.2022.11.15.15.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 15:56:19 -0800 (PST)
Date: Tue, 15 Nov 2022 16:56:17 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen"
 <chen.zhang@intel.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Shay Drory
 <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 10/17] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
Message-ID: <20221115165617.631240ed.alex.williamson@redhat.com>
In-Reply-To: <20221103161620.13120-11-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-11-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 3 Nov 2022 18:16:13 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Move vfio_dev_get_region_info() logic from vfio_migration_probe() to
> vfio_migration_init(). This logic is specific to v1 protocol and moving
> it will make it easier to add the v2 protocol implementation later.
> No functional changes intended.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/migration.c  | 30 +++++++++++++++---------------
>  hw/vfio/trace-events |  2 +-
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 99ffb75782..0e3a950746 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -785,14 +785,14 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>      vbasedev->migration = NULL;
>  }
>  
> -static int vfio_migration_init(VFIODevice *vbasedev,
> -                               struct vfio_region_info *info)
> +static int vfio_migration_init(VFIODevice *vbasedev)
>  {
>      int ret;
>      Object *obj;
>      VFIOMigration *migration;
>      char id[256] = "";
>      g_autofree char *path = NULL, *oid = NULL;
> +    struct vfio_region_info *info = NULL;

Nit, I'm not spotting any cases where we need this initialization.  The
same is not true in the code the info handling was extracted from.
Thanks,

Alex

>  
>      if (!vbasedev->ops->vfio_get_object) {
>          return -EINVAL;
> @@ -803,6 +803,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>          return -EINVAL;
>      }
>  
> +    ret = vfio_get_dev_region_info(vbasedev,
> +                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                   &info);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      vbasedev->migration = g_new0(VFIOMigration, 1);
>      vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
>      vbasedev->migration->vm_running = runstate_is_running();
> @@ -822,6 +830,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>          goto err;
>      }
>  
> +    g_free(info);
> +
>      migration = vbasedev->migration;
>      migration->vbasedev = vbasedev;
>  
> @@ -844,6 +854,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      return 0;
>  
>  err:
> +    g_free(info);
>      vfio_migration_exit(vbasedev);
>      return ret;
>  }
> @@ -857,34 +868,23 @@ int64_t vfio_mig_bytes_transferred(void)
>  
>  int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>  {
> -    struct vfio_region_info *info = NULL;
>      int ret = -ENOTSUP;
>  
>      if (!vbasedev->enable_migration) {
>          goto add_blocker;
>      }
>  
> -    ret = vfio_get_dev_region_info(vbasedev,
> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> -                                   &info);
> +    ret = vfio_migration_init(vbasedev);
>      if (ret) {
>          goto add_blocker;
>      }
>  
> -    ret = vfio_migration_init(vbasedev, info);
> -    if (ret) {
> -        goto add_blocker;
> -    }
> -
> -    trace_vfio_migration_probe(vbasedev->name, info->index);
> -    g_free(info);
> +    trace_vfio_migration_probe(vbasedev->name);
>      return 0;
>  
>  add_blocker:
>      error_setg(&vbasedev->migration_blocker,
>                 "VFIO device doesn't support migration");
> -    g_free(info);
>  
>      ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
>      if (ret < 0) {
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index a21cbd2a56..27c059f96e 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -148,7 +148,7 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
>  vfio_display_edid_write_error(void) ""
>  
>  # migration.c
> -vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
> +vfio_migration_probe(const char *name) " (%s)"
>  vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
>  vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>  vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"


