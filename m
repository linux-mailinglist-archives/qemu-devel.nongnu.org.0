Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A90303A13
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:20:32 +0100 (CET)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LSY-0002qm-8e
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4LR2-000275-Ng
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:18:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4LR0-0004py-UE
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:18:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611656333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0As0S4N0P06/rbcrqYWIRnEKHQMs/HCWIna6b4C/bko=;
 b=JqtaykPwpx/csvQiaCFyRxrsxXpjVfqEtdB23GBNeYIosULYZXcFSQl57ExLtUdVOZlHEg
 Tz0S6DHRf1DyQKhK+MRmQoKs4SEwaEocCDoNLA8U9kwKK0CeOzStSxYfmspfSnIOAqAcvJ
 C11hMc0O8HZSz8MnvDzSrV/ZzqKqqUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-FdAm1OIIOzyi8u0_Rnv6rw-1; Tue, 26 Jan 2021 05:18:49 -0500
X-MC-Unique: FdAm1OIIOzyi8u0_Rnv6rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF34318C8C11;
 Tue, 26 Jan 2021 10:18:48 +0000 (UTC)
Received: from localhost (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DAAB77712;
 Tue, 26 Jan 2021 10:18:40 +0000 (UTC)
Date: Tue, 26 Jan 2021 10:18:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210126101839.GC226981@stefanha-x1.localdomain>
References: <20210121144429.58885-1-stefanha@redhat.com>
 <CAOssrKfjLrR0TXqPgk7sYAz9xiuNankgQpOtX69-zXWaGOnu6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKfjLrR0TXqPgk7sYAz9xiuNankgQpOtX69-zXWaGOnu6w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Sergio Lopez Pascual <slp@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 05:12:23PM +0100, Miklos Szeredi wrote:
> On Thu, Jan 21, 2021 at 3:44 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
>=20
> > This patch adds the missing checks to virtiofsd. This is a short-term
> > solution because it does not prevent a compromised virtiofsd process
> > from opening device nodes on the host.
>=20
> I think the proper solution is adding support to the host in order to
> restrict opens on filesystems that virtiofsd has access to.
>=20
> My idea was to add a "force_nodev" mount option that cannot be
> disabled and will make propagated mounts  also be marked
> "force_nodev,nodev".

Interesting idea! Mount options that are relevant:
 * noexec
 * nosuid
 * nodev
 * nosymfollow

Do you have time to work on the force_* mount options?

> A possibly simpler solution is to extend seccomp to restrict the
> process itself from being able to open special files.  Not sure if
> that's within the scope of seccomp though.

I don't think seccomp can provide that restriction since it's unrelated
to the syscall or its arguments.

Stefan

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAP7H8ACgkQnKSrs4Gr
c8jdSwf9E1mD1VAaCfckl0hm6tbK8c1Wt54RHVHhQf35aUTrvJ3OlHkTAHa8vNRj
70enEUf44Nb3xnVXMHeVW1/oS9DmuMqgjTHZx6rK6JF6NZnUlBSliWNU5f1q7Sqa
2eisPVryuXnyPKURZwqxvpd+nVIMbhwIGA+QwTNzUq4ph9ZSBbCaxcLdfYzHlIm+
OuoJ61nbExx0xDlZ9gbC8GFGSxmrwcDJpzEbf3D4XSrzEyq+Fsl43EIWd/qxTX1w
Mxn6y8JD1taY6B4Lk7fx0X7XlVvcW7eGI1OBZUNh0MmzyAqNgbfDV0A9ZYoN2VzU
P9yYfJJyTeVZzX8Vwdm4PiCRAGWFCQ==
=dyMC
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--


