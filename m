Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C234587B59
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:08:26 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIplA-0005N0-Ji
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIpcH-00019L-Dk
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIpcA-0005Bc-4k
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 06:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659437945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akkUDWwwoS3CNIEfChHWtBfTreA2qoJbev7defFi6C4=;
 b=cHU9gaq7OrmN/1Xq9It02fk8tTHSGKilRe+6YKCbCsTBIl/052JxiTbmsYpiIoBifMwgGb
 xsoPCAeq3PgjW2y48OBBdTDLjZDxKxG7v4IyPABU3v9EnMpwTWIkuCYY9K3egsTm8rovet
 kBzSzBxiPjnWtPg36wcbi6ifTU+JvGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-1e6ODu-8NyaaXIPN3CV_FA-1; Tue, 02 Aug 2022 06:59:02 -0400
X-MC-Unique: 1e6ODu-8NyaaXIPN3CV_FA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5614F101A592;
 Tue,  2 Aug 2022 10:59:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 060FE492C3B;
 Tue,  2 Aug 2022 10:59:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D577C21E6930; Tue,  2 Aug 2022 12:58:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Xie Yongji <xieyongji@bytedance.com>,  Kyle Evans
 <kevans@freebsd.org>,  Peter Maydell <peter.maydell@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Warner
 Losh <imp@bsdimp.com>,  Kevin Wolf <kwolf@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Laurent Vivier <laurent@vivier.eu>,  Fam
 Zheng <fam@euphon.net>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 06/15] qapi: move QEMU-specific dispatch code in monitor
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-7-marcandre.lureau@redhat.com>
Date: Tue, 02 Aug 2022 12:58:58 +0200
In-Reply-To: <20220712093528.4144184-7-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 12 Jul 2022 13:35:19 +0400")
Message-ID: <87les6ud1p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Make QMP-dispatch code free from QEMU-specific OOB dispatch/async
> coroutine handling. This will allow to move the base code to
> qemu-common, and clear other users from potential mis-ususe (QGA doesn't
> have OOB or coroutine).

I trust the utilty of such a move will become clear later in this
series.

