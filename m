Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD963CC51
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 01:11:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0AfZ-0001Kk-B6; Tue, 29 Nov 2022 19:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0AfW-0001KF-Lu
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p0AfU-0005cq-Tj
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 19:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669766979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBedEZSKAusL/MhBLyr1jVcmssp3iMRj3C5v54cf8SQ=;
 b=NRFbfCifOPcD++WSD9bIfXG93GWLO1vQ/lQAfdmueBuorohluhdP+DOOsktfsmWLAK6+WJ
 eO4jqD4MxCHQC3CNFgLZw1nGhFTh2MtY4qm2Wv4bQ7tRqPfJ7LD7nhY098evI5NOU2Wnkc
 zl81GxS428gD98J9O3CbWGSWrm+4DOU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-JYjTdz1YOESbgdo9dg06HA-1; Tue, 29 Nov 2022 19:09:38 -0500
X-MC-Unique: JYjTdz1YOESbgdo9dg06HA-1
Received: by mail-qt1-f200.google.com with SMTP id
 ew11-20020a05622a514b00b003a524196d31so24301870qtb.2
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 16:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wBedEZSKAusL/MhBLyr1jVcmssp3iMRj3C5v54cf8SQ=;
 b=M7u+gjheGaAvj7MiPj/9EgSlNEROziLwI1JZIuAD3b9ESb03ksWzBASNpF0VfZRkak
 mVsud6/FgRqTif15Tns0ZwJ38viUsay9gHYZqjRqcRWiG/fuJaM0cqIyIFsu7F04md8P
 QXdkvAb6ZgL0KEgESKR2p7gXtrbcbIg3c4XcDRAkjkZD8N7kY328MNO5VHkGsngK7i0u
 4fGY08pxje8x+qqcXo2upEqdbu6PuW5ScdWyvp/Rd1rGwMuFLE/BSDWtOrxy2JKGBhwU
 eaRJITePOyAYCV/j6S97KskPGGcOq9Qjz3JUuT6GUaiHPyFsW4noQ405XvIACt+b/btq
 IEKQ==
X-Gm-Message-State: ANoB5pnwAucaYbbqPet/C8B1pntkxNycGZxG3pMX7hPWV78o6Dv3fybi
 mOSntuLd1F778Nxp/rqf4gdg5vrpZHoIjXdi5TTqP9qwEa0Q0iJyOHpSfCEoehfbpk/1+11Q5Nd
 Jos4P2UJSe7D/jQI=
X-Received: by 2002:a05:6214:11a6:b0:4bb:9163:8406 with SMTP id
 u6-20020a05621411a600b004bb91638406mr42205039qvv.58.1669766977483; 
 Tue, 29 Nov 2022 16:09:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4xTpx39Sax0EvAgnBmsVqgz4XPDluA1oO1W8L0PShvnl8jiq2VJxdmkI1/X+4LnGFUfkqJHw==
X-Received: by 2002:a05:6214:11a6:b0:4bb:9163:8406 with SMTP id
 u6-20020a05621411a600b004bb91638406mr42205012qvv.58.1669766977220; 
 Tue, 29 Nov 2022 16:09:37 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 d13-20020a05620a240d00b006fab68c7e87sm11775409qkn.70.2022.11.29.16.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 16:09:36 -0800 (PST)
