Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7639751F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:10:12 +0200 (CEST)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo55u-00043h-PD
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lo54l-00035V-RT
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:09:00 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:57119
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lo54i-0001OW-SL
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:08:59 -0400
HMM_SOURCE_IP: 172.18.0.218:58848.483291610
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.243?logid-25e204b045d7497088adee60ab797ca3
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 5F016280029;
 Tue,  1 Jun 2021 22:08:46 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 25e204b045d7497088adee60ab797ca3 for
 zhengchuan@huawei.com; Tue Jun  1 22:08:45 2021
X-Transaction-ID: 25e204b045d7497088adee60ab797ca3
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210601005708.189888-1-peterx@redhat.com>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <024ee4df-07a5-a31d-7b97-31d36dfa3ce6@chinatelecom.cn>
Date: Tue, 1 Jun 2021 22:08:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210601005708.189888-1-peterx@redhat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.613, SPF_HELO_PASS=-0.001,
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
Cc: Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



ÔÚ 2021/6/1 8:57, Peter Xu Ð´µÀ:
> These two commands are missing when adding the QMP sister commands.  Add them,
> so developers can play with them easier.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> Cc: Chuan Zheng <zhengchuan@huawei.com>
> Cc: huangy81@chinatelecom.cn
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
> PS: I really doubt whether this is working as expected... I ran one 200MB/s
> workload inside, what I measured is 20MB/s with current algorithm...  Sampling
> 512 pages out of 1G mem is not wise enough I guess, especially that assumes
> dirty workload is spread across the memories while it's normally not the case..
I doubt whether the sampling can cope with the situation that the guest 
dirty memory too fast so that the sampling within a given time can not 
finish, this may happens when vm is in large scale.
> ---
>   hmp-commands-info.hx  | 13 +++++++++++++
>   hmp-commands.hx       | 14 ++++++++++++++
>   include/monitor/hmp.h |  2 ++
>   migration/dirtyrate.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 72 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ab0c7aa5eea..f8a9141dd8a 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -880,3 +880,16 @@ SRST
>     ``info replay``
>       Display the record/replay information: mode and the current icount.
>   ERST
> +
> +    {
> +        .name       = "dirty_rate",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "show dirty rate information",
> +        .cmd        = hmp_info_dirty_rate,
> +    },
> +
> +SRST
> +  ``info dirty_rate``
> +    Display the vcpu dirty rate information.
> +ERST
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 2d21fe5ad42..4c27fb91f7d 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1727,3 +1727,17 @@ ERST
>           .flags      = "p",
>       },
>   
> +SRST
> +``calc_dirty_rate`` *second*
> +  Start a round of dirty rate measurement with the period specified in *second*.
> +  The result of the dirty rate measurement may be observed with ``info
> +  dirty_rate`` command.
> +ERST
> +
> +    {
> +        .name       = "calc_dirty_rate",
> +        .args_type  = "second:l",
> +        .params     = "second",
> +        .help       = "start a round of guest dirty rate measurement",
> +        .cmd        = hmp_calc_dirty_rate,
> +    },
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 605d57287ae..3baa1058e2c 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -129,5 +129,7 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
>   void hmp_replay_break(Monitor *mon, const QDict *qdict);
>   void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
>   void hmp_replay_seek(Monitor *mon, const QDict *qdict);
> +void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
> +void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>   
>   #endif
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ccb98147e89..382287d2912 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -20,6 +20,9 @@
>   #include "ram.h"
>   #include "trace.h"
>   #include "dirtyrate.h"
> +#include "monitor/hmp.h"
> +#include "monitor/monitor.h"
> +#include "qapi/qmp/qdict.h"
>   
>   static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
>   static struct DirtyRateStat DirtyStat;
> @@ -424,3 +427,43 @@ struct DirtyRateInfo *qmp_query_dirty_rate(Error **errp)
>   {
>       return query_dirty_rate_info();
>   }
> +
> +void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
> +{
> +    DirtyRateInfo *info = query_dirty_rate_info();
> +
> +    monitor_printf(mon, "Status: %s\n",
> +                   DirtyRateStatus_str(info->status));
> +    monitor_printf(mon, "Start Time: %"PRIi64" (ms)\n",
> +                   info->start_time);
> +    monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
> +                   info->calc_time);
> +    monitor_printf(mon, "Dirty rate: ");
> +    if (info->has_dirty_rate) {
> +        monitor_printf(mon, "%"PRIi64" (MB/s)\n", info->dirty_rate);
> +    } else {
> +        monitor_printf(mon, "(not ready)\n");
> +    }
> +    g_free(info);
> +}
> +
> +void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict)
> +{
> +    int64_t sec = qdict_get_try_int(qdict, "second", 0);
> +    Error *err = NULL;
> +
> +    if (!sec) {
> +        monitor_printf(mon, "Incorrect period length specified!\n");
> +        return;
> +    }
> +
> +    qmp_calc_dirty_rate(sec, &err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +
> +    monitor_printf(mon, "Starting dirty rate measurement with period %"PRIi64
> +                   " seconds\n", sec);
> +    monitor_printf(mon, "[Please use 'info dirty_rate' to check results]\n");
> +}
> 

