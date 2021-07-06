Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DC33BDE0D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 21:30:00 +0200 (CEST)
Received: from localhost ([::1]:37714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0qlb-0003WD-R0
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 15:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m0qkX-0002lE-Su
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:28:53 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m0qkV-000554-SX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 15:28:53 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x192so8076951ybe.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z8QWHIPn8YA6r2/tN1MzPJSyJjrvroHghg6y3PqwyP8=;
 b=ixZbFJHgi/Y1T3pQaj/0GpwQ4JKl6XsLcgTGRJMmj2lx4JHzmrFqFcHzuVEawIqDD0
 hSD16dxd1zyn1smJVE05PJ35NnGRICBtb06EWM/vAbotdx5LjuZ7B0WLUVsnmbD/Htb/
 vsPHqsGggVTdpfb87U68ce1NGeHQ9WDqPkZlvmk+RETnOgjisivVl0APxuSaveE+zs3R
 oMkoPC/bITdP7jSQpK7u4R0Q7Xzu2sm4OviGL4eUm3IqSTQM0cnTN4uMzk/T/r/RRZDC
 TWzu7o+Ad6VlkcHUmD03zkZZIkYA43a0m6x1nEEXRVyTyQlg9T/CoWzfpF7aXURCAcBF
 xA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z8QWHIPn8YA6r2/tN1MzPJSyJjrvroHghg6y3PqwyP8=;
 b=TOdX4IoyuAWcUa/HtMeQ3PhLgqbXPOoMRZ42Q0Y8kx45Gk+AzJcDOwnmhzUxzFD01O
 S2ZqzUYxdfI4KXyojuDDVgOyudi7/33ppNPtBIzbZgK20FM7zAjZqMqEnIOfnfSYWXju
 nRIufhle2FGAFAp3JjGzbTXdj5iu8Lgb7TpQR0L6HHsWP9gQIpgCFA8+HmCua5koPdJb
 pkLcZsmR/20cSC7mtCsgkhcsF7ldmYZ2f0hmESt4IMDxyRYsykIDrA5qFFU24ZKAdgpW
 aOEMbCCbXp9p6bbd3GXNcurdVKj0+mUX6TxRDIAaHruTMTB3DHNsDHD/5UK1T+pgF/nO
 oJ5w==
X-Gm-Message-State: AOAM531+XJnmZoNTjvQeP357lncS8m7+1kneZORs0mUDGq4DfRir6HD+
 gx8EcN11VSM2BITwIa5KK+yAWHb3l045fFFCfco=
X-Google-Smtp-Source: ABdhPJwo+sOqWo8cQBrjkXtORKqagFKs2HJuAuUOBsdQdCoscAqvXq2JHQ32ldMV2EyKzVy9yp3ViybZCdva2krxV2s=
X-Received: by 2002:a25:3103:: with SMTP id x3mr27338815ybx.8.1625599730712;
 Tue, 06 Jul 2021 12:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210706191452.127893-1-li.zhang@ionos.com>
In-Reply-To: <20210706191452.127893-1-li.zhang@ionos.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Tue, 6 Jul 2021 21:28:40 +0200
Message-ID: <CAD8of+r08zaKNKeuqGVvDos8wMGodycOp3q+Cm8aZ0_UvZvkrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] qmp: Support chardev-change for QMP device
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 pankaj.gupta.linux@gmail.com, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=zhlcindy@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Li Zhang <li.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

Sorry for the late update because of other tasks. Please review the patcheset.
About the indentation problem, I found that the email shows different
from my patches.
The source code which is not changed also shows different indentation
in email.
I checked a lot of times, I still don't know what the problem is.

