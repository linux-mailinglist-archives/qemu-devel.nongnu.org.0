Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21423C9C6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 12:09:33 +0200 (CEST)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3GMW-0000Fc-W0
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 06:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3GGR-0000EX-RK
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 06:03:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47974
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3GGO-0000fM-68
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 06:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596621791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdL68pcoKEFDxpUjJZRElOM6PrNAMCqjRq16wnDYAgQ=;
 b=ifen7vVDshDAeiagtryl4PtdHKuS3G0ympfzlohm2n/juYdkMQI5W+Ckr6SdM8zjk6nZWh
 sFHLbdqPpegwK4A8utHfAxwb5fAQNsPyEpFoByR9X/tAgrX86uPwxAvkSkqTVZlFI2s1gc
 B99nauIbRVhwHB2zz9HS/N37OZ+20zM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-E0mOuRZnMa6ZUCgLutnwHQ-1; Wed, 05 Aug 2020 06:03:09 -0400
X-MC-Unique: E0mOuRZnMa6ZUCgLutnwHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DEFB10059B2;
 Wed,  5 Aug 2020 10:03:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B541A922;
 Wed,  5 Aug 2020 10:03:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1DF631141D60; Wed,  5 Aug 2020 12:03:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v6 08/12] qmp: Move dispatcher to a coroutine
References: <20200528153742.274164-1-kwolf@redhat.com>
 <20200528153742.274164-9-kwolf@redhat.com>
