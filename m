Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB5C3A7714
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 08:27:16 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt2Xa-00085d-ID
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 02:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt2WY-0006uR-7n; Tue, 15 Jun 2021 02:26:10 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51799 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt2WT-0000pB-1g; Tue, 15 Jun 2021 02:26:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3yxf23fjz9sW7; Tue, 15 Jun 2021 16:25:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623738358;
 bh=4HOtPqJ1/XJXAdI1Z/D2NihF7X2o63dbCFvfOi3p6ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBM5XD85R68nPYZAIMMFRiZzY2ZOygbc5hRu2zjAHH1AdZ/d89VX94kPk9V0xVuG5
 bVIYJf7/GCuel1oL+hymnKaP3vn4zmg0m3F7qx/aZ+bWIZkNjA379dqTywJZM5q302
 TYlOeYiGdPDUEj9+aqDtaltFI5hPBQgyw3koXmsQ=
Date: Tue, 15 Jun 2021 15:56:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 5/5] target/ppc: powerpc_excp: Move interrupt raising
 code to QOM
Message-ID: <YMhBCQZFYk1O5Ivd@yekko>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-6-farosas@linux.ibm.com>
 <YL2ZdhfEojgOCYIR@yekko> <87zgw1vcnc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vwigFJhF88NPX9ib"
Content-Disposition: inline
In-Reply-To: <87zgw1vcnc.fsf@linux.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vwigFJhF88NPX9ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 01:54:15PM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Tue, Jun 01, 2021 at 06:46:49PM -0300, Fabiano Rosas wrote:
> >> +typedef void (*ppc_intr_fn_t)(PowerPCCPU *cpu, PPCInterrupt *intr,
> >> +                              int excp_model, ppc_intr_args *regs,
> >> +                              bool *ignore);
> >
> > Hmm.  Using this signature kind of enforces that we dispatch based on
> > which exception *then* then the exception model.  I think that's
> > backwards: since what vectors exist and make sense depends on the
> > exception model, I think we should ideally be splitting on model
> > first, then exception type.
> >
> > Now, a lot of the existing code is exception-then-model and changing
> > that is a long term project, but I don't think we should lock
> > ourselves further into doing it the backwards way.
>=20
> Ok, so assuming one C file per exception model, I see three options:
>=20
>  i) exception --> model (current):
>=20
>  Interrupt code separate from models. One implementation for each
>  interrupt that takes the model as argument. Models opt-in which
>  interrupts they want (according to the ISA).
>=20
>  ii) model --> exception:
>=20
>  Interrupt code inside each model file. The model implements only the
>  interrupts which exist (according to ISA). There would be duplication
>  since several models would implement the same system reset, machine
>  check, program, etc.
>=20
>  iii) model --> exception w/ generic interrupts:
>=20
>  Generic interrupt code separate from models. One implementation for
>  each generic interrupt. Models opt-in which interrupts they want
>  (according to the ISA). Models override generic implementation with
>  model-specific ones.
>=20
> Option (i) leads to the most code reuse;

Technically, yes, but my experience with this approach is that because
many of the interrupts have similar, but not quite identical behaviour
in different models, the "common" interrupt path is so littered with
special cases and per-model tests that they become very hard to read.
It also makes things fragile, because it's difficult to refactor or
update things for one model without risking breaking some other model
for an obscure CPU variant you barely know and aren't thinking about
at the time.

Basically the reason I think things look at mess at the moment, is
that historically we've tried to share the implementation for things
that aren't quite similar enough for that to really work well.

> (ii) makes each model and its
> interrupts into one comprehensive unit; (iii) avoids duplication of the
> generic code.

Note that with model-then-exception it's still possible and encouraged
for the model specific code to call back to a common "library"
implementation for things that really do have the same logic between
models.  For simple things like system reset the per-model versions
could well just be stubs calling back to generic code.

But for the complex MMU interrupts, which have heaps of variants and
different cases, I think model-then-exception will make following the
logic much easier.

>=20
> >> +
> >> +struct ppc_intr_args {
> >> +    target_ulong nip;
> >> +    target_ulong msr;
> >> +    target_ulong new_nip;
> >> +    target_ulong new_msr;
> >> +    int sprn_srr0;
> >> +    int sprn_srr1;
> >> +    int sprn_asrr0;
> >> +    int sprn_asrr1;
> >> +    int lev;
> >> +};
> >> +
> >> +struct PPCInterrupt {
> >
> > Having an info/dispatch structure for each vector makes sense..
> >
> >> +    Object parent;
> >
> > ..but making it a QOM object really seems like overkill.  In fact
> > making it a QOM object at least somewhat exposes the internal
> > structure to the user via QMP, which I really don't think we want to
> > do.
>=20
> I'm using QOM code mainly to facilitate the id->function mapping. I'll
> remove the QOM layer and implement my own.
>=20
> >> +
> >> +    int id;
> >> +    const char *name;
> >> +    target_ulong addr;
> >> +    ppc_intr_fn_t setup_regs;
> >> +};
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vwigFJhF88NPX9ib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIQQcACgkQbDjKyiDZ
s5Jucg//YeDwbofNKANdFmX1ru4jHlMr0S3f7sCt0eEP9DxavbAOAlb+qlON0FYJ
66665rAvFrsNQqz9fv0VdcIlWjjoEFy2n+zA6n1MFpvBmRjlb9Nul7cTCj+glwyg
kPBn/XF64kk9IR8IciwJUiS9GYPhXlOXCVrLN5XFdTKWROZ8l9wVwoNF9+FfambU
mZpIPO+1wE+TiVz45kTsOLdgMLCOBmfo6q1negvqW5W5VImzLQar9iugiuh7AhzS
GbieUfz1nxLocH/EkEwhsi1rdMAyHo9H14JIkEmVTnAZHpOf5tc1mrZ0TvF0PTBV
SzU3eYEnIrF6ax7odjqt4Z7U+8tt1w3yO6duoZ59Z23uN/yZXexSTAdtBNJSMk7/
PnI+9ZFJ/CoqgLNpcne3bY99P38/uZW0Hc7E3l08fV7Rm+LdzRu+o03HerURFE0D
pGk0Xgvqcyn5byyQXko1Pq0hLLJuAnA/nGPQbVz4Nk1YVTjcgqT6PgQn/7Odt7+y
XsDdEr5/4EVxTZZFfqzZVSvyXIkDWf2GWAHXPFggC7uFdrvwAguUUfstDv559zXS
xI01s76dipbt66iWKFSr/vbak4nTEX1v0sL8Pre/DaZ+zfmswfJAS8F4eefzFKSm
FSYi4EOzP13psb/Vt8lHP/RQksrJnBDI6JGEgjEIwuBpIwwYAiM=
=1c++
-----END PGP SIGNATURE-----

--vwigFJhF88NPX9ib--

