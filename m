Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490EC420849
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:31:00 +0200 (CEST)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKJG-0006ye-PN
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXKCq-0006JH-DW
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXKCn-00078q-FK
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633339455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Oaj7F/pwJt3qefxZq0GiOJKVrruglRRhdjZzkkKD0k=;
 b=JaLp5iurwGIwbcoxZZOujcHYs1NcZRZiYut2XD5QYV+VuRk3Hn0bcsra/dRyZOSTudz5X0
 QhBfsSm8UBrwnaOH4cYaBBemfiPAB0jhju4VqSQ43oQQpm82qNNkc/HlM+5JWnxtuFWHZy
 x0HhiTJohJpDVkVYokIKacB8GuyUen8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-oe1KcglZOdCxSfH3MQ9gyg-1; Mon, 04 Oct 2021 05:24:14 -0400
X-MC-Unique: oe1KcglZOdCxSfH3MQ9gyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55AB419200C4
 for <qemu-devel@nongnu.org>; Mon,  4 Oct 2021 09:24:13 +0000 (UTC)
Received: from localhost (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9302960BF4;
 Mon,  4 Oct 2021 09:24:10 +0000 (UTC)
Date: Mon, 4 Oct 2021 10:24:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 3/3] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Message-ID: <YVrIOa4R6t+mOiXh@stefanha-x1.localdomain>
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210906104318.1569967-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="53MuLFX+kDclzmVo"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--53MuLFX+kDclzmVo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 12:43:18PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Both virtqueue_packed_get_avail_bytes() and
> virtqueue_split_get_avail_bytes() access the region cache, but
> their caller also does. Simplify by having virtqueue_get_avail_bytes
> calling both with RCU lock held, and passing the caches as argument.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--53MuLFX+kDclzmVo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFayDkACgkQnKSrs4Gr
c8geRgf+P0nAum9Lkp9hdXiGO1XZM7PbX+L+fIA5UQP5cb2RNUKFJJBO+oNBxS5q
M31qRGDpbrPKAV93b7MDNYsJEfcR7kREaDRGgt1J/FsFln3YfBfQYJ6Faq/bsNkz
M8jh1hb+vtMfPcHgLRS0nLlxk+KbFGj8CYoY9TAV8cHeQYKPfC86wKaSkBGubWVk
TH/MRZT9CfsehlytX59RTuh4r8PodBRamVSEQQZRjOn0oPr1lcs94HWuN1wkzU/l
PsSqAiPUE/jWPNkY5ACX8GXSpwEeASJtY676HqQBsYJ3ID5yXk7N1Ecisg5qBFCe
i2TF7Uj+WmWSda4iVvKCnt8/HP1+fQ==
=hRt3
-----END PGP SIGNATURE-----

--53MuLFX+kDclzmVo--


