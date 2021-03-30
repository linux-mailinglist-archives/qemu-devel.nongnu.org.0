Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8034E540
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:18:48 +0200 (CEST)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBSR-0006pP-ID
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRBQn-0005sw-99
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRBQk-00045J-Vh
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617099422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XUevlfeZL6g2QypEVTNzaGibK7UlagCPIRS7tuTrcgA=;
 b=O/ejcVaQ7hhy7iMrRnTI+DqKZw2cUkK9X0HlQeSAcS/MH6CtFlKImYpAquyov0mmib0BBg
 GBMuVrNH9IqF/EHd0Cql8KPBiJeaehR409TvotV2wxWXXHE/ZsTZIGW1+cYsOxJp50QSWV
 tQS6faeDYVjp0JA9KrL164MktI//6Ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-vGfyygEnN1iDa1WcSSw__Q-1; Tue, 30 Mar 2021 06:16:57 -0400
X-MC-Unique: vGfyygEnN1iDa1WcSSw__Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA8FD801814;
 Tue, 30 Mar 2021 10:16:55 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFE661A266;
 Tue, 30 Mar 2021 10:16:51 +0000 (UTC)
Date: Tue, 30 Mar 2021 11:16:50 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 1/8] memory: Allow eventfd add/del without starting a
 transaction
Message-ID: <YGL6km9zlhYO5QQN@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-2-groug@kaod.org>
 <YGIIdUlzJR7TlhTR@stefanha-x1.localdomain>
 <20210330094749.577da616@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210330094749.577da616@bahia.lan>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="beLrDWuReVJJKljS"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--beLrDWuReVJJKljS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 09:47:49AM +0200, Greg Kurz wrote:
> On Mon, 29 Mar 2021 18:03:49 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Thu, Mar 25, 2021 at 04:07:28PM +0100, Greg Kurz wrote:
> > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > index 5728a681b27d..98ed552e001c 100644
> > > --- a/include/exec/memory.h
> > > +++ b/include/exec/memory.h
> > > @@ -1848,13 +1848,25 @@ void memory_region_clear_flush_coalesced(Memo=
ryRegion *mr);
> > >   * @match_data: whether to match against @data, instead of just @add=
r
> > >   * @data: the data to match against the guest write
> > >   * @e: event notifier to be triggered when @addr, @size, and @data a=
ll match.
> > > + * @transaction: whether to start a transaction for the change
> >=20
> > "start" is unclear. Does it begin a transaction and return with the
> > transaction unfinished? I think instead the function performs the
> > eventfd addition within a transaction. It would be nice to clarify this=
.
> >=20
>=20
> What about:=20
>=20
>  * @transaction: if true, the eventfd is added within a nested transactio=
n,
>  *               if false, it is up to the caller to ensure this is calle=
d
>  *               within a transaction.

Sounds good, thanks!

Stefan

--beLrDWuReVJJKljS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBi+pIACgkQnKSrs4Gr
c8i6wQf/Yc7izhm6jb3f0PMRWS7mHK536gPDDlwbbfzuqnYwDOlJCiCj8bCgegK0
7/QB3yJ134BVP0jiB+PAebScXu2OvMhNtaWOkkRkjNNYXKkN5HwZQlfseTLbsdYS
/bp2KihrdnvJe/WwGNdZI+CQKORYZY7G4G+2bOGBX5ukAFxkr7FHl4j8tXKwGwUM
oJh0Q2AIMzkkKDzm1kG+Gi8jjDI4kjWO2RJhcth7nD4dt5P54G28pZsgjXAjnxSh
uj8J8w7K9rLqPQEFVvpMdTTjWWvLzEwZLpYcj8DHPu0H3ayB11FBLxUZxf2Cna7h
LC24KzP4wZllNCbudpaXZwtWtySQVQ==
=uXZ7
-----END PGP SIGNATURE-----

--beLrDWuReVJJKljS--


