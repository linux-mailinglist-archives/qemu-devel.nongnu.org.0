Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCC20F173
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 11:21:24 +0200 (CEST)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqCSB-0006Uz-Df
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 05:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqCDW-0006yG-B3
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:06:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47844
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqCDT-0003OK-Pa
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjAOtyt4zK5rWxh8cQ8hhUAu5p4EQ2UGyh8Mp+Pz0Q4=;
 b=VW3sU5jGgvyyRWJpcnCNbt6bYA0XzKuIjGTaxUVczmLPQInOFshWLiAat+/CGTMCQMxiQy
 tVpu98KGFs3KQTzwzz2xKK8Ndy51tzCGV2AwlD2Y/9efEFTyUhLNoeJhV9Q0D2gglUQdJ9
 5lMRRBddXQEdg7GiMasRxEhqRVUj6FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-gjciMEDrMjKdwHQWcZyQuA-1; Tue, 30 Jun 2020 05:06:07 -0400
X-MC-Unique: gjciMEDrMjKdwHQWcZyQuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69F911005512;
 Tue, 30 Jun 2020 09:06:06 +0000 (UTC)
Received: from work-vm (ovpn-113-225.ams2.redhat.com [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4098160BF3;
 Tue, 30 Jun 2020 09:05:58 +0000 (UTC)
Date: Tue, 30 Jun 2020 10:05:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [PATCH v2 2/3] trace: Add support for recorder back-end
Message-ID: <20200630090556.GA2673@work-vm>
References: <20200626162706.3304357-1-dinechin@redhat.com>
 <20200626162706.3304357-3-dinechin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200626162706.3304357-3-dinechin@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 01:11:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Christophe de Dinechin (dinechin@redhat.com) wrote:
> The recorder library provides support for low-cost continuous
> recording of events, which can then be replayed. This makes it
> possible to collect data "after the fact",for example to show the
> events that led to a crash.
> 
> Recorder support in qemu is implemented using the existing tracing
> interface. In addition, it is possible to individually enable
> recorders that are not traces, although this is probably not
> recommended.
> 
> HMP COMMAND:
> The 'recorder' hmp command has been added, which supports two
> sub-commands:
> - recorder dump: Dump the current state of the recorder. You can
                                                          ^^^^^^^^
is that intended?

> - recorder trace: Set traces using the recorder_trace_set() syntax.
>   You can use "recorder trace help" to list all available recorders.
> 
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  configure                             |  5 +++
>  hmp-commands.hx                       | 19 ++++++++--
>  monitor/misc.c                        | 27 ++++++++++++++
>  scripts/tracetool/backend/recorder.py | 51 +++++++++++++++++++++++++++
>  trace/Makefile.objs                   |  2 ++
>  trace/control.c                       |  7 ++++
>  trace/recorder.c                      | 22 ++++++++++++
>  trace/recorder.h                      | 34 ++++++++++++++++++
>  util/module.c                         |  8 +++++
>  9 files changed, 173 insertions(+), 2 deletions(-)
>  create mode 100644 scripts/tracetool/backend/recorder.py
>  create mode 100644 trace/recorder.c
>  create mode 100644 trace/recorder.h
> 
> diff --git a/configure b/configure
> index ae8737d5a2..130630b98f 100755
> --- a/configure
> +++ b/configure
> @@ -7702,6 +7702,11 @@ fi
>  if have_backend "log"; then
>    echo "CONFIG_TRACE_LOG=y" >> $config_host_mak
>  fi
> +if have_backend "recorder"; then
> +  echo "CONFIG_TRACE_RECORDER=y" >> $config_host_mak
> +  # This is a bit brutal, but there is currently a bug in the makefiles
> +  LIBS="$LIBS -lrecorder"
> +fi
>  if have_backend "ust"; then
>    echo "CONFIG_TRACE_UST=y" >> $config_host_mak
>  fi
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 60f395c276..565f518d4b 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -297,6 +297,22 @@ ERST
>          .cmd        = hmp_trace_file,
>      },
>  
> +SRST
> +``trace-file on|off|flush``
> +  Open, close, or flush the trace file.  If no argument is given, the
> +  status of the trace file is displayed.
> +ERST
> +#endif
> +
> +#if defined(CONFIG_TRACE_RECORDER)
> +    {
> +        .name       = "recorder",
> +        .args_type  = "op:s?,arg:F?",

Having 'arg' as a filename is a bit odd; using op/arg is very generic
for adding extra commands; but it suddenly becomes less generic if
arg is always a filename.

> +        .params     = "trace|dump [arg]",
> +        .help       = "trace selected recorders or print recorder dump",
> +        .cmd        = hmp_recorder,
> +    },
> +
>  SRST
>  ``trace-file on|off|flush``
>    Open, close, or flush the trace file.  If no argument is given, the

I think this SRST chunk is the one that needs updating for recorder.
(The diff has made a bit of a mess, but I think you've copy pasted the
trace-file chunk, but forgotten to update the SRST section).

> @@ -1120,7 +1136,7 @@ ERST
>  
>  SRST
>  ``dump-guest-memory [-p]`` *filename* *begin* *length*
> -  \ 
> +  \
>  ``dump-guest-memory [-z|-l|-s|-w]`` *filename*
>    Dump guest memory to *protocol*. The file can be processed with crash or
>    gdb. Without ``-z|-l|-s|-w``, the dump format is ELF.
> @@ -1828,4 +1844,3 @@ ERST
>          .sub_table  = hmp_info_cmds,
>          .flags      = "p",
>      },
> -
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 89bb970b00..0094b1860f 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -61,6 +61,9 @@
>  #ifdef CONFIG_TRACE_SIMPLE
>  #include "trace/simple.h"
>  #endif
> +#ifdef CONFIG_TRACE_RECORDER
> +#include "trace/recorder.h"
> +#endif
>  #include "exec/memory.h"
>  #include "exec/exec-all.h"
>  #include "qemu/option.h"
> @@ -227,6 +230,30 @@ static void hmp_trace_file(Monitor *mon, const QDict *qdict)
>  }
>  #endif
>  
> +#ifdef CONFIG_TRACE_RECORDER
> +static void hmp_recorder(Monitor *mon, const QDict *qdict)
> +{
> +    const char *op = qdict_get_try_str(qdict, "op");
> +    const char *arg = qdict_get_try_str(qdict, "arg");
> +
> +    if (!op) {
> +        monitor_printf(mon, "missing recorder command\"%s\"\n", op);
> +        help_cmd(mon, "recorder");
> +    } else if (!strcmp(op, "trace")) {
> +        recorder_trace_set(arg);
> +    } else if (!strcmp(op, "dump")) {
> +        if (!arg || !*arg) {
> +            recorder_dump();
> +        } else {
> +            recorder_dump_for(arg);
> +        }
> +    } else {
> +        monitor_printf(mon, "unexpected recorder command \"%s\"\n", op);
> +        help_cmd(mon, "recorder");
> +    }
> +}

