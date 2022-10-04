Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D835F4856
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 19:26:03 +0200 (CEST)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oflgA-0005Qb-Et
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 13:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oflGn-00005Z-WC
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oflGj-0005wt-Vi
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 12:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664902784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K1TnzJeH8IcBh9Eg2jj7N1mxFqvzhwAeMyOlAih5BuY=;
 b=MBW2Gp3R5kP7CAVS5qu3ncrBZFaSlSrgjf7slHBWreOVzfXQIaausF5ZW3XH9ehYtr2u6I
 OliMI7ro0W9Ws/dSXKcRtKGRusJbTmSAdDXxsyY3qKchmmU/z5trjr5OMzM31Xosbw22Mu
 +Axx702YnqQ8po+pjsm/Qj0VpBhvnTU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-lL6C9sImP6-Zfr8R8dDuwA-1; Tue, 04 Oct 2022 12:59:42 -0400
X-MC-Unique: lL6C9sImP6-Zfr8R8dDuwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 i187-20020a1c3bc4000000b003be06269377so186272wma.6
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 09:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K1TnzJeH8IcBh9Eg2jj7N1mxFqvzhwAeMyOlAih5BuY=;
 b=4IeYMLguvYX4iUaypc3qRqYr1GSYSr7Ij+vXuC1UGvi/+6sKxPvyoaA6CCPsPOuaaR
 6XPP0zgguZpfyto4OWqRep3RsJP74XyUhOXXssChg7Z81fr0OpX0XpnNCatEnHgweTk1
 hRBzL6Ez8xSlnSsrqz4UqElHV2t1pZev711ompnseDu59FR81htzK+e+7+UQaDt03ZxI
 IRelXuEhn0TS7pkjwEKnl8L6aU3Zb+frS/PbmOvP42GGlE9Ej+5LV0kpDIpEPRz8JWZv
 THcIgN97RMvaUuTjDgmy0trAu50Ib3tTmv3ef/2PWsZxHkivHtP0hAW36x2SywiPki3h
 g++g==
X-Gm-Message-State: ACrzQf099js0HVcCWcI/nD0A5DVBT+c0Kf0JBWDoPmWlZhW71ZbRJZqY
 MlWZ0PJn6Bv1K8geQHl9hXa1MKSvoAnb5mLGo9aknYCzI8yZMYmIJrBMdw1OoNQXlUTAKdfJ1yJ
 EvoPJVhCCl4CeVR0=
X-Received: by 2002:a5d:64cd:0:b0:22e:4af7:8182 with SMTP id
 f13-20020a5d64cd000000b0022e4af78182mr3405092wri.453.1664902780000; 
 Tue, 04 Oct 2022 09:59:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tz2JIGXyRtHOjkIJdE+wOJ5F3sXuw/S/EH37t86yRLF8f0BwR1EuavLK5BTh12/8AdgA77w==
X-Received: by 2002:a5d:64cd:0:b0:22e:4af7:8182 with SMTP id
 f13-20020a5d64cd000000b0022e4af78182mr3405073wri.453.1664902779725; 
 Tue, 04 Oct 2022 09:59:39 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bj3-20020a0560001e0300b00226dfac0149sm6992323wrb.114.2022.10.04.09.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 09:59:39 -0700 (PDT)
Date: Tue, 4 Oct 2022 17:59:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 06/14] migration: Use atomic ops properly for page
 accountings
Message-ID: <YzxmeMMEq52IDGit@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225212.48785-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225212.48785-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> To prepare for thread-safety on page accountings, at least below counters
> need to be accessed only atomically, they are:
> 
>         ram_counters.transferred
>         ram_counters.duplicate
>         ram_counters.normal
>         ram_counters.postcopy_bytes
> 
> There are a lot of other counters but they won't be accessed outside
> migration thread, then they're still safe to be accessed without atomic
> ops.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

I think this is OK; I'm not sure whether the memset 0's of ram_counters
technically need changing.
I'd love to put a comment somewhere saying these fields need to be
atomically read, but their qapi defined so I don't think we can.

