Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C12F7DB3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:07:58 +0100 (CET)
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pld-0007Kh-29
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0PIQ-0005fB-Ew
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:37:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0PIO-0001Og-IJ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610717863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRiWcvBf721AOOYkoFLH/uOnwVV69RW1EuYpKikvKxI=;
 b=eVUwB61N/NKELNKMMHGUE+hDFdvin5SR/6FYDc1xY1komNEpGIUtrp23th0MBoASp1GuQv
 66fdQbKBa1AU8lpFzS3z9nLDq+UGVd/r27TK4337TG4JzDHCpAEfVfTh4INtzBerhHKT70
 n7c/iPm3qTXjgixiWyH7aQcOOJUafQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Gf3wrJv3OUqDTlE88ZNyPQ-1; Fri, 15 Jan 2021 08:37:42 -0500
X-MC-Unique: Gf3wrJv3OUqDTlE88ZNyPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17B25879513;
 Fri, 15 Jan 2021 13:37:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-142.ams2.redhat.com
 [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 069CC5D739;
 Fri, 15 Jan 2021 13:37:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 807EC11386A7; Fri, 15 Jan 2021 14:37:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH v2 2/2] vnc: add qmp to support reload vnc tls certificates
References: <20210107143032.752-1-changzihao1@huawei.com>
 <20210107143032.752-3-changzihao1@huawei.com>
Date: Fri, 15 Jan 2021 14:37:33 +0100
In-Reply-To: <20210107143032.752-3-changzihao1@huawei.com> (Zihao Chang's
 message of "Thu, 7 Jan 2021 22:30:32 +0800")
Message-ID: <87turil3s2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: oscar.zhangbo@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zihao Chang <changzihao1@huawei.com> writes:

> QEMU loads vnc tls certificates only when vm is started. This patch
> provides a new qmp to reload vnc tls certificates without restart
> vnc-server/VM.
> {"execute": "reload-vnc-cert"}
>
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  include/ui/console.h |  1 +
>  monitor/qmp-cmds.c   |  5 +++++
>  qapi/ui.json         | 18 ++++++++++++++++++
>  ui/vnc.c             | 24 ++++++++++++++++++++++++
>  4 files changed, 48 insertions(+)
>
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 5dd21976a3..60a24a8bb5 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -441,6 +441,7 @@ int vnc_display_password(const char *id, const char *=
password);
>  int vnc_display_pw_expire(const char *id, time_t expires);
>  QemuOpts *vnc_parse(const char *str, Error **errp);
>  int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
> +void vnc_display_reload_cert(const char *id,  Error **errp);

Make this return bool, please.

error.h's big comment:

 * =3D Rules =3D
 *
 * - Functions that use Error to report errors have an Error **errp
 *   parameter.  It should be the last parameter, except for functions
 *   taking variable arguments.
 *
 * - You may pass NULL to not receive the error, &error_abort to abort
 *   on error, &error_fatal to exit(1) on error, or a pointer to a
 *   variable containing NULL to receive the error.
 *
 * - Separation of concerns: the function is responsible for detecting
 *   errors and failing cleanly; handling the error is its caller's
 *   job.  Since the value of @errp is about handling the error, the
 *   function should not examine it.
 *
 * - The function may pass @errp to functions it calls to pass on
 *   their errors to its caller.  If it dereferences @errp to check
 *   for errors, it must use ERRP_GUARD().
 *
 * - On success, the function should not touch *errp.  On failure, it
 *   should set a new error, e.g. with error_setg(errp, ...), or
 *   propagate an existing one, e.g. with error_propagate(errp, ...).
 *
 * - Whenever practical, also return a value that indicates success /
 *   failure.  This can make the error checking more concise, and can
 *   avoid useless error object creation and destruction.  Note that
 *   we still have many functions returning void.  We recommend
 *   =E2=80=A2 bool-valued functions return true on success / false on fail=
ure,
 *   =E2=80=A2 pointer-valued functions return non-null / null pointer, and
 *   =E2=80=A2 integer-valued functions return non-negative / negative.

> =20
>  /* input.c */
>  int index_from_key(const char *key, size_t key_length);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 34f7e75b7b..84f2b74ea8 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -287,6 +287,11 @@ static void qmp_change_vnc(const char *target, bool =
has_arg, const char *arg,
>          qmp_change_vnc_listen(target, errp);
>      }
>  }
> +
> +void qmp_reload_vnc_cert(Error **errp)
> +{
> +    vnc_display_reload_cert(NULL, errp);
> +}
>  #endif /* !CONFIG_VNC */
> =20
>  void qmp_change(const char *device, const char *target,
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d08d72b439..855b1ac007 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1179,3 +1179,21 @@
>  ##
>  { 'command': 'query-display-options',
>    'returns': 'DisplayOptions' }
> +
> +##
> +# @reload-vnc-cert:
> +#
> +# Reload certificates for vnc.
> +#
> +# Returns: nothing
> +#
> +# Since: 5.2

6.0 now.

> +#
> +# Example:
> +#
> +# -> { "execute": "reload-vnc-cert" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'reload-vnc-cert',
> +  'if': 'defined(CONFIG_VNC)' }

Daniel's objection to another patch that adds a rather specialized QMP
command may apply: "I'm not a fan of adding adhoc new commands for
specific properties."

    From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
    Subject: Re: [PATCH] vnc: add qmp to support change authz
    Message-ID: <20210107161830.GE1029501@redhat.com>

[...]


