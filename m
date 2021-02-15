Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D04131BDE1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:58:50 +0100 (CET)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgGv-0000F8-IZ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lBgFb-0007nV-NQ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lBgFa-0001V1-5o
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613404645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZfq79Da3uTkittJEqhUW+Oi6C5CdJ7LzHr0GuC9EyY=;
 b=IVKUFv0iBn2sEay3rdTrteH4hxViLiLucU3XTywUC3xICS/ocxPEejjbthWftkDdsXm7EO
 xchKKThQq+5zXfC3JvgqrwHTtgdy/MVMP9uLA4n1xySd38NdqQWOQGNF3NP6VJkM4TJUly
 aTSLLfA6nI44CrjqeQNzS8YWshLd+lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-f1VbjurHPKSsg0eF3Cf7jg-1; Mon, 15 Feb 2021 10:57:23 -0500
X-MC-Unique: f1VbjurHPKSsg0eF3Cf7jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A7F2106BB24
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 15:57:22 +0000 (UTC)
Received: from localhost (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BC845D9C0;
 Mon, 15 Feb 2021 15:57:12 +0000 (UTC)
Date: Mon, 15 Feb 2021 15:57:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 23/24] vhost-user-fs: Implement drop CAP_FSETID
 functionality
Message-ID: <20210215155711.GA95852@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-24-dgilbert@redhat.com>
 <20210211143542.GT247031@stefanha-x1.localdomain>
 <20210211144031.GB5014@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211144031.GB5014@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 09:40:31AM -0500, Vivek Goyal wrote:
> On Thu, Feb 11, 2021 at 02:35:42PM +0000, Stefan Hajnoczi wrote:
> > On Tue, Feb 09, 2021 at 07:02:23PM +0000, Dr. David Alan Gilbert (git) =
wrote:
> > > From: Vivek Goyal <vgoyal@redhat.com>
> > >=20
> > > As part of slave_io message, slave can ask to do I/O on an fd. Additi=
onally
> > > slave can ask for dropping CAP_FSETID (if master has it) before doing=
 I/O.
> > > Implement functionality to drop CAP_FSETID and gain it back after the
> > > operation.
> > >=20
> > > This also creates a dependency on libcap-ng.
> >=20
> > Is this patch only for the case where QEMU is running as root?
> >=20
>=20
> Yes, it primarily is for the case where qemu is running as root, or
> somebody managed to launch it non-root but with still having capability
> CAP_FSETID.

Running QEMU as root is not encouraged because the security model is
designed around the principle of least privilege (only give QEMU access
to resources that belong to the guest).

What happens in the case where QEMU is not root? Does that mean QEMU
will drop suid/guid bits even if the FUSE client wanted them to be
preserved?

Stefan

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAqmdcACgkQnKSrs4Gr
c8iYPQf+ItykL4kTL3tGtciggQvbGHX/AMImfY87LtKrT9teSO+cRq7s70fnwhqj
3EExD7CtMYVO1q0CrJgfN7ICd2melPLkD5FHc2oAm4KW1Zb4/B1KoB8A+j3SJLsO
6zfqx5JMCVaHheEUxqoiMfsgwyH1H8rhBjQjr4/XQ3vNZJ+OsWiYFsENqi3HcH6S
tF83XT4iXzsyXXJ4N/59bSQWtJHnWQ/9o6tD513aMwJiU5d9HxYqjp4avBXKs5zy
mk2vRkr7gi8maknAOIfzcNggQAhsHNIfW1FPvzUbBdr5Y+MMohVNCUNX+9BLsq/O
zV2WMshVc4YPGk9SqGPOETlKsEsQhQ==
=GsZz
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--


