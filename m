Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A109D567017
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:58:13 +0200 (CEST)
Received: from localhost ([::1]:43154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8j47-0004cR-GQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8j2m-0003np-QW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8j2i-0007bZ-2n
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657029402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B2BrPfntnMpOo7x19dH0rbKC2lzB4tyAxlvKVCTHp1w=;
 b=KLcQ8AWGT/AsRItlImrvHLwVAG/E8uY3LZrwUaBYkUAXTuHWn8oko3IHiAvng9AxQLH1ya
 9RqVoHN0IGFLWncrctjE2GXhaEA1OiO+VnB29pADVTaJTblQ4TcVE7y67NCk2sfgD7wRoZ
 N6He1tl6ngi+75S0kxn5s51ZxAulsY0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-ijMfsXfxNh2ABOVN7PMejQ-1; Tue, 05 Jul 2022 09:56:41 -0400
X-MC-Unique: ijMfsXfxNh2ABOVN7PMejQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c126-20020a1c3584000000b003a02fa133ceso1068343wma.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 06:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B2BrPfntnMpOo7x19dH0rbKC2lzB4tyAxlvKVCTHp1w=;
 b=Dystj7gRO6qtin0RKj4sqhUaXyQWL5m7ltKrBTNh+LYlH2mY0hTITmyWOLq4emWeHJ
 7eWx+9stQfn8wK8jzt2Y0htBhWlN6H000Qs0qAR88mInvmrN+7x9f62PwD/VO+7DMlt5
 /oBNZaQb0e1WOgYR+GyAE6ifO/kok317DClXxRmPJYCrXkcYmBltB46wU1DjfyQ8gFTE
 LfAR8xWG+YRJNN3cknxRfudxPeCotFmQUBrOxdEhWrd8HZGcJQflBHqkh3NmFvUhQKhB
 GintEIjpMjdvCPYmzj1h+T41anYET9Igdra9cBYj1th2CqYb5pDALB7mfHsVpeFnlktX
 LjDg==
X-Gm-Message-State: AJIora/bzCooVrfw1OR9Ue8lezuSdW44oGZA8jXcmCpdw4a62hmnq0c/
 HFaFQOcjq7ukn8hZrwiOVcV5b+YcWiyU2oCrKJKV46es91KSQgSL5fMZ+vfMzCdB4KqJpMNaI5f
 kzkC+wRj83+BfaJ0=
X-Received: by 2002:adf:f7cd:0:b0:21d:6e8d:ee13 with SMTP id
 a13-20020adff7cd000000b0021d6e8dee13mr6466511wrq.11.1657029398948; 
 Tue, 05 Jul 2022 06:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgsjfFb7lmM+/uHdaanQeippef2xFzBt/97QfIys50IQiT3pJCNhSH0fAup2zNwflpUuwSHg==
X-Received: by 2002:adf:f7cd:0:b0:21d:6e8d:ee13 with SMTP id
 a13-20020adff7cd000000b0021d6e8dee13mr6466485wrq.11.1657029398680; 
 Tue, 05 Jul 2022 06:56:38 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l1-20020a5d5601000000b0021d7799cf4csm584566wrv.61.2022.07.05.06.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 06:56:38 -0700 (PDT)
Date: Tue, 5 Jul 2022 14:56:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH 5/5] multifd: Only sync once each full round of memory
Message-ID: <YsRDEyA0mjUD4DSB@work-vm>
References: <20220621140507.1246-1-quintela@redhat.com>
 <20220621140507.1246-6-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621140507.1246-6-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We need to add a new flag to mean to sync at that point.
> Notice that we still synchronize at the end of setup and at the end of
> complete stages.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.c |  2 +-
>  migration/ram.c       | 42 ++++++++++++++++++++++++++++++------------
>  2 files changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 3f79df0b70..6627787fc2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4283,7 +4283,7 @@ static Property migration_properties[] = {
>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
>      /* We will change to false when we introduce the new mechanism */
>      DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
> -                      multifd_sync_each_iteration, true),
> +                      multifd_sync_each_iteration, false),
>  
>      /* Migration capabilities */
>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> diff --git a/migration/ram.c b/migration/ram.c
> index 2c7289edad..6792986565 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -81,6 +81,7 @@
>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> +#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200

Note this is the very last usable flag!
We could do with avoiding using them as flags where we dont need to.

>  XBZRLECacheStats xbzrle_counters;
>  
> @@ -1482,6 +1483,7 @@ retry:
>   * associated with the search process.
>   *
>   * Returns:
> + *        <0: An error happened
>   *         0: no page found, give up
>   *         1: no page found, retry
>   *         2: page found
> @@ -1510,6 +1512,13 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
>          pss->page = 0;
>          pss->block = QLIST_NEXT_RCU(pss->block, next);
>          if (!pss->block) {
> +            if (!migrate_multifd_sync_each_iteration()) {
> +                int ret = multifd_send_sync_main(rs->f);
> +                if (ret < 0) {
> +                    return ret;
> +                }
> +                qemu_put_be64(rs->f, RAM_SAVE_FLAG_MULTIFD_SYNC);
> +            }
>              /*
>               * If memory migration starts over, we will meet a dirtied page
>               * which may still exists in compression threads's ring, so we
> @@ -2273,7 +2282,8 @@ static int ram_find_and_save_block(RAMState *rs)
>          if (!get_queued_page(rs, &pss)) {
>              /* priority queue empty, so just search for something dirty */
>              int res = find_dirty_block(rs, &pss);
> -            if (res == 0) {
> +            if (res <= 0) {
> +                pages = res;
>                  break;
>              } else if (res == 1)
>                  continue;
> @@ -2943,11 +2953,13 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>  
> -    if (migrate_multifd_sync_each_iteration()) {
> -        ret =  multifd_send_sync_main(f);
> -        if (ret < 0) {
> -            return ret;
> -        }
> +    ret =  multifd_send_sync_main(f);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if (!migrate_multifd_sync_each_iteration()) {
> +        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
>      }
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
> @@ -3127,13 +3139,14 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> -    if (migrate_multifd_sync_each_iteration()) {
> -        ret = multifd_send_sync_main(rs->f);
> -        if (ret < 0) {
> -            return ret;
> -        }

It feels like you could have done that in the previous patch.
Anyway,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +    ret = multifd_send_sync_main(rs->f);
> +    if (ret < 0) {
> +        return ret;
>      }
>  
> +    if (migrate_multifd_sync_each_iteration()) {
> +        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
> +    }
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
>  
> @@ -3800,7 +3813,9 @@ int ram_load_postcopy(QEMUFile *f)
>              }
>              decompress_data_with_multi_threads(f, page_buffer, len);
>              break;
> -
> +        case RAM_SAVE_FLAG_MULTIFD_SYNC:
> +            multifd_recv_sync_main();
> +            break;
>          case RAM_SAVE_FLAG_EOS:
>              /* normal exit */
>              if (migrate_multifd_sync_each_iteration()) {
> @@ -4079,6 +4094,9 @@ static int ram_load_precopy(QEMUFile *f)
>                  break;
>              }
>              break;
> +        case RAM_SAVE_FLAG_MULTIFD_SYNC:
> +            multifd_recv_sync_main();
> +            break;
>          case RAM_SAVE_FLAG_EOS:
>              /* normal exit */
>              if (migrate_multifd_sync_each_iteration()) {
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


