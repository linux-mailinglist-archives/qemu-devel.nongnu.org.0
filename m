Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DAA3A010A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 20:53:14 +0200 (CEST)
Received: from localhost ([::1]:56534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqgqf-0000Nx-A7
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 14:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqgoK-0007Kk-Ho
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqgo6-0001QF-Qc
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623178232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+dB2+wcY7+40HkEAaoEBJ8cvRZtlQbbU/BN0EgWJ9c0=;
 b=YDbzAGTCPSALvwjcDeoNZ/dgTg2Xb6lsfvZfX8rYNVuHYNmcnXYcCrkw19nToRKfsKoGXT
 pGAtpOUHx3Yv2bSyAXfaBJ7CRd+usvQi3eGSMYQ4/+cEhtS9ZIB48xBpxMewCqb5t1f+pK
 z/YSJUlx65LSQcsINgWSaJPqVjOoNsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-ftRmcSF8OuaCmkPWgeqYEw-1; Tue, 08 Jun 2021 14:50:31 -0400
X-MC-Unique: ftRmcSF8OuaCmkPWgeqYEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C1D691286;
 Tue,  8 Jun 2021 18:50:30 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C883D5D6D3;
 Tue,  8 Jun 2021 18:49:58 +0000 (UTC)
Date: Tue, 8 Jun 2021 19:49:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Message-ID: <YL+71C9cteDVYJum@work-vm>
References: <20210601005708.189888-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601005708.189888-1-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> These two commands are missing when adding the QMP sister commands.  Add them,
> so developers can play with them easier.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> Cc: Chuan Zheng <zhengchuan@huawei.com>
> Cc: huangy81@chinatelecom.cn
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> PS: I really doubt whether this is working as expected... I ran one 200MB/s
> workload inside, what I measured is 20MB/s with current algorithm...  Sampling
> 512 pages out of 1G mem is not wise enough I guess, especially that assumes
> dirty workload is spread across the memories while it's normally not the case..

What size of address space did you dirty - was it 20MB?

Dave

> ---
>  hmp-commands-info.hx  | 13 +++++++++++++
>  hmp-commands.hx       | 14 ++++++++++++++
>  include/monitor/hmp.h |  2 ++
>  migration/dirtyrate.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 72 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ab0c7aa5eea..f8a9141dd8a 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -880,3 +880,16 @@ SRST
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
> index 2d21fe5ad42..4c27fb91f7d 100644
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
>  void hmp_replay_break(Monitor *mon, const QDict *qdict);
>  void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
>  void hmp_replay_seek(Monitor *mon, const QDict *qdict);
> +void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
> +void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>  
>  #endif
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ccb98147e89..382287d2912 100644
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
> @@ -424,3 +427,43 @@ struct DirtyRateInfo *qmp_query_dirty_rate(Error **errp)
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
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


