Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C90430E17
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 05:20:14 +0200 (CEST)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJC9-00046m-JT
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 23:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mcJ5p-0008Fv-FT; Sun, 17 Oct 2021 23:13:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mcJ5b-0005Nq-CR; Sun, 17 Oct 2021 23:13:40 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HXhlg43wpz4xd8; Mon, 18 Oct 2021 14:13:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634526799;
 bh=EiW1v8EcBZUKcpICVk8rKJ0gDF463OGwucXRCVLwAKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTt/j6ymckGXpaENQichz2g7qZafwj4mYJ2Q64Szkn4mVjQdIP+tUZQj80vKpdC2I
 Xr08/kgyxj8HM744zMD73zGDfTBvZ4iMUwS0OohbirqXcf/mdjHuKoNAughApsTY35
 16JZ8VLb1kf9Rmo6Dt2Mn7PgB3uFSTg/h7TmcO1o=
Date: Mon, 18 Oct 2021 14:13:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 00/15] PPC64/TCG: Implement 'rfebb' instruction
Message-ID: <YWzmRSW6O+NsI0Qq@yekko>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0KPoD2SjrJSFPuKl"
Content-Disposition: inline
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0KPoD2SjrJSFPuKl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 17, 2021 at 10:01:18PM -0300, Daniel Henrique Barboza wrote:
> This new version presents drastic design changes across all areas, most
> of them based on the feedback received in v3.
>=20
> - TCG reviewers: for people looking to review only TCG related changes,
> here's a summmary of where are the TCG code in the series:
>=20
> * Patches that have a lot of TCG/translation changes: 1-4, 9, 13
> * Patches that have TCG/translation bits: 6, 7, 10, 11

Patches 1..4 applied to ppc-for-6.2, still looking at the rest.

> - changes in v3:
>=20
> The most drastic change is in the PMU. We're now working with an
> abstraction called PMUEvent that holds all the event information that
> the helper functions need to process it: the PMC, the event type and an
> overflow timer for cycle events. The PMU will always have 6 PMCEvent
> structs, one for each counter. Counters that aren't being used in that
> moment will have event type 'invalid'. These events are populated only
> when MMCR1 is written. Calculating the PMC values does not require
> multiple calls to 'get_PMC_event()', which has been deleted. In fact,
> this design change cut 60 lines of the power8-pmu.c file compared to the
> previous version, resulting in a more concise logic that will allow for
> easier extension of the PMU in the future.
>=20
> Another change was related to PMCC bits and access control of problem
> state to PMU registers. We're now exposing both PMCC bits and doing a
> proper access control for groupA regs.
>=20
> A new file was created to host the PMU translation code. The 300+ lines
> of the new power8-pmu-regs.c.inc file would be dumped into translate.c.
>=20
> I've also changed the patch order. The exclusive EBB patches were pushed =
to
> the end of the series. I find it easier to add the placeholders for the
> PMC interrupt right at the start but populate them later on, after all
> the PMU logic has already been in place, instead of adding PMU code,
> then EBB, then go back to PMU code again.
>=20
> All other changes were result of these decisions described above.
>=20
> - patch 13 (former 08):
>   * renamed arg_RFEBB to arg_XL_s
>   * added Matheus' R-b
> - other patches:
>   * The changes were so substancial that the patch breakdown with the dif=
fs
> turned out cumbersome and contraproductive.
> - v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg01250=
=2Ehtml=20
>=20
>=20
> Daniel Henrique Barboza (13):
>   target/ppc: add MMCR0 PMCC bits to hflags
>   target/ppc: add user read/write functions for MMCR2
>   target/ppc: adding user read/write functions for PMCs
>   target/ppc: introduce PMU events
>   target/ppc: initialize PMUEvents on MMCR1 write
>   target/ppc: PMU basic cycle count for pseries TCG
>   target/ppc: enable PMU counter overflow with cycle events
>   target/ppc: enable PMU instruction count
>   target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA) event
>   target/ppc: PMU: handle setting of PMCs while running
>   target/ppc/power8-pmu.c: handle overflow bits when PMU is running
>   PPC64/TCG: Implement 'rfebb' instruction
>   target/ppc/excp_helper.c: EBB handling adjustments
>=20
> Gustavo Romero (2):
>   target/ppc: add user read/write functions for MMCR0
>   target/ppc: PMU Event-Based exception support
>=20
>  hw/ppc/spapr_cpu_core.c                |   6 +
>  target/ppc/cpu.h                       |  89 +++++-
>  target/ppc/cpu_init.c                  |  38 +--
>  target/ppc/excp_helper.c               |  92 ++++++
>  target/ppc/helper.h                    |   5 +
>  target/ppc/helper_regs.c               |  10 +
>  target/ppc/insn32.decode               |   5 +
>  target/ppc/meson.build                 |   1 +
>  target/ppc/power8-pmu-regs.c.inc       | 320 +++++++++++++++++++
>  target/ppc/power8-pmu.c                | 410 +++++++++++++++++++++++++
>  target/ppc/power8-pmu.h                |  25 ++
>  target/ppc/spr_tcg.h                   |  12 +
>  target/ppc/translate.c                 |  67 ++++
>  target/ppc/translate/branch-impl.c.inc |  33 ++
>  14 files changed, 1093 insertions(+), 20 deletions(-)
>  create mode 100644 target/ppc/power8-pmu-regs.c.inc
>  create mode 100644 target/ppc/power8-pmu.c
>  create mode 100644 target/ppc/power8-pmu.h
>  create mode 100644 target/ppc/translate/branch-impl.c.inc
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0KPoD2SjrJSFPuKl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFs5kUACgkQbDjKyiDZ
s5J1AxAAn2M+VAJ0DtASPgbSGA8eFwtqs6MdVM+hS5olt4AQMWW3Fr2ihruWYdpZ
kTtb0EbqRVM/IeCSzTHCmQ5A7xm+wcMDASNUW5srcCtCaljg6O/I1Adk/8hWPei5
y5+Wk1tcS/VzKqkrPHOUp3/KE42w4l3j5USspaE9XGgZWgw2dtC8NMpyS6dYer5B
QbSFyR8l6mmOOrcFJ+KkRl9BylX7nPG77V91dTZKP3leMgtGf4lXdhrMeHpCO1D9
OBC+b0cyMb78wkF1cicGdKo1rUwUTrIqIpkU1IPK3fKE9Qvxgmd+yalX7+jHO6ni
9/kwVBDROLgq2RlvfbqjJtTLQx1jld/4csWlWNBN0yAWjE545wX+z4FqqTWzsC+t
kzpiNCqGkNryLdRcAf7jMzKZDK2eRS6h9TpOP0jiWMPaoMBEmEMVilLWArMAd7Gi
sFOmbdyWSxsyoE0RkmYQAg57QipjkmvcGlqkz09MG4eJdKx7w2aEL3G/PlD/9MS1
1IY76W4kiNwIBGF1REXofUaMdzBA6C3NP8/P6Iv4qaKoVy1fKLI4Q6yWLybZ2hDE
EVhiLISv0jykyMFUw67LGEfZsuNNB/NDKvhpHmjsYx12rh6DXZbeNA6ZcEGOcklJ
PRb6oXnIPkLPBlk+p7fRVeVXF984Sa5kyJQJU/sdiTYpCza8w8g=
=TRtW
-----END PGP SIGNATURE-----

--0KPoD2SjrJSFPuKl--