Date: Wed, 05 Aug 2020 12:03:06 +0200
In-Reply-To: <20200528153742.274164-9-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 28 May 2020 17:37:38 +0200")
Message-ID: <87o8np2yw5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 01:46:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: marcandre.lureau@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> This moves the QMP dispatcher to a coroutine and runs all QMP command
> handlers that declare 'coroutine': true in coroutine context so they
> can avoid blocking the main loop while doing I/O or waiting for other
> events.
>
> For commands that are not declared safe to run in a coroutine, the
> dispatcher drops out of coroutine context by calling the QMP command
> handler from a bottom half.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/qapi/qmp/dispatch.h |   1 +
>  monitor/monitor-internal.h  |   6 +-
>  monitor/monitor.c           |  55 +++++++++++++---
>  monitor/qmp.c               | 122 +++++++++++++++++++++++++++---------
>  qapi/qmp-dispatch.c         |  52 +++++++++++++--
>  qapi/qmp-registry.c         |   3 +
>  util/aio-posix.c            |   8 ++-
>  7 files changed, 201 insertions(+), 46 deletions(-)
>
> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> index 9fd2b720a7..af8d96c570 100644
> --- a/include/qapi/qmp/dispatch.h
> +++ b/include/qapi/qmp/dispatch.h
> @@ -31,6 +31,7 @@ typedef enum QmpCommandOptions
>  typedef struct QmpCommand
>  {
>      const char *name;
> +    /* Runs in coroutine context if QCO_COROUTINE is set */
>      QmpCommandFunc *fn;
>      QmpCommandOptions options;
>      QTAILQ_ENTRY(QmpCommand) node;
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index b39e03b744..b55d6df07f 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -155,7 +155,9 @@ static inline bool monitor_is_qmp(const Monitor *mon)
> =20
>  typedef QTAILQ_HEAD(MonitorList, Monitor) MonitorList;
>  extern IOThread *mon_iothread;
> -extern QEMUBH *qmp_dispatcher_bh;
> +extern Coroutine *qmp_dispatcher_co;
> +extern bool qmp_dispatcher_co_shutdown;
> +extern bool qmp_dispatcher_co_busy;
>  extern QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
>  extern QemuMutex monitor_lock;
>  extern MonitorList mon_list;
> @@ -173,7 +175,7 @@ void monitor_fdsets_cleanup(void);
> =20
>  void qmp_send_response(MonitorQMP *mon, const QDict *rsp);
>  void monitor_data_destroy_qmp(MonitorQMP *mon);
> -void monitor_qmp_bh_dispatcher(void *data);
> +void coroutine_fn monitor_qmp_dispatcher_co(void *data);
> =20
>  int get_monitor_def(int64_t *pval, const char *name);
>  void help_cmd(Monitor *mon, const char *name);
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 35003bb486..50fb5b20d3 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -55,8 +55,32 @@ typedef struct {
>  /* Shared monitor I/O thread */
>  IOThread *mon_iothread;
> =20
> -/* Bottom half to dispatch the requests received from I/O thread */
> -QEMUBH *qmp_dispatcher_bh;
> +/* Coroutine to dispatch the requests received from I/O thread */
> +Coroutine *qmp_dispatcher_co;
> +
> +/* Set to true when the dispatcher coroutine should terminate */
> +bool qmp_dispatcher_co_shutdown;
> +
> +/*
> + * qmp_dispatcher_co_busy is used for synchronisation between the
> + * monitor thread and the main thread to ensure that the dispatcher
> + * coroutine never gets scheduled a second time when it's already
> + * scheduled (scheduling the same coroutine twice is forbidden).
> + *
> + * It is true if the coroutine is active and processing requests.
> + * Additional requests may then be pushed onto a mon->qmp_requests,

s/onto a/onto/

> + * and @qmp_dispatcher_co_shutdown may be set without further ado.
> + * @qmp_dispatcher_co_busy must not be woken up in this case.
> + *
> + * If false, you also have to set @qmp_dispatcher_co_busy to true and
> + * wake up @qmp_dispatcher_co after pushing the new requests.
> + *
> + * The coroutine will automatically change this variable back to false
> + * before it yields.  Nobody else may set the variable to false.
> + *
> + * Access must be atomic for thread safety.
> + */
> +bool qmp_dispatcher_co_busy;
> =20
>  /*
>   * Protects mon_list, monitor_qapi_event_state, coroutine_mon,
> @@ -608,9 +632,24 @@ void monitor_cleanup(void)
>      }
>      qemu_mutex_unlock(&monitor_lock);
> =20
> -    /* QEMUBHs needs to be deleted before destroying the I/O thread */
> -    qemu_bh_delete(qmp_dispatcher_bh);
> -    qmp_dispatcher_bh =3D NULL;
> +    /*
> +     * The dispatcher needs to stop before destroying the I/O thread.
> +     *
> +     * We need to poll both qemu_aio_context and iohandler_ctx to make
> +     * sure that the dispatcher coroutine keeps making progress and
> +     * eventually terminates.  qemu_aio_context is automatically
> +     * polled by calling AIO_WAIT_WHILE on it, but we must poll
> +     * iohandler_ctx manually.
> +     */
> +    qmp_dispatcher_co_shutdown =3D true;
> +    if (!atomic_xchg(&qmp_dispatcher_co_busy, true)) {
> +        aio_co_wake(qmp_dispatcher_co);
> +    }
> +
> +    AIO_WAIT_WHILE(qemu_get_aio_context(),
> +                   (aio_poll(iohandler_get_aio_context(), false),
> +                    atomic_mb_read(&qmp_dispatcher_co_busy)));
> +
>      if (mon_iothread) {
>          iothread_destroy(mon_iothread);
>          mon_iothread =3D NULL;
> @@ -634,9 +673,9 @@ void monitor_init_globals_core(void)
>       * have commands assuming that context.  It would be nice to get
>       * rid of those assumptions.
>       */
> -    qmp_dispatcher_bh =3D aio_bh_new(iohandler_get_aio_context(),
> -                                   monitor_qmp_bh_dispatcher,
> -                                   NULL);
> +    qmp_dispatcher_co =3D qemu_coroutine_create(monitor_qmp_dispatcher_c=
o, NULL);
> +    atomic_mb_set(&qmp_dispatcher_co_busy, true);
> +    aio_co_schedule(iohandler_get_aio_context(), qmp_dispatcher_co);
>  }
> =20
>  int monitor_init(MonitorOptions *opts, bool allow_hmp, Error **errp)
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 922fdb5541..5a14062a5b 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -133,6 +133,10 @@ static void monitor_qmp_respond(MonitorQMP *mon, QDi=
ct *rsp)
>      }
>  }
> =20
> +/*
> + * Runs outside of coroutine context for OOB commands, but in
> + * coroutine context for everything else.
> + */
>  static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
>  {
>      QDict *rsp;
> @@ -205,43 +209,99 @@ static QMPRequest *monitor_qmp_requests_pop_any_wit=
h_lock(void)
>      return req_obj;
>  }
> =20
> -void monitor_qmp_bh_dispatcher(void *data)
> +void coroutine_fn monitor_qmp_dispatcher_co(void *data)
>  {
> -    QMPRequest *req_obj =3D monitor_qmp_requests_pop_any_with_lock();
> +    QMPRequest *req_obj =3D NULL;
>      QDict *rsp;
>      bool need_resume;
>      MonitorQMP *mon;
> =20
> -    if (!req_obj) {
> -        return;
> -    }
> +    while (true) {
> +        assert(atomic_mb_read(&qmp_dispatcher_co_busy) =3D=3D true);
> =20
> -    mon =3D req_obj->mon;
> -    /*  qmp_oob_enabled() might change after "qmp_capabilities" */
> -    need_resume =3D !qmp_oob_enabled(mon) ||
> -        mon->qmp_requests->length =3D=3D QMP_REQ_QUEUE_LEN_MAX - 1;
> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
> -    if (req_obj->req) {
> -        QDict *qdict =3D qobject_to(QDict, req_obj->req);
> -        QObject *id =3D qdict ? qdict_get(qdict, "id") : NULL;
> -        trace_monitor_qmp_cmd_in_band(qobject_get_try_str(id) ?: "");
> -        monitor_qmp_dispatch(mon, req_obj->req);
> -    } else {
> -        assert(req_obj->err);
> -        rsp =3D qmp_error_response(req_obj->err);
> -        req_obj->err =3D NULL;
> -        monitor_qmp_respond(mon, rsp);
> -        qobject_unref(rsp);
> -    }
> +        /*
> +         * Mark the dispatcher as not busy already here so that we
> +         * don't miss any new requests coming in the middle of our
> +         * processing.
> +         */
> +        atomic_mb_set(&qmp_dispatcher_co_busy, false);
> +
> +        while (!(req_obj =3D monitor_qmp_requests_pop_any_with_lock())) =
{
> +            /*
> +             * No more requests to process.  Wait to be reentered from
> +             * handle_qmp_command() when it pushes more requests, or
> +             * from monitor_cleanup() when it requests shutdown.
> +             */
> +            if (!qmp_dispatcher_co_shutdown) {
> +                qemu_coroutine_yield();
> +
> +                /*
> +                 * busy must be set to true again by whoever
> +                 * rescheduled us to avoid double scheduling
> +                 */
> +                assert(atomic_xchg(&qmp_dispatcher_co_busy, false) =3D=
=3D true);
> +            }
> +
> +            /*
> +             * qmp_dispatcher_co_shutdown may have changed if we
> +             * yielded and were reentered from monitor_cleanup()
> +             */
> +            if (qmp_dispatcher_co_shutdown) {
> +                return;
> +            }
> +        }
> =20
> -    if (need_resume) {
> -        /* Pairs with the monitor_suspend() in handle_qmp_command() */
> -        monitor_resume(&mon->common);
> -    }
> -    qmp_request_free(req_obj);
> +        if (atomic_xchg(&qmp_dispatcher_co_busy, true) =3D=3D true) {
> +            /*
> +             * Someone rescheduled us (probably because a new requests
> +             * came in), but we didn't actually yield. Do that now,
> +             * only to be immediately reentered and removed from the
> +             * list of scheduled coroutines.
> +             */
> +            qemu_coroutine_yield();
> +        }
> =20
> -    /* Reschedule instead of looping so the main loop stays responsive *=
/
> -    qemu_bh_schedule(qmp_dispatcher_bh);
> +        /*
> +         * Move the coroutine from iohandler_ctx to qemu_aio_context for
> +         * executing the command handler so that it can make progress if=
 it
> +         * involves an AIO_WAIT_WHILE().
> +         */
> +        aio_co_schedule(qemu_get_aio_context(), qmp_dispatcher_co);
> +        qemu_coroutine_yield();
> +
> +        mon =3D req_obj->mon;
> +        /*  qmp_oob_enabled() might change after "qmp_capabilities" */

Extra space after /*

> +        need_resume =3D !qmp_oob_enabled(mon) ||
> +            mon->qmp_requests->length =3D=3D QMP_REQ_QUEUE_LEN_MAX - 1;
> +        qemu_mutex_unlock(&mon->qmp_queue_lock);
> +        if (req_obj->req) {
> +            QDict *qdict =3D qobject_to(QDict, req_obj->req);
> +            QObject *id =3D qdict ? qdict_get(qdict, "id") : NULL;
> +            trace_monitor_qmp_cmd_in_band(qobject_get_try_str(id) ?: "")=
;
> +            monitor_qmp_dispatch(mon, req_obj->req);
> +        } else {
> +            assert(req_obj->err);
> +            rsp =3D qmp_error_response(req_obj->err);
> +            req_obj->err =3D NULL;
> +            monitor_qmp_respond(mon, rsp);
> +            qobject_unref(rsp);
> +        }
> +
> +        if (need_resume) {
> +            /* Pairs with the monitor_suspend() in handle_qmp_command() =
*/
> +            monitor_resume(&mon->common);
> +        }
> +        qmp_request_free(req_obj);
> +
> +        /*
> +         * Yield and reschedule so the main loop stays responsive.
> +         *
> +         * Move back to iohandler_ctx so that nested event loops for
> +         * qemu_aio_context don't start new monitor commands.
> +         */
> +        aio_co_schedule(iohandler_get_aio_context(), qmp_dispatcher_co);
> +        qemu_coroutine_yield();
> +    }
>  }
> =20
>  static void handle_qmp_command(void *opaque, QObject *req, Error *err)
> @@ -302,7 +362,9 @@ static void handle_qmp_command(void *opaque, QObject =
*req, Error *err)
>      qemu_mutex_unlock(&mon->qmp_queue_lock);
> =20
>      /* Kick the dispatcher routine */
> -    qemu_bh_schedule(qmp_dispatcher_bh);
> +    if (!atomic_xchg(&qmp_dispatcher_co_busy, true)) {
> +        aio_co_wake(qmp_dispatcher_co);
> +    }
>  }
> =20
>  static void monitor_qmp_read(void *opaque, const uint8_t *buf, int size)
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 5677ba92ca..8ae5e59648 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -12,12 +12,16 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +
> +#include "block/aio.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/dispatch.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qjson.h"
>  #include "sysemu/runstate.h"
>  #include "qapi/qmp/qbool.h"
> +#include "qemu/coroutine.h"
> +#include "qemu/main-loop.h"
> =20
>  static QDict *qmp_dispatch_check_obj(QDict *dict, bool allow_oob,
>                                       Error **errp)
> @@ -88,6 +92,30 @@ bool qmp_is_oob(const QDict *dict)
>          && !qdict_haskey(dict, "execute");
>  }
> =20
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
> + * Runs outside of coroutine context for OOB commands, but in coroutine =
context

