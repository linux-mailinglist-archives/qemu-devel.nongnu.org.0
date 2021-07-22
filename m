Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4763D2675
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:21:02 +0200 (CEST)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aVP-0000wH-RY
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6aU4-0000Az-RZ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6aU2-0008QC-MB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626967173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vdgXMg1XrPJLVVVO29WM6HeXA6D5DbspGpBNacjDvIQ=;
 b=CcgL6v9MS4neaz2BcR9eIxkK7RbWiu3yzVFt5waZ/drP3inTMaTYiS7JLBJ404EmNQfX+/
 rz0acXf1x8SeKUNHWJemcM/82HE71aA7nOLdzRAuRlpM2vk+UZi+STausAangRlmv8yuoS
 UdBPT19K7ipm/G6HEW3QYQXVr6lu0DE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-jJukPwhOPba0HIXDhQjfEw-1; Thu, 22 Jul 2021 11:19:32 -0400
X-MC-Unique: jJukPwhOPba0HIXDhQjfEw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i12-20020adffc0c0000b0290140ab4d8389so2584957wrr.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vdgXMg1XrPJLVVVO29WM6HeXA6D5DbspGpBNacjDvIQ=;
 b=sYkb6HAXgXo75MS5UuhLjV8xoF/LKKsOoviPEcRezMmlmhEwxaye/V8fSWjLPfwJ8W
 /f0LS90awU7qgOhp8nqWk8yl+h1VUc9nJYNpfyGm0OkiNK6mZvH3244KaySu/bbfsDGK
 RffTX+QFxMqqaJGknOupOQKNjLIX6TYc64ebzWhNaV1DAUewJEJ1fO5fMxH7juXzMBwP
 UiQu7vdgXh9XqcGIjFoMP0GEXjoMXaN/hCOosbJrZ1zFKzeXS1Y+MdlpxDbI+8XCw1LI
 K6VMrqXBVox4kPQUa3dIaNZtbBpo/vZ1jZZGntrT+HBQZ6MijLas/xtwMqPeJgLp5Wrp
 OnPA==
X-Gm-Message-State: AOAM531ocruUs+HaCwULhpOXGzScCtxbjZslWqQwGlnMTogr3NSiE1gS
 CDgsD0gkU1o5cwGj151LY6DCu6OjlQm6aFVLckDcJlcLPVIAca5evwwEOTqla+lpfi4TgmCLBkM
 L1uy9ci7BbAtgTk0=
X-Received: by 2002:a05:6000:1b02:: with SMTP id
 f2mr461761wrz.315.1626967171008; 
 Thu, 22 Jul 2021 08:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNY1UvmTsplcrO+85Oe2vsWeqbjjWCQEOPEp253F2XeppGALWSlfbDCSKdUmQ3Ua+9NKPX6Q==
X-Received: by 2002:a05:6000:1b02:: with SMTP id
 f2mr461738wrz.315.1626967170866; 
 Thu, 22 Jul 2021 08:19:30 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id e6sm35393848wrg.18.2021.07.22.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:19:30 -0700 (PDT)
