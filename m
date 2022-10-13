Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59F5FDCCA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:03:06 +0200 (CEST)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oizjl-00036N-5J
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oizhO-0001Sg-Dh
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oizhJ-0007Wz-Ie
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665673232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKysicn/IX/dJbFRCuX3PXvLCYqEHGlU+tl7RbTNvCg=;
 b=Lqsk4/xhtnr9vmkCvQAuj/JwSkaYNOxTvWmvwKSERKANyjNRLi9ka/vf4vHGshKXuv4jrm
 WAPtxvslDQBQHlL9P2hOVNRxMcQ2nQug2JfvRRnd3izdaCQZI2bj6AxT5P874NE+gufehT
 lr8iva7xJXIg/O7XfaggUHb/RJCTjTM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-SW75EIzbM0ScYShMKlRLJg-1; Thu, 13 Oct 2022 11:00:31 -0400
X-MC-Unique: SW75EIzbM0ScYShMKlRLJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9685A101A54E;
 Thu, 13 Oct 2022 15:00:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB20FC15BB3;
 Thu, 13 Oct 2022 15:00:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A272321E691D; Thu, 13 Oct 2022 17:00:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  yc-core@yandex-team.ru,  michael.roth@amd.com,
 vsementsov@yandex-team.ru,  berrange@redhat.com, marcandre.lureau@gmail.com
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
Date: Thu, 13 Oct 2022 17:00:26 +0200
In-Reply-To: <20221011153408.495401-1-den-plotnikov@yandex-team.ru> (Denis
 Plotnikov's message of "Tue, 11 Oct 2022 18:34:08 +0300")
Message-ID: <87tu47vkdx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:

> Add "start" & "end" time values to qmp command responses.

Please spell it QMP.  More of the same below.

>
> These time values are added to let the qemu management layer get the exact
> command execution time without any other time variance which might be bro=
ught by
> other parts of management layer or qemu internals. This is particulary us=
eful
> for the management layer logging for later problems resolving.

I'm still having difficulties seeing the value add over existing
tracepoints and logging.

Can you tell me about a problem you cracked (or could have cracked) with
the help of this?

> Example of result:
>
>     ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
>
>     (QEMU) query-status
>     {"end": {"seconds": 1650367305, "microseconds": 831032},
>      "start": {"seconds": 1650367305, "microseconds": 831012},
>      "return": {"status": "running", "singlestep": false, "running": true=
}}
>
> The responce of the qmp command contains the start & end time of

response

> the qmp command processing.
>
> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Please spell out that this affects both QMP and qemu-ga.

> ---
>
> v0->v1:
>  - remove interface to control "start" and "end" time values: return time=
stamps unconditionally
>  - add description to qmp specification
>  - leave the same timestamp format in "seconds", "microseconds" to be con=
sistent with events
>    timestamp
>  - fix patch description
>
> v1->v2:
>  - rephrase doc descriptions [Daniel]
>  - add tests for qmp timestamps to qmp test and qga test [Daniel]
>  - adjust asserts in test-qmp-cmds according to the new number of returni=
ng keys
>
> v2->v3:
>  - fix typo "timestaps -> timestamps" [Marc-Andr=C3=A9]
>
>  docs/interop/qmp-spec.txt  | 28 ++++++++++++++++++++++++++--
>  qapi/qmp-dispatch.c        | 18 ++++++++++++++++++
>  tests/qtest/qmp-test.c     | 34 ++++++++++++++++++++++++++++++++++
>  tests/unit/test-qga.c      | 31 +++++++++++++++++++++++++++++++
>  tests/unit/test-qmp-cmds.c |  4 ++--
>  5 files changed, 111 insertions(+), 4 deletions(-)
>
> diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
> index b0e8351d5b261..2e0b7de0c4dc7 100644
> --- a/docs/interop/qmp-spec.txt
> +++ b/docs/interop/qmp-spec.txt
> @@ -158,7 +158,9 @@ responses that have an unknown "id" field.
>=20=20
>  The format of a success response is:
>=20=20
> -{ "return": json-value, "id": json-value }
> +{ "return": json-value, "id": json-value,
> +  "start": {"seconds": json-value, "microseconds": json-value},
> +  "end": {"seconds": json-value, "microseconds": json-value} }
>=20=20
>   Where,
>=20=20
> @@ -169,13 +171,25 @@ The format of a success response is:
>    command does not return data
>  - The "id" member contains the transaction identification associated
>    with the command execution if issued by the Client
> +- The "start" member contains the exact time of when the server
> +  started executing the command. This excludes any time the
> +  command request spent queued, after reading it off the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)

