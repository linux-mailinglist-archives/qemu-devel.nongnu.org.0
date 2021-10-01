Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E941F13F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:29:27 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKTW-00028z-9Y
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mWKRL-0000nI-4X
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:27:11 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mWKRJ-00020c-9N
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=U9xXzKTdMOgii859ZIwfiIob9l3wpxTEIR8Z5UwaiUo=; b=Yt8JdPikVW7zgZDDu9akZqh+WN
 eho5rAYAWHZBKEX+MZJ212wTNcveRU9VpFjLsTdQGrRsJlSbuYSWeZM5oxMmd3ToY8gF8Lk8UXfot
 EWDyq1KXJlSkm2Q45rwfoTlkEqdPd6+Kxl1dvONSB2yfBeDn0HqLOZGYTOWKGpuuTIr7fo+QUbLrY
 88ffp0pgnIrLCUcWTQA7CP1GPUAk1UrSxU6Lo0ls9EZNYCCWUus6yxPSaLsBtzh8X7nxAEz4lY4t8
 Mu2hv9WxpmhjW3gXhvn2/nJqlGMYfMM9B7B0OlQEAUycFvjbMIFoDv7BYF8aMpLr/hcR7RcMiIEHb
 DZyrJiH8KgV7tGQ4Ku8gSgHi6VLzCwtclEfaQ8qq90BEQYmEusUvFb9Wbm2enrzInLO7J3cZyKB4E
 SeRUe6h0ZZ1ru7R/UxPYFvoEstRwJBDyeNahC3AfqkCeMyiwVoNqkOlH09XDmvK/hmWKuZhiylV2E
 N1s+ZHLw5y+SwaZ/4CLAjvykwOpw2rH/5uQJoW3pqR9GKTEnXq192ehd0/rkEYviniIX+liCkgsy1
 uzixRHqxetue61xrh86DfJS6YECEEZj8f1g0FS9+Sf02kCEOt0f01qFZEvldMQLv6bDcXQYHRA8qa
 40IoO2WT+dJVuQX/2TnOC/QQiBzKcOk4j44qvOziY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/5] 9pfs: introduce P9Array
Date: Fri, 01 Oct 2021 17:27:06 +0200
Message-ID: <3721374.iaAHClRopi@silver>
In-Reply-To: <YVcmX/lKmHrsivVJ@redhat.com>
References: <cover.1633097129.git.qemu_oss@crudebyte.com>
 <a954ef47b5ac26085a16c5c2aec8695374e0424d.1633097129.git.qemu_oss@crudebyte.com>
 <YVcmX/lKmHrsivVJ@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 1. Oktober 2021 17:16:47 CEST Daniel P. Berrang=E9 wrote:
> On Fri, Oct 01, 2021 at 04:26:17PM +0200, Christian Schoenebeck wrote:
> > Implements deep auto free of arrays while retaining common C-style
> > squared bracket access. Main purpose of this API is to get rid of
> > error prone individual array deallocation pathes in user code, i.e.
> >=20
> > turning something like this:
> >   void doSomething(size_t n) {
> >  =20
> >       Foo *foos =3D malloc(n * sizeof(Foo));
> >       for (...) {
> >      =20
> >           foos[i].s =3D malloc(...);
> >           if (...) {
> >          =20
> >               goto out;
> >          =20
> >           }
> >      =20
> >       }
> >  =20
> >   out:
> >       if (...) {
> >      =20
> >           for (...) {
> >          =20
> >               /* deep deallocation */
> >               free(foos[i].s);
> >          =20
> >           }
> >           /* array deallocation */
> >           free(foos);
> >      =20
> >       }
> >  =20
> >   }
> >=20
> > into something more simple and safer like:
> >   void doSomething(size_t n) {
> >  =20
> >       P9ARRAY_REF(Foo) foos =3D NULL;
> >       P9ARRAY_NEW(Foo, foos, n);
> >       for (...) {
> >      =20
> >           foos[i].s =3D malloc(...);
> >           if (...) {
> >          =20
> >               return; /* array auto freed here */
> >          =20
> >           }
> >      =20
> >       }
> >       /* array auto freed here */
> >  =20
> >   }
>=20
> As explained before, I'm against the idea of introducing new ways
> to automatically free local variables that are not using g_auto*
> functionality. It is not following the QEMU wide coding style
> that is documented.

Yes, your concerns are linked in the cover letter. And I also made it clear=
=20
that what you suggested does not fit either. So my position has not changed.

Best regards,
Christian Schoenebeck



