Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9B528466
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:46:07 +0200 (CEST)
Received: from localhost ([::1]:33560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqa6w-0005ID-3k
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYns-0007I6-AJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nqYnq-0004W2-Eg
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652700137;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=c10XzXLTFtRxJR2TlaBRhnjIvtkMwoJ8Z9q2b616ZKk=;
 b=QMe96Ao2e/zdBJAF8nuLOHffv2ntQfj7LQenZyWHGNq46pd6K7QNHpwsy7JeVBIDsvZtB/
 Th0wyQ0aCb/4Mc6ryBMGYFLIRpSidwE1B//8ciQ3lnTcWPOklDzokedwgzetTpH8AmoegP
 KBOa4rJtulYUwXt7NqCNa94ua3XaqFc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-rtRd65d0N1KSreLUBLComA-1; Mon, 16 May 2022 07:22:16 -0400
X-MC-Unique: rtRd65d0N1KSreLUBLComA-1
Received: by mail-wm1-f71.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so10207277wmq.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 04:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=c10XzXLTFtRxJR2TlaBRhnjIvtkMwoJ8Z9q2b616ZKk=;
 b=Hlr8Qp6K+lHngHUvrja13FssviI2JsexCCIcVi+PaMJvq5VtjG2U8pdLGR5wi8r1vi
 6ghmBKSoMyenQd/85toFBKjhE/IOseJxeoDP65eRvM8yhoapo4uTaqf2k4T4FagFyCWU
 5F9AUQgx+XK2I4sHdeQqyIFiJi7xB15WcAt/ALWU8nm2y1f59JJ5d3hWj+v2OwwPHJ2A
 eKOzWJ4tWGoUcGy/YeHVt4n9yhJ9gn4KJmAsWTTsTabMQAa7FP20Leij4SRs27JHNp/c
 IlAzatRPgi5rJEBuUqGTyXaRs+C0gCu5+0xlHYJes4bM6ZM5bK47QHClfXmJ1h/SoFxn
 EC0Q==
X-Gm-Message-State: AOAM531bzV1q6VL7ZFp0Rw1ZJwaq3nGwDXgrayJZaeX7tbMu+H5R2gSZ
 dyQR+Ib9jrSAqbhGq16VlsviAPsGVS8JolcbQqInwEmzrB1czRLILj+DSXG/UGn0iytHKuKS8HP
 iPArEEcdqXJyYAZc=
X-Received: by 2002:adf:eacb:0:b0:20d:230:906 with SMTP id
 o11-20020adfeacb000000b0020d02300906mr7169661wrn.245.1652700135685; 
 Mon, 16 May 2022 04:22:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmKaKrvK3NwY0MwMj0m0bas7mR2fCa2jauwy9JxjxS7Delqe9ef18IXXQ3syIov+0Cjf5Fmg==
X-Received: by 2002:adf:eacb:0:b0:20d:230:906 with SMTP id
 o11-20020adfeacb000000b0020d02300906mr7169630wrn.245.1652700135454; 
 Mon, 16 May 2022 04:22:15 -0700 (PDT)
Received: from localhost (static-211-115-85-188.ipcom.comunitel.net.
 [188.85.115.211]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b00397071b10dfsm3093265wms.10.2022.05.16.04.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 04:22:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  "Michael S . Tsirkin" <mst@redhat.com>,
 "Cornelia Huck" <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  "Alex Williamson" <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,  Yishai Hadas
 <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  "Mark Bloch"
 <mbloch@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti Wankhede
 <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page
 tracking is not supported
In-Reply-To: <20220512154320.19697-5-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 12 May 2022 18:43:15 +0300")
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 16 May 2022 13:22:14 +0200
Message-ID: <87h75psowp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avihai Horon <avihaih@nvidia.com> wrote:
> Currently, if IOMMU of a VFIO container doesn't support dirty page
> tracking, migration is blocked completely. This is because a DMA-able
> VFIO device can dirty RAM pages without updating QEMU about it, thus
> breaking the migration.
>
> However, this doesn't mean that migration can't be done at all. If
> migration pre-copy phase is skipped, the VFIO device doesn't have a
> chance to dirty RAM pages that have been migrated already, thus
> eliminating the problem previously mentioned.
>
> Hence, in such case allow migration but skip pre-copy phase.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

I don't know (TM).
Several issues:
- Patch is ugly as hell (ok, that depends on taste)
- It changes migration_iteration_run() instead of directly
  migration_thread.
- There is already another case where we skip the sending of RAM
  (localhost migration with shared memory)

In migration/ram.c:

static int ram_find_and_save_block(RAMState *rs, bool last_stage)
{
    PageSearchStatus pss;
    int pages = 0;
    bool again, found;

    /* No dirty page as there is zero RAM */
    if (!ram_bytes_total()) {
        return pages;
    }

This is the other place where we _don't_ send any RAM at all.

I don't have a great idea about how to make things clear at a higher
level, I have to think about this.

Later, Juan.

> ---
>  hw/vfio/migration.c   | 9 ++++++++-
>  migration/migration.c | 5 +++++
>  migration/migration.h | 3 +++
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 21e8f9d4d4..d4b6653026 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>      struct vfio_region_info *info = NULL;
>      int ret = -ENOTSUP;
>  
> -    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
> +    if (!vbasedev->enable_migration) {
>          goto add_blocker;
>      }
>  
> +    if (!container->dirty_pages_supported) {
> +        warn_report(
> +            "%s: IOMMU of the device's VFIO container doesn't support dirty page tracking, migration pre-copy phase will be skipped",
> +            vbasedev->name);
> +        migrate_get_current()->skip_precopy = true;
> +    }
> +
>      ret = vfio_get_dev_region_info(vbasedev,
>                                     VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>                                     VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> diff --git a/migration/migration.c b/migration/migration.c
> index 5a31b23bd6..668343508d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3593,6 +3593,11 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>      uint64_t pending_size, pend_pre, pend_compat, pend_post;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>  
> +    if (s->skip_precopy) {
> +        migration_completion(s);
> +        return MIG_ITERATE_BREAK;
> +    }
> +
>      qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
>                                &pend_compat, &pend_post);
>      pending_size = pend_pre + pend_compat + pend_post;
> diff --git a/migration/migration.h b/migration/migration.h
> index a863032b71..876713e7e1 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -332,6 +332,9 @@ struct MigrationState {
>       * This save hostname when out-going migration starts
>       */
>      char *hostname;
> +
> +    /* Whether to skip pre-copy phase of migration or not */
> +    bool skip_precopy;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);


