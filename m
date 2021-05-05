Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D290C373486
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:03:14 +0200 (CEST)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9gn-0003Dy-Sw
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le9eT-0001yA-DE; Wed, 05 May 2021 01:00:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51793 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le9eO-0007ua-Uy; Wed, 05 May 2021 01:00:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZl075K6Jz9sSs; Wed,  5 May 2021 15:00:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620190839;
 bh=YVaBME8cYlAONb7aPI+wLl6ajZoH+W+EQUB5BWnbk2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WS4+6srWjvxiaN17LINkFU52QikAgQ0LIKRc/do7jtcvK1sSGV2LTl7oLyQdW7yZe
 GQW73Bw9uP7F/UsfXTXt9UOcWdYXJet+b9cybGMjmON9pClIzALQqv9+C4nLx281Tm
 Rv51sN/pYOeHLuSRWQgHBLozVPDx2ltS1mSChrUM=
Date: Wed, 5 May 2021 14:42:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG
Message-ID: <YJIiPLlYCJ3kf8LX@yekko>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <87sg331mso.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fjjFp19358KpRUpy"
Content-Disposition: inline
In-Reply-To: <87sg331mso.fsf@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fjjFp19358KpRUpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 07:21:11PM -0300, Fabiano Rosas wrote:
> "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:
>=20
> > After the feedback from v1 I reworked the patch with suggested ideas and
> > this version has less duplicated code and is overall simpler.
> >
> > This patch series is still a WIP, there are still 2 main problems I am
> > trying to solve, I'll mention them in their respective patches.
> >
> > The aim of these patches is to progress toward enabling disable-tcg on
> > PPC by solving errors in hw/ppc with that option.
> >
> > As a WIP comments are welcome.
> >
> > Lucas Mateus Castro (alqotel) (2):
> >   target/ppc: Moved functions out of mmu-hash64
> >   hw/ppc: Moved TCG code to spapr_hcall_tcg
> >
> >  hw/ppc/meson.build       |   3 +
> >  hw/ppc/spapr.c           |   1 +
> >  hw/ppc/spapr_caps.c      |   1 +
> >  hw/ppc/spapr_cpu_core.c  |   1 +
> >  hw/ppc/spapr_hcall.c     | 301 ++--------------------------------
> >  hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
> >  hw/ppc/spapr_rtas.c      |   1 +
> >  target/ppc/meson.build   |   1 +
> >  target/ppc/mmu-hash64.c  |  81 +--------
> >  target/ppc/mmu-hash64.h  |   6 -
> >  target/ppc/mmu-misc.c    |  86 ++++++++++
> >  target/ppc/mmu-misc.h    |  22 +++
> >  12 files changed, 478 insertions(+), 369 deletions(-)
> >  create mode 100644 hw/ppc/spapr_hcall_tcg.c
> >  create mode 100644 target/ppc/mmu-misc.c
> >  create mode 100644 target/ppc/mmu-misc.h
>=20
> This is the list of hypercalls registered with spapr_register_hypercall
> and whether they are implemented by KVM HV, KVM PR or none. I also list
> whether the KVM hcall uses the QEMU implementation as a fallback. Maybe
> it will be helpful to this discussion.
>=20
> (This is from just looking at the code, so take it with a grain of salt)
>=20
> H_ADD_LOGICAL_LAN_BUFFER  - not impl. by KVM
> H_CHANGE_LOGICAL_LAN_MAC  - not impl. by KVM
> H_ENABLE_CRQ              - not impl. by KVM
> H_FREE_CRQ                - not impl. by KVM
> H_FREE_LOGICAL_LAN        - not impl. by KVM
> H_GET_CPU_CHARACTERISTICS - not impl. by KVM
> H_GET_TERM_CHAR           - not impl. by KVM
> H_HOME_NODE_ASSOCIATIVITY - not impl. by KVM
> H_INT_ESB                 - not impl. by KVM
> H_INT_GET_QUEUE_INFO      - not impl. by KVM
> H_INT_GET_SOURCE_CONFIG   - not impl. by KVM
> H_INT_GET_SOURCE_INFO     - not impl. by KVM
> H_INT_RESET               - not impl. by KVM
> H_INT_SET_QUEUE_CONFIG    - not impl. by KVM
> H_INT_SET_SOURCE_CONFIG   - not impl. by KVM
> H_INT_SYNC                - not impl. by KVM
> H_JOIN                    - not impl. by KVM
> H_LOGICAL_CACHE_LOAD      - not impl. by KVM
> H_LOGICAL_CACHE_STORE     - not impl. by KVM
> H_LOGICAL_DCBF            - not impl. by KVM
> H_LOGICAL_ICBI            - not impl. by KVM
> H_MULTICAST_CTRL          - not impl. by KVM
> H_PUT_TERM_CHAR           - not impl. by KVM
> H_REGISTER_LOGICAL_LAN    - not impl. by KVM
> H_REGISTER_PROC_TBL       - not impl. by KVM
> H_REG_CRQ                 - not impl. by KVM
> H_RESIZE_HPT_COMMIT       - not impl. by KVM
> H_RESIZE_HPT_PREPARE      - not impl. by KVM
> H_SCM_BIND_MEM            - not impl. by KVM
> H_SCM_READ_METADATA       - not impl. by KVM
> H_SCM_UNBIND_ALL          - not impl. by KVM
> H_SCM_WRITE_METADATA      - not impl. by KVM
> H_SEND_CRQ                - not impl. by KVM
> H_SEND_LOGICAL_LAN        - not impl. by KVM
> H_SET_SPRG0               - not impl. by KVM
> H_SIGNAL_SYS_RESET        - not impl. by KVM
> H_VIO_SIGNAL              - not impl. by KVM
>=20
> H_CAS                     - not impl. by KVM | called by SLOF only
> H_LOGICAL_MEMOP           - not impl. by KVM | called by SLOF only
> H_TPM_COMM                - not impl. by KVM | called by UV only
> H_UPDATE_DT               - not impl. by KVM | called by SLOF only
>=20
> H_INT_GET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF=
/UV
> H_INT_GET_QUEUE_CONFIG      - not impl. by KVM | not called by linux/SLOF=
/UV
> H_INT_SET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF=
/UV
> H_SCM_UNBIND_MEM            - not impl. by KVM | not called by linux/SLOF=
/UV
>=20
> H_GET_TCE      - HV | not impl. by PR | QEMU fallback
> H_SET_MODE     - HV | not impl. by PR | QEMU fallback
> H_CONFER       - HV | not impl. by PR
> H_PAGE_INIT    - HV | not impl. by PR
> H_PROD         - HV | not impl. by PR
> H_RANDOM       - HV | not impl. by PR
> H_READ         - HV | not impl. by PR
> H_REGISTER_VPA - HV | not impl. by PR
> H_SET_DABR     - HV | not impl. by PR
> H_SET_XDABR    - HV | not impl. by PR
>=20
> H_CPPR             - HV | PR | QEMU fallback
> H_EOI              - HV | PR | QEMU fallback
> H_IPI              - HV | PR | QEMU fallback
> H_IPOLL            - HV | PR | QEMU fallback
> H_LOGICAL_CI_LOAD  - HV | PR | QEMU fallback
> H_LOGICAL_CI_STORE - HV | PR | QEMU fallback
> H_PUT_TCE          - HV | PR | QEMU fallback
> H_PUT_TCE_INDIRECT - HV | PR | QEMU fallback
> H_RTAS             - HV | PR | QEMU fallback
> H_STUFF_TCE        - HV | PR | QEMU fallback
> H_XIRR             - HV | PR | QEMU fallback
> H_XIRR_X           - HV | PR | QEMU fallback
>=20
> H_BULK_REMOVE      - HV | PR
> H_CEDE             - HV | PR
> H_ENTER            - HV | PR
> H_PROTECT          - HV | PR
> H_REMOVE           - HV | PR
>=20
> H_CLEAN_SLB      - never called/implemented, added along with H_REGISTER_=
PROC_TBL
> H_INVALIDATE_PID - never called/implemented, added along with H_REGISTER_=
PROC_TBL

