Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BFB6365F5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxslr-0006nD-1h; Wed, 23 Nov 2022 11:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxslj-0006k3-Fm
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxslg-0002wp-DW
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669221515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3adfTHdFx7exUxfSdbNpupw7pHcMFtfZJ07mU8ewDBg=;
 b=UkmdLyXe51obhZtfIdx1zcgzxjQsgErs2YmeceTOD4VUbODvspTwfa7xC9ERp6oF9bN9l9
 euJniksWr0do30jRbVIrjjSFkZJprxV6ZJBQ0hSDvx/PG8Zp9n0LlwmYwJoajnAtpSMx4y
 khwKp7QJo6W2A9/rrkzz4a+0vN7Kgek=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-_xGz7DsiME-dmYbfZnM8Fg-1; Wed, 23 Nov 2022 11:38:33 -0500
X-MC-Unique: _xGz7DsiME-dmYbfZnM8Fg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l8-20020adfc788000000b00241ef50e89eso545832wrg.0
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 08:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3adfTHdFx7exUxfSdbNpupw7pHcMFtfZJ07mU8ewDBg=;
 b=OQJ3VIzUWgoUlu5pObkVie6CyX+bfhDNlf0Z/KdzBpPnYaMahPUE+6IEYGPhL+/6kl
 xIZPROzWr4z1auq6GwSj4QhfaEr8AsrK/tTgfrmiBvBRvnZi5Vlj319WjoczRS0cfcIU
 sDMr/e9K2Fsg+lMfpmpo8gYNJwXpubZMs7eHpxy46ZVQPkpUDJBosIvirVsmp0it96lJ
 80OW2KRtZKm35zzgKQC4klz0qYLj4d8tfkCHpBInJnwR+P2XufbkneqEvS4JEW2CaMdn
 /H+dnhfYTIZOZXpQwhb4NfeegpInHMHYXvRxY9eh8XpaMLag8Ul+lZYqqV+O0E4vsNvp
 Eaig==
X-Gm-Message-State: ANoB5pmWnhVQru+PdCTIQ1qi1kDYpRIx6/Fz4e20iJ05uWsN96dt278B
 VH7KCg4XMRgP6uQulwfwRNyMzQ+8B/LA+kCNPDrRUgw28pmv9ycWmWhY4cYvH85gCV/trZK+YZH
 ATM7pjJVvyAo0wQw=
X-Received: by 2002:adf:e2c3:0:b0:236:65f2:eade with SMTP id
 d3-20020adfe2c3000000b0023665f2eademr5851257wrj.608.1669221511127; 
 Wed, 23 Nov 2022 08:38:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4lIZIwG4SmcBiV+PRlebYGbZGibnjgJ3rKoda4vRBo1dRS8n3Smv7elEPmN+Z4555poeTwYQ==
X-Received: by 2002:adf:e2c3:0:b0:236:65f2:eade with SMTP id
 d3-20020adfe2c3000000b0023665f2eademr5851235wrj.608.1669221510849; 
 Wed, 23 Nov 2022 08:38:30 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a05600000c300b00241c8794d38sm12975749wrx.105.2022.11.23.08.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:38:30 -0800 (PST)
