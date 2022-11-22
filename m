Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F0634530
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxZZO-0000qh-2q; Tue, 22 Nov 2022 15:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxZZL-0000o1-9S
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxZZI-0004Sl-S9
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669147711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z5yx6Cn4hWpURZ78moTB2nQCH/gf8iM9glyl7h4tvjU=;
 b=DJ2oioax5JRf86RZSbzwHtNbstKLLHpO6Y7Lbzf/dbbaYrNunCC08v3rLClSHzw0bcc0hB
 d87VjiehibN94hA9GYGjiS99gf2QZUNbDpSYHMq/mYQo0lVqjR9Z54J33ihNmzEYh/qViu
 y3UYMSXdnZbLWlXOrViO/cub2tTJFGg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-XfptP8fGMTecdULb6HlFWw-1; Tue, 22 Nov 2022 15:08:30 -0500
X-MC-Unique: XfptP8fGMTecdULb6HlFWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso8565289wmb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5yx6Cn4hWpURZ78moTB2nQCH/gf8iM9glyl7h4tvjU=;
 b=ErrVsFsfFe3iwyGvzUy0KWEgp1jJV+Nlh7VsqJd5VuIZkeOX0UICINWY4ApQKMWzPA
 tAUZJ2fu8dif1bxnfyewUC/aWjhaJnLYx4zWaoWrfDVjN3v4UgU5qd7lUnzbkhgg1DKL
 DrUKgAImQr9UcnQGeoMab/gpaIOYbr1iJoxCFs4SU4qTFcnN6fyFmutDDMAnjxkAMTCi
 sM5hDd8CtdJMGGinq6nXS7CRobd8/arQ9GNl5/bkGzH4frvgNoE4XFWv/rbivxtkR/Uy
 LiA2LDgXHCnZoxEy+pibgO0gyDqcnTdsfofZOOCCkvI3VatzM1WiXBUc1Ti1V4BAPsyf
 hCKQ==
X-Gm-Message-State: ANoB5pl2FERPNaxLXOmUqwQJ9zRcZvDAUMaEamFRvriwzZqHT43cuPyk
 4T+O3cksLc6gNUQiPYyVnm5DEWysQVkGreiOiSlttB09CuF5/hC2vgI/BJH/m9anbdZ7g7OMdLf
 voKkmOf+qdSvhnb4=
X-Received: by 2002:a05:600c:1e8d:b0:3d0:2c5c:e483 with SMTP id
 be13-20020a05600c1e8d00b003d02c5ce483mr3137956wmb.141.1669147707044; 
 Tue, 22 Nov 2022 12:08:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7O7ehl41anDWF2FJxAZv4J0vYgqobJId/g5kRX5W0oJvDQX2mB8XSrocydiyNwudRpBLnpvQ==
X-Received: by 2002:a05:600c:1e8d:b0:3d0:2c5c:e483 with SMTP id
 be13-20020a05600c1e8d00b003d02c5ce483mr3137917wmb.141.1669147706499; 
 Tue, 22 Nov 2022 12:08:26 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003cf5ec79bf9sm20651431wms.40.2022.11.22.12.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:08:25 -0800 (PST)
Date: Tue, 22 Nov 2022 20:08:23 +0000
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
Subject: Re: [RFC 4/7] migration: Split save_live_pending() into
 state_pending_*
