Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C183C293680
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 10:13:07 +0200 (CEST)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUmlW-0005vc-BH
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 04:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUmkP-0005N1-Gh
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUmkM-00016p-SC
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603181511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3VJeJDDq0A6Tm6Z6tgCMd3fHbFvPc9eHVkCP/a9Nfs=;
 b=bykUVw8ZJX2cC1pPt4ayOHtSd1HWjgnQEPFHps8ZxoVu6K0TPmtm+m2giOoXMp57EtaBIB
 h3emAC1BzzlLJjdtMUZctc8GhfqeXts6Q7D6QBkQho6wnUgN3zT1qw7FUMsg9ZCjs4hCjv
 +knvyNlyd4zGrjdAsxi5L90S/NlbvyU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-_7ZK0EjMOciBEZaePmA9OA-1; Tue, 20 Oct 2020 04:11:49 -0400
X-MC-Unique: _7ZK0EjMOciBEZaePmA9OA-1
Received: by mail-wr1-f69.google.com with SMTP id j15so480364wrd.16
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 01:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n3VJeJDDq0A6Tm6Z6tgCMd3fHbFvPc9eHVkCP/a9Nfs=;
 b=gTgXbxMSdHNOx8Km5PlNtNW+AF3JGRRcnHsBfRc1zclh1+CHcu/igCOpZ5qawMaflh
 GIcbNO9brtUlZGhiYQFiMV6xb2d6u9FiD9v3g1WonubBduWnt4eWpL6f75O42tlOFIVi
 tvkDkVhr4uf8nivvjGJef6ddObLHCO2dpkOLDgGjdBDx5OQCbLwlyUUdfrhlDQQ4JyjM
 kcCoabLzlUMIUZhTfpFQo+TqPd7W/r/3soEFOfc7qSP0URxxLmnoMx8jxVyZLP05M/iu
 RzDm91crKCne6QK8fEzq3sOLfIq/FCCN8YCT4wtjQuD0lEze8VTKU3Rv9IF8Mb+bZqZM
 hsiQ==
X-Gm-Message-State: AOAM5322dLL5HbuNjIukYcWanl5ikhb+9PQH3Jxiq6JBslFNWLyzREWU
 WQ3M/YHCaNCrNiFp0Xj/jn19bUiwsqd8go9M/KSERolVLmZV7bovEeldhl2NIQm31a78oDlQCdH
 3hGsfOiskGOxDM2U=
X-Received: by 2002:a1c:7d49:: with SMTP id y70mr1577683wmc.103.1603181508656; 
 Tue, 20 Oct 2020 01:11:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycIHup/QOZfccfMnowL0DRd7gnHOoWN/Q83VACNv+QBt1t8FYVD9kg3ov3VAxlwrxIbpdHUg==
X-Received: by 2002:a1c:7d49:: with SMTP id y70mr1577656wmc.103.1603181508388; 
 Tue, 20 Oct 2020 01:11:48 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id t19sm1595102wmi.26.2020.10.20.01.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 01:11:47 -0700 (PDT)