On Tue, Jul 6, 2021 at 9:15 PM Li Zhang <zhlcindy@gmail.com> wrote:
>
> For some scenarios, we'd like to hot-add a monitor device.  But QEMU
> doesn't support that, yet.  It does support hot-swapping character
> backends with QMP command chardev-change.  This lets us pre-add a
> monitor with a null character backend, then chardev-change to a
> socket backend.  Except the chardev-change fails with "Chardev user
> does not support chardev hotswap" because monitors don't provide the
> required callback.  Implement it for QMP monitors.
>
> Signed-off-by: Li Zhang <li.zhang@ionos.com>
> ---
> v3 -> v2:
>   * rework the patch according.
>   * refactor the source code of chardev.
>
>  monitor/monitor-internal.h |  1 +
>  monitor/monitor.c          |  4 +-
>  monitor/qmp.c              | 83 +++++++++++++++++++++++++++-----------
>  3 files changed, 62 insertions(+), 26 deletions(-)
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 9c3a09cb01..162f73119b 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -182,5 +182,6 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name);
>  void help_cmd(Monitor *mon, const char *name);
>  void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
>  int hmp_compare_cmd(const char *name, const char *list);
> +void monitor_flush_locked(Monitor *mon);
>
>  #endif
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index b90c0f4051..1b05ef3bdb 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -154,8 +154,6 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
>      return !monitor_uses_readline(container_of(mon, MonitorHMP, common));
>  }
>
> -static void monitor_flush_locked(Monitor *mon);
> -
>  static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>                                    void *opaque)
>  {
> @@ -169,7 +167,7 @@ static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>  }
>
>  /* Caller must hold mon->mon_lock */
> -static void monitor_flush_locked(Monitor *mon)
> +void monitor_flush_locked(Monitor *mon)
>  {
>      int rc;
>      size_t len;
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 092c527b6f..92c704373f 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -46,6 +46,8 @@ struct QMPRequest {
>  typedef struct QMPRequest QMPRequest;
>
>  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
> +static void monitor_qmp_setup_handlers_bh(void *opaque);
> +static void monitor_backend_init(MonitorQMP *mon, Chardev *chr);
>
>  static bool qmp_oob_enabled(MonitorQMP *mon)
>  {
> @@ -481,6 +483,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>      g_queue_free(mon->qmp_requests);
>  }
>
> +static bool mointor_in_list(Monitor *mon)
> +{
> +    Monitor *mon_tmp;
> +    QTAILQ_FOREACH(mon_tmp, &mon_list, entry) {
> +        if (mon_tmp == mon) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static int monitor_qmp_change(void *opaque)
> +{
> +    MonitorQMP *mon = opaque;
> +
> +    monitor_data_init(&mon->common, true, false,
> +            qemu_chr_has_feature(mon->common.chr.chr,
> +                                 QEMU_CHAR_FEATURE_GCONTEXT));
> +    monitor_backend_init(mon, mon->common.chr.chr);
> +    qemu_mutex_lock(&mon->common.mon_lock);
> +    if (mon->common.out_watch) {
> +        mon->common.out_watch = 0;
> +        monitor_flush_locked(&mon->common);
> +    }
> +    qemu_mutex_unlock(&mon->common.mon_lock);
> +
> +    return 0;
> +}
> +
>  static void monitor_qmp_setup_handlers_bh(void *opaque)
>  {
>      MonitorQMP *mon = opaque;
> @@ -491,30 +522,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
>      assert(context);
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                               monitor_qmp_read, monitor_qmp_event,
> -                             NULL, &mon->common, context, true);
> -    monitor_list_append(&mon->common);
> +                             monitor_qmp_change, &mon->common, context, true);
> +
> +    if (!mointor_in_list(&mon->common))
> +        monitor_list_append(&mon->common);
>  }
>
> -void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
> +static void monitor_backend_init(MonitorQMP *mon, Chardev *chr)
>  {
> -    MonitorQMP *mon = g_new0(MonitorQMP, 1);
> -
> -    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
> -        g_free(mon);
> -        return;
> -    }
> -    qemu_chr_fe_set_echo(&mon->common.chr, true);
> -
> -    /* Note: we run QMP monitor in I/O thread when @chr supports that */
> -    monitor_data_init(&mon->common, true, false,
> -                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
> -
> -    mon->pretty = pretty;
> -
> -    qemu_mutex_init(&mon->qmp_queue_lock);
> -    mon->qmp_requests = g_queue_new();
> -
> -    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
>      if (mon->common.use_io_thread) {
>          /*
>           * Make sure the old iowatch is gone.  It's possible when
> @@ -532,7 +547,29 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
>      } else {
>          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                                   monitor_qmp_read, monitor_qmp_event,
> -                                 NULL, &mon->common, NULL, true);
> -        monitor_list_append(&mon->common);
> +                                 monitor_qmp_change, &mon->common, NULL, true);
> +        if (!mointor_in_list(&mon->common)) {
> +            monitor_list_append(&mon->common);
> +        }
> +    }
> +}
> +
> +void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
> +{
> +    MonitorQMP *mon = g_new0(MonitorQMP, 1);
> +
> +    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
> +        g_free(mon);
> +        return;
>      }
> +    qemu_chr_fe_set_echo(&mon->common.chr, true);
> +     /* Note: we run QMP monitor in I/O thread when @chr supports that */
> +    monitor_data_init(&mon->common, true, false,
> +                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
> +
> +    mon->pretty = pretty;
> +    qemu_mutex_init(&mon->qmp_queue_lock);
> +    mon->qmp_requests = g_queue_new();
> +    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
> +    monitor_backend_init(mon, chr);
>  }
> --
> 2.25.1
>


-- 

Best Regards
-Li

