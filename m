Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE26342FC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 18:50:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXOR-0001FW-WC; Tue, 22 Nov 2022 12:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxXOP-0001ES-Nw
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxXOM-0006DC-RK
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669139346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoIyGByiJo7I4TTlbQp4yJ1wkQEncxCgBCX5zafAuqU=;
 b=GrKIP7L+jNMWKdukkbvvuN8jWkcEWU6Cn9sVulvx1uNMsJ22TpWrEoegfskX1YeMKE8EMG
 fMAJqwAq10vCbtB45FauZu+h4XSEg/Ll8gT24oUOk6tqAugDWmGR1HLE0OWt1m/mz+UHAM
 bnprpHfUeNBqFSzQuBCyTB/dFC56ybs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-E1AVanNjPW2xk0keQJk8Xg-1; Tue, 22 Nov 2022 12:49:04 -0500
X-MC-Unique: E1AVanNjPW2xk0keQJk8Xg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so8390452wmh.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 09:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SoIyGByiJo7I4TTlbQp4yJ1wkQEncxCgBCX5zafAuqU=;
 b=lPcyz5qGFKm6qlRg1aUBWsRPZLcr2OSynPP1ZlpeE8SFSvp4fUkfVHSnEK6iavgVAZ
 u4hDeDlEK9Y268FhmSwKTp22PM7MU54xd9niYKJtxKJTrjt3KXEtU/13aILA2ShJszsJ
 wwjrJiIis9I9C7yuMS+b1Y6MG/UZCZ/tesy4KAOFTF+rphdJsqAkMPJgvJaAz3NjhAKY
 H4rOM3snuxnmLEEtAv4x5BWKL2vNNC6uMiRZ7Bd+oKmDbZ92yhf04FYOhoozKkUiGUKj
 qyzfjv4arGCvpuMKUiQrN8IXNGCY3Nhfm7ndedFZx9o4tPO3SjXyvpM49D1syzVAJOOD
 cyyA==
X-Gm-Message-State: ANoB5pmpdYSh6f+RMu3xOtk9p74i2n0N45Xi7okw77A9miP7+4Vhsrwj
 sPwfBHINBQMKB3niLZyoqOF2d6RZ+wfuMW7YGPfe3zwYzJzsV7tEBpC8uYLVbNYep+99TWnP0BC
 Mny1/98x/cQ/ePqI=
X-Received: by 2002:a5d:4308:0:b0:241:e80e:225a with SMTP id
 h8-20020a5d4308000000b00241e80e225amr1125890wrq.560.1669139343358; 
 Tue, 22 Nov 2022 09:49:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6MYiIdrkm2AwtrIwgO8mf4w7eCmjX6oicY1wUaZhc/DGIQsmaNn61DynUW119Puqavo7c+hQ==
X-Received: by 2002:a5d:4308:0:b0:241:e80e:225a with SMTP id
 h8-20020a5d4308000000b00241e80e225amr1125858wrq.560.1669139342993; 
 Tue, 22 Nov 2022 09:49:02 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b003d01b84e9b2sm9469652wmq.27.2022.11.22.09.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 09:49:01 -0800 (PST)
Date: Tue, 22 Nov 2022 17:48:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC 2/7] migration: No save_live_pending() method uses the
 QEMUFile parameter
Message-ID: <Y30LiwT/Likxo+TL@work-vm>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-3-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003031600.20084-3-quintela@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