Finally, we probably need to check these are happy on 32 bit builds,
sometimes it's a bit funny with atomic adds.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 10 +++++-----
>  migration/multifd.c   |  2 +-
>  migration/ram.c       | 29 +++++++++++++++--------------
>  3 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 07c74a79a2..0eacc0c99b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1048,13 +1048,13 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>  
>      info->has_ram = true;
>      info->ram = g_malloc0(sizeof(*info->ram));
> -    info->ram->transferred = ram_counters.transferred;
> +    info->ram->transferred = qatomic_read(&ram_counters.transferred);
>      info->ram->total = ram_bytes_total();
> -    info->ram->duplicate = ram_counters.duplicate;
> +    info->ram->duplicate = qatomic_read(&ram_counters.duplicate);
>      /* legacy value.  It is not used anymore */
>      info->ram->skipped = 0;
> -    info->ram->normal = ram_counters.normal;
> -    info->ram->normal_bytes = ram_counters.normal * page_size;
> +    info->ram->normal = qatomic_read(&ram_counters.normal);
> +    info->ram->normal_bytes = info->ram->normal * page_size;
>      info->ram->mbps = s->mbps;
>      info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
>      info->ram->dirty_sync_missed_zero_copy =
> @@ -1065,7 +1065,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>      info->ram->pages_per_second = s->pages_per_second;
>      info->ram->precopy_bytes = ram_counters.precopy_bytes;
>      info->ram->downtime_bytes = ram_counters.downtime_bytes;
> -    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
> +    info->ram->postcopy_bytes = qatomic_read(&ram_counters.postcopy_bytes);
>  
>      if (migrate_use_xbzrle()) {
>          info->has_xbzrle_cache = true;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 586ddc9d65..460326acd4 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -437,7 +437,7 @@ static int multifd_send_pages(QEMUFile *f)
>                  + p->packet_len;
>      qemu_file_acct_rate_limit(f, transferred);
>      ram_counters.multifd_bytes += transferred;
> -    ram_counters.transferred += transferred;
> +    qatomic_add(&ram_counters.transferred, transferred);
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
>  
> diff --git a/migration/ram.c b/migration/ram.c
> index 6e7de6087a..5bd3d76bf0 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -432,11 +432,11 @@ static void ram_transferred_add(uint64_t bytes)
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes += bytes;
>      } else if (migration_in_postcopy()) {
> -        ram_counters.postcopy_bytes += bytes;
> +        qatomic_add(&ram_counters.postcopy_bytes, bytes);
>      } else {
>          ram_counters.downtime_bytes += bytes;
>      }
> -    ram_counters.transferred += bytes;
> +    qatomic_add(&ram_counters.transferred, bytes);
>  }
>  
>  void dirty_sync_missed_zero_copy(void)
> @@ -725,7 +725,7 @@ void mig_throttle_counter_reset(void)
>  
>      rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>      rs->num_dirty_pages_period = 0;
> -    rs->bytes_xfer_prev = ram_counters.transferred;
> +    rs->bytes_xfer_prev = qatomic_read(&ram_counters.transferred);
>  }
>  
>  /**
> @@ -1085,8 +1085,9 @@ uint64_t ram_pagesize_summary(void)
>  
>  uint64_t ram_get_total_transferred_pages(void)
>  {
> -    return  ram_counters.normal + ram_counters.duplicate +
> -                compression_counters.pages + xbzrle_counters.pages;
> +    return  qatomic_read(&ram_counters.normal) +
> +        qatomic_read(&ram_counters.duplicate) +
> +        compression_counters.pages + xbzrle_counters.pages;
>  }
>  
>  static void migration_update_rates(RAMState *rs, int64_t end_time)
> @@ -1145,8 +1146,8 @@ static void migration_trigger_throttle(RAMState *rs)
>  {
>      MigrationState *s = migrate_get_current();
>      uint64_t threshold = s->parameters.throttle_trigger_threshold;
> -
> -    uint64_t bytes_xfer_period = ram_counters.transferred - rs->bytes_xfer_prev;
> +    uint64_t bytes_xfer_period =
> +        qatomic_read(&ram_counters.transferred) - rs->bytes_xfer_prev;
>      uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
>      uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
>  
> @@ -1285,7 +1286,7 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
>      int len = save_zero_page_to_file(rs, rs->f, block, offset);
>  
>      if (len) {
> -        ram_counters.duplicate++;
> +        qatomic_inc(&ram_counters.duplicate);
>          ram_transferred_add(len);
>          return 1;
>      }
> @@ -1322,9 +1323,9 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>      }
>  
>      if (bytes_xmit > 0) {
> -        ram_counters.normal++;
> +        qatomic_inc(&ram_counters.normal);
>      } else if (bytes_xmit == 0) {
> -        ram_counters.duplicate++;
> +        qatomic_inc(&ram_counters.duplicate);
>      }
>  
>      return true;
> @@ -1354,7 +1355,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>          qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
>      }
>      ram_transferred_add(TARGET_PAGE_SIZE);
> -    ram_counters.normal++;
> +    qatomic_inc(&ram_counters.normal);
>      return 1;
>  }
>  
> @@ -1448,7 +1449,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
>      ram_transferred_add(bytes_xmit);
>  
>      if (param->zero_page) {
> -        ram_counters.duplicate++;
> +        qatomic_inc(&ram_counters.duplicate);
>          return;
>      }
>  
> @@ -2620,9 +2621,9 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
>      uint64_t pages = size / TARGET_PAGE_SIZE;
>  
>      if (zero) {
> -        ram_counters.duplicate += pages;
> +        qatomic_add(&ram_counters.duplicate, pages);
>      } else {
> -        ram_counters.normal += pages;
> +        qatomic_add(&ram_counters.normal, pages);
>          ram_transferred_add(size);
>          qemu_file_credit_transfer(f, size);
>      }
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


