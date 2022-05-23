Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C16530EA0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:05:08 +0200 (CEST)
Received: from localhost ([::1]:34292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt6o6-0003o8-Q9
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nt6lD-00020w-Rk
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nt6lB-0007yL-6X
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653307320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CC8bJCauQJ9oTCHwwTDM4HSg39wSWV60eXPBT6s5oNQ=;
 b=FJ2x01sgYk7K45N1vsvfbw0bpE3cBiPMzArUo/lOo/nXLR5Pkg9wCNFNbANuLCphhtJGvg
 Tyx5doZxgVRI+CW+awhU5C6P7fawOIDHNSLa0JyqwUyYH1QKRyCb3HVJzK7/ia2mSkZVeG
 vulq6qsBa+TEGblBJihZsslbFWGfXJc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-KEXLGHSINDaN5QcwZw8tmg-1; Mon, 23 May 2022 08:01:59 -0400
X-MC-Unique: KEXLGHSINDaN5QcwZw8tmg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD96B188142F;
 Mon, 23 May 2022 12:01:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80F96492C3B;
 Mon, 23 May 2022 12:01:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49D9021E6906; Mon, 23 May 2022 14:01:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 05/15] osdep: export qemu_open_cloexec()
References: <20220513180821.905149-1-marcandre.lureau@redhat.com>
 <20220513180821.905149-6-marcandre.lureau@redhat.com>
Date: Mon, 23 May 2022 14:01:57 +0200
In-Reply-To: <20220513180821.905149-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 13 May 2022 20:08:11 +0200")
Message-ID: <87mtf88nka.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Used in the next patch, to simplify qga code.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

The commit mesage makes me expect a change to external linkage plus a
declaration in the header, but ...

> ---
>  include/qemu/osdep.h |  1 +
>  util/osdep.c         | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 67cc465416..64f51cfb7a 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -489,6 +489,7 @@ void sigaction_invoke(struct sigaction *action,
>   */
>  int qemu_open_old(const char *name, int flags, ...);
>  int qemu_open(const char *name, int flags, Error **errp);
> +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error **=
errp);
>  int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
>  int qemu_close(int fd);
>  int qemu_unlink(const char *name);
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..545a88e1fd 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -279,9 +279,11 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t=
 len, bool exclusive)
>  }
>  #endif
>=20=20
> -static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
> +int qemu_open_cloexec(const char *name, int flags, mode_t mode, Error **=
errp)
>  {
> +    ERRP_GUARD();

Looks redundant to me.

>      int ret;
> +
>  #ifdef O_CLOEXEC
>      ret =3D open(name, flags | O_CLOEXEC, mode);
>  #else
> @@ -290,6 +292,10 @@ static int qemu_open_cloexec(const char *name, int f=
lags, mode_t mode)
>          qemu_set_cloexec(ret);
>      }
>  #endif
> +    if (ret =3D=3D -1) {
> +        error_setg_errno(errp, errno, "Failed to open file '%s'", name);
> +    }
> +
>      return ret;
>  }
>=20=20
> @@ -327,7 +333,7 @@ qemu_open_internal(const char *name, int flags, mode_=
t mode, Error **errp)
>      }
>  #endif
>=20=20
> -    ret =3D qemu_open_cloexec(name, flags, mode);
> +    ret =3D qemu_open_cloexec(name, flags, mode, NULL);
>=20=20
>      if (ret =3D=3D -1) {
>          const char *action =3D flags & O_CREAT ? "create" : "open";

... the patch additionally changes how errors are communicated.  Please
cover that in the commit message.