What's a "fixed json-object"?

Hmm, I guess you're copying from the description of event member
"timestamp".

Let's go with "a json-object with the number of seconds and microseconds
since the Unix epoch" everywhere.

> +- The "end" member contains the exact time of when the server
> +  finished executing the command. This excludes any time the
> +  command response spent queued, waiting to be sent on the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)
>=20=20
>  2.4.2 error
>  -----------
>=20=20
>  The format of an error response is:
>=20=20
> -{ "error": { "class": json-string, "desc": json-string }, "id": json-val=
ue }
> +{ "error": { "class": json-string, "desc": json-string }, "id": json-val=
ue
> +  "start": {"seconds": json-value, "microseconds": json-value},
> +  "end": {"seconds": json-value, "microseconds": json-value} }
>=20=20
>   Where,
>=20=20
> @@ -184,6 +198,16 @@ The format of an error response is:
>    not attempt to parse this message.
>  - The "id" member contains the transaction identification associated with
>    the command execution if issued by the Client
> +- The "start" member contains the exact time of when the server
> +  started executing the command. This excludes any time the
> +  command request spent queued, after reading it off the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)
> +- The "end" member contains the exact time of when the server
> +  finished executing the command. This excludes any time the
> +  command response spent queued, waiting to be sent on the wire.
> +  It is a fixed json-object with time in seconds and microseconds
> +  relative to the Unix Epoch (1 Jan 1970)
>=20=20
>  NOTE: Some errors can occur before the Server is able to read the "id" m=
ember,
>  in these cases the "id" member will not be part of the error response, e=
ven
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 0990873ec8ec1..fce87416f2128 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -130,6 +130,22 @@ static void do_qmp_dispatch_bh(void *opaque)
>      aio_co_wake(data->co);
>  }
>=20=20
> +static void add_timestamps(QDict *qdict, uint64_t start_ms, uint64_t end=
_ms)
> +{
> +    QDict *start_dict, *end_dict;
> +
> +    start_dict =3D qdict_new();
> +    qdict_put_int(start_dict, "seconds", start_ms / G_USEC_PER_SEC);
> +    qdict_put_int(start_dict, "microseconds", start_ms % G_USEC_PER_SEC);
> +
> +    end_dict =3D qdict_new();
> +    qdict_put_int(end_dict, "seconds", end_ms / G_USEC_PER_SEC);
> +    qdict_put_int(end_dict, "microseconds", end_ms % G_USEC_PER_SEC);
> +
> +    qdict_put_obj(qdict, "start", QOBJECT(start_dict));
> +    qdict_put_obj(qdict, "end", QOBJECT(end_dict));
> +}
> +
>  /*
>   * Runs outside of coroutine context for OOB commands, but in coroutine
>   * context for everything else.
> @@ -146,6 +162,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObje=
ct *request,
>      QObject *id;
>      QObject *ret =3D NULL;
>      QDict *rsp =3D NULL;
> +    uint64_t ts_start =3D g_get_real_time();

Make this int64_t, because that's what g_get_real_time() returns.

Same for add_timestamps() parameters.

>=20=20
>      dict =3D qobject_to(QDict, request);
>      if (!dict) {
> @@ -270,5 +287,6 @@ out:
>          qdict_put_obj(rsp, "id", qobject_ref(id));
>      }
>=20=20
> +    add_timestamps(rsp, ts_start, g_get_real_time());
>      return rsp;
>  }
> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> index 22957fa49c228..e0d83eea91ae5 100644
> --- a/tests/qtest/qmp-test.c
> +++ b/tests/qtest/qmp-test.c
> @@ -33,6 +33,30 @@ static void test_version(QObject *version)
>      visit_free(v);
>  }
>=20=20
> +static void test_timestamps(QDict *resp)
> +{
> +    QDict *start, *end;
> +    uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;

Make these int64_t, because...

> +
> +    start =3D qdict_get_qdict(resp, "start");
> +    g_assert(start);
> +    end =3D qdict_get_qdict(resp, "end");
> +    g_assert(end);
> +
> +    start_s =3D qdict_get_try_int(start, "seconds", 0);

... that's what qdict_get_try_int() returns.

> +    g_assert(start_s);

Fails when the real time clock is within one second of the epoch.
You'll arguably have bigger problems to worry about then.  However, code
that doesn't have this "problem" is simpler:

       start_s =3D qdict_get_int(start, "seconds");

> +    start_us =3D qdict_get_try_int(start, "microseconds", 0);

Use qdict_get_int(), so we actually fail when "microseconds" is absent.

> +
> +    end_s =3D qdict_get_try_int(end, "seconds", 0);
> +    g_assert(end_s);
> +    end_us =3D qdict_get_try_int(end, "microseconds", 0);

Likewise.

> +
> +    start_ts =3D (start_s * G_USEC_PER_SEC) + start_us;
> +    end_ts =3D (end_s * G_USEC_PER_SEC) + end_us;
> +
> +    g_assert(end_ts > start_ts);
> +}
> +
>  static void assert_recovered(QTestState *qts)
>  {
>      QDict *resp;
> @@ -156,6 +180,16 @@ static void test_qmp_protocol(void)
>      g_assert_cmpint(qdict_get_int(resp, "id"), =3D=3D, 2);
>      qmp_expect_error_and_unref(resp, "GenericError");
>=20=20
> +    /* Test timestamps on success */
> +    resp =3D qtest_qmp(qts, "{ 'execute': 'query-version' }");
> +    test_timestamps(resp);
> +    qobject_unref(resp);
> +
> +    /* Test timestamps on error */
> +    resp =3D qtest_qmp(qts, "{ 'execute': 'not-existing-cmd' }");
> +    test_timestamps(resp);
> +    qobject_unref(resp);

