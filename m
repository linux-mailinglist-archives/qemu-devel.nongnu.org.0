Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A534EC77
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:31:28 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGL1-0004sf-41
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRGIl-0004F7-Uy
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRGIh-0002zW-LQ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617118143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h5dROR9exnMKUdVac2D4A5bMn321DWFka/VB7+oa10I=;
 b=c2cZ6Tmaxu9YPoG6WwD9/HhMFkcM+RuJmZt1a4fu1Zf1BNJkd6/z5OIGdUgQJV6xYS92Cb
 N6vMfg/a641p/26EgtvQvtaE/qNTG8Qn6hTiq3Pl6/gHvbaGQ2VqWIrY2nUUiNrika8J+z
 TpcDWC3Cjb5X38n3MTMpYMl26ZDdJdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-_A64urFxP8SE2YZBdezmOw-1; Tue, 30 Mar 2021 11:29:00 -0400
X-MC-Unique: _A64urFxP8SE2YZBdezmOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E261E49E2;
 Tue, 30 Mar 2021 15:28:59 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6AC61001281;
 Tue, 30 Mar 2021 15:28:58 +0000 (UTC)
Date: Tue, 30 Mar 2021 16:28:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 1/6] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Message-ID: <YGNDuWar+jMQAV/n@stefanha-x1.localdomain>
References: <20210325112941.365238-1-pbonzini@redhat.com>
 <20210325112941.365238-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210325112941.365238-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JfArHS/DhPJy/mPN"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: david.edmondson@oracle.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JfArHS/DhPJy/mPN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 12:29:36PM +0100, Paolo Bonzini wrote:
> From: David Edmondson <david.edmondson@oracle.com>
>=20
> If a new bitmap entry is allocated, requiring the entire block to be
> written, avoiding leaking the buffer allocated for the block should
> the write fail.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> Message-Id: <20210309144015.557477-2-david.edmondson@oracle.com>
> Acked-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/vdi.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JfArHS/DhPJy/mPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjQ7kACgkQnKSrs4Gr
c8h0HAf8DdZNHsgiEx/YSz7Id8eVffgBzOVGA7MK9ulrl7rYbcWrwiiZ/eMoWcTi
4Z3Mdyz1n3i1zIBRmQUIJ1JAeBokkQ8th11iFB4TJ4Zq3fG5dFFUrCXJmeSe6LyE
Bckt4jFLaBSI9OHgkjiw8AhMp1DFhWyEOd0XilNoTZsxKUfqYIV+d1sjm4/FntWc
qhsprNqK1ikAXJI+uv3lNdxquPvxjLOVZ4mJ8XaY/Cm9WIoVzFFSKFdCS6zxLkS6
p7pqJWh4ZSzLGslmmvNPf7xuuDF7bt3/+kisxBC4GTcgdNYof4l/7OVB5bpl/eh6
Jp40xyadsYXrTZfpFSLRJI16X7UOEw==
=AEph
-----END PGP SIGNATURE-----

--JfArHS/DhPJy/mPN--


