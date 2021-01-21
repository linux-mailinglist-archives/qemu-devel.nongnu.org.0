Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACCC2FE228
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 06:59:40 +0100 (CET)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2T0N-0007Wa-PA
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 00:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l2SyM-0006VU-03
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:57:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l2SyI-0006rC-Id
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611208648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7o0bbPSPPSo7DKBAs9A2MqdgRgHfs/aqf0ulT72hxRY=;
 b=Pbs8GPRSSqCwN5scLjebkrUsYJUen9iTg1hMembtV4KL+4Abj6AnxBPpIffkkfV5te8Rpk
 6dtUiqCUjTWlBjNE7vGOZMIyd6HToQXztdF0Yx4eVsqfDYlpRSHg3Xgvt3hkjKVs3Kukt5
 5pmOAcJXNW4Ks+ZCKTiyF5a/PSx7ooQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-ypWlAIFWOhazPt0hYy499A-1; Thu, 21 Jan 2021 00:57:24 -0500
X-MC-Unique: ypWlAIFWOhazPt0hYy499A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A4480A5C1;
 Thu, 21 Jan 2021 05:57:22 +0000 (UTC)
Received: from localhost (ovpn-113-165.rdu2.redhat.com [10.10.113.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 466CC1724C;
 Thu, 21 Jan 2021 05:57:16 +0000 (UTC)
Date: Thu, 21 Jan 2021 06:57:15 +0100
From: Sergio Lopez <slp@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 0/4] nbd/server: Quiesce coroutines on context switch
Message-ID: <20210121055715.po4btier34izrrew@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <cb4c9e40-065f-228b-b805-1ed10fd605a3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cb4c9e40-065f-228b-b805-1ed10fd605a3@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ymqawj4b3u265odu"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ymqawj4b3u265odu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 02:49:14PM -0600, Eric Blake wrote:
> On 12/14/20 11:05 AM, Sergio Lopez wrote:
> > This series allows the NBD server to properly switch between AIO contex=
ts,
> > having quiesced recv_coroutine and send_coroutine before doing the tran=
sition.
> >=20
> > We need this because we send back devices running in IO Thread owned co=
ntexts
> > to the main context when stopping the data plane, something that can ha=
ppen
> > multiple times during the lifetime of a VM (usually during the boot seq=
uence or
> > on a reboot), and we drag the NBD server of the correspoing export with=
 it.
> >=20
> > While there, fix also a problem caused by a cross-dependency between
> > closing the export's client connections and draining the block
> > layer. The visible effect of this problem was QEMU getting hung when
> > the guest request a power off while there's an active NBD client.
> >=20
> > v2:
> >  - Replace "virtio-blk: Acquire context while switching them on
> >  dataplane start" with "block: Honor blk_set_aio_context() context
> >  requirements" (Kevin Wolf)
> >  - Add "block: Avoid processing BDS twice in
> >  bdrv_set_aio_context_ignore()"
> >  - Add "block: Close block exports in two steps"
> >  - Rename nbd_read_eof() to nbd_server_read_eof() (Eric Blake)
> >  - Fix double space and typo in comment. (Eric Blake)
>=20
> ping - where do we stand on this series?  Patches 1 and 3 have positive
> reviews, I'll queue them now; patches 2 and 4 had enough comments that
> I'm guessing I should wait for a v3?

Yes, I have almost ready a v3. Will send it out today. I think it'd be
better to pull all four patches at the same time, as "block: Honor
blk_set_aio_context() context requirements" may cause trouble without
the patch to avoid double processing in
"bdrv_set_aio_context_ignore()".

Thanks,
Sergio.
=20
> >=20
> > Sergio Lopez (4):
> >   block: Honor blk_set_aio_context() context requirements
> >   block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()
> >   nbd/server: Quiesce coroutines on context switch
> >   block: Close block exports in two steps
> >=20
> >  block.c                         |  27 ++++++-
> >  block/export/export.c           |  10 +--
> >  blockdev-nbd.c                  |   2 +-
> >  hw/block/dataplane/virtio-blk.c |   4 ++
> >  hw/block/dataplane/xen-block.c  |   7 +-
> >  hw/scsi/virtio-scsi.c           |   6 +-
> >  include/block/export.h          |   4 +-
> >  nbd/server.c                    | 120 ++++++++++++++++++++++++++++----
> >  qemu-nbd.c                      |   2 +-
> >  stubs/blk-exp-close-all.c       |   2 +-
> >  10 files changed, 156 insertions(+), 28 deletions(-)
> >=20
>=20
> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>=20

--ymqawj4b3u265odu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmAJF7QACgkQ9GknjS8M
AjWkUQ//QDNMGI9Y3SoBGRPAMgQtEUddp5uyvDjGc39r3NqeAKnCcKRf/m9Ihb5p
mQqrSmxd8jsUrDJqMYaXoUldaEy1e+5Zr8tmGPHpJQbQu8oxM6hHYNluT13JCH9Y
J8FH3kptcWjWbJSm01T4rKDhgTnbEgNpO192btBObbVteC07ddoYM4dI+whPQ7mT
bl81rx5sH/1FjBAXpZ4qcUkfq5yb9CcEt/f+Dnk6UsZZRnfJ5Ja3cmWDosragAA5
XDhlfES1AnmdAUsUZYl97OMaUJwL+B2VfafscRrW4WPbFuNVqVEh4ojQkxSDU5ng
n/OtNVSOb04FDxEC52P98j3MYaxCFpf9okgvpvpDQBQxJnVnTST9eX5dfL77H0yy
n1C/0HwyTcYoeDgFh8kApCRBKrodlTUKSY0fMeDem2jifypQR35aR9lalkjGzDyJ
kvJ+W5uf6edeWFrwvKieFAvvsBA6IdaVNosVNGf+vIaCyvC4V9D3gZM5l4YJZYia
EPn7Nk7KNCFI0vzM00IDgGf0gBuogBBUnpldyrGfkye6gHExnpSwd5VIW4ZvRl5E
nhLIr5d60Hj6EcqhzqfN8YbSlCwZpaElYrkwXQY6lFP/REk+s+qV17pmYBbrzt5f
roqiY8XtSM5TwHVdc6kBoijMnGKlsppjHIEHHn44LYf9IWTFbjk=
=VcFD
-----END PGP SIGNATURE-----

--ymqawj4b3u265odu--


