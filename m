Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6D837383C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:59:50 +0200 (CEST)
Received: from localhost ([::1]:60058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEJp-0000Oc-Ut
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEHv-0008Gg-HN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:57:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEHt-0000mA-2A
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620208668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6HDf38rxkjxFnyAcBgVx1U7MOK9CBa1leiohEogP3hg=;
 b=cOXmWrL6ja7NO2FL/NKWfJoufW4K8OphQVea+lCE+Amrx6WfNL+V4UGgaBDZdJ5pYhDMR2
 DLxWkyifbeHmUM52kgCeJr6wnnc6cDkht4OlxxZRBlNYTPyy2gMJirud9Ph249MZ/0OmFD
 T27F8KRSfrbLqB4MwEoh8U0faFpyU4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-tHbKBN2cMqa6_AOKXzh76w-1; Wed, 05 May 2021 05:57:46 -0400
X-MC-Unique: tHbKBN2cMqa6_AOKXzh76w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5563384A5E4;
 Wed,  5 May 2021 09:57:45 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7E65D6D1;
 Wed,  5 May 2021 09:57:44 +0000 (UTC)
Date: Wed, 5 May 2021 10:57:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 7/8] block/replication: do not acquire AioContext
Message-ID: <YJJsGOKLz3Ywe450@stefanha-x1.localdomain>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-8-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8tB8DGphw7AFSZbM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8tB8DGphw7AFSZbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:55:40AM +0200, Emanuele Giuseppe Esposito wrote:
> @@ -210,7 +212,7 @@ static int replication_return_value(BDRVReplicationSt=
ate *s, int ret)
>      }
> =20
>      if (ret < 0) {
> -        s->error =3D ret;
> +        qatomic_set(&s->error, ret);
>          ret =3D 0;
>      }
> =20
> @@ -307,6 +309,7 @@ out:
>      return ret;
>  }
> =20
> +/* Called with no I/O pending.  */

It would be clearer to refer to the specific guarantee that no I/O is
pending, like "Called from a drained section". There are more comments
like this one below.

--8tB8DGphw7AFSZbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSbBcACgkQnKSrs4Gr
c8j55ggAykW2UyXKc7yfSjD/9r14QdPgFa1yWMNymIqtouS6NVo/GWWLjoW7SUHP
lx0rBEkUHvMwmJ5cXikwE4Nc/Q2uEaCSDJTvhS4T3ZPBzlFmeSN4KYda/gA/xbLV
rNhYpFSFnklvf7dFlqEYcwHlWo635//0XktjabOc7brMJZCqyXMUHG3+JFiAkBLw
UioEQcEyjiaGXDrfjdaohIVomLz+9CEuyz1VvSMiKTQG/4qjGnL8A3rPiP12WQJX
rNKJI6zZPr8eNFMhbMMmB1MxQ00ROyadei6EBbPMvUWoVQvAkAqy/1Ql3UkdEqdg
S7Uxy3S9aiX1yEpr1kNtl21C96a3Xg==
=vrIi
-----END PGP SIGNATURE-----

--8tB8DGphw7AFSZbM--


