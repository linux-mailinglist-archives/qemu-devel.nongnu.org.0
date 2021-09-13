Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09251409272
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:10:34 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmfJ-00078f-3t
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlsP-0008V3-AG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mPlsN-0004ky-Nl
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631539198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5YcOrcrobYQoL2u++SwD7GvlcZkhm2vI8ISLVi6H8g=;
 b=g1/86WVuMQqqFcRhmcNpjPedijrSt8wBecQ8YIlJlCfNjVZ3ypE6w/ljlv6o9MKNdYHDQV
 lLnc8Xb/AVNluyhgQC3a60MCEQHTmNpWm4QB6pQElJ5xavKCCAPP0W0PkQOxvPn/+262Pv
 h4XlLXx4rn4+6J8AwhyXzsJVFhl/mH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-7l7B1d5TOd65jTc7QZpZcQ-1; Mon, 13 Sep 2021 09:19:57 -0400
X-MC-Unique: 7l7B1d5TOd65jTc7QZpZcQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1565118414A0;
 Mon, 13 Sep 2021 13:19:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92F8D10013C1;
 Mon, 13 Sep 2021 13:19:55 +0000 (UTC)
Date: Mon, 13 Sep 2021 14:19:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 2/4] migration: block-dirty-bitmap: add missing
 qemu_mutex_lock_iothread
Message-ID: <YT9P+pQzPEDBshxH@stefanha-x1.localdomain>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <20210908131021.774533-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908131021.774533-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3hoSJpkZT6ii4Vbq"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3hoSJpkZT6ii4Vbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 09:10:19AM -0400, Emanuele Giuseppe Esposito wrote:
> init_dirty_bitmap_migration assumes the iothread lock (BQL)
> to be held, but instead it isn't.
>=20
> Instead of adding the lock to qemu_savevm_state_setup(),
> follow the same pattern as the other ->save_setup callbacks
> and lock+unlock inside dirty_bitmap_save_setup().
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  migration/block-dirty-bitmap.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3hoSJpkZT6ii4Vbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE/T/oACgkQnKSrs4Gr
c8j7HwgAlitEQqNSP83m5k9H5/s02H5vjp9lYCDIGIGkaubUi8885ZyrIqYTKm8R
doL4xzY6dd741i/zk2EJ6VMqa/+stuFqUIbBo9ch5xLWVrZK7rrvkRKnjiznUL8r
cVRdXX5D3tfTZOjm3KQPzBMTZcOZUhHOAO+KoOqsh1esha7K8E8FHuTbHdyKGpdQ
DQPJNNNCdysqS2cM7M/bpbm61mUT72/ZT3lp38aMmEHFyYOJhdvpZ0OieBBhTGgz
5GFzdrPsi+fNGAwOZ8ixU0dAhDxuhds0DmLGNqhyubxvSAToDRsTpZIXU5GhbSj6
MC1jiI97lHNnrb3bhBUiqhFQG6CQxw==
=CDqI
-----END PGP SIGNATURE-----

--3hoSJpkZT6ii4Vbq--


