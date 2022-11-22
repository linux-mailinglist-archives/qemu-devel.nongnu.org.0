Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E3633E3C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:56:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTkD-0005yo-VF; Tue, 22 Nov 2022 08:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxTkC-0005xA-1F
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:55:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oxTk9-0008ET-4K
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669125312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ov4ZPehLGxXA374uzTqfbVNtI4JADg1ISAFKrofIZv0=;
 b=ARHgTIlbMExRVdFneZknb4pveQI8ONqbQAA+Geq9iMqDqmQXFlzta+oxU3iUlSqrj4dWkh
 Uj5cfcb49l+8jBlzhg+D2VAq97ZVv2CMAUEzqZOT+8E+UcNua8VSBJSvrCgSPqQWiPgvdX
 4x4C2u/A4lFRiV5Obx4Biv8LwlGX+OY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-iBYFnUuOOL2qOiETMLFx5w-1; Tue, 22 Nov 2022 08:55:01 -0500
X-MC-Unique: iBYFnUuOOL2qOiETMLFx5w-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so11024819wmb.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 05:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ov4ZPehLGxXA374uzTqfbVNtI4JADg1ISAFKrofIZv0=;
 b=xr1V0sUofgW5nfmEKOzmt1+MO7RwwtkRswznWN9ScjFyXhI6YtbH/IXkBwvo31W1iV
 zxPwoCX5W6BJJoNKlnbnRKDB839LINsGclEHHPJgw7SwZ+6iUJ8YKGiCXIC6elKmdkEQ
 9JRDh2n0fq7Q+ubVzcedSau1XU+8rrCgnbXtsFodnw+S5o8RyPBdBzqW/MaWDt3zabGF
 nnDZ+Tbhs86FcqeUqry4AF4MB4e0s+14QreNmno9xVnfcukZxJHsDJnMUvwoBIPMFjI1
 wA1PaLUNA9zqTQ4zIdPcf94AL7HaJG4mpfHA+O6HnqlJoyklW6FYE4za7XpNTDWgcGRS
 ejpw==
X-Gm-Message-State: ANoB5plyp1eQy+0MPn10YJZBptH7iaLzlB1i1NaUaL54AmGwGZblwR83
 iOmM/fXyAJw+CB/c7XzhQLTC5ZlvTJ0QJWJEssrBJNuhuw6IJEn18jPoG8GHpJzbXsn75tgD0/m
 703+cvOlQimr4+lA=
X-Received: by 2002:adf:e105:0:b0:236:73af:f9ad with SMTP id
 t5-20020adfe105000000b0023673aff9admr13779786wrz.225.1669125299472; 
 Tue, 22 Nov 2022 05:54:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5L+FGV1rqDp8frsFI0HxrCkHZxzqZuvnTeE0JZLB9phxUenWRNeLqXqq5tWIGYEotZ6jTCXQ==
X-Received: by 2002:adf:e105:0:b0:236:73af:f9ad with SMTP id
 t5-20020adfe105000000b0023673aff9admr13779770wrz.225.1669125299213; 
 Tue, 22 Nov 2022 05:54:59 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003a3170a7af9sm18126173wmo.4.2022.11.22.05.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 05:54:58 -0800 (PST)
Date: Tue, 22 Nov 2022 13:54:56 +0000
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
Subject: Re: [RFC 1/7] migration: Remove res_compatible parameter
Message-ID: <Y3zUsI7uNbQkabCh@work-vm>
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003031600.20084-2-quintela@redhat.com>
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
> It was only used for RAM, and in that case, it means that this amount
> of data was sent for memory.  Just delete the field in all callers.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  include/migration/register.h   | 20 ++++++++++----------
>  migration/savevm.h             |  4 +---
>  hw/s390x/s390-stattrib.c       |  6 ++----
>  hw/vfio/migration.c            | 10 ++++------
>  migration/block-dirty-bitmap.c |  7 +++----
>  migration/block.c              |  7 +++----
>  migration/migration.c          |  9 ++++-----
>  migration/ram.c                |  8 +++-----
>  migration/savevm.c             | 14 +++++---------
>  hw/vfio/trace-events           |  2 +-
>  migration/trace-events         |  2 +-
>  11 files changed, 37 insertions(+), 52 deletions(-)
> 
> diff --git a/include/migration/register.h b/include/migration/register.h
> index c1dcff0f90..1950fee6a8 100644
> --- a/include/migration/register.h
> +++ b/include/migration/register.h
> @@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
>      int (*save_setup)(QEMUFile *f, void *opaque);
>      void (*save_live_pending)(QEMUFile *f, void *opaque,
>                                uint64_t threshold_size,
> -                              uint64_t *res_precopy_only,
> -                              uint64_t *res_compatible,
> -                              uint64_t *res_postcopy_only);
> +                              uint64_t *rest_precopy,
> +                              uint64_t *rest_postcopy);
>      /* Note for save_live_pending:
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
>       *
> -     * Sum of res_postcopy_only, res_compatible and res_postcopy_only is the
> -     * whole amount of pending data.
> +     * Sum of res_precopy and res_postcopy is the whole amount of
> +     * pending data.

I'm not sure if this is correct; I think we really do have three
different kinds of device:
  a) Those that don't know how to postcopy
  b) Those that can only send data in postcopy (which I think is what
the dirty-bitmap block stuff does)
  c) Devices that know how to postcopy, like RAM
  
<snip>

> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9ddbc..20167e1102 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3435,9 +3435,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>  }
>  
>  static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
> -                             uint64_t *res_precopy_only,
> -                             uint64_t *res_compatible,
> -                             uint64_t *res_postcopy_only)
> +                             uint64_t *res_precopy, uint64_t *res_postcopy)
>  {
>      RAMState **temp = opaque;
>      RAMState *rs = *temp;
> @@ -3457,9 +3455,9 @@ static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
>  
>      if (migrate_postcopy_ram()) {
>          /* We can do postcopy, and all the data is postcopiable */
> -        *res_compatible += remaining_size;
> +        *res_postcopy += remaining_size;