Date: Thu, 22 Jul 2021 16:19:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 2/5] migration: Make from_dst_file accesses thread-safe
Message-ID: <YPmMgEqXDxKxNCNo@work-vm>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721193409.910462-3-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Accessing from_dst_file is potentially racy in current code base like below:
> 
>   if (s->from_dst_file)
>     do_something(s->from_dst_file);
> 
> Because from_dst_file can be reset right after the check in another
> thread (rp_thread).  One example is migrate_fd_cancel().
> 
> Use the same qemu_file_lock to protect it too, just like to_dst_file.
> 
> When it's safe to access without lock, comment it.
> 
> There's one special reference in migration_thread() that can be replaced by
> the newly introduced rp_thread_created flag.
> 
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yep, with Eric's comments

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 32 +++++++++++++++++++++++++-------
>  migration/migration.h |  8 +++++---
>  migration/ram.c       |  1 +
>  3 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 21b94f75a3..fa70400f98 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1879,10 +1879,12 @@ static void migrate_fd_cancel(MigrationState *s)
>      QEMUFile *f = migrate_get_current()->to_dst_file;
>      trace_migrate_fd_cancel();
>  
> +    qemu_mutex_lock(&s->qemu_file_lock);
>      if (s->rp_state.from_dst_file) {
>          /* shutdown the rp socket, so causing the rp thread to shutdown */
>          qemu_file_shutdown(s->rp_state.from_dst_file);
>      }
> +    qemu_mutex_unlock(&s->qemu_file_lock);
>  
>      do {
>          old_state = s->state;
> @@ -2686,6 +2688,22 @@ static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
>      return 0;
>  }
>  
> +/* Release ms->rp_state.from_dst_file in a safe way */
> +static void migration_release_from_dst_file(MigrationState *ms)
> +{
> +    QEMUFile *file = ms->rp_state.from_dst_file;
> +
> +    qemu_mutex_lock(&ms->qemu_file_lock);
> +    /*
> +     * Reset the from_dst_file pointer first before releasing it, as we can't
> +     * block within lock section
> +     */
> +    ms->rp_state.from_dst_file = NULL;
> +    qemu_mutex_unlock(&ms->qemu_file_lock);
> +
> +    qemu_fclose(file);
> +}
> +
>  /*
>   * Handles messages sent on the return path towards the source VM
>   *
> @@ -2827,11 +2845,13 @@ out:
>               * Maybe there is something we can do: it looks like a
>               * network down issue, and we pause for a recovery.
>               */
> -            qemu_fclose(rp);
> -            ms->rp_state.from_dst_file = NULL;
> +            migration_release_from_dst_file(ms);
>              rp = NULL;
>              if (postcopy_pause_return_path_thread(ms)) {
> -                /* Reload rp, reset the rest */
> +                /*
> +                 * Reload rp, reset the rest.  Referencing it is save since
> +                 * it's reset only by us above, or when migration completes
> +                 */
>                  rp = ms->rp_state.from_dst_file;
>                  ms->rp_state.error = false;
>                  goto retry;
> @@ -2843,8 +2863,7 @@ out:
>      }
>  
>      trace_source_return_path_thread_end();
> -    ms->rp_state.from_dst_file = NULL;
> -    qemu_fclose(rp);
> +    migration_release_from_dst_file(ms);
>      rcu_unregister_thread();
>      return NULL;
>  }
> @@ -2852,7 +2871,6 @@ out:
>  static int open_return_path_on_source(MigrationState *ms,
>                                        bool create_thread)
>  {
> -
>      ms->rp_state.from_dst_file = qemu_file_get_return_path(ms->to_dst_file);
>      if (!ms->rp_state.from_dst_file) {
>          return -1;
> @@ -3746,7 +3764,7 @@ static void *migration_thread(void *opaque)
>       * If we opened the return path, we need to make sure dst has it
>       * opened as well.
>       */
> -    if (s->rp_state.from_dst_file) {
> +    if (s->rp_state.rp_thread_created) {
>          /* Now tell the dest that it should open its end so it can reply */
>          qemu_savevm_send_open_return_path(s->to_dst_file);
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index c302879fad..7a5aa8c2fd 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -154,12 +154,13 @@ struct MigrationState {
>      QemuThread thread;
>      QEMUBH *vm_start_bh;
>      QEMUBH *cleanup_bh;
> +    /* Protected by qemu_file_lock */
>      QEMUFile *to_dst_file;
>      QIOChannelBuffer *bioc;
>      /*
> -     * Protects to_dst_file pointer.  We need to make sure we won't
> -     * yield or hang during the critical section, since this lock will
> -     * be used in OOB command handler.
> +     * Protects to_dst_file/from_dst_file pointers.  We need to make sure we
> +     * won't yield or hang during the critical section, since this lock will be
> +     * used in OOB command handler.
>       */
>      QemuMutex qemu_file_lock;
>  
> @@ -192,6 +193,7 @@ struct MigrationState {
>  
>      /* State related to return path */
>      struct {
> +        /* Protected by qemu_file_lock */
>          QEMUFile     *from_dst_file;
>          QemuThread    rp_thread;
>          bool          error;
> diff --git a/migration/ram.c b/migration/ram.c
> index b5fc454b2f..f728f5072f 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -4012,6 +4012,7 @@ static void ram_dirty_bitmap_reload_notify(MigrationState *s)
>  int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
>  {
>      int ret = -EINVAL;
> +    /* from_dst_file is always valid because we're within rp_thread */
>      QEMUFile *file = s->rp_state.from_dst_file;
>      unsigned long *le_bitmap, nbits = block->used_length >> TARGET_PAGE_BITS;
>      uint64_t local_size = DIV_ROUND_UP(nbits, 8);
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


