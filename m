Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0994867A040
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 18:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNCE-0002KC-Vy; Tue, 24 Jan 2023 12:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKNCC-0002K3-Qm
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:34:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKNCA-00016I-CH
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674581693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qh8pNExEVp1CJfrFRHI4WXDgKhit4DHCP64vQTqqjGo=;
 b=PV7Lb//7OPO5cnT0LdLcX0WR+9rpgczNRCevb7FiFThWt/5KHzE8o0OnatdRObqSL1VmzY
 hnGTWHOGic1ZQEg5GwBQZbK2vritim7He4qWG7O18PzEq9cNI3B2PGzg2VOmb0TSvwMhDD
 +Ubd3oXCxn0TLn0j60VkIFo9r11Mo34=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-436-2A57NPAvNzu4yvXDhLX-Jg-1; Tue, 24 Jan 2023 12:34:51 -0500
X-MC-Unique: 2A57NPAvNzu4yvXDhLX-Jg-1
Received: by mail-wr1-f71.google.com with SMTP id
 b15-20020adfc74f000000b002be276d2052so2743309wrh.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 09:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qh8pNExEVp1CJfrFRHI4WXDgKhit4DHCP64vQTqqjGo=;
 b=RyRWHprtbsNJxsIJgIm64XPC90aH1n5KPleQlmp7gTwtEY8ONHl8khE3ex6+2paTFN
 xiL5dX3NiKB72mTV9/HLkeBrZE3B9nwQ0O86MR3ky8cKyv3eZGk6ZefWZEYRpMzpM5nH
 WAnunnnI4qDp8hn/szOX9fo1uPrvB/+ySWxesGSx5CiP51fMBCcIlIJ+F3DLNK+sGdn3
 EkeQawYja5h235n4otn8DBVmiB6MKy6I4JGzbRSnvfK574yTfbS1ekxDc/fYZiIJcNhp
 Dgm/o4i49braFQDm6hgbtdgOkKfNaRDFI/FkQzEr3BfYtYaifrqGC0kHwCujYiTEwSK4
 6+ig==
X-Gm-Message-State: AFqh2koJ6Fd3lVVpq4pNKA8PnjWswUZg+BmDptm1RDZq6r8zvo+l7o9Y
 pU9uJ3m7Ul/KAO62Gf2cxkIRaN1NU0m9bshCinLLgDQ3Amf6QEoD9Njhz1JvWGvxLXrtkhKp2u/
 nhL2285MedlqAYuo=
X-Received: by 2002:a05:600c:331d:b0:3d3:591a:bfda with SMTP id
 q29-20020a05600c331d00b003d3591abfdamr36411660wmp.27.1674581689906; 
 Tue, 24 Jan 2023 09:34:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtQOPrUNQzL2eRTw6g4UPBR9678SUWp1WjI1z/EecG7V5y2DLtEojEhRX6qIxlbmjcck2Xg/g==
X-Received: by 2002:a05:600c:331d:b0:3d3:591a:bfda with SMTP id
 q29-20020a05600c331d00b003d3591abfdamr36411647wmp.27.1674581689743; 
 Tue, 24 Jan 2023 09:34:49 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003db2b81660esm14398240wmo.21.2023.01.24.09.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 09:34:49 -0800 (PST)
Date: Tue, 24 Jan 2023 17:34:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 13/21] migration: Add migration_ram_pagesize_largest()
Message-ID: <Y9AWtl9UUzc8y9QY@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-14-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-14-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> Let it replace the old qemu_ram_pagesize_largest() just to fetch the page
> sizes using migration_ram_pagesize(), because it'll start to consider
> double mapping effect in migrations.
> 
> Also don't account the ignored ramblocks as they won't be migrated.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/exec/cpu-common.h |  1 -
>  migration/migration.c     |  2 +-
>  migration/ram.c           | 12 ++++++++++++
>  migration/ram.h           |  1 +
>  softmmu/physmem.c         | 13 -------------
>  5 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 94452aa17f..4c394ccdfc 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -96,7 +96,6 @@ int qemu_ram_get_fd(RAMBlock *rb);
>  
>  size_t qemu_ram_pagesize(RAMBlock *block);
>  bool qemu_ram_is_hugetlb(RAMBlock *rb);
> -size_t qemu_ram_pagesize_largest(void);
>  
>  /**
>   * cpu_address_space_init:
> diff --git a/migration/migration.c b/migration/migration.c
> index f6fe474fc3..7724e00c47 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -604,7 +604,7 @@ process_incoming_migration_co(void *opaque)
>  
>      assert(mis->from_src_file);
>      mis->migration_incoming_co = qemu_coroutine_self();
> -    mis->largest_page_size = qemu_ram_pagesize_largest();
> +    mis->largest_page_size = migration_ram_pagesize_largest();
>      postcopy_state_set(POSTCOPY_INCOMING_NONE);
>      migrate_set_state(&mis->state, MIGRATION_STATUS_NONE,
>                        MIGRATION_STATUS_ACTIVE);
> diff --git a/migration/ram.c b/migration/ram.c
> index 945c6477fd..2ebf414f5f 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -135,6 +135,18 @@ size_t migration_ram_pagesize(RAMBlock *block)
>      return qemu_ram_pagesize(block);
>  }
>  
> +size_t migration_ram_pagesize_largest(void)
> +{
> +    RAMBlock *block;
> +    size_t largest = 0;
> +
> +    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
> +        largest = MAX(largest, migration_ram_pagesize(block));
> +    }
> +
> +    return largest;
> +}
> +
>  static void XBZRLE_cache_lock(void)
>  {
>      if (migrate_use_xbzrle()) {
> diff --git a/migration/ram.h b/migration/ram.h
> index 162b3e7cb8..cefe166841 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -69,6 +69,7 @@ bool ramblock_is_ignored(RAMBlock *block);
>  
>  int xbzrle_cache_resize(uint64_t new_size, Error **errp);
>  size_t migration_ram_pagesize(RAMBlock *block);
> +size_t migration_ram_pagesize_largest(void);
>  uint64_t ram_bytes_remaining(void);
>  uint64_t ram_bytes_total(void);
>  void mig_throttle_counter_reset(void);
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cdda7eaea5..536c204811 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1813,19 +1813,6 @@ bool qemu_ram_is_hugetlb(RAMBlock *rb)
>      return rb->page_size > qemu_real_host_page_size();
>  }
>  
> -/* Returns the largest size of page in use */
> -size_t qemu_ram_pagesize_largest(void)
> -{
> -    RAMBlock *block;
> -    size_t largest = 0;
> -
> -    RAMBLOCK_FOREACH(block) {
> -        largest = MAX(largest, qemu_ram_pagesize(block));
> -    }
> -
> -    return largest;
> -}
> -
>  static int memory_try_enable_merging(void *addr, size_t len)
>  {
>      if (!machine_mem_merge(current_machine)) {
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


