Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6834EC7C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:31:54 +0200 (CEST)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGLR-0005e4-7l
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRGJb-0004ae-0C
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRGJY-0003N6-If
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617118193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vL3+08vvjyomYz+S99eMOAG013fx4QK915YfRk/xJBQ=;
 b=TPGV0yHTvnQ03Y76lxEtCJJKhZmLwQ5k21F6isujQDyGikn9JNXapQoJJdMsfe3VYSWCxh
 Z3q/tRIlndulQaKZiqC/f1zziLE6V+Opum0YubnAA4dgUYUDHUdFpQaWSfO7ZYyKw9v+9x
 tFtaScbFRGtpniyLm2RIGyCzFRAqQFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-yfTfov_uOZW9XiwPy5H-jw-1; Tue, 30 Mar 2021 11:29:50 -0400
X-MC-Unique: yfTfov_uOZW9XiwPy5H-jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF64E49EB;
 Tue, 30 Mar 2021 15:29:49 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6CA51002388;
 Tue, 30 Mar 2021 15:29:48 +0000 (UTC)
Date: Tue, 30 Mar 2021 16:29:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 3/6] coroutine-lock: Store the coroutine in the
 CoWaitRecord only once
Message-ID: <YGND6xn7dcbe1NaP@stefanha-x1.localdomain>
References: <20210325112941.365238-1-pbonzini@redhat.com>
 <20210325112941.365238-4-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210325112941.365238-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8cw0SuHqauOdQ1g3"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: david.edmondson@oracle.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8cw0SuHqauOdQ1g3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 12:29:38PM +0100, Paolo Bonzini wrote:
> From: David Edmondson <david.edmondson@oracle.com>
>=20
> When taking the slow path for mutex acquisition, set the coroutine
> value in the CoWaitRecord in push_waiter(), rather than both there and
> in the caller.
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Message-Id: <20210309144015.557477-4-david.edmondson@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-coroutine-lock.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--8cw0SuHqauOdQ1g3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjQ+sACgkQnKSrs4Gr
c8itjwf/To+7tzCiIy5XnQI2V4eKiro2fyl01nJYM5/n59udePVPEzeNhsZ+A7bU
r2q96cEA8Gr2yJSZkZ9nrjMW9sa02BGOHOotMf/O07aS59q4+2U+JiquWdS5S5AV
6rvlNNl/MS4NpUt639jFjrXPHffjFcfKMxnQupDhCNV0Gf26Q8yuKQnORDaTUfMb
fkAyMoEv0zhW+Rz4c7wlz3f7qWq0vWJE4mJ2rjKV6HeP7IeKnO2TWcviakgU8NRj
eQ0TxL1sz57+Xo6Q68MT4z2aXjxaXGMUai4nlq89BzM71+ILk6JE5TVfhOYhq7ED
0pqnQO9NdHMN/k5Lfn6EF1URefUktA==
=p3jD
-----END PGP SIGNATURE-----

--8cw0SuHqauOdQ1g3--


