Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E72770CA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 14:20:49 +0200 (CEST)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLQEy-0002oy-Q0
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 08:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLQAf-0000Vl-EO
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 08:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLQAX-0002pw-QO
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 08:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600949769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bb6PtDkNX6ebgV8XYfJLNXYOjSrMe1IuJ42KtVW/svs=;
 b=OpC9FTcslFfeutQHrO15MC6aoGYbVSF55BTvvPtVEELeOSKoKqHZ8HAgeTQOIrQEJv2WXK
 MG8iemK1dhQCfqN/US6FFG09uKnAl2dSRRCfoV4jbdAZVvfmyVFh7W+VykfTNsNCIqKZm+
 15D44XDFlHc+FBoEiiiNDmQ1lsjZeh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-OlntRqKsPaCbyiX-vYxHuw-1; Thu, 24 Sep 2020 08:16:06 -0400
X-MC-Unique: OlntRqKsPaCbyiX-vYxHuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A380800475;
 Thu, 24 Sep 2020 12:16:05 +0000 (UTC)
Received: from localhost (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FCA360C15;
 Thu, 24 Sep 2020 12:16:05 +0000 (UTC)
Date: Thu, 24 Sep 2020 13:16:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v8 7/7] block/io: refactor save/load vmstate
Message-ID: <20200924121604.GZ62770@stefanha-x1.localdomain>
References: <20200915164411.20590-1-vsementsov@virtuozzo.com>
 <20200915164411.20590-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200915164411.20590-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hNrqBtd35jzZL4Yk"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 crosa@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hNrqBtd35jzZL4Yk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 07:44:11PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Like for read/write in a previous commit, drop extra indirection layer,
> generate directly bdrv_readv_vmstate() and bdrv_writev_vmstate().
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/coroutines.h    | 10 +++----
>  include/block/block.h |  6 ++--
>  block/io.c            | 67 ++++++++++++++++++++++---------------------
>  3 files changed, 42 insertions(+), 41 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--hNrqBtd35jzZL4Yk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9sjgQACgkQnKSrs4Gr
c8jS2gf/ft8zdKrG3zqkSzh6KO3GyqKGRbrt1DQ8IEXwTjiQWobcx74b2z5CvUgA
Yc4DgsZ0BeomwMd4HXZdkCKjsyPOzL34WXeuco3C1WJzFmdcViKDPypMO9r6nVvR
rpeoMY2UuXxjr//qF1wtMhl1tN38x7YfkHmpHzftF6HGAbhCoSb0dpS9aplTE2Xu
JKWMnhOQVIjmFSx01QwneKjvVg+p+QNrNo1ErX4Sc8lazpUKizndIxDUCQ9T6NVT
kskHHYObc7L7U4FybWtrImoHju8gCqptDekorqQqWNmQJmDw9EMJtvynd2vvTKcq
4hzfLW6fctUW264tG4rE2UTOrlfk0g==
=3LWr
-----END PGP SIGNATURE-----

--hNrqBtd35jzZL4Yk--


