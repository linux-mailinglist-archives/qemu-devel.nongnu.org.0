Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389412F9AF9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 09:06:07 +0100 (CET)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1PY6-0001Ub-9k
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 03:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l1PWF-0000Uo-0B
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l1PWB-0002Mo-4k
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 03:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610957046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOIGD2G2ecJQm9UNfLUiX/V/JUlu/fKIPOOxEnfsWYw=;
 b=hwJ6zWyAzVAcm6QB9x3fFczxi6f/uNPcuTPJniaaf8OkIw5oOuUW9BpGVJJVYdKsUpNQj8
 tqnA9zNQe+5XtYxxBVjgiWZawtkZ/r0D+4qA4zgJ1NVgmTN+Gkm49533R4EgW10z3dDPbI
 6fWJlFuH8ToKvobJXbgPtDZaXROHim4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-kmAeKK5TOxWGEMqrOhLPiA-1; Mon, 18 Jan 2021 03:04:02 -0500
X-MC-Unique: kmAeKK5TOxWGEMqrOhLPiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72013801817;
 Mon, 18 Jan 2021 08:03:59 +0000 (UTC)
Received: from gondolin (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADCE460622;
 Mon, 18 Jan 2021 08:03:48 +0000 (UTC)
Date: Mon, 18 Jan 2021 09:03:36 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 08/13] confidential guest support: Move SEV
 initialization into arch specific code
Message-ID: <20210118090336.1e708346.cohuck@redhat.com>
In-Reply-To: <20210118030308.GG2089552@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-9-david@gibson.dropbear.id.au>
 <20210115142425.540b6126.cohuck@redhat.com>
 <20210118030308.GG2089552@yekko.fritz.box>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WkEXjtwJyWPKs=NWbty5zOm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/WkEXjtwJyWPKs=NWbty5zOm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Jan 2021 14:03:08 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Jan 15, 2021 at 02:24:25PM +0100, Cornelia Huck wrote:
> > On Thu, 14 Jan 2021 10:58:06 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >  =20
> > > While we've abstracted some (potential) differences between mechanism=
s for
> > > securing guest memory, the initialization is still specific to SEV.  =
Given
> > > that, move it into x86's kvm_arch_init() code, rather than the generic
> > > kvm_init() code.
> > >=20
> > > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > > ---
> > >  accel/kvm/kvm-all.c   | 14 --------------
> > >  accel/kvm/sev-stub.c  |  4 ++--
> > >  target/i386/kvm/kvm.c | 12 ++++++++++++
> > >  target/i386/sev.c     |  7 ++++++-
> > >  4 files changed, 20 insertions(+), 17 deletions(-)
> > >  =20
> >=20
> > (...)
> >  =20
> > > @@ -2135,6 +2136,17 @@ int kvm_arch_init(MachineState *ms, KVMState *=
s)
> > >      uint64_t shadow_mem;
> > >      int ret;
> > >      struct utsname utsname;
> > > +    Error *local_err =3D NULL;
> > > +
> > > +    /*
> > > +     * if memory encryption object is specified then initialize the
> > > +     * memory encryption context (no-op otherwise)
> > > +     */
> > > +    ret =3D sev_kvm_init(ms->cgs, &local_err); =20
> >=20
> > Maybe still leave a comment here, as the code will still need to be
> > modified to handle non-SEV x86 mechanisms? =20
>=20
> Uh.. I'm confused.. this hunk is adding a comment, not removing one..

Yes, but there was a "TODO: handle non-SEV" comment before. This will
probably need some massaging if we add Intel mechanisms?

>=20
> >  =20
> > > +    if (ret < 0) {
> > > +        error_report_err(local_err);
> > > +        return ret;
> > > +    }
> > > =20
> > >      if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
> > >          error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM"=
);

--Sig_/WkEXjtwJyWPKs=NWbty5zOm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAmAFQNgACgkQ3s9rk8bw
L6+rVA//YG3RYaH7PAb1Wxo1thCQnDUklKSye2aqzmkoPAe3RCqWur2vajE5vX3R
rdOJvofTSloYZo0QzMSahu7gBXvh8r1R3O/LEysaOYAUMkguyN9Np2SOZLOpmOwg
Ix+U/cfF5050isQenpKg5Aa9zvsuYaA7soTkZY113MAz/K9eD8ZGQfJWFj36a/Nh
oCyM3BeDq5ByUTJbXruDxV61pMEFRmmpIGOIBlVUOuEA/Vzi5NF1CrkaTA2OOwiM
clj6JU4+VxRgglSckK7c9BBjyvKzb2IIfc4KUkwlsWUmVN0hySDIJnOOqj5KxqRo
hKoW/QVCmkP5p95DA9A+l+K06YdL/ZpLUhTyMOz4+IW47zf1QVh/ndoUWhaZYZPS
NzmAc7KE36WsfSH2XtkyY+PKbcASF+RWja0/+AtASYlbtD3POAz8IFmyAUBpulz2
cEsVc3Rq0F3iU6EteHe74cPFQuw03AOnnILUriQDb7zQZlWiZIQEdAJAyv3f/D2i
/zOPQ7aeqivJf/kK2h6AIA7PrfZPD2CBuonRM2WGEE8HYiVYCYoC8qQkTE0WICrX
nksCDEC5v4sSeRv5+8bMhPR7BRNxNPJWhA06Z4ARB7921TH4Rz9qL38d3OyMvVc8
UyVXOsMqdHnKGzGeZ3uimgx9lzmNfMkRJSmijEpLWWzlepGdC0M=
=du0m
-----END PGP SIGNATURE-----

--Sig_/WkEXjtwJyWPKs=NWbty5zOm--


