Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7941C420870
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:36:54 +0200 (CEST)
Received: from localhost ([::1]:43152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKOy-000666-BQ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXK8b-0000lh-AE
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXK8S-0003Ib-ND
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633339187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xJl8pqbG7heSBl++iEyiGDaqv3heTCG/aQnvi7hFncY=;
 b=ObiFqkrMpP2kIY2yjzcfxX9sBq70NY9UVAmHm8YCjlOQSgaIiPfDMd2yb8ZpxlQ8K3d0Pq
 EFWNi8lMoQKVkUcO+QDMLP6cOBdMEJjq0LF+965upeL1mZE7PMS0BPTHAufqpASAZZ3ulV
 THLCpObQZUEh1X7dt/pDbvXprBAX4fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-5Fxr93GtObOq8bf_uZrJnQ-1; Mon, 04 Oct 2021 05:19:44 -0400
X-MC-Unique: 5Fxr93GtObOq8bf_uZrJnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32A6718D6A2A;
 Mon,  4 Oct 2021 09:19:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED7160871;
 Mon,  4 Oct 2021 09:19:42 +0000 (UTC)
Date: Mon, 4 Oct 2021 10:19:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 1/3] hw/virtio: Comment virtqueue_flush() must be
 called with RCU read lock
Message-ID: <YVrHLY5WwcJydHcZ@stefanha-x1.localdomain>
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-2-philmd@redhat.com>
 <874ka6e2yw.fsf@redhat.com>
 <fd0e791a-edc9-4b5b-fde5-673a2415acac@redhat.com>
 <871r5adzo5.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <871r5adzo5.fsf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IMrSI5p9W2oP5TDE"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IMrSI5p9W2oP5TDE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 01:29:46PM +0200, Cornelia Huck wrote:
> On Mon, Sep 27 2021, Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
>=20
> > On 9/27/21 12:18, Cornelia Huck wrote:
> >> On Mon, Sep 06 2021, Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrot=
e:
> >>=20
> >>> Reported-by: Stefano Garzarella <sgarzare@redhat.com>
> >>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >>> ---
> >>>  include/hw/virtio/virtio.h | 7 +++++++
> >>>  hw/virtio/virtio.c         | 1 +
> >>>  2 files changed, 8 insertions(+)
> >>>
> >>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> >>> index 8bab9cfb750..c1c5f6e53c8 100644
> >>> --- a/include/hw/virtio/virtio.h
> >>> +++ b/include/hw/virtio/virtio.h
> >>> @@ -186,6 +186,13 @@ void virtio_delete_queue(VirtQueue *vq);
> >>> =20
> >>>  void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
> >>>                      unsigned int len);
> >>> +/**
> >>> + * virtqueue_flush:
> >>> + * @vq: The #VirtQueue
> >>> + * @count: Number of elements to flush
> >>> + *
> >>> + * Must be called within RCU critical section.
> >>> + */
> >>=20
> >> Hm... do these doc comments belong into .h files, or rather into .c fi=
les?
> >
> > Maybe we should restart this old thread, vote(?) and settle on a style?
> >
> > https://lore.kernel.org/qemu-devel/349cd87b-0526-30b8-d9cd-0eee537ab5a4=
@redhat.com/
>=20
> My vote would still go to putting this into .c files :) Not sure if we
> want to go through the hassle of a wholesale cleanup; but if others
> agree, we could at least start with putting new doc comments next to the
> implementation.

In the virtio.c/h case doc comments (and especially the RCU-related
ones) are in the .c file. The exception is that constants and structs
are documented in the header file.

I would follow that and avoid duplicating doc comments into the .h file.

Stefan

--IMrSI5p9W2oP5TDE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFaxy0ACgkQnKSrs4Gr
c8hAoggAqDzUstpLaLRbjhIQNcIAP0grxMV37RqlyqpSJzaYQeEOHZmSIm1VrE1h
Q+nahMs8dLIadxXPFbmKHaM0SIc2U6CYGHupTbQTtWFSph2gjf0v6FY+fR97Zhsw
A/26n6bd0kPQfO2uR9v4snKIjo7ntiP5/GB6Kcw3QRT2O/nCc1irfYAwrBduooZu
f8NSeto8TVM326nZu/+sLi6pj88j4idldGlQjUwJ2NYBkLVmrMEoW7ct2d3QDK8a
SFp2WgWnxmYkUAsK5Le73zxFxUIVjRJmdFubCRakAXkzab8ljAAg9JhLGrYcd8Hd
lRfLzVPZqx8/iJbGrzccd9x1fXpbQA==
=Gpni
-----END PGP SIGNATURE-----

--IMrSI5p9W2oP5TDE--


