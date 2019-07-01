Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57C4275A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 15:21:34 +0200 (CEST)
Received: from localhost ([::1]:60394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb3C2-0008W0-5D
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 09:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34711)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hb38e-0006cr-AM
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 09:18:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hb38c-0007Mm-Ty
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 09:18:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hb38Z-0007AE-MX; Wed, 12 Jun 2019 09:17:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7C4313AA9;
 Wed, 12 Jun 2019 13:17:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50C627943D;
 Wed, 12 Jun 2019 13:17:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E78411138648; Wed, 12 Jun 2019 15:17:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190611134043.9524-1-kwolf@redhat.com>
 <20190611134043.9524-11-kwolf@redhat.com>
Date: Wed, 12 Jun 2019 15:17:48 +0200
In-Reply-To: <20190611134043.9524-11-kwolf@redhat.com> (Kevin Wolf's message
 of "Tue, 11 Jun 2019 15:40:42 +0200")
Message-ID: <87wohrx7r7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 12 Jun 2019 13:17:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 10/11] monitor: Split out monitor/hmp.c
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
Cc: dgilbert@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Move HMP infrastructure from monitor/misc.c to monitor/hmp.c. This is
> code that can be shared for all targets, so compile it only once.
>
> The amount of function and particularly extern variables in
> monitor_int.h is probably a bit larger than it needs to be, but this way
> no non-trivial code modifications are needed. The interfaces between HMP
> and the monitor core can be cleaned up later.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  include/monitor/monitor.h |    1 +
>  monitor/monitor_int.h     |   31 +
>  monitor/hmp.c             | 1387 +++++++++++++++++++++++++++++++++++++
>  monitor/misc.c            | 1338 +----------------------------------
>  monitor/Makefile.objs     |    2 +-
>  monitor/trace-events      |    4 +-
>  6 files changed, 1429 insertions(+), 1334 deletions(-)
>  create mode 100644 monitor/hmp.c
>
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 7bbab05320..8547529e49 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -22,6 +22,7 @@ bool monitor_cur_is_qmp(void);
>  void monitor_init_globals(void);
>  void monitor_init(Chardev *chr, int flags);
>  void monitor_init_qmp(Chardev *chr, int flags);
> +void monitor_init_hmp(Chardev *chr, int flags);
>  void monitor_cleanup(void);
>  
>  int monitor_suspend(Monitor *mon);
> diff --git a/monitor/monitor_int.h b/monitor/monitor_int.h
> index 4aabee54e1..88eaed9c5c 100644
> --- a/monitor/monitor_int.h
> +++ b/monitor/monitor_int.h
> @@ -27,6 +27,7 @@
>  
>  #include "qemu-common.h"
>  #include "monitor/monitor.h"
> +#include "qemu/cutils.h"
>  
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/json-parser.h"
> @@ -154,6 +155,29 @@ static inline bool monitor_is_qmp(const Monitor *mon)
>      return (mon->flags & MONITOR_USE_CONTROL);
>  }
>  
> +/**
> + * Is @name in the '|' separated list of names @list?
> + */
> +static inline int compare_cmd(const char *name, const char *list)
> +{
> +    const char *p, *pstart;
> +    int len;
> +    len = strlen(name);
> +    p = list;
> +    for (;;) {
> +        pstart = p;
> +        p = qemu_strchrnul(p, '|');
> +        if ((p - pstart) == len && !memcmp(pstart, name, len)) {
> +            return 1;
> +        }
> +        if (*p == '\0') {
> +            break;
> +        }
> +        p++;
> +    }
> +    return 0;
> +}
> +

What's the justification for inline?

>  typedef QTAILQ_HEAD(MonitorList, Monitor) MonitorList;
>  extern IOThread *mon_iothread;
>  extern QEMUBH *qmp_dispatcher_bh;
> @@ -162,6 +186,8 @@ extern QemuMutex monitor_lock;
>  extern MonitorList mon_list;
>  extern int mon_refcount;
>  
> +extern mon_cmd_t mon_cmds[];
> +

Any particular reason for not moving this one to hmp.c, along with
info_cmds?  Question, not demand :)

>  int monitor_puts(Monitor *mon, const char *str);
>  void monitor_data_init(Monitor *mon, int flags, bool skip_flush,
>                         bool use_io_thread);
> @@ -173,4 +199,9 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp);
>  void monitor_data_destroy_qmp(MonitorQMP *mon);
>  void monitor_qmp_bh_dispatcher(void *data);
>  
> +void monitor_data_init_hmp(MonitorHMP *mon, int flags, bool skip_flush);
> +int get_monitor_def(int64_t *pval, const char *name);
> +void help_cmd(Monitor *mon, const char *name);
> +void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
> +
>  #endif
[...]

