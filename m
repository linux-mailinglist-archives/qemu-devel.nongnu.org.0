Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C422737A46A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:16:08 +0200 (CEST)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPQt-0001r1-R0
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgPMn-0005W6-SQ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgPMh-0001mW-T6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620727907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3DBUvigqD8ENnuNmniUd1KZO28woNokIGxjwvTOPy18=;
 b=fu3TZZUGJhkhS06iUlEPeCxpUPdmdtJe52//BfGP3+ZWG33V/jGP78qBz40xQm/YrQy2EA
 1sDO5061m5GrqkExeRMvagviIiPuuP6nI1nZMOe6GH3CFw2vaswQmfTfZDsB46hEGn+UoT
 DZkrGwuYm89j8+VH7YWKsCxvZqfh7Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-EFK1BmBZMA6BVdhx8PMKUQ-1; Tue, 11 May 2021 06:11:43 -0400
X-MC-Unique: EFK1BmBZMA6BVdhx8PMKUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 080A710066E6;
 Tue, 11 May 2021 10:11:42 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 087176E41C;
 Tue, 11 May 2021 10:11:37 +0000 (UTC)
Date: Tue, 11 May 2021 11:11:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/2] virtio-blk: Convert QEMUBH callback to "bitops.h"
 API
Message-ID: <YJpYWRZirHv3QBCJ@stefanha-x1.localdomain>
References: <20210510200758.2623154-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210510200758.2623154-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QQTTytiIVo9hw2vA"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Chai Wen <chaiwen@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QQTTytiIVo9hw2vA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:07:56PM +0200, Philippe Mathieu-Daud=E9 wrote:
> This series follow a suggestion from Stefan to use the bitops
> API in virtio-blk:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg805139.html
>=20
> Since v2:
> - clear bitmap to avoid spurious interrupts! (Stefan)
> - use 'further' in find_next docstring (Eric)
> - added Richard R-b tag
>=20
> Since v1:
> - improved "bitops.h" docstring
> - addressed Richard's review comments
>=20
> Philippe Mathieu-Daud=E9 (2):
>   bitops.h: Improve find_xxx_bit() documentation
>   virtio-blk: Convert QEMUBH callback to "bitops.h" API
>=20
>  include/qemu/bitops.h           | 15 ++++++++++++---
>  hw/block/dataplane/virtio-blk.c | 20 +++++---------------
>  2 files changed, 17 insertions(+), 18 deletions(-)
>=20
> --=20
> 2.26.3
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--QQTTytiIVo9hw2vA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCaWFkACgkQnKSrs4Gr
c8jzKgf9HD9Nqqu359RG5pC2Dwcp20JWiLGR5JyLSnrasqsGMxtuh571uSxFZnYt
ozM7NhzkTt9+IDaQfSqRBFVYsvIgHlhzr+nDabUcqAbt52DQU1C7h3s2tyldT0j5
b6+o0rWAReeFQkS1t28CzbrSOOghxDEvjAu0TKiZT3HWQWb51iENEPMHjfIgZvqv
u8zNkPSDgOF/Xejun3GO+0CC+AxMj38BcqWHNJujFvd/KJ7nToTCOTJA8IUTSpjT
Nob/9VkxGZh7K8eTWHqgOOn69XNvye+OCuOPUlJtDdqCZBfjXO6z+zJ+drDCZIMw
iKaIoqLN1HrWgxWm1X+e6sr1ZMabfw==
=gZIp
-----END PGP SIGNATURE-----

--QQTTytiIVo9hw2vA--


