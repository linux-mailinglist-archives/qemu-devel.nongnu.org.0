Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B706E3DFD2D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:43:30 +0200 (CEST)
Received: from localhost ([::1]:56050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCUr-0001m3-RN
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBCQq-0004Nt-PJ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBCQo-0007lm-HF
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628066357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xd+bYfDBQZWIuNYdp83FVTvtKdLY7d7dTbldgdwz1IQ=;
 b=fe4SUCCPdy7Bfwh+kC//+ccGaWK/QcK9cJhaM85YvAivqikOt8Rus1418V1euX5uZ3wccA
 8QiD13xE4SX258CqZHNk+jWkffpLIqIAahqk1BbjWwkLPWR4f80O8FuRq3bGWhyeYpVdzi
 ovC4B571TJQzE5jQIkAmEYAKvtV7law=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-5B7JOIYvNdG3nMW-ihcegw-1; Wed, 04 Aug 2021 04:39:16 -0400
X-MC-Unique: 5B7JOIYvNdG3nMW-ihcegw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8A931084F56;
 Wed,  4 Aug 2021 08:39:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC73C781E6;
 Wed,  4 Aug 2021 08:39:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4608411380A0; Wed,  4 Aug 2021 10:39:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] util: fix abstract socket path copy
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
Date: Wed, 04 Aug 2021 10:39:10 +0200
In-Reply-To: <20210719130112.932069-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Mon, 19 Jul 2021 17:01:12 +0400")
Message-ID: <87pmutioy9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: zxq_yx_007@163.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
> support" neglected to update socket_sockaddr_to_address_unix() and
> copied the whole sun_path without taking "salen" into account.
>
> Later, commit 3b14b4ec49 "sockets: Fix socket_sockaddr_to_address_unix()
> for abstract sockets" handled the abstract UNIX path, by stripping the
> leading \0 character and fixing address details, but didn't use salen
> either.
>
> Not taking "salen" into account may result in incorrect "path" being
> returned in monitors commands, as we read past the address which is not
> necessarily \0-terminated.
>
> Fixes: 776b97d3605ed0fc94443048fdf988c7725e38a9
> Fixes: 3b14b4ec49a801067da19d6b8469eb1c1911c020
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  util/qemu-sockets.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 080a240b74..f2f3676d1f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,13 +1345,16 @@ socket_sockaddr_to_address_unix(struct sockaddr_s=
torage *sa,
>      SocketAddress *addr;
>      struct sockaddr_un *su =3D (struct sockaddr_un *)sa;
> =20
> +    assert(salen >=3D sizeof(su->sun_family) + 1 &&
> +           salen <=3D sizeof(struct sockaddr_un));
> +
>      addr =3D g_new0(SocketAddress, 1);
>      addr->type =3D SOCKET_ADDRESS_TYPE_UNIX;
>  #ifdef CONFIG_LINUX
>      if (!su->sun_path[0]) {
>          /* Linux abstract socket */
>          addr->u.q_unix.path =3D g_strndup(su->sun_path + 1,
> -                                        sizeof(su->sun_path) - 1);
> +                                        salen - sizeof(su->sun_family) -=
 1);
>          addr->u.q_unix.has_abstract =3D true;
>          addr->u.q_unix.abstract =3D true;
>          addr->u.q_unix.has_tight =3D true;

Is this for 6.1?


