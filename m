Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E4045FC43
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 04:05:54 +0100 (CET)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqo2C-0007Re-UD
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 22:05:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqnxX-0005Oj-36; Fri, 26 Nov 2021 22:01:05 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:55295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mqnxT-00069d-5w; Fri, 26 Nov 2021 22:01:02 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J1GZr6Mq4z4xbs; Sat, 27 Nov 2021 14:00:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637982052;
 bh=tO1kEbCK7FRIYtMKnNIaBdrQC3J8R77bm92R6BXXbV8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pByOqdjt9Xcdtm4r9nvi5FfIdKui18pvOfD4tLWOZ25ruHbB/t4vjtqjB8XA9Xt0n
 BwIdmrxjIuBM0RkdabDdprt2XXX4Ri3n5Ge+IjF8Z0hbHdaSHpyfqoGddYVJFRGvNs
 /aqscN0jMBVT18DqDAkaymuE7g7pTQOrFUU9YRMs=
Date: Sat, 27 Nov 2021 14:00:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH v3] target/ppc: fix Hash64 MMU update of PTE bit R
Message-ID: <YaGfX6iiNqtO8qb4@yekko>
References: <20211126193940.52513-2-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oaTz/iaxXSqJmion"
Content-Disposition: inline
In-Reply-To: <20211126193940.52513-2-leandro.lupori@eldorado.org.br>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: groug@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oaTz/iaxXSqJmion
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 04:39:40PM -0300, Leandro Lupori wrote:
> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
> offset, causing the first byte of the adjacent PTE to be corrupted.
> This caused a panic when booting FreeBSD, using the Hash MMU.
>=20
> Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
> Changes from v2:
> - Add new defines for the byte offset of PTE bit C and
>   HASH_PTE_SIZE_64 / 2 (pte1)
> - Use new defines in hash64 and spapr code
> ---
>  hw/ppc/spapr.c          | 8 ++++----
>  hw/ppc/spapr_softmmu.c  | 2 +-
>  target/ppc/mmu-hash64.c | 4 ++--
>  target/ppc/mmu-hash64.h | 5 +++++
>  4 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 163c90388a..8ebf85bad8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1414,7 +1414,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>          kvmppc_write_hpte(ptex, pte0, pte1);
>      } else {
>          if (pte0 & HPTE64_V_VALID) {
> -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
> +            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);

Urgh.. so, initially I thought this was wrong because I was confusing
HPTE64_R_BYTE_OFFSET with HPTE64_R_R_BYTE_OFFSET.  I doubt I'd be the
only one.

Calling something a BYTE_OFFSET then doing an stq to it is pretty
misleading I think.  WORD1_OFFSET or R_WORD_OFFSET might be better?

Or you could change these writebacks to byte writes, as powernv has
already been changed.  I'm not sure if that's necessary in the case of
pseries - since in that case the HPT doesn't exist within the guest's
address space.

>              /*
>               * When setting valid, we write PTE1 first. This ensures
>               * proper synchronization with the reading code in
> @@ -1430,7 +1430,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>               * ppc_hash64_pteg_search()
>               */
>              smp_wmb();
> -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
> +            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);
>          }
>      }
>  }
> @@ -1438,7 +1438,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>  static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
>                               uint64_t pte1)
>  {
> -    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + 15;
> +    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_R_C_BYTE_OFFSET;
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
> =20
>      if (!spapr->htab) {
> @@ -1454,7 +1454,7 @@ static void spapr_hpte_set_c(PPCVirtualHypervisor *=
vhyp, hwaddr ptex,
>  static void spapr_hpte_set_r(PPCVirtualHypervisor *vhyp, hwaddr ptex,
>                               uint64_t pte1)
>  {
> -    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + 14;
> +    hwaddr offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OFFSET;
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
> =20
>      if (!spapr->htab) {
> diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
> index f8924270ef..03676c4448 100644
> --- a/hw/ppc/spapr_softmmu.c
> +++ b/hw/ppc/spapr_softmmu.c
> @@ -426,7 +426,7 @@ static void new_hpte_store(void *htab, uint64_t pteg,=
 int slot,
>      addr +=3D slot * HASH_PTE_SIZE_64;
> =20
>      stq_p(addr, pte0);
> -    stq_p(addr + HASH_PTE_SIZE_64 / 2, pte1);
> +    stq_p(addr + HPTE64_R_BYTE_OFFSET, pte1);
>  }
> =20
>  static int rehash_hpte(PowerPCCPU *cpu,
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46..168d397c26 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_=
idx, uint64_t dar, uint64_t
> =20
>  static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>  {
> -    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + 16;
> +    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OF=
FSET;
> =20
>      if (cpu->vhyp) {
>          PPCVirtualHypervisorClass *vhc =3D
> @@ -803,7 +803,7 @@ static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr =
ptex, uint64_t pte1)
> =20
>  static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>  {
> -    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + 15;
> +    hwaddr base, offset =3D ptex * HASH_PTE_SIZE_64 + HPTE64_R_C_BYTE_OF=
FSET;
> =20
>      if (cpu->vhyp) {
>          PPCVirtualHypervisorClass *vhc =3D
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index c5b2f97ff7..2a46763f70 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -97,6 +97,11 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
>  #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
>  #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
> =20
> +/* PTE byte offsets */
> +#define HPTE64_R_R_BYTE_OFFSET  14
> +#define HPTE64_R_C_BYTE_OFFSET  15
> +#define HPTE64_R_BYTE_OFFSET    (HASH_PTE_SIZE_64 / 2)
> +
>  /* Format changes for ARCH v3 */
>  #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
>  #define HPTE64_R_3_0_SSIZE_SHIFT 58

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oaTz/iaxXSqJmion
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGhn18ACgkQbDjKyiDZ
s5IPzhAAuU6JApuLp46I/OV0VqI80svowUH3cBRjjvKyncXnzSzz13CjkjZ0JI+g
YUzTdtawQmTYNTOGqsfgPjLuNiRgvPucZcaxlsBcVA/tvJZigq6Sl3qEJDqe1yjq
QbbZisVFOa/tRIb3Atf4IemkWHE63cL+CppqfxCYR3bk2HmwcEgEK1R17HDY4ZRj
tkHIyrRLqA/I938TWdqJnBDzcTtqF5UpYOV0speVk14nVOrEkqwgEHgGIGJZak5+
yEuosgTN3UfSnEB52R2Z1bJxn4tF/B29AoOey2RlGg96a6ibcHq+kM4D3sHsxxqS
QekHrrzt37QC5KYUfY/cqfphSGd3FTTlInDRTCO2H6iNi6+cy60fF8MGBoUjg34p
hCU30lbJKAtR+gEwA+lBSmJw/yUzj05qfbN6FEmSoIouGKV97LpheOM3J+8DnmHQ
L7G99JebJ3CNdamvsrlyo62if20APCvbu7y7LSHDIET8ljFMQAK+VKifLBbmVslm
51SPPd24IDCyXxs16wIUHTlIAJ1YfcChNBv52RY2bN91a6DMjf/jFjZrXr1IjSl+
o+h7nF9N8zqAtxNEC/UJYTaTNNbnK9cFMsb/QdNU0DTYM2onxhkM8QA8ZAULAv/b
T0Lvsqqg6MY50bxqxzvhX4ZidIvfTPEN2Lfwnifs8pRsTSld+dM=
=elRf
-----END PGP SIGNATURE-----

--oaTz/iaxXSqJmion--