migrate_postcopy_ram() says that postcopy is enabled, not active, so here you are saying that
ram is 'postcopy only' according to your definition above.
I don't think it actually changes behaviour though at the moment; but it
doesn't feel right to assign that to something that says 'postcopy only'
migration_iteration_run doesn't enforce the postcopy-only part very
hard; it's just part of the threshold as far as I can tell.

Dave

>      } else {
> -        *res_precopy_only += remaining_size;
> +        *res_precopy += remaining_size;
>      }
>  }

> diff --git a/migration/migration.c b/migration/migration.c
> index bb8bbddfe4..440aa62f16 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3734,15 +3734,14 @@ typedef enum {
>   */
>  static MigIterateState migration_iteration_run(MigrationState *s)
>  {
> -    uint64_t pending_size, pend_pre, pend_compat, pend_post;
> +    uint64_t pending_size, pend_pre, pend_post;
>      bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
>  
>      qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
> -                              &pend_compat, &pend_post);
> -    pending_size = pend_pre + pend_compat + pend_post;
> +                              &pend_post);
> +    pending_size = pend_pre + pend_post;
>  
> -    trace_migrate_pending(pending_size, s->threshold_size,
> -                          pend_pre, pend_compat, pend_post);
> +    trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
>  
>      if (pending_size && pending_size >= s->threshold_size) {
>          /* Still a significant amount to transfer */
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 48e85c052c..a752ff9ea1 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1472,16 +1472,13 @@ flush:
>   * for units that can't do postcopy.
>   */
>  void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
> -                               uint64_t *res_precopy_only,
> -                               uint64_t *res_compatible,
> -                               uint64_t *res_postcopy_only)
> +                               uint64_t *res_precopy,
> +                               uint64_t *res_postcopy)
>  {
>      SaveStateEntry *se;
>  
> -    *res_precopy_only = 0;
> -    *res_compatible = 0;
> -    *res_postcopy_only = 0;
> -
> +    *res_precopy = 0;
> +    *res_postcopy = 0;
>  
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>          if (!se->ops || !se->ops->save_live_pending) {
> @@ -1493,8 +1490,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
>              }
>          }
>          se->ops->save_live_pending(f, se->opaque, threshold_size,
> -                                   res_precopy_only, res_compatible,
> -                                   res_postcopy_only);
> +                                   res_precopy, res_postcopy);
>      }
>  }
>  
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 73dffe9e00..a21cbd2a56 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -157,7 +157,7 @@ vfio_save_cleanup(const char *name) " (%s)"
>  vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
>  vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
>  vfio_save_device_config_state(const char *name) " (%s)"
> -vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
> +vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
>  vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
>  vfio_save_complete_precopy(const char *name) " (%s)"
>  vfio_load_device_config_state(const char *name) " (%s)"
> diff --git a/migration/trace-events b/migration/trace-events
> index 57003edcbd..f2a873fd6c 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -150,7 +150,7 @@ migrate_fd_cleanup(void) ""
>  migrate_fd_error(const char *error_desc) "error=%s"
>  migrate_fd_cancel(void) ""
>  migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
> -migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
> +migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
>  migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
>  migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
>  migration_completion_file_err(void) ""
> -- 
> 2.37.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


