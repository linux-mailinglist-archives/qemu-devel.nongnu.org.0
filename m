Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C2392B9A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 12:19:18 +0200 (CEST)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmD6j-0002Xm-3G
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 06:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCy0-00082q-9p
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmCxr-0005AD-GM
 for qemu-devel@nongnu.org; Thu, 27 May 2021 06:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622110205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6GbmLsOBR407HH3nkOlwX6Jfu/5mi3BJ59mDgBgibU=;
 b=bT7mZF17V+WVYkpZOWFVN4fnjugxKAJTzQkOti38Nhe1c7tA7ZIHm/bUDzhuFAqeFLfEPx
 HQ/vDpVc/7rVThtcvp5mD+Z9I4DFdCl4KUHssFPcsCtU5V3uEum74wNNVnI11k2t5uil1L
 VebSqhD1ABJnGa16sMKysN5z7cIkKxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-8b-h_F5zNTCEodrwos4uwA-1; Thu, 27 May 2021 06:10:01 -0400
X-MC-Unique: 8b-h_F5zNTCEodrwos4uwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765D179EC1;
 Thu, 27 May 2021 10:09:59 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0826C10013C1;
 Thu, 27 May 2021 10:09:58 +0000 (UTC)
Date: Thu, 27 May 2021 12:09:58 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 07/19] hvf: Split out common code on vcpu init and
 destroy
Message-ID: <20210527100958.gjfbqaftetcb33ew@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-8-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-8-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2zplhkdkestiogp7"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2zplhkdkestiogp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:41PM +0200, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems=
.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's start moving common
> code out into its own accel directory.
>=20
> This patch splits the vcpu init and destroy functions into a generic and
> an architecture specific portion. This also allows us to move the generic
> functions into the generic hvf code, removing exported functions.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 30 ++++++++++++++++++++++++++++++
>  accel/hvf/hvf-accel-ops.h |  2 --
>  include/sysemu/hvf_int.h  |  2 ++
>  target/i386/hvf/hvf.c     | 23 ++---------------------
>  4 files changed, 34 insertions(+), 23 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--2zplhkdkestiogp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvb/UACgkQ9GknjS8M
AjV5tg/9HMEqtJzZGZHdiCr4x63Y+5EMlqCNqN/P2hBZzXa/lC69a9aP+HwdBloj
n/cH71lwY85dBhGzA67kOGLiQy1chWrFkzIN5LlYtHTVwh4FwMny7q3ol2nFvUlw
/+DCEwFwmsxY4rNBeKkViINLbz+xeY9C17uaCFbosELgvZSXBb0KBg7SWapW9kUQ
ivK4v//Drx1onMde7xnw9hQrC4A/3hQcC7KsDANNDGv1ERfWkOR/d4DJ/4+KRaTU
LT2L/wR3kyaamxjIJASU3Ov/2RpFZfaCPpfGX4go0IOGwwhGIAveKlWa0SF2KCMm
AdlUiIWoH7P3n6/DuSSd7U4mcRlErXCKOzLwY1/nd8jBgS4FOiOYQdPkZVR/OaWS
/45Yfos/xmHUjWoGY88219OKDoSxS1JAO7IObr5HVQwBRtS3eZHTwl5o3ZBK3+2q
ONe7q7S0XiNMBbYiU77TMY4mWTvilYH9Wq6j08BDDYiqOKD7dGdOLlR4LReA4/yy
8ged0qTIaaqMWSnMCEuR7y0DM5GeTpf1RRt8G5x6nCgepECCkYNaZ8BI8LiqWN7u
2/DusldAnAq7JH6JtwhW+jFoGNea6PHG4xi8tw/CeOT7EsHoGpMti9dNArFi1/2b
r7lLqUcpUpmKzsZeIPuc5diwcS4Ko7igF1W0fU9bXJ860TI0VbE=
=zfs2
-----END PGP SIGNATURE-----

--2zplhkdkestiogp7--