Long line.

> + * for everything else.
> + */
>  QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
>                      bool allow_oob, Monitor *cur_mon)
>  {
> @@ -153,12 +181,26 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QOb=
ject *request,
>          qobject_ref(args);
>      }
> =20
> +    assert(!(oob && qemu_in_coroutine()));
>      assert(monitor_cur() =3D=3D NULL);
> -    monitor_set_cur(qemu_coroutine_self(), cur_mon);
> -
> -    cmd->fn(args, &ret, &err);
> -
> -    monitor_set_cur(qemu_coroutine_self(), NULL);
> +    if ((cmd->options & QCO_COROUTINE) || !qemu_in_coroutine()) {
> +        monitor_set_cur(qemu_coroutine_self(), cur_mon);
> +        cmd->fn(args, &ret, &err);
> +        monitor_set_cur(qemu_coroutine_self(), NULL);
> +    } else {
> +        /* Must drop out of coroutine context for this one */
> +        QmpDispatchBH data =3D {
> +            .cur_mon    =3D cur_mon,
> +            .cmd        =3D cmd,
> +            .args       =3D args,
> +            .ret        =3D &ret,
> +            .errp       =3D &err,
> +            .co         =3D qemu_coroutine_self(),
> +        };
> +        aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_=
bh,
> +                                &data);
> +        qemu_coroutine_yield();
> +    }

