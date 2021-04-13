Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E7735D82D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 08:42:48 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWCl5-0004aC-1M
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 02:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWCjc-00048x-Tx
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 02:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWCjZ-0002SK-9g
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 02:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618296071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ne+Itd5LbeN7WEEs3xSAAnzBfzkZTGHETgfnLN9t2Cs=;
 b=dk4DhggMQPZ8NUGdC8/fUdzU4SGoFf0IKdj8Mw+b4RwqM66S0aLXZfwYbDtJSgUGNeakgk
 s6AXDkDp99cnqBVHPyl26kbp+7Q9ETpacuQRkpN1Xecd6tM2KWHs0QtgSNl39y/wVFQAjD
 Q44Qr9JCOrqQ8ux0ehhnm5MiOURrWc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-rHd-6_KQNbeXVHK67-AtaQ-1; Tue, 13 Apr 2021 02:41:09 -0400
X-MC-Unique: rHd-6_KQNbeXVHK67-AtaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AA4A1006C80;
 Tue, 13 Apr 2021 06:41:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 058855D9DE;
 Tue, 13 Apr 2021 06:41:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FD8C113525D; Tue, 13 Apr 2021 08:40:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Li Zhang <zhlcindy@gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
Date: Tue, 13 Apr 2021 08:40:59 +0200
In-Reply-To: <20210315170636.704201-2-zhlcindy@gmail.com> (Li Zhang's message
 of "Mon, 15 Mar 2021 18:06:36 +0100")
Message-ID: <8735vu1ybo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: lukasstraub2@web.de, alexandr.iarygin@profitbricks.com,
 qemu-devel@nongnu.org, Li Zhang <li.zhang@cloud.ionos.com>,
 pankaj.gupta@cloud.ionos.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhang <zhlcindy@gmail.com> writes:

> From: Li Zhang <li.zhang@cloud.ionos.com>
>
> For some scenarios, it needs to hot-add a monitor device.
> But QEMU doesn't support hotplug yet. It also works by adding
> a monitor with null backend by default and then change its
> backend to socket by QMP command "chardev-change".
>
> So this patch is to support monitor chardev hotswap with QMP.
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>

I think what what you're trying to say is that chardev-change does not
work when the character device changes is used by a QMP monitor.
Correct?

If yes, how exactly does it misbehave?

Does it work with an HMP monitor?

> ---
>  monitor/monitor-internal.h |  3 +++
>  monitor/monitor.c          |  2 +-
>  monitor/qmp.c              | 42 +++++++++++++++++++++++++++++++++++---
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 40903d6386..2df6dd21de 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char *lis=
t);
>  void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
>                                   Error **errp);
> =20
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +                               void *opaque);
> +
>  #endif
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index e94f532cf5..2d255bab18 100644
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
> index 2326bd7f9b..55cfb230d9 100644
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
> @@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>      g_queue_free(mon->qmp_requests);
>  }
> =20
> -static void monitor_qmp_setup_handlers_bh(void *opaque)
> +static int monitor_qmp_change(void *opaque)
> +{
> +    MonitorQMP *mon =3D opaque;
> +
> +    mon->common.use_io_thread =3D
> +        qemu_chr_has_feature(mon->common.chr.chr, QEMU_CHAR_FEATURE_GCON=
TEXT);
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
> +    if (mon->common.out_watch) {
> +        g_source_remove(mon->common.out_watch);

All other updates of @out_watch are under @mon_lock.  Why not this one?

I have no idea whether g_source_remove() is the right function to call.
Its documentation says "You must use g_source_destroy() for sources
added to a non-default main context."  The qemu_chr_fe_set_handlers()
contract is of no help.

Documentation of g_source_destroy() confuses some more: "This does not
unref the GSource: if you still hold a reference, use g_source_unref()
to drop it.

Marc-Andr=C3=A9, can you help?

> +        qemu_mutex_lock(&mon->common.mon_lock);
> +        mon->common.out_watch =3D
> +        qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
> +                               monitor_unblocked, &mon->common);

Bad indentation.  Better:

        mon->common.out_watch =3D
            qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
                                   monitor_unblocked, &mon->common);

or

        mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
                                                      G_IO_OUT | G_IO_HUP,
                                                      monitor_unblocked,
                                                      &mon->common);

or

        mon->common.out_watch =3D qemu_chr_fe_add_watch(&mon->common.chr,
                                        G_IO_OUT | G_IO_HUP,
                                        monitor_unblocked, &mon->common);

> +        qemu_mutex_unlock(&mon->common.mon_lock);
> +    }
> +
> +    return 0;
> +}

This function copies from monitor_data_init(), monitor_init_qmp(), and
monitor_flush_locked().  Feels like a refactoring would be in order.
Possibly on top.

> +
> +static void monitor_qmp_set_handlers_bh(void *opaque)
>  {
>      MonitorQMP *mon =3D opaque;
>      GMainContext *context;
> @@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaq=
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
> @@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Erro=
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


