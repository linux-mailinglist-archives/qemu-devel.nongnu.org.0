Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738C3A6F16
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:32:37 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssK2-0003Zu-F5
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lssHQ-0001sn-41
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:29:52 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lssHO-00034b-0x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:29:51 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-RIMM7GHdNiSAsEDzOKLPyw-1; Mon, 14 Jun 2021 15:29:38 -0400
X-MC-Unique: RIMM7GHdNiSAsEDzOKLPyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1632B1054F93;
 Mon, 14 Jun 2021 19:29:37 +0000 (UTC)
Received: from bahia.lan (ovpn-112-181.ams2.redhat.com [10.36.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EB84197F9;
 Mon, 14 Jun 2021 19:29:34 +0000 (UTC)
Date: Mon, 14 Jun 2021 21:29:33 +0200
From: Greg Kurz <groug@kaod.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for
 radix mmus
Message-ID: <20210614212933.158a19c8@bahia.lan>
In-Reply-To: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 16:16:29 -0300
"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:

> Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>
>=20
> This commit attempts to fix the first bug mentioned by Richard Henderson =
in
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
>=20
> To sumarize the bug here, when radix-style mmus are translating an
> address, they might need to call a second level of translation, with
> hypvervisor priviledges. However, the way it was being done up until
> this point meant that the second level translation had the same
> priviledges as the first level. This would only happen when a TCG guest
> was emulating KVM, which is why it hasn't been discovered yet.
>=20

C=C3=A9dric is definitely the person to Cc: for stuff like this :)

> This patch attempts to correct that by making radix64_*_xlate functions
> receive the mmu_idx, and passing one with the correct permission for the
> second level translation.
>=20
> The mmuidx macros added by this patch are only correct for non-bookE
> mmus, because BookE style set the IS and DS bits inverted and there
> might be other subtle differences. However, there doesn't seem to be
> BookE cpus that have radix-style mmus, so we left a comment there to
> document the issue, in case a machine does have that and was missed.
>=20
> As part of this cleanup, we now need to send the correct mmmu_idx
> when calling get_phys_page_debug, otherwise we might not be able to see t=
he
> memory that the CPU could
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/internal.h    | 12 ++++++++++++
>  target/ppc/mmu-radix64.c | 38 ++++++++++++++++++++++----------------
>  target/ppc/mmu-radix64.h |  2 +-
>  target/ppc/mmu_helper.c  |  8 +++++---
>  4 files changed, 40 insertions(+), 20 deletions(-)
>=20
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index f1fd3c8d04..003df7e8a9 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -245,4 +245,16 @@ static inline int prot_for_access_type(MMUAccessType=
 access_type)
>      g_assert_not_reached();
>  }
> =20
> +/*
> + * These correspond to the mmu_idx values computed in
> + * hreg_compute_hflags_value. See the tables therein
> + */
> +static inline bool mmuidx_pr(int idx) { return !(idx & 1); }
> +/*
> + * If we want to use these macros for hash-style MMUs, we need to
> + * add an if or another macro here.
> + */
> +static inline bool mmuidx_real(int idx) { return idx & 2; }
> +static inline bool mmuidx_hv(int idx) { return idx & 4; }
> +
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index cbd404bfa4..0ae8f6b572 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -155,7 +155,7 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, MM=
UAccessType access_type,
> =20
>  static bool ppc_radix64_check_prot(PowerPCCPU *cpu, MMUAccessType access=
_type,
>                                     uint64_t pte, int *fault_cause, int *=
prot,
> -                                   bool partition_scoped)
> +                                   int mmu_idx, bool partition_scoped)
>  {
>      CPUPPCState *env =3D &cpu->env;
>      int need_prot;
> @@ -173,7 +173,8 @@ static bool ppc_radix64_check_prot(PowerPCCPU *cpu, M=
MUAccessType access_type,
>      /* Determine permissions allowed by Encoded Access Authority */
>      if (!partition_scoped && (pte & R_PTE_EAA_PRIV) && msr_pr) {
>          *prot =3D 0;
> -    } else if (msr_pr || (pte & R_PTE_EAA_PRIV) || partition_scoped) {
> +    } else if (mmuidx_pr(mmu_idx) || (pte & R_PTE_EAA_PRIV) ||
> +               partition_scoped) {
>          *prot =3D ppc_radix64_get_prot_eaa(pte);
>      } else { /* !msr_pr && !(pte & R_PTE_EAA_PRIV) && !partition_scoped =
*/
>          *prot =3D ppc_radix64_get_prot_eaa(pte);
> @@ -299,7 +300,7 @@ static int ppc_radix64_partition_scoped_xlate(PowerPC=
CPU *cpu,
>                                                ppc_v3_pate_t pate,
>                                                hwaddr *h_raddr, int *h_pr=
ot,
>                                                int *h_page_size, bool pde=
_addr,
> -                                              bool guest_visible)
> +                                              int mmu_idx, bool guest_vi=
sible)
>  {
>      int fault_cause =3D 0;
>      hwaddr pte_addr;
> @@ -310,7 +311,9 @@ static int ppc_radix64_partition_scoped_xlate(PowerPC=
CPU *cpu,
>      if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_=
RPDB,
>                                pate.dw0 & PRTBE_R_RPDS, h_raddr, h_page_s=
ize,
>                                &pte, &fault_cause, &pte_addr) ||
> -        ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, h_pr=
ot, true)) {
> +        ppc_radix64_check_prot(cpu, access_type, pte,
> +                               &fault_cause, h_prot, mmu_idx, true)
> +        ) {
>          if (pde_addr) { /* address being translated was that of a guest =
pde */
>              fault_cause |=3D DSISR_PRTABLE_FAULT;
>          }
> @@ -332,7 +335,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>                                              vaddr eaddr, uint64_t pid,
>                                              ppc_v3_pate_t pate, hwaddr *=
g_raddr,
>                                              int *g_prot, int *g_page_siz=
e,
> -                                            bool guest_visible)
> +                                            int mmu_idx, bool guest_visi=
ble)
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
> @@ -367,7 +370,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>          ret =3D ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_=
addr,
>                                                   pate, &h_raddr, &h_prot=
,
>                                                   &h_page_size, true,
> -                                                 guest_visible);
> +            /* mmu_idx is 5 because we're translating from hypervisor sc=
ope */
> +                                                 5, guest_visible);
>          if (ret) {
>              return ret;
>          }
> @@ -407,7 +411,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>              ret =3D ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, pt=
e_addr,
>                                                       pate, &h_raddr, &h_=
prot,
>                                                       &h_page_size, true,
> -                                                     guest_visible);
> +            /* mmu_idx is 5 because we're translating from hypervisor sc=
ope */
> +                                                     5, guest_visible);
>              if (ret) {
>                  return ret;
>              }
> @@ -431,7 +436,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>          *g_raddr =3D (rpn & ~mask) | (eaddr & mask);
>      }
> =20
> -    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause, g_pr=
ot, false)) {
> +    if (ppc_radix64_check_prot(cpu, access_type, pte, &fault_cause,
> +                               g_prot, mmu_idx, false)) {
>          /* Access denied due to protection */
>          if (guest_visible) {
>              ppc_radix64_raise_si(cpu, access_type, eaddr, fault_cause);
> @@ -464,7 +470,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
>   *              +-------------+----------------+---------------+
>   */
>  bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType acces=
s_type,
> -                       hwaddr *raddr, int *psizep, int *protp,
> +                       hwaddr *raddr, int *psizep, int *protp, int mmu_i=
dx,
>                         bool guest_visible)
>  {
>      CPUPPCState *env =3D &cpu->env;
> @@ -474,17 +480,17 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr=
, MMUAccessType access_type,
>      hwaddr g_raddr;
>      bool relocation;
> =20
> -    assert(!(msr_hv && cpu->vhyp));
> +    assert(!(mmuidx_hv(mmu_idx) && cpu->vhyp));
> =20
> -    relocation =3D (access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr)=
;
> +    relocation =3D !mmuidx_real(mmu_idx);
> =20
>      /* HV or virtual hypervisor Real Mode Access */
> -    if (!relocation && (msr_hv || cpu->vhyp)) {
> +    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
>          /* In real mode top 4 effective addr bits (mostly) ignored */
>          *raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
> =20
>          /* In HV mode, add HRMOR if top EA bit is clear */
> -        if (msr_hv || !env->has_hv_mode) {
> +        if (mmuidx_hv(mmu_idx) || !env->has_hv_mode) {
>              if (!(eaddr >> 63)) {
>                  *raddr |=3D env->spr[SPR_HRMOR];
>             }
> @@ -546,7 +552,7 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, =
MMUAccessType access_type,
>      if (relocation) {
>          int ret =3D ppc_radix64_process_scoped_xlate(cpu, access_type, e=
addr, pid,
>                                                     pate, &g_raddr, &prot=
,
> -                                                   &psize, guest_visible=
);
> +                                                   &psize, mmu_idx, gues=
t_visible);
>          if (ret) {
>              return false;
>          }
> @@ -564,13 +570,13 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr=
, MMUAccessType access_type,
>           * quadrants 1 or 2. Translates a guest real address to a host
>           * real address.
>           */
> -        if (lpid || !msr_hv) {
> +        if (lpid || !mmuidx_hv(mmu_idx)) {
>              int ret;
> =20
>              ret =3D ppc_radix64_partition_scoped_xlate(cpu, access_type,=
 eaddr,
>                                                       g_raddr, pate, radd=
r,
>                                                       &prot, &psize, fals=
e,
> -                                                     guest_visible);
> +                                                     mmu_idx, guest_visi=
ble);
>              if (ret) {
>                  return false;
>              }
> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
> index 6b13b89b64..b70357cf34 100644
> --- a/target/ppc/mmu-radix64.h
> +++ b/target/ppc/mmu-radix64.h
> @@ -45,7 +45,7 @@
>  #ifdef TARGET_PPC64
> =20
>  bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType acces=
s_type,
> -                       hwaddr *raddr, int *psizep, int *protp,
> +                       hwaddr *raddr, int *psizep, int *protp, int mmu_i=
dx,
>                         bool guest_visible);
> =20
>  static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index ba1952c77d..9dcdf88597 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2908,7 +2908,7 @@ static bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
>      case POWERPC_MMU_3_00:
>          if (ppc64_v3_radix(cpu)) {
>              return ppc_radix64_xlate(cpu, eaddr, access_type,
> -                                     raddrp, psizep, protp, guest_visibl=
e);
> +                                     raddrp, psizep, protp, mmu_idx, gue=
st_visible);
>          }
>          /* fall through */
>      case POWERPC_MMU_64B:
> @@ -2941,8 +2941,10 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, v=
addr addr)
>       * try an MMU_DATA_LOAD, we may not be able to read instructions
>       * mapped by code TLBs, so we also try a MMU_INST_FETCH.
>       */
> -    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 0, false) ||
> -        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 0, false)) =
{
> +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p,
> +                  cpu_mmu_index(&cpu->env, false), false) ||
> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p,
> +                  cpu_mmu_index(&cpu->env, true), false)) {
>          return raddr & TARGET_PAGE_MASK;
>      }
>      return -1;


