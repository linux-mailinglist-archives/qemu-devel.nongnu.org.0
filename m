Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B604362329
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:52:45 +0200 (CEST)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPps-0005yZ-MY
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXPnk-0004cN-N4
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXPng-0004Xz-2s
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618584625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39ZlW7vA61JuQOYIbXgtQZsCCh/Ldi6b55pngNBQJQQ=;
 b=RwirOaU3cZyBlflsvJbJuirzN28xS5Er5d0uIOOk4cYhWyFK7io5vCSB713YU0dlnHg4AI
 bj1EWxFh06kKrFAWhc3V5BiZvB8gqryMQyyQhdvyj2SYeDvGXXxGi5Q9MHcFEtrojeS6VR
 pouhaVAhu5VKyCiGxIHJoEIgpV7G0WY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-gNQM95lHMDmd_3CdCwG5pw-1; Fri, 16 Apr 2021 10:50:23 -0400
X-MC-Unique: gNQM95lHMDmd_3CdCwG5pw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0890E83DD20;
 Fri, 16 Apr 2021 14:50:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B504F69FB4;
 Fri, 16 Apr 2021 14:50:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 35249113525D; Fri, 16 Apr 2021 16:50:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Zhang <zhlcindy@gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
Date: Fri, 16 Apr 2021 16:50:08 +0200
In-Reply-To: <20210413213459.629963-1-li.zhang@cloud.ionos.com> (Li Zhang's
 message of "Tue, 13 Apr 2021 23:34:59 +0200")
Message-ID: <875z0m4733.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Li Zhang <li.zhang@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9, I'd like your opinion for this one, in particular the use =
of
g_source_remove().

Li Zhang <zhlcindy@gmail.com> writes:

> For some scenarios, it needs to hot-add a monitor device.
> But QEMU doesn't support hotplug yet. It also works by adding
> a monitor with null backend by default and then change its
> backend to socket by QMP command "chardev-change".
>
> So this patch is to support monitor chardev hotswap with QMP.
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

Your commit message starts with a brief description of the problem.
Appreciated!  But I think it could be a bit clearer.  What about this:

    qmp: Support chardev-change

    For some scenarios, we'd like to hot-add a monitor device.  But QEMU
    doesn't support that, yet.  It does support hot-swapping character
    backends with QMP command chardev-change.  This lets us pre-add a
    monitor with a null character backend, then chardev-change to a
    socket backend.  Except the chardev-change fails with "Chardev user
    does not support chardev hotswap" because monitors don't provide the
    required callback.  Implement it for QMP monitors.

> ---
>  v1 -> v2:=20
>   - Change mutex lock mon_lock section
>   - Fix indentation problems
>
>  monitor/monitor-internal.h |  3 +++
>  monitor/monitor.c          |  2 +-
>  monitor/qmp.c              | 43 +++++++++++++++++++++++++++++++++++---
>  3 files changed, 44 insertions(+), 4 deletions(-)
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 9c3a09cb01..1b80c74883 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -183,4 +183,7 @@ void help_cmd(Monitor *mon, const char *name);
>  void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
>  int hmp_compare_cmd(const char *name, const char *list);
> =20
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +                           void *opaque);
> +
>  #endif
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 636bcc81c5..16a3620d02 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(con=
st Monitor *mon)
> =20
>  static void monitor_flush_locked(Monitor *mon);
> =20
> -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>                                    void *opaque)
>  {
>      Monitor *mon =3D opaque;
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 2b0308f933..5fa65401ae 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -44,6 +44,7 @@ struct QMPRequest {
>      Error *err;
>  };
>  typedef struct QMPRequest QMPRequest;
> +static void monitor_qmp_set_handlers_bh(void *opaque);
> =20
>  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
> =20
> @@ -477,7 +478,36 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>      g_queue_free(mon->qmp_requests);
>  }
> =20
> -static void monitor_qmp_setup_handlers_bh(void *opaque)
> +static int monitor_qmp_change                  (void *opaque)
> +{
> +    MonitorQMP *mon =3D opaque;
> +
> +    mon->common.use_io_thread =3D qemu_chr_has_feature(mon->common.chr.c=
hr,
> +                                QEMU_CHAR_FEATURE_GCONTEXT);
> +
> +    if (mon->common.use_io_thread) {
> +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
> +                                monitor_qmp_set_handlers_bh, mon);
> +    } else {
> +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> +                                 monitor_qmp_read, monitor_qmp_event,
> +                                 monitor_qmp_change, &mon->common, NULL,=
 true);
> +    }
> +
> +    qemu_mutex_lock(&mon->common.mon_lock);
> +    if (mon->common.out_watch) {
> +        g_source_remove(mon->common.out_watch);
> +        mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr=
,
> +                                G_IO_OUT | G_IO_HUP,
> +                                monitor_unblocked,
> +                                &mon->common);

Visually align the arguments:

        mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
                                                      G_IO_OUT | G_IO_HUP,
                                                      monitor_unblocked,
                                                      &mon->common);

You may reduce argument indentation some to gain extra space, but keep
the arguments more indented than the function:

        mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
                                        G_IO_OUT | G_IO_HUP,
                                        monitor_unblocked, &mon->common);

Do this only when you actually use the extra space for readability.

> +    }
> +    qemu_mutex_unlock(&mon->common.mon_lock);
> +
> +    return 0;
> +}

As I wrote in my review of v1, this function copies from
monitor_data_init(), monitor_init_qmp(), and monitor_flush_locked().
Feels like a refactoring would be in order.  Doing it on top might be
easier.

> +
> +static void monitor_qmp_set_handlers_bh(void *opaque)
>  {
>      MonitorQMP *mon =3D opaque;
>      GMainContext *context;
> @@ -487,7 +517,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaq=
ue)
>      assert(context);
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                               monitor_qmp_read, monitor_qmp_event,
> -                             NULL, &mon->common, context, true);
> +                             monitor_qmp_change, &mon->common, context, =
true);
> +
> +}
> +
> +static void monitor_qmp_setup_handlers_bh(void *opaque)
> +{
> +    MonitorQMP *mon =3D opaque;
> +    monitor_qmp_set_handlers_bh(mon);
>      monitor_list_append(&mon->common);
>  }
> =20
> @@ -528,7 +565,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Erro=
r **errp)
>      } else {
>          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                                   monitor_qmp_read, monitor_qmp_event,
> -                                 NULL, &mon->common, NULL, true);
> +                                 monitor_qmp_change, &mon->common, NULL,=
 true);
>          monitor_list_append(&mon->common);
>      }
>  }


