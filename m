Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AC333B017
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:38:49 +0100 (CET)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkca-0008V1-BI
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkaZ-0007Dr-JD
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLkaX-0006EY-5P
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615804600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uIbJnM922eUefzcLhYJEFUIyvXLocQ00XK3d5TiuWvA=;
 b=dw7Tc9It4lw+LoCNIgnxEzdurzYql+03fTESY3FPvvYh8PuVaIA7kr8P6tStL8DawY6eIZ
 67D7+UUR80XlcI5ZkkGJwWpF/s1vGIb5u0dTIfT/cbXyvTSYwnjSXK6PkmI38I9Ww5+7IL
 PHMMVv/PHKgDjpm49AEdU3h6tFFqA5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-HRPezn3kNrekuGEG6w2GXg-1; Mon, 15 Mar 2021 06:36:38 -0400
X-MC-Unique: HRPezn3kNrekuGEG6w2GXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55749100C622;
 Mon, 15 Mar 2021 10:36:37 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86ECC610AF;
 Mon, 15 Mar 2021 10:36:30 +0000 (UTC)
Date: Mon, 15 Mar 2021 10:36:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 3/7] vhost-user: Factor out duplicated slave_fd
 teardown code
Message-ID: <YE84rZ8+yPoUnsg4@stefanha-x1.localdomain>
References: <20210312092212.782255-1-groug@kaod.org>
 <20210312092212.782255-4-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312092212.782255-4-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kOK2rZth78M287TT"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kOK2rZth78M287TT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 10:22:08AM +0100, Greg Kurz wrote:
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/virtio/vhost-user.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kOK2rZth78M287TT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPOK0ACgkQnKSrs4Gr
c8hrtwf/ZN0rNmTMSiDUaauaRULuVilDbIBSF2g0HkJePjoWNgGANcWCUMRieTl0
cPnKlFTgQFhRIc18WrYoiI5SmknKJQ2k6cqJ4UdlvVreOL8E4xPBkhl/bQCW1z1W
vihtd1eTcMbYrbzZqQcnij6++3cH7nIYF6/QLHGFp5urufFNUcEwfYDMoAtZIdns
z6VU4nED01h9+5mH1dvngb0lZV5q8dA1f2iNOR5gl53Uf2sdmfcSJFQMqvnlCddn
J+sr57y8fS89UJZGpsrhh+83WNE8z+wewdPBkrrRpPoPxEdg5Bafn+VoUfsADL3q
Kw3uSV2SEHvybaAn5hKjAF1C5DYUNQ==
=LHtR
-----END PGP SIGNATURE-----

--kOK2rZth78M287TT--