>
> To do that, introduce an optional callback QmpDispatchRun called when a
> QMP command should be run, to allow QEMU to override the default
> behaviour.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qapi/qmp/dispatch.h |  7 ++--
>  monitor/qmp.c               | 68 ++++++++++++++++++++++++++++++++++++-
>  qapi/qmp-dispatch.c         | 64 +++-------------------------------
>  qga/main.c                  |  2 +-
>  tests/unit/test-qmp-cmds.c  |  6 ++--
>  5 files changed, 81 insertions(+), 66 deletions(-)
>
> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> index 1e4240fd0dbc..b659da613f2e 100644
> --- a/include/qapi/qmp/dispatch.h
> +++ b/include/qapi/qmp/dispatch.h
> @@ -14,7 +14,6 @@
>  #ifndef QAPI_QMP_DISPATCH_H
>  #define QAPI_QMP_DISPATCH_H
>=20=20
> -#include "monitor/monitor.h"
>  #include "qemu/queue.h"
>=20=20
>  typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);
> @@ -41,6 +40,10 @@ typedef struct QmpCommand
>=20=20
>  typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
>=20=20
> +typedef void (QmpDispatchRun)(bool oob, const QmpCommand *cmd,
> +                              QDict *args, QObject **ret, Error **errp,
> +                              void *run_data);
> +
>  void qmp_register_command(QmpCommandList *cmds, const char *name,
>                            QmpCommandFunc *fn, QmpCommandOptions options,
>                            unsigned special_features);
> @@ -56,7 +59,7 @@ const char *qmp_command_name(const QmpCommand *cmd);
>  bool qmp_has_success_response(const QmpCommand *cmd);
>  QDict *qmp_error_response(Error *err);
>  QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
> -                    bool allow_oob, Monitor *cur_mon);
> +                    bool allow_oob, QmpDispatchRun run_cb, void *run_dat=
a);
>  bool qmp_is_oob(const QDict *dict);
>=20=20
>  typedef void (*qmp_cmd_callback_fn)(const QmpCommand *cmd, void *opaque);
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 092c527b6fc9..f8dec97c96bb 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -132,6 +132,72 @@ static void monitor_qmp_respond(MonitorQMP *mon, QDi=
ct *rsp)
>      }
>  }
>=20=20
> +typedef struct QmpDispatchBH {
> +    const QmpCommand *cmd;
> +    Monitor *cur_mon;
> +    QDict *args;
> +    QObject **ret;
> +    Error **errp;
> +    Coroutine *co;
> +} QmpDispatchBH;
> +
> +static void do_qmp_dispatch_bh(void *opaque)
> +{
> +    QmpDispatchBH *data =3D opaque;
> +
> +    assert(monitor_cur() =3D=3D NULL);
> +    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
> +    data->cmd->fn(data->args, data->ret, data->errp);
> +    monitor_set_cur(qemu_coroutine_self(), NULL);
> +    aio_co_wake(data->co);
> +}
> +
> +/*
> + * Runs outside of coroutine context for OOB commands, but in coroutine
> + * context for everything else.
> + */
> +static void qmp_dispatch_run(bool oob, const QmpCommand *cmd,
> +                             QDict *args, QObject **ret, Error **errp,
> +                             void *run_data)
> +{
> +    Monitor *cur_mon =3D run_data;
> +
> +    assert(!(oob && qemu_in_coroutine()));
> +    assert(monitor_cur() =3D=3D NULL);
> +
> +    if (!!(cmd->options & QCO_COROUTINE) =3D=3D qemu_in_coroutine()) {
> +        monitor_set_cur(qemu_coroutine_self(), cur_mon);
> +        cmd->fn(args, ret, errp);
> +        monitor_set_cur(qemu_coroutine_self(), NULL);
> +    } else {
> +       /*
> +        * Actual context doesn't match the one the command needs.
> +        *
> +        * Case 1: we are in coroutine context, but command does not
> +        * have QCO_COROUTINE.  We need to drop out of coroutine
> +        * context for executing it.
> +        *
> +        * Case 2: we are outside coroutine context, but command has
> +        * QCO_COROUTINE.  Can't actually happen, because we get here
> +        * outside coroutine context only when executing a command
> +        * out of band, and OOB commands never have QCO_COROUTINE.
> +        */
> +        assert(!oob && qemu_in_coroutine() && !(cmd->options & QCO_COROU=
TINE));
> +
> +        QmpDispatchBH data =3D {
> +            .cur_mon    =3D cur_mon,
> +            .cmd        =3D cmd,
> +            .args       =3D args,
> +            .ret        =3D ret,
> +            .errp       =3D errp,
> +            .co         =3D qemu_coroutine_self(),
> +        };
> +        aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_=
bh,
> +                                &data);
> +        qemu_coroutine_yield();
> +    }
> +}
> +
>  /*
>   * Runs outside of coroutine context for OOB commands, but in
>   * coroutine context for everything else.
> @@ -142,7 +208,7 @@ static void monitor_qmp_dispatch(MonitorQMP *mon, QOb=
ject *req)
>      QDict *error;
>=20=20
>      rsp =3D qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon),
> -                       &mon->common);
> +                       qmp_dispatch_run, &mon->common);
>=20=20
>      if (mon->commands =3D=3D &qmp_cap_negotiation_commands) {
>          error =3D qdict_get_qdict(rsp, "error");
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 0990873ec8ec..342b13d7ebbd 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -13,7 +13,6 @@
>=20=20
>  #include "qemu/osdep.h"
>=20=20
> -#include "block/aio.h"
>  #include "qapi/compat-policy.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/dispatch.h"
> @@ -22,8 +21,6 @@
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qobject-output-visitor.h"
>  #include "qapi/qmp/qbool.h"
> -#include "qemu/coroutine.h"
> -#include "qemu/main-loop.h"
>=20=20
>  Visitor *qobject_input_visitor_new_qmp(QObject *obj)
>  {
> @@ -110,32 +107,8 @@ bool qmp_is_oob(const QDict *dict)
>          && !qdict_haskey(dict, "execute");
>  }
>=20=20
> -typedef struct QmpDispatchBH {
> -    const QmpCommand *cmd;
> -    Monitor *cur_mon;
> -    QDict *args;
> -    QObject **ret;
> -    Error **errp;
> -    Coroutine *co;
> -} QmpDispatchBH;
> -
> -static void do_qmp_dispatch_bh(void *opaque)
> -{
> -    QmpDispatchBH *data =3D opaque;
> -
> -    assert(monitor_cur() =3D=3D NULL);
> -    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
> -    data->cmd->fn(data->args, data->ret, data->errp);
> -    monitor_set_cur(qemu_coroutine_self(), NULL);
> -    aio_co_wake(data->co);
> -}
> -
> -/*
> - * Runs outside of coroutine context for OOB commands, but in coroutine
> - * context for everything else.
> - */
>  QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
> -                    bool allow_oob, Monitor *cur_mon)
> +                    bool allow_oob, QmpDispatchRun run_cb, void *run_dat=
a)
>  {
>      Error *err =3D NULL;
>      bool oob;
> @@ -203,39 +176,12 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QOb=
ject *request,
>          qobject_ref(args);
>      }
>=20=20
> -    assert(!(oob && qemu_in_coroutine()));
> -    assert(monitor_cur() =3D=3D NULL);
> -    if (!!(cmd->options & QCO_COROUTINE) =3D=3D qemu_in_coroutine()) {
> -        monitor_set_cur(qemu_coroutine_self(), cur_mon);
> -        cmd->fn(args, &ret, &err);
> -        monitor_set_cur(qemu_coroutine_self(), NULL);
> +    if (run_cb) {
> +        run_cb(oob, cmd, args, &ret, &err, run_data);
>      } else {
> -       /*
> -        * Actual context doesn't match the one the command needs.
> -        *
> -        * Case 1: we are in coroutine context, but command does not
> -        * have QCO_COROUTINE.  We need to drop out of coroutine
> -        * context for executing it.
> -        *
> -        * Case 2: we are outside coroutine context, but command has
> -        * QCO_COROUTINE.  Can't actually happen, because we get here
> -        * outside coroutine context only when executing a command
> -        * out of band, and OOB commands never have QCO_COROUTINE.
> -        */
> -        assert(!oob && qemu_in_coroutine() && !(cmd->options & QCO_COROU=
TINE));
> -
> -        QmpDispatchBH data =3D {
> -            .cur_mon    =3D cur_mon,
> -            .cmd        =3D cmd,
> -            .args       =3D args,
> -            .ret        =3D &ret,
> -            .errp       =3D &err,
> -            .co         =3D qemu_coroutine_self(),
> -        };
> -        aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_=
bh,
> -                                &data);
> -        qemu_coroutine_yield();
> +        cmd->fn(args, &ret, &err);
>      }
> +
>      qobject_unref(args);
>      if (err) {
>          /* or assert(!ret) after reviewing all handlers: */

A callback works, but note that each program's function is fixed (the
simple and common function is inlined, but that's just for convenience).

We could use the linker instead.  We already do for
qmp_command_available(), and the patch doesn't change that.

Perhaps a layering argument could be made for callbacks.  Before the
series, monitor/qmp.c's monitor_qmp_dispatch() calls
qapi/qmp-dispatch.c's qmp_dispatch(), which calls a few functions from
monitor/.  However, consistency seems desirable.

What do you think?

[...]


