Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A436398957
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:22:59 +0200 (CEST)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPti-0005lt-BT
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loPsq-0004cp-J1
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loPsn-0006yh-Lm
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 08:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622636520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oeUBUQJv+o9vOA4jxhKN4gbYl5pc4gp/PiBWj69tlPM=;
 b=WOHIN+DtWfabSBN+t73vh3dXjTWLg7zpbJqjRMzTEaDnjCvDGeBW0KIfALDiXTkjo+eNd8
 ztFy/n29vj/A67Izk+X5Q7SGRgJJsPnoCYjKdTGduvYctzgY/NTh64jqQQ3ja8Rqej6QGs
 fBUwdLPab86etUNRm94ASQTn/ZzcPYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-18tLu7eUOWyT_p9U6d41Hg-1; Wed, 02 Jun 2021 08:21:58 -0400
X-MC-Unique: 18tLu7eUOWyT_p9U6d41Hg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E95A2106BB2B;
 Wed,  2 Jun 2021 12:21:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46A2662677;
 Wed,  2 Jun 2021 12:21:52 +0000 (UTC)
Date: Wed, 2 Jun 2021 14:21:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] block-copy: small fix and refactor
Message-ID: <YLd33jBVl5k3RAZK@redhat.com>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <YLdLrrTszu8MMxPv@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YLdLrrTszu8MMxPv@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eimRaYJeaerGEVBN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: eesposit@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eimRaYJeaerGEVBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 02.06.2021 um 11:13 hat Stefan Hajnoczi geschrieben:
> On Fri, May 28, 2021 at 05:16:26PM +0300, Vladimir Sementsov-Ogievskiy wr=
ote:
> > Hi all!
> >=20
> > This is my suggestion how to refactor block-copy to avoid extra atomic
> > operations in=20
> > "[PATCH v2 0/7] block-copy: protect block-copy internal structures"
> >=20
> > Vladimir Sementsov-Ogievskiy (2):
> >   block-copy: fix block_copy_task_entry() progress update
> >   block-copy: refactor copy_range handling
> >=20
> >  block/block-copy.c | 79 +++++++++++++++++++++++++++++++---------------
> >  1 file changed, 53 insertions(+), 26 deletions(-)
>=20
> I posted suggestions for the doc comment on Patch 2, otherwise:
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, fixed up the comment accordingly and applied to the block
branch.

Kevin

--eimRaYJeaerGEVBN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmC3d94ACgkQfwmycsiP
L9YQ5g/6AgVZ3mJjYcqEf6D0E6vyR3tod2Jpf6IwcORPbz4Jh0Nu9jIRcESRTdjo
a2M+QClP6nC+hcN34ofNDE/7KJB1tacfFCtVmeeu58xZpCwCnMN7KetoOxJQSdpo
+sT12BDlMMrtjAWEMaw57mWNk5Ob+LQ0McFUj3rk107P4Tom8pPWxReB/yH5312y
+PXC9dgwcNpIuX4oNBFO8K8kDUGj4Rfp2qYPvC8CM+Hi/8Q7kjgdK38FOOXNadV9
rPzWhvOVxOKyBPtChoEjahOfb23jp5kqGsF37VDvQO7Aod4Sv5K8bwRbAnZDETNJ
3Q/NBF4IBKZutWgir3LJSoPOFiA3C5iDtkJDtYLk6LvA9SxJI81YX4AkqLAkiSJg
6EArMI3JJyCNyH31E4tPy4pdDXwuGpCuEWonxXr+DxVMaz68rGvUfrVacIOr4DeT
9y2nlM8zKsgEqi4YqiwB3ET8qR8NqL3tBLi0I71uiBnYm4lud6gowjDuaEj6ZkLB
OQM2SzA9NPbR207Un4IehL/goSCRnovlW86HBHKePfx+cz6XMXhBEQcBsZjCSvEj
/gQWqMC0n6eplQCpWem7VyikfSuFe28CkW+drhvArUREg9bXIayVvK1GKgPh3hcT
8dGIXuatQIfL+2OHAnBnCNrpoEPp4tsc0vWgFcA6aqPVSDxO/dI=
=j3gi
-----END PGP SIGNATURE-----

--eimRaYJeaerGEVBN--


