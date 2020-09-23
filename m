Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224B276460
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 01:16:16 +0200 (CEST)
Received: from localhost ([::1]:48414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLDzi-0004WO-Sk
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 19:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLDxR-0003UZ-0u
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 19:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kLDxP-00008P-Bs
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 19:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600902830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9xXrordbkQC5MGSsUjGYSugWJzAZvBC8SJ/WYX4wNIg=;
 b=CjdqCuTlzsLEYlyjwXoOuzyXImxjuWkiIdWGfT8pWIy/OZmVhgA+8j5ODAFfwBQj2HFp0N
 5yEtfwhWl5fYFMVBtF8a/2TDRDVAH4+Ztdw2XXTCU+ZDFPmoozA5Xpn2WMTzLKGdTQYbSS
 7X7r4YfEmrrGcKRUKXHki4LmSGKFuYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-OmmgeZaCPeSamOR7kvmh5Q-1; Wed, 23 Sep 2020 19:13:46 -0400
X-MC-Unique: OmmgeZaCPeSamOR7kvmh5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 368D21084C96;
 Wed, 23 Sep 2020 23:13:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4755C55768;
 Wed, 23 Sep 2020 23:13:44 +0000 (UTC)
Date: Wed, 23 Sep 2020 19:13:42 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 24/38] qapi/gen.py: Fix edge-case of _is_user_module
Message-ID: <20200923231342.GB296416@localhost.localdomain>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-25-jsnow@redhat.com>
 <20200923151743.GK3312949@habkost.net>
 <5723714c-e784-ece7-5523-d6d3b5f981a1@redhat.com>
 <20200923183335.GU3312949@habkost.net>
 <20200923231032.GY191229@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200923231032.GY191229@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 07:10:35PM -0400, Cleber Rosa wrote:
> On Wed, Sep 23, 2020 at 02:33:35PM -0400, Eduardo Habkost wrote:
> > On Wed, Sep 23, 2020 at 02:29:28PM -0400, John Snow wrote:
> > > On 9/23/20 11:17 AM, Eduardo Habkost wrote:
> > > > This changes behavior if name=3D=3D'', and I guess this is OK, but
> > > > I'm not sure.  I miss documentation on `visit_module()`,
> > > > `visit_include()`, and `_is_user_module()`.  I don't know what
> > > > `name` means here, and what is a "user module".
> > > >=20
> > >=20
> > > Good spot, I missed that.
> > >
>=20
> Nice catch indeed.
>=20
> > > I can probably do: bool(name and not name.startswith('./'))
> > >
>=20
> In this case I like my previous suggestion even better. :)
>=20
> - Cleber.

Never mind me... I noticed that this actually gets called with None.

- Cleber.

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl9r1qYACgkQZX6NM6Xy
CfM7jw/+IDKf3LN+3DwVooTZTCTsyUbdsQN81UlKKEr4Wz8qY+HTf2lRoSci9d5E
enz34DQsYgQv6FdPVYYnPpUM2AE3sEVm2F/PuVqSwc9YZ/cNTDy+BpSi5EWtI4/q
eEEYg80ST20o+GuTktq2BgaijLLmCbElWiuVKgFW4OWkq/WSJzTnra0gWu6iweY+
5BWmdKeKImtcBg71s9E2/yU4oLJ4uOcTgAc5l+bqynGk/q4/7WhLvfK5mqkW9Yt7
X9Lg4AVA/FbfDyBsCGaeDQc4eZFC90sm++LVdhGSVB7Iw9gNInmVpzyL0rx8TDuA
TvFHXfgaNVadW0C/Mqs4yegTPS6YegGkDhDbMq4F0jZP/kCk07OP+21+0RdCaUMs
5VpKVLL832+JloZ0jiegv7iDYmn7J94gUYFSN3TE9giPZRhBMvfJoR23MWrheTFV
H3ZQZ3TndMB2s3Xyt8p5ghH3rx0E9+aS6Nf2u25SP3Z9PQNTtbaNurF7oxX2UMbr
IzY46IXbkjmmZXqjicHsgszHPLWslB8NKGP1GDScBN9sG3eDYTFAUDoYIagyYaqH
7qMRBZE9KUdRmC2wP53MtIlVTX5hiSZmwAjS9xfVIi7J8o5YlKVTZTOmfECODv1Q
WfIfh9iBy8qdysknuXeX+8M6DLqAEgzyT8uZT7o87wfo69hSfWE=
=jAhm
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--


