Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2C6964C0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvRL-0000mM-4R; Tue, 14 Feb 2023 08:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRvRG-0000lh-Uk
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:33:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRvRE-0006R5-L9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676381619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgA3r97qdXGEICjuVTLv0ZlwP3ThIfgGHuibj9Twhyw=;
 b=arv3PZhbTE+Kw1wQadCiIRoqh7lmLvdqsb26GSQ2HkQPicW8ZFJY8Un5uholRh3yBa3Jy6
 hd4LN8rN9eJqpinc9AbDYhcMw2QYOdtUwi8aD7CzMdaoR3HBUGqD527eEjYt/2GlC24eTJ
 AWYSedN3+s9WxPvK68GRwK7L85+BSeY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-8AlyqY5mMjiAXEv1kxoa7g-1; Tue, 14 Feb 2023 08:33:38 -0500
X-MC-Unique: 8AlyqY5mMjiAXEv1kxoa7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2234100F906;
 Tue, 14 Feb 2023 13:33:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9294400D927;
 Tue, 14 Feb 2023 13:33:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3D5421E6A1F; Tue, 14 Feb 2023 14:33:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Beraldo Leal <bleal@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 06/10] monitor: release the lock before calling close()
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
Date: Tue, 14 Feb 2023 14:33:35 +0100
In-Reply-To: <20230207142535.1153722-7-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Feb 2023 18:25:31 +0400")
Message-ID: <873578id74.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> As per comment, presumably to avoid syscall in critical section.
>
> Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  monitor/fds.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/monitor/fds.c b/monitor/fds.c
> index 26b39a0ce6..03c5e97c35 100644
> --- a/monitor/fds.c
> +++ b/monitor/fds.c
> @@ -80,7 +80,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>          return;
>      }
>=20=20
> -    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> +    qemu_mutex_lock(&cur_mon->mon_lock);
>      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
>          if (strcmp(monfd->name, fdname) !=3D 0) {
>              continue;
> @@ -88,6 +88,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>=20=20
>          tmp_fd =3D monfd->fd;
>          monfd->fd =3D fd;
> +        qemu_mutex_unlock(&cur_mon->mon_lock);
>          /* Make sure close() is outside critical section */
>          close(tmp_fd);
>          return;
> @@ -98,6 +99,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>      monfd->fd =3D fd;
>=20=20
>      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> +    qemu_mutex_unlock(&cur_mon->mon_lock);
>  }
>=20=20
>  void qmp_closefd(const char *fdname, Error **errp)

This confused me.  I think I understand now, but let's double-check.

You're reverting commit 0210c3b39bef08 for qmp_getfd() because it
extended the criticial section beyond the close(), invalidating the
comment.  Correct?

Did it actually break anything?