Hmm, how does this conditional work?  Command wants coroutine =C3=97 runnin=
g
in coroutine (which is the same as command is OOB) -> four cases.

Not OOB:

* (true, true): call right away

* (false, true): drop out of coroutine context

OOB:

* (false, false): call right away

* (true, false): would have to enter a coroutine, but the previous patch
  outlawed this case.

The conditional does the right thing for the first three.  For the last
one, it doesn't, but it doesn't matter, because the case is impossible.

Okay.

Would the following be easier to understand?

       if (!!(cmd->options & QCO_COROUTINE) =3D=3D qemu_in_coroutine()) {
           call right away...
       } else {
           /*
            * The case "@cmd wants a coroutine, but we're not running in
            * coroutine context" is impossible, because the latter
            * implies oob, and OOB commands must not want a coroutine.
            */
           assert(!(cmd->options & QCO_COROUTINE));
           drop out...
       }

>      qobject_unref(args);
>      if (err) {
>          /* or assert(!ret) after reviewing all handlers: */
> diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
> index d0f9a1d3e3..58c65b5052 100644
> --- a/qapi/qmp-registry.c
> +++ b/qapi/qmp-registry.c
> @@ -20,6 +20,9 @@ void qmp_register_command(QmpCommandList *cmds, const c=
har *name,
>  {
>      QmpCommand *cmd =3D g_malloc0(sizeof(*cmd));
> =20
> +    /* QCO_COROUTINE and QCO_ALLOW_OOB are incompatible for now */
> +    assert(!((options & QCO_COROUTINE) && (options & QCO_ALLOW_OOB)));
> +
>      cmd->name =3D name;
>      cmd->fn =3D fn;
>      cmd->enabled =3D true;
> diff --git a/util/aio-posix.c b/util/aio-posix.c
> index 1b2a3af65b..d427908415 100644
> --- a/util/aio-posix.c
> +++ b/util/aio-posix.c
> @@ -15,6 +15,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "block/block.h"
> +#include "qemu/main-loop.h"
>  #include "qemu/rcu.h"
>  #include "qemu/rcu_queue.h"
>  #include "qemu/sockets.h"
> @@ -563,8 +564,13 @@ bool aio_poll(AioContext *ctx, bool blocking)
>       * There cannot be two concurrent aio_poll calls for the same AioCon=
text (or
>       * an aio_poll concurrent with a GSource prepare/check/dispatch call=
back).
>       * We rely on this below to avoid slow locked accesses to ctx->notif=
y_me.
> +     *
> +     * aio_poll() may only be called in the AioContext's thread. iohandl=
er_ctx
> +     * is special in that it runs in the main thread, but that thread's =
context
> +     * is qemu_aio_context.
>       */
> -    assert(in_aio_context_home_thread(ctx));
> +    assert(in_aio_context_home_thread(ctx =3D=3D iohandler_get_aio_conte=
xt() ?
> +                                      qemu_get_aio_context() : ctx));
> =20
>      /* aio_notify can avoid the expensive event_notifier_set if
>       * everything (file descriptors, bottom halves, timers) will

The code is hairy, but the comments help.  At least they helped when I
grappled with the code for my review of v5; I didn't re-grapple with the
parts that haven't changed since.  I can't see how to make the code less
hairy.

With the typos fixed, the long line wrapped, and with or without my
suggestion on qmp_dispatch():
Reviewed-by: Markus Armbruster <armbru@redhat.com>