Date: Wed, 23 Nov 2022 16:38:28 +0000
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
Subject: Re: [RFC 5/7] migration: Remove unused threshold_size parameter
Message-ID: <Y35MhBvqGxXyYoaE@work-vm>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-6-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003031600.20084-6-quintela@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Juan Quintela (quintela@redhat.com) wrote:
> Until previous commit, save_live_pending() was used for ram.  Now with
> the split into state_pending_estimate() and state_pending_exact() it
> is not needed anymore, so remove them.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  include/migration/register.h   |  7 +++----
>  migration/savevm.h             |  6 ++----
>  hw/vfio/migration.c            |  6 +++---
>  migration/block-dirty-bitmap.c |  3 +--
>  migration/block.c              |  3 +--
>  migration/migration.c          |  4 ++--
>  migration/ram.c                |  6 ++----
>  migration/savevm.c             | 12 ++++--------
>  8 files changed, 18 insertions(+), 29 deletions(-)
> 
> diff --git a/include/migration/register.h b/include/migration/register.h
> index 313b8e1c3b..5f08204fb2 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -58,11 +58,10 @@ typedef struct SaveVMHandlers {
>       * pending data.
>       */
>      /* This calculate the exact remaining data to transfer */
> -    void (*state_pending_exact)(void *opaque,  uint64_t threshold_size,
> -                                uint64_t *rest_precopy, uint64_t *rest_postcopy);
> +    void (*state_pending_exact)(void *opaque, uint64_t *rest_precopy,
> +                                uint64_t *rest_postcopy);
>      /* This estimates the remaining data to transfer */
> -    void (*state_pending_estimate)(void *opaque,  uint64_t threshold_size,
> -                                   uint64_t *rest_precopy,
> +    void (*state_pending_estimate)(void *opaque, uint64_t *rest_precopy,
>                                     uint64_t *rest_postcopy);
>  
>      LoadStateHandler *load_state;
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 613f85e717..24f2d2a28b 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -40,11 +40,9 @@ void qemu_savevm_state_cleanup(void);
>  void qemu_savevm_state_complete_postcopy(QEMUFile *f);
>  int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>                                         bool inactivate_disks);
> -void qemu_savevm_state_pending_exact(uint64_t max_size,
> -                                     uint64_t *res_precopy,
> +void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
>                                       uint64_t *res_postcopy);
> -void qemu_savevm_state_pending_estimate(uint64_t max_size,
> -                                        uint64_t *res_precopy,
> +void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
>                                          uint64_t *res_postcopy);
>  void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
>  void qemu_savevm_send_open_return_path(QEMUFile *f);
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 680cf4df6e..d9598ce070 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -456,8 +456,8 @@ static void vfio_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
>  
> -static void vfio_state_pending(void *opaque,  uint64_t threshold_size,
> -                               uint64_t *res_precopy, uint64_t *res_postcopy)
> +static void vfio_state_pending(void *opaque, uint64_t *res_precopy,
> +                               uint64_t *res_postcopy)
>  {
>      VFIODevice *vbasedev = opaque;
>      VFIOMigration *migration = vbasedev->migration;
> @@ -511,7 +511,7 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>      }
>  
>      /*
> -     * Reset pending_bytes as .save_live_pending is not called during savevm or
> +     * Reset pending_bytes as .state_pending_* is not called during savevm or

That comment change feels like it lives in a different patch, other than
that:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>       * snapshot case, in such case vfio_update_pending() at the start of this
>       * function updates pending_bytes.
>       */
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index 5b24007650..8a11577252 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -761,8 +761,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void dirty_bitmap_state_pending(void *opaque, uint64_t max_size,
> -                                       uint64_t *res_precopy,
> +static void dirty_bitmap_state_pending(void *opaque, uint64_t *res_precopy,
>                                         uint64_t *res_postcopy)
>  {
>      DBMSaveState *s = &((DBMState *)opaque)->save;
> diff --git a/migration/block.c b/migration/block.c
> index 8e6ad1c468..4f1f7c0f8d 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -862,8 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void block_state_pending(void *opaque, uint64_t max_size,
> -                                uint64_t *res_precopy,
> +static void block_state_pending(void *opaque, uint64_t *res_precopy,
>                                  uint64_t *res_postcopy)
>  {
>      /* Estimate pending number of bytes to send */
> diff --git a/migration/migration.c b/migration/migration.c
> index 4676568699..97fefd579e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3737,12 +3737,12 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>      uint64_t pend_pre, pend_post;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>  
> -    qemu_savevm_state_pending_estimate(s->threshold_size, &pend_pre, &pend_post);
> +    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
>      uint64_t pending_size = pend_pre + pend_post;
>      trace_migrate_pending_estimate(pending_size, s->threshold_size, pend_pre, pend_post);
>  
>      if (pend_pre <= s->threshold_size) {
> -        qemu_savevm_state_pending_exact(s->threshold_size, &pend_pre, &pend_post);
> +        qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
>          pending_size = pend_pre + pend_post;
>          trace_migrate_pending_exact(pending_size, s->threshold_size, pend_pre, pend_post);
>      }
> diff --git a/migration/ram.c b/migration/ram.c
> index 8d989d51db..53a5dd64a8 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3434,8 +3434,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
> -                                       uint64_t *res_precopy,
> +static void ram_state_pending_estimate(void *opaque, uint64_t *res_precopy,
>                                         uint64_t *res_postcopy)
>  {
>      RAMState **temp = opaque;
> @@ -3451,8 +3450,7 @@ static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
>      }
>  }
>  
> -static void ram_state_pending_exact(void *opaque, uint64_t max_size,
> -                                    uint64_t *res_precopy,
> +static void ram_state_pending_exact(void *opaque, uint64_t *res_precopy,
>                                      uint64_t *res_postcopy)
>  {
>      RAMState **temp = opaque;
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 976ece3f3f..1e0328e088 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1471,8 +1471,7 @@ flush:
>   * the result is split into the amount for units that can and
>   * for units that can't do postcopy.
>   */
> -void qemu_savevm_state_pending_exact(uint64_t threshold_size,
> -                                     uint64_t *res_precopy,
> +void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
>                                       uint64_t *res_postcopy)
>  {
>      SaveStateEntry *se;
> @@ -1489,13 +1488,11 @@ void qemu_savevm_state_pending_exact(uint64_t threshold_size,
>                  continue;
>              }
>          }
> -        se->ops->state_pending_exact(se->opaque, threshold_size,
> -                                     res_precopy, res_postcopy);
> +        se->ops->state_pending_exact(se->opaque, res_precopy, res_postcopy);
>      }
>  }
>  
> -void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
> -                                        uint64_t *res_precopy,
> +void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
>                                          uint64_t *res_postcopy)
>  {
>      SaveStateEntry *se;
> @@ -1512,8 +1509,7 @@ void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
>                  continue;
>              }
>          }
> -        se->ops->state_pending_estimate(se->opaque, threshold_size,
> -                                        res_precopy, res_postcopy);
> +        se->ops->state_pending_estimate(se->opaque, res_precopy, res_postcopy);
>      }
>  }
>  
> -- 
> 2.37.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


