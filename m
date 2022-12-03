Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7438564152D
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 10:14:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1ObV-00028O-4L; Sat, 03 Dec 2022 04:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p1ObS-00024y-1l
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:14:34 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p1ObP-0004mq-8h
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 04:14:33 -0500
HMM_SOURCE_IP: 172.18.0.218:45228.1959027951
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.82 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id E293F2800B8;
 Sat,  3 Dec 2022 17:14:09 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([125.69.43.82])
 by app0025 with ESMTP id c35ac044745c41428bd4b7438b64e4e3 for
 qemu-devel@nongnu.org; Sat, 03 Dec 2022 17:14:21 CST
X-Transaction-ID: c35ac044745c41428bd4b7438b64e4e3
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.43.82
X-MEDUSA-Status: 0
Message-ID: <4578db86-2959-9bae-c28e-da7af162be71@chinatelecom.cn>
Date: Sat, 3 Dec 2022 17:14:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 08/11] migration: Export dirty-limit time info
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <513421b79099d7f73b3db227b5eb347fe9a3c241.1669047366.git.huangy81@chinatelecom.cn>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <513421b79099d7f73b3db227b5eb347fe9a3c241.1669047366.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.258,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



在 2022/11/22 0:26, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Export dirty limit throttle time and estimated ring full
> time, through which we can observe the process of dirty
> limit during live migration.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   include/sysemu/dirtylimit.h |  2 ++
>   migration/migration.c       | 10 ++++++++++
>   monitor/hmp-cmds.c          | 10 ++++++++++
>   qapi/migration.json         | 10 +++++++++-
>   softmmu/dirtylimit.c        | 31 +++++++++++++++++++++++++++++++
>   5 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
> index 8d2c1f3..98cc4a6 100644
> --- a/include/sysemu/dirtylimit.h
> +++ b/include/sysemu/dirtylimit.h
> @@ -34,4 +34,6 @@ void dirtylimit_set_vcpu(int cpu_index,
>   void dirtylimit_set_all(uint64_t quota,
>                           bool enable);
>   void dirtylimit_vcpu_execute(CPUState *cpu);
> +int64_t dirtylimit_throttle_us_per_full(void);
> +int64_t dirtylimit_us_ring_full(void);
>   #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index 096b61a..886c25d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -62,6 +62,7 @@
>   #include "yank_functions.h"
>   #include "sysemu/qtest.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/dirtylimit.h"
>   
>   #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>   
> @@ -1112,6 +1113,15 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>           info->ram->remaining = ram_bytes_remaining();
>           info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
>       }
> +
> +    if (migrate_dirty_limit() && dirtylimit_in_service()) {
> +        info->has_dirty_limit_throttle_us_per_full = true;
> +        info->dirty_limit_throttle_us_per_full =
> +                            dirtylimit_throttle_us_per_full();
> +
> +        info->has_dirty_limit_us_ring_full = true;
> +        info->dirty_limit_us_ring_full = dirtylimit_us_ring_full();
> +    }
>   }
>   
>   static void populate_disk_info(MigrationInfo *info)
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 9ad6ee5..9d02baf 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -339,6 +339,16 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>                          info->cpu_throttle_percentage);
>       }
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
>       if (info->has_postcopy_blocktime) {
>           monitor_printf(mon, "postcopy blocktime: %u\n",
>                          info->postcopy_blocktime);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index af6b2da..62db5cb 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -242,6 +242,12 @@
>   #                   Present and non-empty when migration is blocked.
>   #                   (since 6.0)
>   #
> +# @dirty-limit-throttle-us-per-full: Throttle time (us) during the period of
> +#                                    dirty ring full (since 7.1)
> +# > +# @dirty-limit-us-ring-full: Estimated periodic time (us) of dirty 
ring full.
> +#                            (since 7.1)
How about the following documents:

# @dirty-limit-throttletime-each-round: Max throttle time (us) of all 
virtual CPUs each dirty ring
#                                       full round, used to observe if 
dirty-limit take effect
#                                       during live migration. (since 7.3)
#
# @dirty-limit-ring-full-time: Estimated average dirty ring full time 
(us) each round, note that
#                              the value equals dirty ring memory size 
divided by average dirty
#                              page rate of virtual CPU, which can be 
used to observe the average
#                              memory load of virtual CPU indirectly. 
(since 7.3)

Is it more easy-understanding ?
> +#
>   # Since: 0.14
>   ##
>   { 'struct': 'MigrationInfo',
> @@ -259,7 +265,9 @@
>              '*postcopy-blocktime' : 'uint32',
>              '*postcopy-vcpu-blocktime': ['uint32'],
>              '*compression': 'CompressionStats',
> -           '*socket-address': ['SocketAddress'] } }
> +           '*socket-address': ['SocketAddress'],
> +           '*dirty-limit-throttle-us-per-full': 'int64',
> +           '*dirty-limit-us-ring-full': 'int64'} }
>  >   ##
>   # @query-migrate:
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 3f3c405..9d1df9b 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -573,6 +573,37 @@ static struct DirtyLimitInfo *dirtylimit_query_vcpu(int cpu_index)
>       return info;
>   }
>   
> +/* Pick up first vcpu throttle time by default */
> +int64_t dirtylimit_throttle_us_per_full(void)
> +{
> +    CPUState *cpu = first_cpu;
> +    return cpu->throttle_us_per_full;
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
>   static struct DirtyLimitInfoList *dirtylimit_query_all(void)
>   {
>       int i, index;

