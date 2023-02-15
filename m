Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5A4698532
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSO2a-00038w-CV; Wed, 15 Feb 2023 15:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSO2Y-00037G-Dl
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pSO2W-0006Zg-CS
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676491563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dnNvf/EMDX4jMsZc7FoQfhZyAYObnbFW0EbB5GpJ6so=;
 b=VTaq+MGxgxnlQ3tu20OTGYx1scVju4YPfnR/nBFymkLDdClSzVFPQQJTedAonc7YnWWOol
 rqPrOwUlGYR6yM/PsiZqn+aSE5C5ilj85BadnyUkISusjloTvgQ2FlXeD4P7GAV7EL0126
 L03BxhQ4yKOvk7C8akiHYJRqA5tcTMY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-yNOLJojYPqCrAyDdxQPAuA-1; Wed, 15 Feb 2023 15:06:02 -0500
X-MC-Unique: yNOLJojYPqCrAyDdxQPAuA-1
Received: by mail-io1-f70.google.com with SMTP id
 g19-20020a6b6b13000000b0073deb4b4272so6796643ioc.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnNvf/EMDX4jMsZc7FoQfhZyAYObnbFW0EbB5GpJ6so=;
 b=YRJFBdP5cW+trHVz5LIR4Lp+ISzIhpTZ7h4Yg5nbLwXtEaTuCXDturMV4eKklBCJWl
 ve0viAT7OJG5Ic+dmGhdnFQt7oONZofYDQCn7jtgzvedWdGGoaPuFgmDB8k2CYJhEgm9
 HCtxD+xZjoCjm2+yYEc7kZCE6JwJ44tKIPRUBLGlBUOaWiddYO/nMCJ3Od0Hr5JcoOoo
 gvhiqEi6CiElkSWedz7s00st0XelsSm+971btUNgcFXuU38NzVGAq8bwfE/14ThRPD9h
 YZ8AhzVyjUrm1J7RVX/yzMuzQ1RXddzzdMa5YaUfdLWUMXkcX38HBNbXcFz0ngbt3JtO
 adpA==
X-Gm-Message-State: AO0yUKWkI6XuoQ21gwuS/Q/foDwBzXO43pliKVqkkMc/iq+fCIjIe/0a
 /AuL/xHrxifXKY+c0lTnNcE7gwJPMme4tkwSVeX34QvJwYHOn/K56jCiM66iQjEQcyMmjUOlrIZ
 /c7Jx716QNyCkuaU=
X-Received: by 2002:a05:6e02:1d0b:b0:315:29e8:6ef3 with SMTP id
 i11-20020a056e021d0b00b0031529e86ef3mr2917716ila.2.1676491561505; 
 Wed, 15 Feb 2023 12:06:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9JzJkIDAGkq8xf5fyu8aMay6xPjpz3zNJS5DQQxIwn2xiH6dEX/oKGJYpATA7W1sIDk5aT7Q==
X-Received: by 2002:a05:6e02:1d0b:b0:315:29e8:6ef3 with SMTP id
 i11-20020a056e021d0b00b0031529e86ef3mr2917703ila.2.1676491561211; 
 Wed, 15 Feb 2023 12:06:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05663811cb00b0039df8e7af39sm6161954jas.41.2023.02.15.12.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:06:00 -0800 (PST)
Date: Wed, 15 Feb 2023 15:05:59 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v6 3/3] multifd: Only flush once each full round of memory
Message-ID: <Y+07J9aUmywnQCE6@x1n>
References: <20230215180231.7644-1-quintela@redhat.com>
 <20230215180231.7644-4-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215180231.7644-4-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Feb 15, 2023 at 07:02:31PM +0100, Juan Quintela wrote:
> We need to add a new flag to mean to flush at that point.
> Notice that we still flush at the end of setup and at the end of
> complete stages.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

One nitpick below.

