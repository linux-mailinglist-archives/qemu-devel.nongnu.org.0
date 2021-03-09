Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1246C332AF7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:47:53 +0100 (CET)
Received: from localhost ([::1]:36808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeaO-0005so-3k
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJe9i-0006yw-2u
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJe9d-000408-B0
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615303212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mHQ7b9fO6uWr3z0rx2qRCWijwG5x//UW/ZwH6oYegDs=;
 b=VpRI3G8H01O6OPlghNKPbD1MCseg+KMtDSnGsdZMgeqBT/jKmfKbi0w736GF5i1lEhOZsw
 yniSAnMYO53YX/8mFFmw+eqZDBSV0CTA7fDS0xi8bkOLvGJ9HLb4derjUvIo6pwIhS2R6v
 ae4Cysrjh5BOH+TFEnWVKUY2nsaIPLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-PsCIBpFRMtil77wQa8Z9fA-1; Tue, 09 Mar 2021 10:20:09 -0500
X-MC-Unique: PsCIBpFRMtil77wQa8Z9fA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22858804332;
 Tue,  9 Mar 2021 15:20:08 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBA3410023B2;
 Tue,  9 Mar 2021 15:20:01 +0000 (UTC)
Date: Tue, 9 Mar 2021 15:20:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 4/4] virtiofsd: Release vu_dispatch_lock when stopping
 queue
Message-ID: <YEeSIMtS6mzIar3A@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-5-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210308123141.26444-5-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TcVfrnILXvUfMZ2+"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TcVfrnILXvUfMZ2+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 01:31:41PM +0100, Greg Kurz wrote:
> QEMU can stop a virtqueue by sending a VHOST_USER_GET_VRING_BASE request
> to virtiofsd. As with all other vhost-user protocol messages, the thread
> that runs the main event loop in virtiofsd takes the vu_dispatch lock in
> write mode. This ensures that no other thread can access virtqueues or
> memory tables at the same time.
>=20
> In the case of VHOST_USER_GET_VRING_BASE, the main thread basically
> notifies the queue thread that it should terminate and waits for its
> termination:
>=20
> main()
>  virtio_loop()
>   vu_dispatch_wrlock()
>   vu_dispatch()
>    vu_process_message()
>     vu_get_vring_base_exec()
>      fv_queue_cleanup_thread()
>       pthread_join()
>=20
> Unfortunately, the queue thread ends up calling virtio_send_msg()
> at some point, which itself needs to grab the lock:
>=20
> fv_queue_thread()
>  g_list_foreach()
>   fv_queue_worker()
>    fuse_session_process_buf_int()
>     do_release()
>      lo_release()
>       fuse_reply_err()
>        send_reply()
>         send_reply_iov()
>          fuse_send_reply_iov_nofree()
>           fuse_send_msg()
>            virtio_send_msg()
>             vu_dispatch_rdlock() <-- Deadlock !
>=20
> Simply have the main thread to release the lock before going to
> sleep and take it back afterwards. A very similar patch was already
> sent by Vivek Goyal sometime back:
>=20
> https://listman.redhat.com/archives/virtio-fs/2021-January/msg00073.html
>=20
> The only difference here is that this done in fv_queue_set_started()
> because fv_queue_cleanup_thread() can also be called from virtio_loop()
> without the lock being held.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/fuse_virtio.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--TcVfrnILXvUfMZ2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBHkiAACgkQnKSrs4Gr
c8hKoQf/dSIEA6oml+2/FLPeU13BCp2n/U9wmtf/CmLC8qPFCFETttZer9heoq/v
AALuURQzzOJdBCo0R1f//maCfOsDob3hT53ojz7lUaPj4/uRpaiHOjokHSzSvcUq
hOq1io7dANA/8VnF5z9xdUt97tEurn25jB1NLw0zBBOBxvEq6kYYrLTfT0ojaqv4
otgsnCId57uO8rWbV5kRDt0mi+vXg/A3EqYvzAw0yokUu1g80+JOC8X5azeB7LY8
yf6d5BQjIqpC6gyusmAfVwfcdHl0KfTsPCTIRPj8xmZ6mmJxiZQFiBwPswb5a+U9
mNxtVa7jNXb+JudW81QBhrEXJAGopg==
=XK0P
-----END PGP SIGNATURE-----

--TcVfrnILXvUfMZ2+--