I'd be tempted to fold this into existing tests.

> +
>      qtest_quit(qts);
>  }
>=20=20
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index b4e0a145737d1..18ec9bac3650e 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -217,6 +217,36 @@ static void test_qga_ping(gconstpointer fix)
>      qmp_assert_no_error(ret);
>  }
>=20=20
> +static void test_qga_timestamps(gconstpointer fix)
> +{
> +    QDict *start, *end;
> +    uint64_t start_s, start_us, end_s, end_us, start_ts, end_ts;
> +    const TestFixture *fixture =3D fix;
> +    g_autoptr(QDict) ret =3D NULL;
> +
> +    ret =3D qmp_fd(fixture->fd, "{'execute': 'guest-ping'}");
> +    g_assert_nonnull(ret);
> +    qmp_assert_no_error(ret);
> +
> +    start =3D qdict_get_qdict(ret, "start");
> +    g_assert(start);
> +    end =3D qdict_get_qdict(ret, "end");
> +    g_assert(end);
> +
> +    start_s =3D qdict_get_try_int(start, "seconds", 0);
> +    g_assert(start_s);
> +    start_us =3D qdict_get_try_int(start, "microseconds", 0);
> +
> +    end_s =3D qdict_get_try_int(end, "seconds", 0);
> +    g_assert(end_s);
> +    end_us =3D qdict_get_try_int(end, "microseconds", 0);
> +
> +    start_ts =3D (start_s * G_USEC_PER_SEC) + start_us;
> +    end_ts =3D (end_s * G_USEC_PER_SEC) + end_us;
> +
> +    g_assert(end_ts > start_ts);
> +}
> +
>  static void test_qga_id(gconstpointer fix)
>  {
>      const TestFixture *fixture =3D fix;
> @@ -948,6 +978,7 @@ int main(int argc, char **argv)
>      g_test_add_data_func("/qga/sync-delimited", &fix, test_qga_sync_deli=
mited);
>      g_test_add_data_func("/qga/sync", &fix, test_qga_sync);
>      g_test_add_data_func("/qga/ping", &fix, test_qga_ping);
> +    g_test_add_data_func("/qga/timestamps", &fix, test_qga_timestamps);
>      g_test_add_data_func("/qga/info", &fix, test_qga_info);
>      g_test_add_data_func("/qga/network-get-interfaces", &fix,
>                           test_qga_network_get_interfaces);
> diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> index 6085c099950b5..54d63bb8e346f 100644
> --- a/tests/unit/test-qmp-cmds.c
> +++ b/tests/unit/test-qmp-cmds.c
> @@ -154,7 +154,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const=
 char *template, ...)
>      g_assert(resp);
>      ret =3D qdict_get(resp, "return");
>      g_assert(ret);
> -    g_assert(qdict_size(resp) =3D=3D 1);
> +    g_assert(qdict_size(resp) =3D=3D 3);
>=20=20
>      qobject_ref(ret);
>      qobject_unref(resp);
> @@ -181,7 +181,7 @@ static void do_qmp_dispatch_error(bool allow_oob, Err=
orClass cls,
>                      =3D=3D, QapiErrorClass_str(cls));
>      g_assert(qdict_get_try_str(error, "desc"));
>      g_assert(qdict_size(error) =3D=3D 2);
> -    g_assert(qdict_size(resp) =3D=3D 1);
> +    g_assert(qdict_size(resp) =3D=3D 3);
>=20=20
>      qobject_unref(resp);
>      qobject_unref(req);