Thanks for summarizing this, Fabiano.

> PS: we could perhaps use this information to annotate
> qemu/include/spapr.h. I can send a patch if people find it useful.

I don't want to include the whole set of information here in qemu,
since exactly what's implemented in KVM is subject to change, and in
most cases qemu doesn't care about that.

It would be worth annotating those hcalls which qemu *relies* on being
provided by KVM.  As I've noted this is basically just the hash MMU calls:
	H_ENTER
	H_REMOVE
	H_BULK_REMOVE
	H_PROTECT
	H_READ
	H_RESIZE_HPT_PREPARE
	H_RESIZE_HPT_COMMIT

Secondarily there's a handful of extra hypercalls which are probably
pointless but harmless to be implemented in qemu for a KVM guest.
They shouldn't be as intimately tied to TCG or the softmmu code as the
above, so dealing with them can wait until a later:
	H_CEDE
	H_CONFER
	H_PROD
	H_REGISTER_VPA

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fjjFp19358KpRUpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCSIjoACgkQbDjKyiDZ
s5JJgg//RxOS8sVd7bMy7233vL2X8GASd+fXPKCsPUPST6NkrNaK2XekuaSkOjeB
42EAzuExEXDWomlwVIZdcm0MPe0s+N1ssH4x2Iq+L4gI2Fb43pbtISyV0zFUonI2
pp3c9wFobtkhYwYksUoLSQwVsHeSJbw0xjuwC3qLbLg/WpNReJEwNd/Nftbk1A1e
jEl0+cvkUTyazyquik477MDItyIZna3gjm5AnfdQAhc3pUxXeINhZ4XHXKq1+iY1
pmdkscpa88LoP0t7LoYxTdiNbni5FvOBFDItUgGdHrCLMxACxQspWK8r6WnvFrMq
E0SJIBcJLah9KBiWfSVBdtXvzwCuPIU4G3qkPR3waeUtlZY+EZSgC3KmEkGj79Fy
ZpWkanMP9QOj3D7dcTLDyBPu3llHNT0TYe8YkVvHa+p+KItxxJpYwOwkhBvcdapA
rt4ZXUFCrv4dqXEAhGc/eVxSLXyMqHmtybyzOmKdeUZCnmb0Zawehij5D4kJ4g9f
41cpKl7H1GBVx/3BBt7nBKo1P2Z5kbFdSU1utaLJz8o65o82bwBbCziUTUUHtBIL
CECMwnZ2Na7IRUDyPvlOi7zZ+JSzLmxKqXaj36KyET5k2TwTanXQqhMMnQyC8AJx
ud3CGyrlrmhrHOkHiK2NgDOOzJZ/W7KePaJRqn8h7ZCceglkGlo=
=wrgu
-----END PGP SIGNATURE-----

--fjjFp19358KpRUpy--

