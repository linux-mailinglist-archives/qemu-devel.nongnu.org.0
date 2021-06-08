Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076A43A0138
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:08:03 +0200 (CEST)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqh4z-0003wr-GR
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqh3O-00026o-Pr
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqh3L-0007DE-SF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623179179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d6mX0IlNirhGdM6YjvR1HNHyYj23Z0A67dAxjIq9GsM=;
 b=YJA3eJ+qlmcD5OzgF2Rhy4Gzj8PwjRQe/N+/lyM5W/iQYe+mZnDFF8roBYosFT3Jbn4bmm
 HCABHfG8gCpeQCQP4ti4RVV/WphfVljuX6KxnJe4wdn8ibKdOq3DeAIAXVmF3y++FfM85M
 C6DVhsowuNKiCSSS60I+i/3dmiDbUwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-wl2N2kcBO4afxUW2nyNQCg-1; Tue, 08 Jun 2021 15:06:16 -0400
X-MC-Unique: wl2N2kcBO4afxUW2nyNQCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 289E28015C6;
 Tue,  8 Jun 2021 19:06:15 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9279B19EF2;
 Tue,  8 Jun 2021 19:06:05 +0000 (UTC)
Date: Tue, 8 Jun 2021 20:06:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 2/7] hmp: Add "calc_dirty_rate" and "info dirty_rate"
 cmds
Message-ID: <YL+/muMQjZxSFKv9@work-vm>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <4cc0039fc3ad6145136770cf3b0f056c09a2910b.1623027729.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <4cc0039fc3ad6145136770cf3b0f056c09a2910b.1623027729.git.huangy81@chinatelecom.cn>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> These two commands are missing when adding the QMP sister commands.
> Add them, so developers can play with them easier.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

I've queued 1 and 2 (with a line wrap on 1);  we can take the
rest after Peter is happy with the other stuff.

Dave

> ---
>  hmp-commands-info.hx  | 13 ++++++++++++
>  hmp-commands.hx       | 14 +++++++++++++
>  include/monitor/hmp.h |  2 ++
>  migration/dirtyrate.c | 47 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 76 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index b2347a6aea..fb59c27200 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -867,3 +867,16 @@ SRST
>    ``info replay``
>      Display the record/replay information: mode and the current icount.
>  ERST
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
> index 2d21fe5ad4..84dcc3aae6 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1727,3 +1727,17 @@ ERST
>          .flags      = "p",
>      },
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
> +        .args_type  = "second:l,sample_pages_per_GB:l?",
> +        .params     = "second [sample_pages_per_GB]",
> +        .help       = "start a round of guest dirty rate measurement",
> +        .cmd        = hmp_calc_dirty_rate,
> +    },
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 605d57287a..3baa1058e2 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -129,5 +129,7 @@ void hmp_info_replay(Monitor *mon, const QDict *qdict);
>  void hmp_replay_break(Monitor *mon, const QDict *qdict);
>  void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
>  void hmp_replay_seek(Monitor *mon, const QDict *qdict);
> +void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
> +void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>  
>  #endif
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 2ee3890721..320c56ba2c 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -20,6 +20,9 @@
>  #include "ram.h"
>  #include "trace.h"
>  #include "dirtyrate.h"
> +#include "monitor/hmp.h"
> +#include "monitor/monitor.h"
> +#include "qapi/qmp/qdict.h"
>  
>  static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
>  static struct DirtyRateStat DirtyStat;
> @@ -447,3 +450,47 @@ struct DirtyRateInfo *qmp_query_dirty_rate(Error **errp)
>  {
>      return query_dirty_rate_info();
>  }
> +
> +void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
> +{
> +    DirtyRateInfo *info = query_dirty_rate_info();
> +
> +    monitor_printf(mon, "Status: %s\n",
> +                   DirtyRateStatus_str(info->status));
> +    monitor_printf(mon, "Start Time: %"PRIi64" (ms)\n",
> +                   info->start_time);
> +    monitor_printf(mon, "Sample Pages: %"PRIu64" (per GB)\n",
> +                   info->sample_pages);
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
> +    int64_t sample_pages = qdict_get_try_int(qdict, "sample_pages_per_GB", -1);
> +    bool has_sample_pages = (sample_pages != -1);
> +    Error *err = NULL;
> +
> +    if (!sec) {
> +        monitor_printf(mon, "Incorrect period length specified!\n");
> +        return;
> +    }
> +
> +    qmp_calc_dirty_rate(sec, has_sample_pages, sample_pages, &err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +
> +    monitor_printf(mon, "Starting dirty rate measurement with period %"PRIi64
> +                   " seconds\n", sec);
> +    monitor_printf(mon, "[Please use 'info dirty_rate' to check results]\n");
> +}
> -- 
> 2.18.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