Consider whether just doing two separate commands would be easier;
a recorder-trace and recorder-dump for example; that's fine from a HMP
point of view and I think you'll find it's less code.

Dave

> +#endif
> +
>  static void hmp_info_help(Monitor *mon, const QDict *qdict)
>  {
>      help_cmd(mon, "info");
> diff --git a/scripts/tracetool/backend/recorder.py b/scripts/tracetool/backend/recorder.py
> new file mode 100644
> index 0000000000..79cc6f5b03
> --- /dev/null
> +++ b/scripts/tracetool/backend/recorder.py
> @@ -0,0 +1,51 @@
> +# -*- coding: utf-8 -*-
> +
> +"""
> +Trace back-end for recorder library
> +"""
> +
> +__author__     = "Christophe de Dinechin <christophe@dinechin.org>"
> +__copyright__  = "Copyright 2020, Christophe de Dinechin and Red Hat"
> +__license__    = "GPL version 2 or (at your option) any later version"
> +
> +__maintainer__ = "Christophe de Dinechin"
> +__email__      = "christophe@dinechin.org"
> +
> +
> +from tracetool import out
> +
> +PUBLIC = True
> +
> +def generate_h_begin(events, group):
> +    out('#include <recorder/recorder.h>', '')
> +
> +    for event in events:
> +        out('RECORDER_DECLARE(%(name)s);', name=event.name)
> +
> +
> +def generate_h(event, group):
> +    argnames = ", ".join(event.args.names())
> +    if len(event.args) > 0:
> +        argnames = ", " + argnames
> +
> +    out('    record(%(event)s, %(fmt)s %(argnames)s);',
> +        event=event.name,
> +        fmt=event.fmt.rstrip("\n"),
> +        argnames=argnames)
> +
> +
> +def generate_h_backend_dstate(event, group):
> +    out('    RECORDER_TWEAK(%(event_id)s) || \\', event_id=event.name)
> +
> +def generate_c_begin(events, group):
> +    out('#include "qemu/osdep.h"',
> +        '#include "trace/control.h"',
> +        '#include "trace/simple.h"',
> +        '#include <recorder/recorder.h>',
> +        '')
> +
> +    for event in events:
> +        out('RECORDER_DEFINE(%(name)s, 8, "Tracetool recorder for %(api)s(%(args)s)");',
> +            name=event.name,
> +            api=event.api(),
> +            args=event.args)
> diff --git a/trace/Makefile.objs b/trace/Makefile.objs
> index c544509adf..9e347640c2 100644
> --- a/trace/Makefile.objs
> +++ b/trace/Makefile.objs
> @@ -54,6 +54,8 @@ $(obj)/generated-tcg-tracers.h-timestamp: $(SRC_PATH)/trace-events $(BUILD_DIR)/
>  
>  util-obj-$(CONFIG_TRACE_SIMPLE) += simple.o
>  util-obj-$(CONFIG_TRACE_FTRACE) += ftrace.o
> +util-obj-$(CONFIG_TRACE_RECORDER) += recorder.o
> +recorder.o-libs = -lrecorder
>  util-obj-y += control.o
>  obj-y += control-target.o
>  util-obj-y += qmp.o
> diff --git a/trace/control.c b/trace/control.c
> index 2ffe000818..15e5293eec 100644
> --- a/trace/control.c
> +++ b/trace/control.c
> @@ -23,6 +23,9 @@
>  #ifdef CONFIG_TRACE_SYSLOG
>  #include <syslog.h>
>  #endif
> +#ifdef CONFIG_TRACE_RECORDER
> +#include "trace/recorder.h"
> +#endif
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/config-file.h"
> @@ -282,6 +285,10 @@ bool trace_init_backends(void)
>      openlog(NULL, LOG_PID, LOG_DAEMON);
>  #endif
>  
> +#ifdef CONFIG_TRACE_RECORDER
> +    recorder_trace_init();
> +#endif
> +
>      return true;
>  }
>  
> diff --git a/trace/recorder.c b/trace/recorder.c
> new file mode 100644
> index 0000000000..cbc22ee2d5
> --- /dev/null
> +++ b/trace/recorder.c
> @@ -0,0 +1,22 @@
> +/*
> + * Recorder-based trace backend
> + *
> + * Copyright Red Hat 2020
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "trace/recorder.h"
> +
> +RECORDER_CONSTRUCTOR
> +void recorder_trace_init(void)
> +{
> +    recorder_trace_set(getenv("RECORDER_TRACES"));
> +
> +    // Allow a dump in case we receive some unhandled signal
> +    // For example, send USR2 to a hung process to get a dump
> +    if (getenv("RECORDER_TRACES"))
> +        recorder_dump_on_common_signals(0,0);
> +}
> diff --git a/trace/recorder.h b/trace/recorder.h
> new file mode 100644
> index 0000000000..00b11a2d2f
> --- /dev/null
> +++ b/trace/recorder.h
> @@ -0,0 +1,34 @@
> +/*
> + * Recorder-based trace backend
> + *
> + * Copyright Red Hat 2020
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef TRACE_RECORDER_H
> +#define TRACE_RECORDER_H
> +
> +#include "qemu/osdep.h"
> +
> +#ifdef CONFIG_TRACE_RECORDER
> +
> +#include <recorder/recorder.h>
> +
> +extern void recorder_trace_init(void);
> +
> +#else
> +
> +// Disable recorder macros
> +#define RECORDER(Name, Size, Description)
> +#define RECORDER_DEFINE(Name, Size, Description)
> +#define RECORDER_DECLARE(Name)
> +#define RECORD(Name, ...)
> +#define record(Name, ...)
> +#define recorder_trace_init()
> +
> +#endif // CONFIG_TRACE_RECORDER
> +
> +#endif // TRACE_RECORDER_H
> diff --git a/util/module.c b/util/module.c
> index e48d9aacc0..2fa93561fe 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -22,6 +22,10 @@
>  #ifdef CONFIG_MODULE_UPGRADES
>  #include "qemu-version.h"
>  #endif
> +#ifdef CONFIG_TRACE_RECORDER
> +#include "trace/recorder.h"
> +#endif
> +
>  
>  typedef struct ModuleEntry
>  {
> @@ -150,6 +154,10 @@ static int module_load_file(const char *fname)
>          g_module_close(g_module);
>          ret = -EINVAL;
>      } else {
> +#ifdef CONFIG_TRACE_RECORDER
> +        // New recorders may have been pulled in, activate them if necessary
> +        recorder_trace_init();
> +#endif
>          QTAILQ_FOREACH(e, &dso_init_list, node) {
>              e->init();
>              register_module_init(e->init, e->type);
> -- 
> 2.26.2
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