> 
> ---
> 
> Add missing qemu_fflush(), now it passes all tests always.
> ---
>  qapi/migration.json   |  3 ---
>  migration/migration.c |  6 +-----
>  migration/ram.c       | 28 +++++++++++++++++++++++++++-
>  3 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 3afd81174d..34e1657c4e 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -491,9 +491,6 @@
>  #                                    suboptimal (we flush too many
>  #                                    times).
>  #                                    Default value is false.
> -#                                    Setting this capability has no
> -#                                    effect until the patch that
> -#                                    removes this comment.
>  #                                    (since 8.0)
>  #
>  # Features:
> diff --git a/migration/migration.c b/migration/migration.c
> index cfba0da005..74bcc16848 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2706,11 +2706,7 @@ bool migrate_multifd_flush_after_each_section(void)
>  {
>      MigrationState *s = migrate_get_current();
>  
> -    /*
> -     * Until the patch that remove this comment, we always return that
> -     * the capability is enabled.
> -     */
> -    return true || s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION];
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_FLUSH_AFTER_EACH_SECTION];
>  }
>  
>  bool migrate_pause_before_switchover(void)
> diff --git a/migration/ram.c b/migration/ram.c
> index 6191dac9af..bc5eb1640b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -85,6 +85,7 @@
>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>  /* 0x80 is reserved in qemu-file.h for RAM_SAVE_FLAG_HOOK */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> +#define RAM_SAVE_FLAG_MULTIFD_FLUSH    0x200
>  /* We can't use any flag that is bigger than 0x200 */
>  
>  int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
> @@ -1595,6 +1596,7 @@ retry:
>   * associated with the search process.
>   *
>   * Returns:
> + *         <0: An error happened
>   *         PAGE_ALL_CLEAN: no dirty page found, give up
>   *         PAGE_TRY_AGAIN: no dirty page found, retry for next block
>   *         PAGE_DIRTY_FOUND: dirty page found
> @@ -1622,6 +1624,15 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
>          pss->page = 0;
>          pss->block = QLIST_NEXT_RCU(pss->block, next);
>          if (!pss->block) {
> +            if (!migrate_multifd_flush_after_each_section()) {
> +                QEMUFile *f = rs->pss[RAM_CHANNEL_PRECOPY].pss_channel;
> +                int ret = multifd_send_sync_main(f);
> +                if (ret < 0) {
> +                    return ret;
> +                }
> +                qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
> +                qemu_fflush(f);
> +            }
>              /*
>               * If memory migration starts over, we will meet a dirtied page
>               * which may still exists in compression threads's ring, so we
> @@ -2614,6 +2625,9 @@ static int ram_find_and_save_block(RAMState *rs)
>                      break;
>                  } else if (res == PAGE_TRY_AGAIN) {
>                      continue;
> +                } else if (res < 0) {
> +                    pages = res;
> +                    break;
>                  }
>              }
>          }
> @@ -3300,6 +3314,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> +    if (!migrate_multifd_flush_after_each_section()) {
> +        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
> +    }
> +
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
>  
> @@ -3485,6 +3503,9 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> +    if (!migrate_multifd_flush_after_each_section()) {
> +        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
> +    }
>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>      qemu_fflush(f);
>  
> @@ -4169,7 +4190,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
>              }
>              decompress_data_with_multi_threads(f, page_buffer, len);
>              break;
> -
> +        case RAM_SAVE_FLAG_MULTIFD_FLUSH:
> +            multifd_recv_sync_main();
> +            break;
>          case RAM_SAVE_FLAG_EOS:
>              /* normal exit */
>              if (migrate_multifd_flush_after_each_section()) {

We could have dropped RAM_SAVE_FLAG_MULTIFD_FLUSH and RAM_SAVE_FLAG_EOS for
now until we support postcopy+multifd.

Here it's not only about enabling them together, but it's about running
them in parallel, which I doubt whether it can really be implemented at all
due to the fundamentally concepts difference between multifd & postcopy.. :(

> @@ -4443,6 +4466,9 @@ static int ram_load_precopy(QEMUFile *f)
>                  break;
>              }
>              break;
> +        case RAM_SAVE_FLAG_MULTIFD_FLUSH:
> +            multifd_recv_sync_main();
> +            break;
>          case RAM_SAVE_FLAG_EOS:
>              /* normal exit */
>              if (migrate_multifd_flush_after_each_section()) {
> -- 
> 2.39.1
> 
> 

-- 
Peter Xu


