Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4C0293FCA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 17:44:17 +0200 (CEST)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUto8-000358-4z
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 11:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kUtkS-00086N-8H
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kUtkQ-0001hB-EU
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 11:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603208425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ivrAlSQjzB1ohlViu0yg91vzMnhnRAE9smbzOMC/vLM=;
 b=hv2fpC9HciDDHU49nJgedC4zGnNqp1wagTel+Aq/IfFTVN8z/Qs8JWZzo5cMCviH0onW/h
 TEEGRqKo4Zd6qzTFigtPiyWvgaSPjs5bQzJKp+7/ZawuLw8HtRQBDqxcNGl5P177IwLJCd
 iMwuYLFY7RfVqeqoyUamUKqVlrmFZ8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-gTetuEI3MCa9w3AVtT2xtw-1; Tue, 20 Oct 2020 11:40:22 -0400
X-MC-Unique: gTetuEI3MCa9w3AVtT2xtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BA41875060;
 Tue, 20 Oct 2020 15:40:21 +0000 (UTC)
Received: from localhost (ovpn-115-118.ams2.redhat.com [10.36.115.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E26627C2A;
 Tue, 20 Oct 2020 15:40:20 +0000 (UTC)
Date: Tue, 20 Oct 2020 16:40:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Afanasova <eafanasova@gmail.com>
Subject: Re: [PATCH v2] softmmu/memory: fix memory_region_ioeventfd_equal()
Message-ID: <20201020154019.GD279266@stefanha-x1.localdomain>
References: <cf71a62eb04e61932ff8ffdd02e0b2aab4f495a0.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cf71a62eb04e61932ff8ffdd02e0b2aab4f495a0.camel@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 01:20:13PM -0700, Elena Afanasova wrote:
> Eventfd can be registered with a zero length when fast_mmio is true.
> Handle this case properly when dispatching through QEMU.
>=20
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>  softmmu/memory.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Thanks, applied to my block-next tree:
https://github.com/stefanha/qemu/commits/block-next

Stefan

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+PBOMACgkQnKSrs4Gr
c8gsfwf/biubScXIZjH7e955ZiXyMqFwy0E/PA9vXpE62QRa7Agw54ACUuw7qaOx
+GMedfdmcJkqDRmwZPRmaN+/LQX58a93WkOhf3A2abm2dZsAd+1GFpTRZyPzX+iz
wSqmbiUoKc9BFfj0F/VTBuHTKYzNLnpQQQbDPYYIl/cnVbZhVAVn6y9ylmXxH7+P
eP4vcxPC1xS9JrIsXYIW7iXS5dnA3IyLAHt04ZobgeNGSL4pymUtPEhkslwhw/EC
MrgAtzQvsV7JzZW///SsPpQSLK5+TtPCXW+PNcg5xE2ZYKD1ZgDPAd0AjUDSfM/T
lzbH1q2dx6PhgYCyuolORbrBIb7r1g==
=fWUE
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--