Date: Tue, 29 Nov 2022 19:09:35 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 08/11] migration: Export dirty-limit time info
Message-ID: <Y4afPzTAVQhhRwq2@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <513421b79099d7f73b3db227b5eb347fe9a3c241.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <513421b79099d7f73b3db227b5eb347fe9a3c241.1669047366.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Nov 21, 2022 at 11:26:40AM -0500, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Export dirty limit throttle time and estimated ring full
> time, through which we can observe the process of dirty
> limit during live migration.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/sysemu/dirtylimit.h |  2 ++
>  migration/migration.c       | 10 ++++++++++
>  monitor/hmp-cmds.c          | 10 ++++++++++
>  qapi/migration.json         | 10 +++++++++-
>  softmmu/dirtylimit.c        | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
> index 8d2c1f3..98cc4a6 100644
> --- a/include/sysemu/dirtylimit.h
> +++ b/include/sysemu/dirtylimit.h
> @@ -34,4 +34,6 @@ void dirtylimit_set_vcpu(int cpu_index,
>  void dirtylimit_set_all(uint64_t quota,
>                          bool enable);
>  void dirtylimit_vcpu_execute(CPUState *cpu);
> +int64_t dirtylimit_throttle_us_per_full(void);
> +int64_t dirtylimit_us_ring_full(void);
>  #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index 096b61a..886c25d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -62,6 +62,7 @@
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/dirtylimit.h"
>  
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>  
> @@ -1112,6 +1113,15 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>          info->ram->remaining = ram_bytes_remaining();
>          info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
>      }
> +
> +    if (migrate_dirty_limit() && dirtylimit_in_service()) {
> +        info->has_dirty_limit_throttle_us_per_full = true;
> +        info->dirty_limit_throttle_us_per_full =
> +                            dirtylimit_throttle_us_per_full();
> +
> +        info->has_dirty_limit_us_ring_full = true;
> +        info->dirty_limit_us_ring_full = dirtylimit_us_ring_full();
> +    }
>  }
>  
>  static void populate_disk_info(MigrationInfo *info)
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 9ad6ee5..9d02baf 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -339,6 +339,16 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>                         info->cpu_throttle_percentage);
>      }
>  
> +    if (info->has_dirty_limit_throttle_us_per_full) {
> +        monitor_printf(mon, "dirty-limit throttle time: %" PRIi64 " us\n",
> +                       info->dirty_limit_throttle_us_per_full);
> +    }
> +
> +    if (info->has_dirty_limit_us_ring_full) {
> +        monitor_printf(mon, "dirty-limit ring full time: %" PRIi64 " us\n",
> +                       info->dirty_limit_us_ring_full);
> +    }
> +
>      if (info->has_postcopy_blocktime) {
>          monitor_printf(mon, "postcopy blocktime: %u\n",
>                         info->postcopy_blocktime);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index af6b2da..62db5cb 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -242,6 +242,12 @@
>  #                   Present and non-empty when migration is blocked.
>  #                   (since 6.0)
>  #
> +# @dirty-limit-throttle-us-per-full: Throttle time (us) during the period of
> +#                                    dirty ring full (since 7.1)
> +#
> +# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty ring full.
> +#                            (since 7.1)

s/7.1/7.3/

Could you enrich the document for the new fields?  For example, currently
you only report throttle time for vcpu0 on the 1st field, while for the
latter it's an average of all vcpus.  These need to be mentioned.

OTOH, how do you normally use these values?  Maybe that can also be added
into the documents too.

> +#
>  # Since: 0.14
>  ##
>  { 'struct': 'MigrationInfo',
> @@ -259,7 +265,9 @@
>             '*postcopy-blocktime' : 'uint32',
>             '*postcopy-vcpu-blocktime': ['uint32'],
>             '*compression': 'CompressionStats',
> -           '*socket-address': ['SocketAddress'] } }
> +           '*socket-address': ['SocketAddress'],
> +           '*dirty-limit-throttle-us-per-full': 'int64',
> +           '*dirty-limit-us-ring-full': 'int64'} }
>  
>  ##
>  # @query-migrate:
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 3f3c405..9d1df9b 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -573,6 +573,37 @@ static struct DirtyLimitInfo *dirtylimit_query_vcpu(int cpu_index)
>      return info;
>  }
>  
> +/* Pick up first vcpu throttle time by default */
> +int64_t dirtylimit_throttle_us_per_full(void)
> +{
> +    CPUState *cpu = first_cpu;
> +    return cpu->throttle_us_per_full;

Why would vcpu0 be the standard on this sampling?

I'm wondering whether it'll make more sense to collect the MAX() of all
vcpus here, because that'll be the maximum delay for a guest write to be
postponed due to dirtylimit.  It'll provide the admin some information on
the worst impact on guest workloads.

> +}
> +
> +/*
> + * Estimate dirty ring full time under current dirty page rate.
> + * Return -1 if guest doesn't dirty memory.
> + */
> +int64_t dirtylimit_us_ring_full(void)
> +{
> +    CPUState *cpu;
> +    uint64_t curr_rate = 0;
> +    int nvcpus = 0;
> +
> +    CPU_FOREACH(cpu) {
> +        if (cpu->running) {
> +            nvcpus++;
> +            curr_rate += vcpu_dirty_rate_get(cpu->cpu_index);
> +        }
> +    }
> +
> +    if (!curr_rate || !nvcpus) {
> +        return -1;
> +    }
> +
> +    return dirtylimit_dirty_ring_full_time(curr_rate / nvcpus);
> +}
> +
>  static struct DirtyLimitInfoList *dirtylimit_query_all(void)
>  {
>      int i, index;
> -- 
> 1.8.3.1
> 
> 

-- 
Peter Xu