* Juan Quintela (quintela@redhat.com) wrote:
> So remove it everywhere.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/migration/register.h   | 6 ++----
>  migration/savevm.h             | 2 +-
>  hw/s390x/s390-stattrib.c       | 2 +-
>  hw/vfio/migration.c            | 6 ++----
>  migration/block-dirty-bitmap.c | 5 ++---
>  migration/block.c              | 2 +-
>  migration/migration.c          | 3 +--
>  migration/ram.c                | 2 +-
>  migration/savevm.c             | 5 ++---
>  9 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/include/migration/register.h b/include/migration/register.h
> index 1950fee6a8..5b5424ed8f 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -46,10 +46,8 @@ typedef struct SaveVMHandlers {
>  
>      /* This runs outside the iothread lock!  */
>      int (*save_setup)(QEMUFile *f, void *opaque);
> -    void (*save_live_pending)(QEMUFile *f, void *opaque,
> -                              uint64_t threshold_size,
> -                              uint64_t *rest_precopy,
> -                              uint64_t *rest_postcopy);
> +    void (*save_live_pending)(void *opaque,  uint64_t threshold_size,
> +                              uint64_t *rest_precopy, uint64_t *rest_postcopy);
>      /* Note for save_live_pending:
>       * - res_precopy is for data which must be migrated in precopy
>       *     phase or in stopped state, in other words - before target
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 9bd55c336c..98fae6f9b3 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -40,7 +40,7 @@ void qemu_savevm_state_cleanup(void);
>  void qemu_savevm_state_complete_postcopy(QEMUFile *f);
>  int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>                                         bool inactivate_disks);
> -void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
> +void qemu_savevm_state_pending(uint64_t max_size,
>                                 uint64_t *res_precopy, uint64_t *res_postcopy);
>  void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
>  void qemu_savevm_send_open_return_path(QEMUFile *f);
> diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
> index ee60b53da4..9b74eeadf3 100644
> --- a/hw/s390x/s390-stattrib.c
> +++ b/hw/s390x/s390-stattrib.c
> @@ -182,7 +182,7 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void cmma_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
> +static void cmma_save_pending(void *opaque, uint64_t max_size,
>                                uint64_t *res_precopy, uint64_t *res_postcopy)
>  {
>      S390StAttribState *sas = S390_STATTRIB(opaque);
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 3423f113f0..760d5f3c5c 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -456,10 +456,8 @@ static void vfio_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
>  
> -static void vfio_save_pending(QEMUFile *f, void *opaque,
> -                              uint64_t threshold_size,
> -                              uint64_t *res_precopy,
> -                              uint64_t *res_postcopy)
> +static void vfio_save_pending(void *opaque,  uint64_t threshold_size,
> +                              uint64_t *res_precopy, uint64_t *res_postcopy)
>  {
>      VFIODevice *vbasedev = opaque;
>      VFIOMigration *migration = vbasedev->migration;
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index dfea546330..a445bdc3c3 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -761,9 +761,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
> -                                      uint64_t max_size,
> -                                      uint64_t *res_precopy,
> +static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
> +                                      uint64_t *res_precopy, 
>                                        uint64_t *res_postcopy)
>  {
>      DBMSaveState *s = &((DBMState *)opaque)->save;
> diff --git a/migration/block.c b/migration/block.c
> index 4ae8f837b0..b3d680af75 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -862,7 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
> +static void block_save_pending(void *opaque, uint64_t max_size,
>                                 uint64_t *res_precopy,
>                                 uint64_t *res_postcopy)
>  {
> diff --git a/migration/migration.c b/migration/migration.c
> index 440aa62f16..038fc58a96 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3737,8 +3737,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>      uint64_t pending_size, pend_pre, pend_post;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>  
> -    qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
> -                              &pend_post);
> +    qemu_savevm_state_pending(s->threshold_size, &pend_pre, &pend_post);
>      pending_size = pend_pre + pend_post;
>  
>      trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
> diff --git a/migration/ram.c b/migration/ram.c
> index 20167e1102..48a31b87c8 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3434,7 +3434,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
> +static void ram_save_pending(void *opaque, uint64_t max_size,
>                               uint64_t *res_precopy, uint64_t *res_postcopy)
>  {
>      RAMState **temp = opaque;
> diff --git a/migration/savevm.c b/migration/savevm.c
> index a752ff9ea1..d937ab0b2e 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1471,8 +1471,7 @@ flush:
>   * the result is split into the amount for units that can and
>   * for units that can't do postcopy.
>   */
> -void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
> -                               uint64_t *res_precopy,
> +void qemu_savevm_state_pending(uint64_t threshold_size, uint64_t *res_precopy,
>                                 uint64_t *res_postcopy)
>  {
>      SaveStateEntry *se;
> @@ -1489,7 +1488,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
>                  continue;
>              }
>          }
> -        se->ops->save_live_pending(f, se->opaque, threshold_size,
> +        se->ops->save_live_pending(se->opaque, threshold_size,
>                                     res_precopy, res_postcopy);
>      }
>  }
> -- 
> 2.37.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


