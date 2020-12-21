Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C812DFEC1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 18:09:34 +0100 (CET)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krOgf-0005UY-J5
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 12:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1krOf8-0004st-FH
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 12:07:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1krOf5-0006dV-EQ
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 12:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608570473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ql3QY2EZmY15Osz1anO3jVM9GRD3QvHydriR29vDEaE=;
 b=HivKIw9/SOjS4obWNyF2SHA0S0i4rsY3TelFbwXpvovZihoIjXt1L/EW+uEmA1DuITLHnX
 0LzLRp4FnGgiP9jeDkoF2Z6LsRcWeoEgQIUR59ks82oSEq9skaTia+Y+w6pgo5VmyFAid4
 po170njrXNzZ158nkugVjxhVAcbaCnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-mdHOWa_6MG2mqk5i0E4Gjg-1; Mon, 21 Dec 2020 12:07:49 -0500
X-MC-Unique: mdHOWa_6MG2mqk5i0E4Gjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15171054F8B;
 Mon, 21 Dec 2020 17:07:47 +0000 (UTC)
Received: from localhost (ovpn-117-28.rdu2.redhat.com [10.10.117.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58BC85B695;
 Mon, 21 Dec 2020 17:07:37 +0000 (UTC)
Date: Mon, 21 Dec 2020 18:07:36 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 4/4] block: Close block exports in two steps
Message-ID: <20201221170736.6rf4ip7xpvcho2eq@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-5-slp@redhat.com>
 <20201215153405.GF8185@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201215153405.GF8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nrplgk2vygihh27c"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nrplgk2vygihh27c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 04:34:05PM +0100, Kevin Wolf wrote:
> Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > There's a cross-dependency between closing the block exports and
> > draining the block layer. The latter needs that we close all export's
> > client connections to ensure they won't queue more requests, but the
> > exports may have coroutines yielding in the block layer, which implies
> > they can't be fully closed until we drain it.
>=20
> A coroutine that yielded must have some way to be reentered. So I guess
> the quesiton becomes why they aren't reentered until drain. We do
> process events:
>=20
>     AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
>=20
> So in theory, anything that would finalise the block export closing
> should still execute.
>=20
> What is the difference that drain makes compared to a simple
> AIO_WAIT_WHILE, so that coroutine are reentered during drain, but not
> during AIO_WAIT_WHILE?
>=20
> This is an even more interesting question because the NBD server isn't a
> block node nor a BdrvChildClass implementation, so it shouldn't even
> notice a drain operation.

OK, took a deeper dive into the issue. While shutting down the guest,
some co-routines from the NBD server are stuck here:

nbd_trip
 nbd_handle_request
  nbd_do_cmd_read
   nbd_co_send_sparse_read
    blk_pread
     blk_prw
      blk_read_entry
       blk_do_preadv
        blk_wait_while_drained
         qemu_co_queue_wait

This happens because bdrv_close_all() is called after
bdrv_drain_all_begin(), so all block backends are quiesced.

An alternative approach to this patch would be moving
blk_exp_close_all() to vl.c:qemu_cleanup, before
bdrv_drain_all_begin().

Do you have a preference for one of these options?

Thanks,
Sergio.

--nrplgk2vygihh27c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/g1lcACgkQ9GknjS8M
AjUBEg/9HoD49y3ShNbcRWwXbZD0eTwreK8HAvqk328INIakQIFw5Y398rFnHUoW
z5tMH/NritkqYA/x6a9qBvH+zEhJW+r4skdFmgqcs5N5DQQA/ImemCD2Oc9ytdXc
CTZYjxx90Mz+X5MO9PUY3Ngbx6+oOCGwGQyVlKD/IqPrMd5Fkq/gQpVdShp7oWY9
guFRVAzTdkH36rMvkmxEwbo4x+1CmKuhiQk7IeKcDS7t45TuPGZXCOqE8HGREH29
z7NjRrdatwlmbta14V5YmU4FOZTJy6vq4wSM23evZ3cNjng4D6d92hjxFS9V8fc6
slwv2Dtj4uZZPg+zxvNjq92j0qUKOuiXNfLsEoPaQWwjsZTa9n6P3qHRo3OFp4Ww
leJiVpNVPD+f/5ophXKbTAB/zaw3a8uMx7oXMgYnXjUS4snIWdJ4h1DnuTIPKBA1
VUyh93uCEInT0VlSYrlYeIDu+lZv9/J3wwtpM/CR/P2xFfxFHNzWpoT461YJgHXU
TMto49ag5KSWya+IWjfUiscWuj0nq2RvZVziYNN93o4ekDaMEC2UV65qZZRdxtI7
mgH1oVmQUruWjiSaCVIxwMPT8KCVkngpOlVHkSuY0nSzTebxxjsoJIynhfy/xJwK
GcFjTLpua/nREnq3qg3WBJHJ1Mo9QjKIQ+/1MLxNU+uYo+lGgZc=
=cw1v
-----END PGP SIGNATURE-----

--nrplgk2vygihh27c--


