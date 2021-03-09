Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EA6332AF9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:48:26 +0100 (CET)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeav-00074Q-Lf
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJdt1-0001ca-O2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJdsx-0004rj-Gs
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615302178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+1b6X76QZO543D6S7LYuBn5Ho9GW3JrDYHWjDSST1c=;
 b=Xv4hJ/OK1+JNgwV0kQwmawW569ksgPYC7NQIUYgccc8BGxJq2Ju5ne1mtwzsTFcgtaTpkv
 1XOFvWb/ScGZjdFeGORVK7MiP80oRQYCA2VDNpeeNOpgqDS9UBRc4jwV3DFK/c0z0x8DA3
 KDzu/PohexaOqHqvgIuPO/aG7p0ejVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-_iTR5J2gMX6trHe-0Nf57g-1; Tue, 09 Mar 2021 10:02:55 -0500
X-MC-Unique: _iTR5J2gMX6trHe-0Nf57g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A33A91054FA1;
 Tue,  9 Mar 2021 15:02:54 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88E172B0A6;
 Tue,  9 Mar 2021 15:02:49 +0000 (UTC)
Date: Tue, 9 Mar 2021 15:02:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/4] vhost-user: Introduce nested event loop in
 vhost_user_read()
Message-ID: <YEeOGE7x7QJNITxd@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-2-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210308123141.26444-2-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6J+azmZ/hQyhnPah"
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

--6J+azmZ/hQyhnPah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 01:31:38PM +0100, Greg Kurz wrote:
> A deadlock condition potentially exists if a vhost-user process needs
> to request something to QEMU on the slave channel while processing a
> vhost-user message.
>=20
> This doesn't seem to affect any vhost-user implementation so far, but
> this is currently biting the upcoming enablement of DAX with virtio-fs.
> The issue is being observed when the guest does an emergency reboot while
> a mapping still exits in the DAX window, which is very easy to get with
> a busy enough workload (e.g. as simulated by blogbench [1]) :
>=20
> - QEMU sends VHOST_USER_GET_VRING_BASE to virtiofsd.
>=20
> - In order to complete the request, virtiofsd then asks QEMU to remove
>   the mapping on the slave channel.
>=20
> All these dialogs are synchronous, hence the deadlock.
>=20
> As pointed out by Stefan Hajnoczi:
>=20
> When QEMU's vhost-user master implementation sends a vhost-user protocol
> message, vhost_user_read() does a "blocking" read during which slave_fd
> is not monitored by QEMU.
>=20
> As a preliminary step to address this, split vhost_user_read() into a
> nested even loop and a one-shot callback that does the actual reading.

In case you respin:
s/even/event/

> +static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
> +{
> +    struct vhost_user *u =3D dev->opaque;
> +    CharBackend *chr =3D u->user->chr;
> +    GMainContext *prev_ctxt =3D chr->chr->gcontext;
> +    GMainContext *ctxt =3D g_main_context_new();
> +    GMainLoop *loop =3D g_main_loop_new(ctxt, FALSE);
> +    struct vhost_user_read_cb_data data =3D {
> +        .dev =3D dev,
> +        .loop =3D loop,
> +        .msg =3D msg,
> +        .ret =3D 0
> +    };
> +
> +    /* Switch context and add a new watch to monitor chardev activity */
> +    qemu_chr_be_update_read_handlers(chr->chr, ctxt);
> +    qemu_chr_fe_add_watch(chr, G_IO_IN | G_IO_HUP, vhost_user_read_cb, &=
data);

This comment could be expanded to explain why the nested event loop is
necessary. The goal is to monitor the slave_fd while waiting for chr
I/O so we'll need an event loop. prev_ctxt cannot be run nested since
its fd handlers may not be prepared (e.g. re-entrancy).

--6J+azmZ/hQyhnPah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBHjhgACgkQnKSrs4Gr
c8hChAgAjPTmHQNrIku70k5B+/W/iD2xv3q4Gv3xJgw5CcZ5/TPh87e8YB2lG1Re
mEu1/xXZp4SFJlIc+F5P/hoVZ2sH2gnpU1R4Vdw8S9zs+ZrYDf2KPKCuwSnTkq++
2O+yJR8kbwmVCS/j+eAX/rFpIycQXgbxo0A4awRM4XZQGGfw/x1Q9SFSDtR0SwoI
l93jGkoZRJW6RxkjUEi+/ujMh7ywvwaR77IEnU5J+wcR6L/5dSNDUZQ2xE+87z71
KWeX7GdcH7ndWdN/S6AoCBcl+j5CORnrXVkdoIvjp/M2EF52Qd3dsP22mD1Lclwa
2CDL+WNLjCRvQDn9xsXveRTbKnd3KA==
=0miQ
-----END PGP SIGNATURE-----

--6J+azmZ/hQyhnPah--