Subject: Re: [PATCH v3] migration: using trace_ to replace DPRINTF
To: Bihong Yu <yubihong@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <1603179176-5360-1-git-send-email-yubihong@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0dc00d17-877b-001d-aa7c-9240d4cdb629@redhat.com>
Date: Tue, 20 Oct 2020 10:11:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1603179176-5360-1-git-send-email-yubihong@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, zhengchuan@huawei.com, wanghao232@huawei.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/20 9:32 AM, Bihong Yu wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> ---
>   migration/block.c      | 36 ++++++++++++++++++------------------
>   migration/page_cache.c | 13 +++----------
>   migration/trace-events | 13 +++++++++++++
>   3 files changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/migration/block.c b/migration/block.c
> index 273392b..a950977 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -26,6 +26,7 @@
>   #include "qemu-file.h"
>   #include "migration/vmstate.h"
>   #include "sysemu/block-backend.h"
> +#include "trace.h"
>   
>   #define BLK_MIG_BLOCK_SIZE           (1 << 20)
>   #define BDRV_SECTORS_PER_DIRTY_CHUNK (BLK_MIG_BLOCK_SIZE >> BDRV_SECTOR_BITS)
> @@ -434,10 +435,9 @@ static int init_blk_migration(QEMUFile *f)
>           block_mig_state.total_sector_sum += sectors;
>   
>           if (bmds->shared_base) {
> -            DPRINTF("Start migration for %s with shared base image\n",
> -                    bdrv_get_device_name(bs));
> +            trace_migration_block_init_shared(bdrv_get_device_name(bs));
>           } else {
> -            DPRINTF("Start full migration for %s\n", bdrv_get_device_name(bs));
> +            trace_migration_block_init_full(bdrv_get_device_name(bs));
>           }
>   
>           QSIMPLEQ_INSERT_TAIL(&block_mig_state.bmds_list, bmds, entry);
> @@ -592,7 +592,7 @@ static int mig_save_device_dirty(QEMUFile *f, BlkMigDevState *bmds,
>       return (bmds->cur_dirty >= bmds->total_sectors);
>   
>   error:
> -    DPRINTF("Error reading sector %" PRId64 "\n", sector);
> +    trace_migration_block_save_device_dirty(sector);
>       g_free(blk->buf);
>       g_free(blk);
>       return ret;
> @@ -628,9 +628,9 @@ static int flush_blks(QEMUFile *f)
>       BlkMigBlock *blk;
>       int ret = 0;
>   
> -    DPRINTF("%s Enter submitted %d read_done %d transferred %d\n",
> -            __func__, block_mig_state.submitted, block_mig_state.read_done,
> -            block_mig_state.transferred);
> +    trace_migration_block_flush_blks("Enter", block_mig_state.submitted,
> +                                     block_mig_state.read_done,
> +                                     block_mig_state.transferred);
>   
>       blk_mig_lock();
>       while ((blk = QSIMPLEQ_FIRST(&block_mig_state.blk_list)) != NULL) {
> @@ -656,9 +656,9 @@ static int flush_blks(QEMUFile *f)
>       }
>       blk_mig_unlock();
>   
> -    DPRINTF("%s Exit submitted %d read_done %d transferred %d\n", __func__,
> -            block_mig_state.submitted, block_mig_state.read_done,
> -            block_mig_state.transferred);
> +    trace_migration_block_flush_blks("Exit", block_mig_state.submitted,
> +                                     block_mig_state.read_done,
> +                                     block_mig_state.transferred);
>       return ret;
>   }
>   
> @@ -727,8 +727,8 @@ static int block_save_setup(QEMUFile *f, void *opaque)
>   {
>       int ret;
>   
> -    DPRINTF("Enter save live setup submitted %d transferred %d\n",
> -            block_mig_state.submitted, block_mig_state.transferred);
> +    trace_migration_block_save("setup", block_mig_state.submitted,
> +                               block_mig_state.transferred);
>   
>       qemu_mutex_lock_iothread();
>       ret = init_blk_migration(f);
> @@ -759,8 +759,8 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
>       int64_t last_ftell = qemu_ftell(f);
>       int64_t delta_ftell;
>   
> -    DPRINTF("Enter save live iterate submitted %d transferred %d\n",
> -            block_mig_state.submitted, block_mig_state.transferred);
> +    trace_migration_block_save("iterate", block_mig_state.submitted,
> +                               block_mig_state.transferred);
>   
>       ret = flush_blks(f);
>       if (ret) {
> @@ -825,8 +825,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
>   {
>       int ret;
>   
> -    DPRINTF("Enter save live complete submitted %d transferred %d\n",
> -            block_mig_state.submitted, block_mig_state.transferred);
> +    trace_migration_block_save("complete", block_mig_state.submitted,
> +                               block_mig_state.transferred);
>   
>       ret = flush_blks(f);
>       if (ret) {
> @@ -851,7 +851,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
>       /* report completion */
>       qemu_put_be64(f, (100 << BDRV_SECTOR_BITS) | BLK_MIG_FLAG_PROGRESS);
>   
> -    DPRINTF("Block migration completed\n");
> +    trace_migration_block_save_complete();
>   
>       qemu_put_be64(f, BLK_MIG_FLAG_EOS);
>   
> @@ -884,7 +884,7 @@ static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
>           pending = max_size + BLK_MIG_BLOCK_SIZE;
>       }
>   
> -    DPRINTF("Enter save live pending  %" PRIu64 "\n", pending);
> +    trace_migration_block_save_pending(pending);
>       /* We don't do postcopy */
>       *res_precopy_only += pending;
>   }
> diff --git a/migration/page_cache.c b/migration/page_cache.c
> index 775582f..098b436 100644
> --- a/migration/page_cache.c
> +++ b/migration/page_cache.c
> @@ -18,14 +18,7 @@
>   #include "qapi/error.h"
>   #include "qemu/host-utils.h"
>   #include "page_cache.h"
> -
> -#ifdef DEBUG_CACHE
> -#define DPRINTF(fmt, ...) \
> -    do { fprintf(stdout, "cache: " fmt, ## __VA_ARGS__); } while (0)
> -#else
> -#define DPRINTF(fmt, ...) \
> -    do { } while (0)
> -#endif
> +#include "trace.h"
>   
>   /* the page in cache will not be replaced in two cycles */
>   #define CACHED_PAGE_LIFETIME 2
> @@ -75,7 +68,7 @@ PageCache *cache_init(int64_t new_size, size_t page_size, Error **errp)
>       cache->num_items = 0;
>       cache->max_num_items = num_pages;
>   
> -    DPRINTF("Setting cache buckets to %" PRId64 "\n", cache->max_num_items);
> +    trace_migration_pagecache_init(cache->max_num_items);
>   
>       /* We prefer not to abort if there is no memory */
>       cache->page_cache = g_try_malloc((cache->max_num_items) *
> @@ -169,7 +162,7 @@ int cache_insert(PageCache *cache, uint64_t addr, const uint8_t *pdata,
>       if (!it->it_data) {
>           it->it_data = g_try_malloc(cache->page_size);
>           if (!it->it_data) {
> -            DPRINTF("Error allocating page\n");
> +            trace_migration_pagecache_insert();
>               return -1;
>           }
>           cache->num_items++;
> diff --git a/migration/trace-events b/migration/trace-events
> index 338f38b..c775511 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -325,3 +325,16 @@ get_ramblock_vfn_hash(const char *idstr, uint64_t vfn, uint32_t crc) "ramblock n
>   calc_page_dirty_rate(const char *idstr, uint32_t new_crc, uint32_t old_crc) "ramblock name: %s, new crc: %" PRIu32 ", old crc: %" PRIu32
>   skip_sample_ramblock(const char *idstr, uint64_t ramblock_size) "ramblock name: %s, ramblock size: %" PRIu64
>   find_page_matched(const char *idstr) "ramblock %s addr or size changed"
> +
> +# block.c
> +migration_block_init_shared(const char *blk_device_name) "Start migration for %s with shared base image"
> +migration_block_init_full(const char *blk_device_name) "Start full migration for %s"
> +migration_block_save_device_dirty(int64_t sector) "Error reading sector %" PRId64
> +migration_block_flush_blks(const char *action, int submitted, int read_done, int transferred) "%s submitted %d read_done %d transferred %d"

Maybe "%s (submitted %d, read_done %d, transferred %d)"

> +migration_block_save(const char *mig_stage, int submitted, int transferred) "Enter save live %s submitted %d transferred %d"
> +migration_block_save_complete(void) "Block migration completed"
> +migration_block_save_pending(uint64_t pending) "Enter save live pending  %" PRIu64

Maybe "save live (blocks pending: %" PRIu64 ")"

> +
> +# page_cache.c
> +migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRId64

Maybe "Setting cache to %" PRId64 " buckets"

> +migration_pagecache_insert(void) "Error allocating page"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


