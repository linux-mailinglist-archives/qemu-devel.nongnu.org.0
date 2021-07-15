Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C94B3CAE42
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 23:00:12 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48So-0005RW-OT
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 17:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m48Ri-0004BN-UU
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m48Rf-0001Mj-9C
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626382738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EOjr2TTWQW3KMdburSNDAxeUOtHZBXfRHaDNWhlU6s=;
 b=T8sOnSPfHJzl+ey0BoB+DGEidulaqnENCxYSqWjYejnAtg2y62fZWaYTmQ0IxuGU7nAUKc
 BtB6n6A50ZHHNe1Q3Lar917I6QEmm0gdVYCMXcP2nZksIUpUPJuD1BKETLecShkr7KD1Z2
 iRPKJrDxsEvf0UwR2ZJu5wKAddj3ADY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-rxFpftuAMkGtoMMcZCDA5A-1; Thu, 15 Jul 2021 16:58:57 -0400
X-MC-Unique: rxFpftuAMkGtoMMcZCDA5A-1
Received: by mail-qt1-f200.google.com with SMTP id
 q1-20020a05622a0301b029025f76cabdfcso1932162qtw.15
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2EOjr2TTWQW3KMdburSNDAxeUOtHZBXfRHaDNWhlU6s=;
 b=dFoggey0Rh4aZt1JeeYnnU5dQ/1xSrBaAJzEmQ0G4dtn91PguWMruz+opfIxJf/kyU
 PAnywHtYDU+4ftT9nJ6m3rmAccHGHJZm+sqabTXMNFFb2/H/opJHUqsQA2437Fc4gTp+
 gj3ykdAtrcCpjZLcFHdXXXdkCeVXZ3OOYZCZRaiMUxrkkZpPIlRghgWx9oNVbCGzB668
 7/7SMgXAcL02/Wn1Mq97+H9JXe6Td9OBqczgqSqiRQkNvAnTlhnCssliiJ62MDVJ6l2b
 kK6KfgQHR55ygohp42A1yH1vYXE7BEUdyl2ofHnv2Pzt2R+xGxlaf3YUBIAt8QFSPawk
 aVxg==
X-Gm-Message-State: AOAM533jlAqnLLR7113FEZYNwDxCX0+Wg3U+x6dTzaOJFvNLdgs/o7Fh
 siJuy38Yh8YGoMw79Xd/QxxpPXTY7D+gnqu0fMFJu2EuSldTtSSVFuKu1HUs0fgZ1bbdMU51HRN
 R2/4s9ipNQniX2JE=
X-Received: by 2002:a05:620a:1189:: with SMTP id
 b9mr5687619qkk.213.1626382736854; 
 Thu, 15 Jul 2021 13:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEJtNR6XCYlb3iyuKyqhrAZvytgmU9WM8iM9DkLZswZ8NGh2mc+G6uzeq/058SZ268kt1p9A==
X-Received: by 2002:a05:620a:1189:: with SMTP id
 b9mr5687600qkk.213.1626382736637; 
 Thu, 15 Jul 2021 13:58:56 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id a132sm2975065qkg.55.2021.07.15.13.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 13:58:56 -0700 (PDT)
Date: Thu, 15 Jul 2021 16:58:54 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 3/3] migration/dirtyrate: implement dirty-bitmap
 dirtyrate calculation
Message-ID: <YPChjjmp2NWwVd8s@t490s>
References: <cover.1626364220.git.huangy81@chinatelecom.cn>
 <1623bf516942494f78b0d33c9dda1297d6660574.1626364220.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <1623bf516942494f78b0d33c9dda1297d6660574.1626364220.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 11:51:33PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> introduce dirty-bitmap mode as the third method of calc-dirty-rate.
