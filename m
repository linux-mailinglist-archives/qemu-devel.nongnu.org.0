Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F492646EE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 15:27:11 +0200 (CEST)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGMbV-0004fB-Or
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 09:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kGMZI-0002cJ-CJ
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kGMZD-0007eK-4o
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599744284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wu5s+79DMQv3J0MyqK7XbxTcUlGQKS/Q+RF78M+NF18=;
 b=aq4A9uZFxjfhWkwcOWc7v4l/owdvq16febvqhhRWl2kpMA7dm4tyGIbwRK9OwKGwgqW/wy
 tGfMUdexEIaXvA1X1g/O4ii2K7DZSbnumO13Z0WuD5qcy0pJM9d1CV0Fv3qws5q+k1s0zK
 UGDLI0Qprlqp/01G66gO5q0Zyjdi9rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-HhJRs8IJOreeMqlQZ0yBqQ-1; Thu, 10 Sep 2020 09:24:42 -0400
X-MC-Unique: HhJRs8IJOreeMqlQZ0yBqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45F25801FDF;
 Thu, 10 Sep 2020 13:24:41 +0000 (UTC)
Received: from localhost (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD4AC27CC1;
 Thu, 10 Sep 2020 13:24:40 +0000 (UTC)
Date: Thu, 10 Sep 2020 14:24:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v7 00/13] monitor: Optionally run handlers in coroutines
Message-ID: <20200910132439.GE45048@stefanha-x1.localdomain>
References: <20200909151149.490589-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200909151149.490589-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:38:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, armbru@redhat.com,
 qemu-block@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 05:11:36PM +0200, Kevin Wolf wrote:
> Some QMP command handlers can block the main loop for a relatively long
> time, for example because they perform some I/O. This is quite nasty.
> Allowing such handlers to run in a coroutine where they can yield (and
> therefore release the BQL) while waiting for an event such as I/O
> completion solves the problem.
>=20
> This series adds the infrastructure to allow this and switches
> block_resize to run in a coroutine as a first example.
>=20
> This is an alternative solution to Marc-Andr=E9's "monitor: add
> asynchronous command type" series.

Please clarify the following in the QAPI documentation:
 * Is the QMP monitor suspended while the command is pending?
 * Are QMP events reported while the command is pending?

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9aKRcACgkQnKSrs4Gr
c8iFdgf/YRmkiReZ7StGO3826yE7YupNlT7YNlv4eRGuv0H6kLRpk8jptgRJDwVO
ZUqOAU6ObEMepRlmrO05opiSLFYqCEmqIofOV13NkGX8FYs7F+EBAyWz01Ofk/1I
WJYgmHDs+iInIM1r2oNmzOReA+01mKO14ZG4gtjUUKOZPOuvFsyZmzHva+frZNZd
8vOc5fiVdmlbTW4myGoelOsZhcL+0TkPiRAs0POQVrp83UBjRNAhxBglZ9469MKt
mEK4617DCxjhjxH4c14Y+80PvHxV3NBSjOjQvC37X2E4FQZl0ph24dL8s5dSGZhc
RBa9gsyphTZ2nFRVwKcd57zYf5r/vQ==
=jZUE
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--


