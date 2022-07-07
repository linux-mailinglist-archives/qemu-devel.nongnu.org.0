Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54B56AA21
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 19:58:20 +0200 (CEST)
Received: from localhost ([::1]:47800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Vlb-0003vq-GY
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 13:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Vhx-0001UC-2T
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 13:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Vho-0002ZB-52
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 13:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657216462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QrHyDeT03XM4kr5sXZUNu8zcZ+TXTnLRHf9lh0TpMJI=;
 b=fUIbyoX5p7MvSxAIsS/6tKKD6eqB+z0Evd2kN7muN0ol5exKLFHipfjdGHjP2BaBHUgEY3
 fLVBpIh/XDCd9qllGjxQqJ+BjyyDz9JOMzMV0XJKRGvYxxy74UIuTo46KXeokD6VHCUP3x
 Zlvt2+CRAXz45Yl1MLLEdhswWg0JVNg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-SWrY1HAUPFKG8sFsnO2qbQ-1; Thu, 07 Jul 2022 13:54:21 -0400
X-MC-Unique: SWrY1HAUPFKG8sFsnO2qbQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 cr13-20020a05622a428d00b0031d3463f241so15964777qtb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 10:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QrHyDeT03XM4kr5sXZUNu8zcZ+TXTnLRHf9lh0TpMJI=;
 b=rZ8mLD5m+zx/22yZEG+R/GHdBMvWRz6iR0Wpq38KEhf3IQiZRxO2I25nwaCh/RbbBB
 0hcHnAgQPnVXVu5Ds6vA3LcHjqom7pTvW/AmJh5sQygfPF9HbdKHN7holEDTUT55B+hW
 x8lccH2164ShzlIyeMemnJPGFGAAEzXIy2g2oVl+i7fvcj/2iAAXUa+//LinY8GleMFK
 Gb8xPo0se19Lbrxo1IfgNbS2nEt2Ue+67ztgfVEVE+beqqsycgRdW4PrXDicvklpPQLC
 +LK4poBWYDG+zIRw9MVzpb4sFKvsWUCqHRDoDwc3KEJgjQosqT6BcMunVUlC7Ws9mCEg
 KBqA==
X-Gm-Message-State: AJIora8y7/Tlg++rmBgn09onxRFoyJINjIdbTvPsMmj1Q69/Ni8DyfsB
 tsSN48IgmHgkqe0KdGRDe9IDkXWgG6A0fOflexUSZvZPkG1LEvAACQmDmjfl+7Z2S49HfZaW3DT
 5k2fzSUJchk0OUgg=
X-Received: by 2002:a05:622a:1114:b0:31a:b237:c1ec with SMTP id
 e20-20020a05622a111400b0031ab237c1ecmr38952792qty.141.1657216460935; 
 Thu, 07 Jul 2022 10:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vC1W3Jil593vmNeIwQVLGzrnrWSMqp4Wi8upy0UeSCCAqzAg6qoEEGxzX3dlgjVqWC+RY6wQ==
X-Received: by 2002:a05:622a:1114:b0:31a:b237:c1ec with SMTP id
 e20-20020a05622a111400b0031ab237c1ecmr38952774qty.141.1657216460706; 
 Thu, 07 Jul 2022 10:54:20 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a254a00b006a6d74f8fc9sm35496538qko.127.2022.07.07.10.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 10:54:20 -0700 (PDT)
Date: Thu, 7 Jul 2022 13:54:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/3] Add dirty-sync-missed-zero-copy migration stat
Message-ID: <Yscdy/YZZ6H1Qpr3@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704202315.507145-3-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 04, 2022 at 05:23:14PM -0300, Leonardo Bras wrote:
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  qapi/migration.json   | 7 ++++++-
>  migration/migration.c | 2 ++
>  monitor/hmp-cmds.c    | 4 ++++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 7102e474a6..fed08b9b88 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -55,6 +55,10 @@
>  # @postcopy-bytes: The number of bytes sent during the post-copy phase
>  #                  (since 7.0).
>  #
> +# @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
> +#                               not avoid copying zero pages.  This is between 0

Avoid copying zero pages?  Isn't this for counting MSG_ZEROCOPY fallbacks?

> +#                               and @dirty-sync-count * @multifd-channels.

I'd not name it as "dirty-sync-*" because fundamentally the accounting is
not doing like that (more in latter patch).  I also think we should squash
patch 2/3 as patch 3 only started to provide meaningful values.

> +#                               (since 7.1)
>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationStats',
> @@ -65,7 +69,8 @@
>             'postcopy-requests' : 'int', 'page-size' : 'int',
>             'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
>             'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
> -           'postcopy-bytes' : 'uint64' } }
> +           'postcopy-bytes' : 'uint64',
> +           'dirty-sync-missed-zero-copy' : 'uint64' } }
>  
>  ##
>  # @XBZRLECacheStats:
> diff --git a/migration/migration.c b/migration/migration.c
> index 78f5057373..048f7f8bdb 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1027,6 +1027,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>      info->ram->normal_bytes = ram_counters.normal * page_size;
>      info->ram->mbps = s->mbps;
>      info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
> +    info->ram->dirty_sync_missed_zero_copy =
> +            ram_counters.dirty_sync_missed_zero_copy;
>      info->ram->postcopy_requests = ram_counters.postcopy_requests;
>      info->ram->page_size = page_size;
>      info->ram->multifd_bytes = ram_counters.multifd_bytes;
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index ca98df0495..5f3be9e405 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -307,6 +307,10 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>              monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
>                             info->ram->postcopy_bytes >> 10);
>          }
> +        if (info->ram->dirty_sync_missed_zero_copy) {
> +            monitor_printf(mon, "missed zero-copy on: %" PRIu64 " iterations\n",
> +                           info->ram->dirty_sync_missed_zero_copy);

I suggest we don't call it "iterations" because it's not the generic mean
of iterations.

> +        }
>      }
>  
>      if (info->has_disk) {
> -- 
> 2.36.1
> 

-- 
Peter Xu


