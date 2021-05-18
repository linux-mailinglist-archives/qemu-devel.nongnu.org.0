Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8E387A67
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:50:56 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj07b-0003Gr-EO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lj05F-0000Bi-Fa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lj05C-0002PL-Ui
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621345706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFXJTPoe9/D0NBYpug3qemWdm0fx2ryl+qDEtaOlFlw=;
 b=fns5H4b2MCNbDWzaTjuRhKnHzITSNp44h29WUV59w0PXBo6w925c+rEXqOBE/t3ymSlHE7
 YrLqJLPFkztCsqPETTz4Bi7xeyLdk0SzLUM5Q5ItQPFItVRHOO+2lq68PZaIcl9KVbAgvY
 3lKEqhjvchduurvFGfukKTS7K2OagAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Dr4PIAs_P9qAnOA8395hHA-1; Tue, 18 May 2021 09:48:23 -0400
X-MC-Unique: Dr4PIAs_P9qAnOA8395hHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ECB81012D92;
 Tue, 18 May 2021 13:48:22 +0000 (UTC)
Received: from localhost (ovpn-115-196.ams2.redhat.com [10.36.115.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A82B85C1A1;
 Tue, 18 May 2021 13:48:21 +0000 (UTC)
Date: Tue, 18 May 2021 14:48:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <YKPFpESezZhnNq7A@stefanha-x1.localdomain>
References: <20210430103305.28849-1-chenyi.qiang@intel.com>
 <20210517194629.k4aff57k74lukywd@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210517194629.k4aff57k74lukywd@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NCK+WBH60gmWWP/i"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NCK+WBH60gmWWP/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 03:46:29PM -0400, Eduardo Habkost wrote:
> > +    X86MachineState *x86ms =3D X86_MACHINE(ms);
> > +
> > +    qemu_mutex_lock(&bus_lock_ratelimit_lock);
> > +    uint64_t delay_ns =3D ratelimit_calculate_delay(&x86ms->bus_lock_r=
atelimit_ctrl, 1);
> > +    qemu_mutex_unlock(&bus_lock_ratelimit_lock);
>=20
> Stefan, ratelimit_calculate_delay() is supposed to be thread
> safe, correct?

Yes, it was a recent change by Paolo Bonzini:

  commit 4951967d84a0acbf47895add9158e2d4c6056ea0
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Apr 13 10:20:32 2021 +0200

      ratelimit: protect with a mutex

>=20
> In that case, bus_lock_ratelimit_lock would be completely unnecessary.

I agree.

--NCK+WBH60gmWWP/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCjxaQACgkQnKSrs4Gr
c8gVZQf/Qv5RMoQXCMrMeigUWX6LGIQAxTU4rzE6f16xZfCktTsbNDtltLoKv+U1
lBAgivmtA162UinS1Y7Se6gkRiboTisMFw3yM46kcBRLE8GhleTZC13efslMTCzX
DwemoNVzenx7wX5HQLoOBMjcKvZYmlW7jxd+7PuMDxnBuUfwN+4aPzoE2N7sUNel
TuoFYmL9i7MaHNsgfLp2GLX1WTNodCt7KELHdohYpZ50AlbxrMxQPN07dwj/gOOi
3svdQe/hVQsf5H3g4OCKY12sMJUVycDCdXEoo3slrjPM7lycctIc01XkVsHVbG08
SrM9iXHwbR6ERLO44JPjauOTJD3X3w==
=XZlZ
-----END PGP SIGNATURE-----

--NCK+WBH60gmWWP/i--


