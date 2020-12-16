Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7E52DC748
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:38:24 +0100 (CET)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpccu-0002ST-N7
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpcbf-0001pG-AX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:37:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpcbc-0002WY-GZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608147418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BvnPjVahdczQG1K6CI8Q29b8eDmBI0fWUaQdN87RdME=;
 b=KIo98dIom88u6gcFNDejriCNhrLLC/M1wL78Blk4iA5Mn/3CPKDq63E7hRzbnqYtYLgr+K
 iDWlCVgOudClY2RvOUEnCW9lu5DkOpYCBvg4bhwFjJUYjXwNlVent7bWNC8/baONQGx5aN
 9cGR1UVvvdCq+IC+gMjLAUdtoiqYdhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-K8HhBDo_OC6MkpRF3P-_kQ-1; Wed, 16 Dec 2020 14:36:54 -0500
X-MC-Unique: K8HhBDo_OC6MkpRF3P-_kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E3359;
 Wed, 16 Dec 2020 19:36:53 +0000 (UTC)
Received: from work-vm (ovpn-115-143.ams2.redhat.com [10.36.115.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1341803E;
 Wed, 16 Dec 2020 19:36:52 +0000 (UTC)
Date: Wed, 16 Dec 2020 19:36:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/20] monitor: Use GString instead of QString for output
 buffer
Message-ID: <20201216193650.GF3008@work-vm>
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201211171152.146877-3-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> GString has a richer set of string operations than QString.  It should
> be preferred to QString except where we need a QObject or reference
> counting.  We don't here.  Switch to GString, and put its richer
> interface to use.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  monitor/monitor-internal.h |  2 +-
>  monitor/misc.c             |  2 +-
>  monitor/monitor.c          | 20 ++++++++------------
>  3 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index a6131554da..40903d6386 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -105,7 +105,7 @@ struct Monitor {
>       * Members that are protected by the per-monitor lock
>       */
>      QLIST_HEAD(, mon_fd_t) fds;
> -    QString *outbuf;
> +    GString *outbuf;
>      guint out_watch;
>      /* Read under either BQL or mon_lock, written with BQL+mon_lock.  */
>      int mux_out;
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6c3e8506a9..814d22de11 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -136,7 +136,7 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
>      handle_hmp_command(&hmp, command_line);
>  
>      WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
> -        output = g_strdup(qstring_get_str(hmp.common.outbuf));
> +        output = g_strdup(hmp.common.outbuf->str);
>      }
>  
>  out:
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 84222cd130..1e4a6b3f20 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -29,7 +29,6 @@
>  #include "qapi/qapi-emit-events.h"
>  #include "qapi/qapi-visit-control.h"
>  #include "qapi/qmp/qdict.h"
> -#include "qapi/qmp/qstring.h"
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "sysemu/qtest.h"
> @@ -181,22 +180,19 @@ static void monitor_flush_locked(Monitor *mon)
>          return;
>      }
>  
> -    buf = qstring_get_str(mon->outbuf);
> -    len = qstring_get_length(mon->outbuf);
> +    buf = mon->outbuf->str;
> +    len = mon->outbuf->len;
>  
>      if (len && !mon->mux_out) {
>          rc = qemu_chr_fe_write(&mon->chr, (const uint8_t *) buf, len);
>          if ((rc < 0 && errno != EAGAIN) || (rc == len)) {
>              /* all flushed or error */
> -            qobject_unref(mon->outbuf);
> -            mon->outbuf = qstring_new();
> +            g_string_truncate(mon->outbuf, 0);
>              return;
>          }
>          if (rc > 0) {
>              /* partial write */
> -            QString *tmp = qstring_from_str(buf + rc);
> -            qobject_unref(mon->outbuf);
> -            mon->outbuf = tmp;
> +            g_string_erase(mon->outbuf, 0, rc);
>          }
>          if (mon->out_watch == 0) {
>              mon->out_watch =
> @@ -223,9 +219,9 @@ int monitor_puts(Monitor *mon, const char *str)
>      for (i = 0; str[i]; i++) {
>          c = str[i];
>          if (c == '\n') {
> -            qstring_append_chr(mon->outbuf, '\r');
> +            g_string_append_c(mon->outbuf, '\r');
>          }
> -        qstring_append_chr(mon->outbuf, c);
> +        g_string_append_c(mon->outbuf, c);
>          if (c == '\n') {
>              monitor_flush_locked(mon);
>          }
> @@ -602,7 +598,7 @@ void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
>      }
>      qemu_mutex_init(&mon->mon_lock);
>      mon->is_qmp = is_qmp;
> -    mon->outbuf = qstring_new();
> +    mon->outbuf = g_string_new(NULL);
>      mon->skip_flush = skip_flush;
>      mon->use_io_thread = use_io_thread;
>  }
> @@ -616,7 +612,7 @@ void monitor_data_destroy(Monitor *mon)
>      } else {
>          readline_free(container_of(mon, MonitorHMP, common)->rs);
>      }
> -    qobject_unref(mon->outbuf);
> +    g_string_free(mon->outbuf, true);
>      qemu_mutex_destroy(&mon->mon_lock);
>  }
>  
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


