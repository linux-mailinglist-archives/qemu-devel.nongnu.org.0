Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55B737513F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:07:48 +0200 (CEST)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZz1-0001fW-MX
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZwV-000118-P9
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leZwN-0001hr-F1
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620291902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6N/d+CJP5zM0PQrcJ704EGNJCqUHIPwQjMee4RuYEHY=;
 b=OK8fUwg3vL+xV3bCipdqqLdsSznaPEx07MdwyrDLmPGOR7on/JgoxtqmE2lIvrhhqx3OZ4
 bDFnYmOVZqBvnUHkb8Yywk+KLDRmvCAQWaNCctGpwogFrKJPCGdqpaDyBsMKb/LZZYvYx0
 dUZ/sY9Y2jKDteXuhyl7ZO+xkSlb/Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-6E0drotEOvWS63opgLAwHg-1; Thu, 06 May 2021 05:04:59 -0400
X-MC-Unique: 6E0drotEOvWS63opgLAwHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EC3B10060CA;
 Thu,  6 May 2021 09:04:58 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93E855C1C5;
 Thu,  6 May 2021 09:04:57 +0000 (UTC)
Date: Thu, 6 May 2021 10:04:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 1/8] block: prepare write threshold code for thread
 safety
Message-ID: <YJOxODfge4Men5Ez@stefanha-x1.localdomain>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-2-eesposit@redhat.com>
 <YJJcSqa+EG1U+wMV@stefanha-x1.localdomain>
 <39fe743f-ed26-d806-aa31-37146856790d@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <39fe743f-ed26-d806-aa31-37146856790d@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CD/sYcemfPT7y69k"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--CD/sYcemfPT7y69k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 12:54:09PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Hi Stefan!
>=20
> Note my "[PATCH v2 0/9] block: refactor write threshold", it's a kind of =
counter-proposal for first half of this series.

Thanks! Emanuele mentioned he will drop his patches.

I took a look at your series and that approach looks good to me.

Stefan

--CD/sYcemfPT7y69k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCTsTgACgkQnKSrs4Gr
c8gq+wf8DOzU/mUMZAXchY6QcDmQyNesSsZK4ZCZ93P+FYgCLaOrFQfGUKrMk6Nt
Qd3RZuKs0ntVxWWCqvl6qcwxqf6U/NiF3CNvKc59bu+tITE9ezNph6eRCswAIRgE
aCjUoGyLFoNtfWgHwyVZ1ISnjw3vimj1vQaxjtZfCBWxhk16XN1D9LHLa3HxT8wA
F0Qv5VTZW4FIS4pUgfIe5XdttOq7ZzlGgNldmtuGQgFqiQQG9Y51lmAWpRx3oeck
8PK1efwRm+sHC4MhBpWoWULS2+rVzABzLotrgn0FoFnbw4ed1YIvTbjMZqIbA482
Cg2NA8di27e+HmFSVHqP8MeXtpnf6Q==
=0E+R
-----END PGP SIGNATURE-----

--CD/sYcemfPT7y69k--