Message-ID: <Y30sN9VSs4b4ZhMF@work-vm>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003031600.20084-5-quintela@redhat.com>
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
> We split the function into to:
> 
> - state_pending_estimate: We estimate the remaining state size without
>   stopping the machine.
> 
> - state pending_exact: We calculate the exact amount of remaining
>   state.
> 
> The only "device" that implements different functions for _estimate()
> and _exact() is ram.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Yeh I think that's OK; I'm a little worried whether you end up calling
the two functions in migration_iteration_run a lot, but still


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/devel/migration.rst       | 18 ++++++++++--------
>  docs/devel/vfio-migration.rst  |  4 ++--
>  include/migration/register.h   | 12 ++++++++----
>  migration/savevm.h             |  8 ++++++--
>  hw/s390x/s390-stattrib.c       |  7 ++++---
>  hw/vfio/migration.c            |  9 +++++----
>  migration/block-dirty-bitmap.c | 11 ++++++-----
>  migration/block.c              | 11 ++++++-----
>  migration/migration.c          | 13 +++++++++----
>  migration/ram.c                | 31 ++++++++++++++++++++++++-------
>  migration/savevm.c             | 34 +++++++++++++++++++++++++++++-----
>  hw/vfio/trace-events           |  2 +-
>  migration/trace-events         |  7 ++++---
>  13 files changed, 114 insertions(+), 53 deletions(-)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 3e9656d8e0..6f65c23b47 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -482,15 +482,17 @@ An iterative device must provide:
>    - A ``load_setup`` function that initialises the data structures on the
>      destination.
>  
> -  - A ``save_live_pending`` function that is called repeatedly and must
> -    indicate how much more data the iterative data must save.  The core
> -    migration code will use this to determine when to pause the CPUs
> -    and complete the migration.
> +  - A ``state_pending_exact`` function that indicates how much more
> +    data we must save.  The core migration code will use this to
> +    determine when to pause the CPUs and complete the migration.
>  
> -  - A ``save_live_iterate`` function (called after ``save_live_pending``
> -    when there is significant data still to be sent).  It should send
> -    a chunk of data until the point that stream bandwidth limits tell it
> -    to stop.  Each call generates one section.
> +  - A ``state_pending_estimate`` function that indicates how much more
> +    data we must save.  When the estimated amount is smaller than the
> +    threshold, we call ``state_pending_exact``.
> +
> +  - A ``save_live_iterate`` function should send a chunk of data until
> +    the point that stream bandwidth limits tell it to stop.  Each call
> +    generates one section.
>  
>    - A ``save_live_complete_precopy`` function that must transmit the
>      last section for the device containing any remaining data.
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> index 9ff6163c88..673057c90d 100644
> --- a/docs/devel/vfio-migration.rst
> +++ b/docs/devel/vfio-migration.rst
> @@ -28,7 +28,7 @@ VFIO implements the device hooks for the iterative approach as follows:
>  * A ``load_setup`` function that sets up the migration region on the
>    destination and sets _RESUMING flag in the VFIO device state.
>  
> -* A ``save_live_pending`` function that reads pending_bytes from the vendor
> +* A ``state_pending_exact`` function that reads pending_bytes from the vendor
>    driver, which indicates the amount of data that the vendor driver has yet to
>    save for the VFIO device.
>  
> @@ -114,7 +114,7 @@ Live migration save path
>                      (RUNNING, _SETUP, _RUNNING|_SAVING)
>                                    |
>                      (RUNNING, _ACTIVE, _RUNNING|_SAVING)
> -             If device is active, get pending_bytes by .save_live_pending()
> +             If device is active, get pending_bytes by .state_pending_exact()
>            If total pending_bytes >= threshold_size, call .save_live_iterate()
>                    Data of VFIO device for pre-copy phase is copied
>          Iterate till total pending bytes converge and are less than threshold
> diff --git a/include/migration/register.h b/include/migration/register.h
> index 5b5424ed8f..313b8e1c3b 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -46,9 +46,7 @@ typedef struct SaveVMHandlers {
>  
>      /* This runs outside the iothread lock!  */
>      int (*save_setup)(QEMUFile *f, void *opaque);
> -    void (*save_live_pending)(void *opaque,  uint64_t threshold_size,
> -                              uint64_t *rest_precopy, uint64_t *rest_postcopy);
> -    /* Note for save_live_pending:
> +    /* Note for state_pending_*:
>       * - res_precopy is for data which must be migrated in precopy
>       *     phase or in stopped state, in other words - before target
>       *     vm start
> @@ -59,7 +57,13 @@ typedef struct SaveVMHandlers {
>       * Sum of res_precopy and res_postcopy is the whole amount of
>       * pending data.
>       */
> -
> +    /* This calculate the exact remaining data to transfer */
> +    void (*state_pending_exact)(void *opaque,  uint64_t threshold_size,
> +                                uint64_t *rest_precopy, uint64_t *rest_postcopy);
> +    /* This estimates the remaining data to transfer */
> +    void (*state_pending_estimate)(void *opaque,  uint64_t threshold_size,
> +                                   uint64_t *rest_precopy,
> +                                   uint64_t *rest_postcopy);
>  
>      LoadStateHandler *load_state;
>      int (*load_setup)(QEMUFile *f, void *opaque);
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 98fae6f9b3..613f85e717 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -40,8 +40,12 @@ void qemu_savevm_state_cleanup(void);
>  void qemu_savevm_state_complete_postcopy(QEMUFile *f);
>  int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>                                         bool inactivate_disks);
> -void qemu_savevm_state_pending(uint64_t max_size,
> -                               uint64_t *res_precopy, uint64_t *res_postcopy);
> +void qemu_savevm_state_pending_exact(uint64_t max_size,
> +                                     uint64_t *res_precopy,
> +                                     uint64_t *res_postcopy);
> +void qemu_savevm_state_pending_estimate(uint64_t max_size,
> +                                        uint64_t *res_precopy,
> +                                        uint64_t *res_postcopy);
>  void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
>  void qemu_savevm_send_open_return_path(QEMUFile *f);
>  int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
> diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
> index 9b74eeadf3..dfb95eb20c 100644
> --- a/hw/s390x/s390-stattrib.c
> +++ b/hw/s390x/s390-stattrib.c
> @@ -182,8 +182,8 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void cmma_save_pending(void *opaque, uint64_t max_size,
> -                              uint64_t *res_precopy, uint64_t *res_postcopy)
> +static void cmma_state_pending(void *opaque, uint64_t *res_precopy,
> +                               uint64_t *res_postcopy)
>  {
>      S390StAttribState *sas = S390_STATTRIB(opaque);
>      S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
> @@ -369,7 +369,8 @@ static SaveVMHandlers savevm_s390_stattrib_handlers = {
>      .save_setup = cmma_save_setup,
>      .save_live_iterate = cmma_save_iterate,
>      .save_live_complete_precopy = cmma_save_complete,
> -    .save_live_pending = cmma_save_pending,
> +    .state_pending_exact = cmma_state_pending,
> +    .state_pending_estimate = cmma_state_pending,
>      .save_cleanup = cmma_save_cleanup,
>      .load_state = cmma_load,
>      .is_active = cmma_active,
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 760d5f3c5c..680cf4df6e 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -456,8 +456,8 @@ static void vfio_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
>  
> -static void vfio_save_pending(void *opaque,  uint64_t threshold_size,
> -                              uint64_t *res_precopy, uint64_t *res_postcopy)
> +static void vfio_state_pending(void *opaque,  uint64_t threshold_size,
> +                               uint64_t *res_precopy, uint64_t *res_postcopy)
>  {
>      VFIODevice *vbasedev = opaque;
>      VFIOMigration *migration = vbasedev->migration;
> @@ -470,7 +470,7 @@ static void vfio_save_pending(void *opaque,  uint64_t threshold_size,
>  
>      *res_precopy += migration->pending_bytes;
>  
> -    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
> +    trace_vfio_state_pending(vbasedev->name, *res_precopy, *res_postcopy);
>  }
>  
>  static int vfio_save_iterate(QEMUFile *f, void *opaque)
> @@ -681,7 +681,8 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>  static SaveVMHandlers savevm_vfio_handlers = {
>      .save_setup = vfio_save_setup,
>      .save_cleanup = vfio_save_cleanup,
> -    .save_live_pending = vfio_save_pending,
> +    .state_pending_exact = vfio_state_pending,
> +    .state_pending_estimate = vfio_state_pending,
>      .save_live_iterate = vfio_save_iterate,
>      .save_live_complete_precopy = vfio_save_complete_precopy,
>      .save_state = vfio_save_state,
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index a445bdc3c3..5b24007650 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -761,9 +761,9 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
> -                                      uint64_t *res_precopy, 
> -                                      uint64_t *res_postcopy)
> +static void dirty_bitmap_state_pending(void *opaque, uint64_t max_size,
> +                                       uint64_t *res_precopy,
> +                                       uint64_t *res_postcopy)
>  {
>      DBMSaveState *s = &((DBMState *)opaque)->save;
>      SaveBitmapState *dbms;
> @@ -781,7 +781,7 @@ static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
>  
>      qemu_mutex_unlock_iothread();
>  
> -    trace_dirty_bitmap_save_pending(pending, max_size);
> +    trace_dirty_bitmap_state_pending(pending);
>  
>      *res_postcopy += pending;
>  }
> @@ -1250,7 +1250,8 @@ static SaveVMHandlers savevm_dirty_bitmap_handlers = {
>      .save_live_complete_postcopy = dirty_bitmap_save_complete,
>      .save_live_complete_precopy = dirty_bitmap_save_complete,
>      .has_postcopy = dirty_bitmap_has_postcopy,
> -    .save_live_pending = dirty_bitmap_save_pending,
> +    .state_pending_exact = dirty_bitmap_state_pending,
> +    .state_pending_estimate = dirty_bitmap_state_pending,
>      .save_live_iterate = dirty_bitmap_save_iterate,
>      .is_active_iterate = dirty_bitmap_is_active_iterate,
>      .load_state = dirty_bitmap_load,
> diff --git a/migration/block.c b/migration/block.c
> index 39ce4003c6..8e6ad1c468 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -862,9 +862,9 @@ static int block_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void block_save_pending(void *opaque, uint64_t max_size,
> -                               uint64_t *res_precopy,
> -                               uint64_t *res_postcopy)
> +static void block_state_pending(void *opaque, uint64_t max_size,
> +                                uint64_t *res_precopy,
> +                                uint64_t *res_postcopy)
>  {
>      /* Estimate pending number of bytes to send */
>      uint64_t pending;
> @@ -883,7 +883,7 @@ static void block_save_pending(void *opaque, uint64_t max_size,
>          pending = BLK_MIG_BLOCK_SIZE;
>      }
>  
> -    trace_migration_block_save_pending(pending);
> +    trace_migration_block_state_pending(pending);
>      /* We don't do postcopy */
>      *res_precopy += pending;
>  }
> @@ -1018,7 +1018,8 @@ static SaveVMHandlers savevm_block_handlers = {
>      .save_setup = block_save_setup,
>      .save_live_iterate = block_save_iterate,
>      .save_live_complete_precopy = block_save_complete,
> -    .save_live_pending = block_save_pending,
> +    .state_pending_exact = block_state_pending,
> +    .state_pending_estimate = block_state_pending,
>      .load_state = block_load,
>      .save_cleanup = block_migration_cleanup,
>      .is_active = block_is_active,
> diff --git a/migration/migration.c b/migration/migration.c
> index 038fc58a96..4676568699 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3734,13 +3734,18 @@ typedef enum {
>   */
>  static MigIterateState migration_iteration_run(MigrationState *s)
>  {
> -    uint64_t pending_size, pend_pre, pend_post;
> +    uint64_t pend_pre, pend_post;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>  
> -    qemu_savevm_state_pending(s->threshold_size, &pend_pre, &pend_post);
> -    pending_size = pend_pre + pend_post;
> +    qemu_savevm_state_pending_estimate(s->threshold_size, &pend_pre, &pend_post);
> +    uint64_t pending_size = pend_pre + pend_post;
> +    trace_migrate_pending_estimate(pending_size, s->threshold_size, pend_pre, pend_post);
>  
> -    trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
> +    if (pend_pre <= s->threshold_size) {
> +        qemu_savevm_state_pending_exact(s->threshold_size, &pend_pre, &pend_post);
> +        pending_size = pend_pre + pend_post;
> +        trace_migrate_pending_exact(pending_size, s->threshold_size, pend_pre, pend_post);
> +    }
>  
>      if (pending_size && pending_size >= s->threshold_size) {
>          /* Still a significant amount to transfer */
> diff --git a/migration/ram.c b/migration/ram.c
> index 48a31b87c8..8d989d51db 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3434,17 +3434,33 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> -static void ram_save_pending(void *opaque, uint64_t max_size,
> -                             uint64_t *res_precopy, uint64_t *res_postcopy)
> +static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
> +                                       uint64_t *res_precopy,
> +                                       uint64_t *res_postcopy)
>  {
>      RAMState **temp = opaque;
>      RAMState *rs = *temp;
> -    uint64_t remaining_size;
>  
> -    remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
> +    uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
>  
> -    if (!migration_in_postcopy() &&
> -        remaining_size < max_size) {
> +    if (migrate_postcopy_ram()) {
> +        /* We can do postcopy, and all the data is postcopiable */
> +        *res_postcopy += remaining_size;
> +    } else {
> +        *res_precopy += remaining_size;
> +    }
> +}
> +
> +static void ram_state_pending_exact(void *opaque, uint64_t max_size,
> +                                    uint64_t *res_precopy,
> +                                    uint64_t *res_postcopy)
> +{
> +    RAMState **temp = opaque;
> +    RAMState *rs = *temp;
> +
> +    uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
> +
> +    if (!migration_in_postcopy()) {
>          qemu_mutex_lock_iothread();
>          WITH_RCU_READ_LOCK_GUARD() {
>              migration_bitmap_sync_precopy(rs);
> @@ -4600,7 +4616,8 @@ static SaveVMHandlers savevm_ram_handlers = {
>      .save_live_complete_postcopy = ram_save_complete,
>      .save_live_complete_precopy = ram_save_complete,
>      .has_postcopy = ram_has_postcopy,
> -    .save_live_pending = ram_save_pending,
> +    .state_pending_exact = ram_state_pending_exact,
> +    .state_pending_estimate = ram_state_pending_estimate,
>      .load_state = ram_load,
>      .save_cleanup = ram_save_cleanup,
>      .load_setup = ram_load_setup,
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d937ab0b2e..976ece3f3f 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1471,8 +1471,9 @@ flush:
>   * the result is split into the amount for units that can and
>   * for units that can't do postcopy.
>   */
> -void qemu_savevm_state_pending(uint64_t threshold_size, uint64_t *res_precopy,
> -                               uint64_t *res_postcopy)
> +void qemu_savevm_state_pending_exact(uint64_t threshold_size,
> +                                     uint64_t *res_precopy,
> +                                     uint64_t *res_postcopy)
>  {
>      SaveStateEntry *se;
>  
> @@ -1480,7 +1481,7 @@ void qemu_savevm_state_pending(uint64_t threshold_size, uint64_t *res_precopy,
>      *res_postcopy = 0;
>  
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> -        if (!se->ops || !se->ops->save_live_pending) {
> +        if (!se->ops || !se->ops->state_pending_exact) {
>              continue;
>          }
>          if (se->ops->is_active) {
> @@ -1488,8 +1489,31 @@ void qemu_savevm_state_pending(uint64_t threshold_size, uint64_t *res_precopy,
>                  continue;
>              }
>          }
> -        se->ops->save_live_pending(se->opaque, threshold_size,
> -                                   res_precopy, res_postcopy);
> +        se->ops->state_pending_exact(se->opaque, threshold_size,
> +                                     res_precopy, res_postcopy);
> +    }
> +}
> +
> +void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
> +                                        uint64_t *res_precopy,
> +                                        uint64_t *res_postcopy)
> +{
> +    SaveStateEntry *se;
> +
> +    *res_precopy = 0;
> +    *res_postcopy = 0;
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->ops || !se->ops->state_pending_estimate) {
> +            continue;
> +        }
> +        if (se->ops->is_active) {
> +            if (!se->ops->is_active(se->opaque)) {
> +                continue;
> +            }
> +        }
> +        se->ops->state_pending_estimate(se->opaque, threshold_size,
> +                                        res_precopy, res_postcopy);
>      }
>  }
>  
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index a21cbd2a56..90a8aecb37 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -157,7 +157,7 @@ vfio_save_cleanup(const char *name) " (%s)"
>  vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
>  vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
>  vfio_save_device_config_state(const char *name) " (%s)"
> -vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
> +vfio_state_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
>  vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
>  vfio_save_complete_precopy(const char *name) " (%s)"
>  vfio_load_device_config_state(const char *name) " (%s)"
> diff --git a/migration/trace-events b/migration/trace-events
> index f2a873fd6c..84352f310a 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -150,7 +150,8 @@ migrate_fd_cleanup(void) ""
>  migrate_fd_error(const char *error_desc) "error=%s"
>  migrate_fd_cancel(void) ""
>  migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
> -migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
> +migrate_pending_estimate(uint64_t size, uint64_t max, uint64_t pre, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
> +migrate_pending_exact(uint64_t size, uint64_t max, uint64_t pre, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
>  migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
>  migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
>  migration_completion_file_err(void) ""
> @@ -330,7 +331,7 @@ send_bitmap_bits(uint32_t flags, uint64_t start_sector, uint32_t nr_sectors, uin
>  dirty_bitmap_save_iterate(int in_postcopy) "in postcopy: %d"
>  dirty_bitmap_save_complete_enter(void) ""
>  dirty_bitmap_save_complete_finish(void) ""
> -dirty_bitmap_save_pending(uint64_t pending, uint64_t max_size) "pending %" PRIu64 " max: %" PRIu64
> +dirty_bitmap_state_pending(uint64_t pending) "pending %" PRIu64
>  dirty_bitmap_load_complete(void) ""
>  dirty_bitmap_load_bits_enter(uint64_t first_sector, uint32_t nr_sectors) "chunk: %" PRIu64 " %" PRIu32
>  dirty_bitmap_load_bits_zeroes(void) ""
> @@ -355,7 +356,7 @@ migration_block_save_device_dirty(int64_t sector) "Error reading sector %" PRId6
>  migration_block_flush_blks(const char *action, int submitted, int read_done, int transferred) "%s submitted %d read_done %d transferred %d"
>  migration_block_save(const char *mig_stage, int submitted, int transferred) "Enter save live %s submitted %d transferred %d"
>  migration_block_save_complete(void) "Block migration completed"
> -migration_block_save_pending(uint64_t pending) "Enter save live pending  %" PRIu64
> +migration_block_state_pending(uint64_t pending) "Enter save live pending  %" PRIu64
>  
>  # page_cache.c
>  migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRId64
> -- 
> 2.37.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