> implement dirty-bitmap dirtyrate calculation, which can be used
> to measuring dirtyrate in the absence of dirty-ring.
> 
> introduce "dirty_bitmap:-b" option in hmp calc_dirty_rate to
> indicate dirty bitmap method should be used for calculation.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  hmp-commands.hx        |   9 ++--
>  migration/dirtyrate.c  | 116 +++++++++++++++++++++++++++++++++++++++++++++----
>  migration/trace-events |   1 +
>  qapi/migration.json    |   6 ++-
>  4 files changed, 117 insertions(+), 15 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index f7fc9d7..605973c 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1738,9 +1738,10 @@ ERST
>  
>      {
>          .name       = "calc_dirty_rate",
> -        .args_type  = "dirty_ring:-r,second:l,sample_pages_per_GB:l?",
> -        .params     = "[-r] second [sample_pages_per_GB]",
> -        .help       = "start a round of guest dirty rate measurement (using -d to"
> -                      "\n\t\t\t specify dirty ring as the method of calculation)",
> +        .args_type  = "dirty_ring:-r,dirty_bitmap:-b,second:l,sample_pages_per_GB:l?",
> +        .params     = "[-r] [-b] second [sample_pages_per_GB]",
> +        .help       = "start a round of guest dirty rate measurement (using -r to"
> +                      "\n\t\t\t specify dirty ring as the method of calculation and"
> +                      "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
>          .cmd        = hmp_calc_dirty_rate,
>      },
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index c465e62..8006a0d 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -15,6 +15,7 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "exec/ramblock.h"
> +#include "exec/ram_addr.h"
>  #include "qemu/rcu_queue.h"
>  #include "qemu/main-loop.h"
>  #include "qapi/qapi-commands-migration.h"
> @@ -113,6 +114,10 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>              }
>              info->vcpu_dirty_rate = head;
>          }
> +
> +        if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_BITMAP) {
> +            info->sample_pages = 0;
> +        }
>      }
>  
>      trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
> @@ -410,6 +415,83 @@ static void dirtyrate_global_dirty_log_stop(void)
>      qemu_mutex_unlock_iothread();
>  }
>  
> +static inline void dirtyrate_dirtypages_clear(void)
> +{
> +    DirtyRateDirtyPages = 0;

I think this is okay; but I think it's easier we keep it increase-only, so we
do things similar to dirty ring - we record the diff before/after.

> +}
> +
> +static inline void dirtyrate_manual_reset_protect(void)
> +{
> +    RAMBlock *block = NULL;
> +
> +    WITH_RCU_READ_LOCK_GUARD() {
> +        RAMBLOCK_FOREACH_MIGRATABLE(block) {
> +            cpu_physical_memory_dirtyrate_reset_protect(block);
> +        }
> +    }
> +}
> +
> +static void do_calculate_dirtyrate_bitmap(void)
> +{
> +    uint64_t memory_size_MB;
> +    int64_t time_s;
> +    uint64_t dirtyrate = 0;
> +
> +    memory_size_MB = (DirtyRateDirtyPages *TARGET_PAGE_SIZE) >> 20;
> +    time_s = DirtyStat.calc_time;
> +
> +    dirtyrate = memory_size_MB / time_s;
> +    DirtyStat.dirty_rate = dirtyrate;
> +
> +    trace_dirtyrate_do_calculate_bitmap(DirtyRateDirtyPages,
> +                                        time_s, dirtyrate);
> +}
> +
> +static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
> +{
> +    int64_t msec = 0;
> +    int64_t start_time;
> +    uint64_t protect_flags = kvm_get_manual_dirty_log_protect();
> +
> +    dirtyrate_global_dirty_log_start();
> +
> +    /*
> +     * 1'round of log sync may return all 1 bits with
> +     * KVM_DIRTY_LOG_INITIALLY_SET enable
> +     * skip it unconditionally and start dirty tracking
> +     * from 2'round of log sync
> +     */
> +    memory_global_dirty_log_sync();

I think we need BQL for calling this.  E.g., memory_listeners can grow as we
call, also I'm not sure all ->log_sync() hooks are thread-safe.

> +
> +    /*
> +     * reset page protect manually and
> +     * start dirty tracking from now on
> +     */
> +    if (protect_flags & KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE) {
> +        dirtyrate_manual_reset_protect();

I think this needs BQL too.

Meanwhile after a second thought I think it's easier to drop patch 1 and call
dirtyrate_manual_reset_protect() unconditionally.  Say, kvm is not the only one
that may need a log clear (or say, re-protect), so checking kvm-only is not
actually a "complete" solution, because when there're more log_clear() hooks we
may want to call them too.

All modules providing log_clear() hook should be able to handle this correctly,
e.g., kvm_log_clear() can be called even without manual protect enabled, see
entry of kvm_physical_log_clear() which checks manual_dirty_log_protect.

> +    }
> +
> +    dirtyrate_dirtypages_clear();
> +
> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    DirtyStat.start_time = start_time / 1000;
> +
> +    msec = config.sample_period_seconds * 1000;
> +    msec = set_sample_page_period(msec, start_time);
> +    DirtyStat.calc_time = msec / 1000;
> +
> +    /* fetch dirty bitmap from kvm */
> +    memory_global_dirty_log_sync();
> +
> +    do_calculate_dirtyrate_bitmap();
> +
> +    if (protect_flags & KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE) {
> +        dirtyrate_manual_reset_protect();
> +    }

I feel like this chunk can be dropped.

> +
> +    dirtyrate_global_dirty_log_stop();
> +}

Thanks,

-- 
Peter Xu


