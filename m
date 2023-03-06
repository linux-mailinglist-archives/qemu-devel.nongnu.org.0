Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A756AC705
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDIQ-0001Kf-I9; Mon, 06 Mar 2023 11:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZDI4-0000yW-Ce
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZDI1-0007Ok-DK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:02:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678118531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMRUW3Fr0PLF4H6o/tLmwEMRzLIo9qpWT5KcBzfWNJg=;
 b=L4Gsr0dH7T/tPBZDSYggTel9d/S08ZOtq/1Ti7BkpXXly08RQpfmlCIhQHClaLNMxuxfJi
 nx0pqyNPbYayRZYLAfydpCDLRRBSTTrZtge/w0+hGGGmapj81mBfpsnh2L/xPnCeALfd6f
 Ylb3Y1pJd4x/Ij4kQWd++oczgWD90/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-JlPgbiVBN5-1DAvFaJfuGQ-1; Mon, 06 Mar 2023 11:01:53 -0500
X-MC-Unique: JlPgbiVBN5-1DAvFaJfuGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5902101A52E;
 Mon,  6 Mar 2023 16:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C22DD440DD;
 Mon,  6 Mar 2023 16:01:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA1E021E6A1F; Mon,  6 Mar 2023 17:01:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Michael Roth
 <michael.roth@amd.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eric Blake <eblake@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 11/11] QMP/HMP: only actually implement getfd on
 CONFIG_POSIX
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-12-marcandre.lureau@redhat.com>
Date: Mon, 06 Mar 2023 17:01:22 +0100
In-Reply-To: <20230306122751.2355515-12-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Mon, 6 Mar 2023 16:27:51 +0400")
Message-ID: <87sfehhnsd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Regarding the subject line:

1. We use "qmp:" for qmp-only patches, "hmp:" for hmp-only patches, and
"monitor:" for both.  "qmp hmp:" would work there, too.

2. We're not implementing anything, we're restricting the existing
implementation to hosts where it is actually useful.

Suggest "monitor: Restrict command getfd to POSIX hosts"

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Currently, the function will simply fail if ancillary fds are not
> provided, for ex on unsupported platforms.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi/misc.json     | 2 +-
>  monitor/fds.c      | 2 ++
>  monitor/hmp-cmds.c | 2 ++
>  hmp-commands.hx    | 2 ++
>  4 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 031c94050c..96c053e305 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -273,7 +273,7 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'getfd', 'data': {'fdname': 'str'} }
> +{ 'command': 'getfd', 'data': {'fdname': 'str'}, 'if': 'CONFIG_POSIX' }
>=20=20
>  ##
>  # @get-win32-socket:

This changes the failure from

    {"error": {"class": "GenericError", "desc": "No file descriptor supplie=
d via SCM_RIGHTS"}}

to

    {"error": {"class": "CommandNotFound", "desc": "The command getfd has n=
ot been found"}}

when CONFIG_POSIX is off.  I think this is fine.  But I'd like the
commit message to document it.


> diff --git a/monitor/fds.c b/monitor/fds.c
> index 9ed4197358..d86c2c674c 100644
> --- a/monitor/fds.c
> +++ b/monitor/fds.c
> @@ -98,6 +98,7 @@ static bool monitor_add_fd(Monitor *mon, int fd, const =
char *fdname, Error **err
>      return true;
>  }
>=20=20
> +#ifdef CONFIG_POSIX
>  void qmp_getfd(const char *fdname, Error **errp)
>  {
>      Monitor *cur_mon =3D monitor_cur();
> @@ -111,6 +112,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>=20=20
>      monitor_add_fd(cur_mon, fd, fdname, errp);
>  }
> +#endif
>=20=20
>  void qmp_closefd(const char *fdname, Error **errp)
>  {
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 34bd8c67d7..6c559b48c8 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -192,6 +192,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>      hmp_handle_error(mon, err);
>  }
>=20=20
> +#ifdef CONFIG_POSIX
>  void hmp_getfd(Monitor *mon, const QDict *qdict)
>  {
>      const char *fdname =3D qdict_get_str(qdict, "fdname");
> @@ -200,6 +201,7 @@ void hmp_getfd(Monitor *mon, const QDict *qdict)
>      qmp_getfd(fdname, &err);
>      hmp_handle_error(mon, err);
>  }
> +#endif
>=20=20
>  void hmp_closefd(Monitor *mon, const QDict *qdict)
>  {
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index b87c250e23..bb85ee1d26 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1486,6 +1486,7 @@ SRST
>    Inject an MCE on the given CPU (x86 only).
>  ERST
>=20=20
> +#ifdef CONFIG_POSIX
>      {
>          .name       =3D "getfd",
>          .args_type  =3D "fdname:s",
> @@ -1501,6 +1502,7 @@ SRST
>    mechanism on unix sockets, it is stored using the name *fdname* for
>    later use by other monitor commands.
>  ERST
> +#endif
>=20=20
>      {
>          .name       =3D "closefd",

With the commit message brushed up:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


