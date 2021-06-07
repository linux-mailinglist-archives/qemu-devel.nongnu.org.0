Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8239D3C0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 06:03:37 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq6UC-0005DJ-Gd
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 00:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Pk-0007HQ-IZ; Sun, 06 Jun 2021 23:59:00 -0400
Received: from ozlabs.org ([203.11.71.1]:42141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lq6Pe-0007RZ-8b; Sun, 06 Jun 2021 23:59:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fz03b56kSz9sVt; Mon,  7 Jun 2021 13:58:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623038331;
 bh=XcMPaxRksPHtu6steeCnfJN9yxoMBF5ibARGsfvePl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h+1VXvz8N4nmonwJ8nkNMEwmFr851H9ptew+GL7/VU6Ily7ixsRkLsvzrEBvS1+Sg
 crNNRdfhJmduR1iJMxLI5gBKL7c+rHPeyQ5TGwSLTtVLaneTypyOLnjELdX1OnsYEm
 2UbX6RRArr9sou8SZlWQ+ZTfFeH5mqTSf/XjmSRI=
Date: Mon, 7 Jun 2021 13:58:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 5/5] target/ppc: powerpc_excp: Move interrupt raising
 code to QOM
Message-ID: <YL2ZdhfEojgOCYIR@yekko>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-6-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gAVct/IatSXbPq/Z"
Content-Disposition: inline
In-Reply-To: <20210601214649.785647-6-farosas@linux.ibm.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gAVct/IatSXbPq/Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 06:46:49PM -0300, Fabiano Rosas wrote:
> This patch introduces a new way to dispatch the emulated interrupts in
> powerpc_excp. It leverages the QEMU object model to store the
> implementations for each interrupt and link them to their identifier
> from POWERPC_EXCP enum. The processor-specific code then uses this
> identifier to register which interrupts it supports.
>=20
> Interrupts now come out of the big switch in powerpc_excp into their
> own functions:
>=20
>   static void ppc_intr_system_reset(<args>)
>   {
>       /*
>        * Interrupt code. Sets any specific registers and MSR bits.
>        */
>   }
>   PPC_DEFINE_INTR(POWERPC_EXCP_RESET, system_reset, "System reset");
>=20
>   ^This line registers the interrupt with QOM.
>=20
> When we initialize the emulated processor, the correct set of
> interrupts is instantiated (pretty much like we already do):
>=20
>   static void init_excp_POWER9(CPUPPCState *env)
>   {
>       ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
>       (...)
>   }
>=20
> When it comes the time to inject the interrupt:
>=20
>   static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int ex=
cp)
>   {
>       (...)
>=20
>       intr =3D &env->entry_points[excp];
>       intr->setup_regs(<args>);    <-- ppc_intr_system_reset function
>=20
>       (...)
>       env->spr[srr0] =3D nip;
>       env->spr[srr1] =3D msr;
>=20
>       env->nip =3D intr->addr;
>       env->msr =3D new_msr;
>   }
>=20
> Some points to notice:
>=20
> - The structure for the new PPCInterrupt class object is stored
>   directly inside of CPUPPCState (env) so the translation code can
>   still access it linearly at an offset.
>=20
> - Some interrupts were being registered for P7/8/9/10 but were never
>   implemented (i.e. not in the powerpc_excp switch statement). They
>   are likely never triggered. We now get the benefit of QOM warning in
>   such cases:
>=20
>   qemu-system-ppc64: missing object type 'POWERPC_EXCP_SDOOR'
>   qemu-system-ppc64: missing object type 'POWERPC_EXCP_HV_MAINT'
>=20
> - The code currently allows for Program interrupts to be ignored and
>   System call interrupts to be directed to the vhyp hypercall code. I
>   have added an 'ignore' flag to deal with these two cases and return
>   early from powerpc_excp.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/cpu.h         |  29 +-
>  target/ppc/cpu_init.c    | 640 +++++++++++++++++++--------------------
>  target/ppc/excp_helper.c | 545 ++-------------------------------
>  target/ppc/interrupts.c  | 638 ++++++++++++++++++++++++++++++++++++++
>  target/ppc/machine.c     |   2 +-
>  target/ppc/meson.build   |   1 +
>  target/ppc/ppc_intr.h    |  55 ++++
>  target/ppc/translate.c   |   3 +-
>  8 files changed, 1066 insertions(+), 847 deletions(-)
>  create mode 100644 target/ppc/interrupts.c
>  create mode 100644 target/ppc/ppc_intr.h
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index b0934d9be4..012677965f 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -174,6 +174,33 @@ enum {
>      POWERPC_EXCP_TRAP          =3D 0x40,
>  };
> =20
> +typedef struct PPCInterrupt PPCInterrupt;
> +typedef struct ppc_intr_args ppc_intr_args;
> +typedef void (*ppc_intr_fn_t)(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                              int excp_model, ppc_intr_args *regs,
> +                              bool *ignore);

Hmm.  Using this signature kind of enforces that we dispatch based on
which exception *then* then the exception model.  I think that's
backwards: since what vectors exist and make sense depends on the
exception model, I think we should ideally be splitting on model
first, then exception type.

Now, a lot of the existing code is exception-then-model and changing
that is a long term project, but I don't think we should lock
ourselves further into doing it the backwards way.

> +
> +struct ppc_intr_args {
> +    target_ulong nip;
> +    target_ulong msr;
> +    target_ulong new_nip;
> +    target_ulong new_msr;
> +    int sprn_srr0;
> +    int sprn_srr1;
> +    int sprn_asrr0;
> +    int sprn_asrr1;
> +    int lev;
> +};
> +
> +struct PPCInterrupt {

Having an info/dispatch structure for each vector makes sense..

> +    Object parent;

=2E.but making it a QOM object really seems like overkill.  In fact
making it a QOM object at least somewhat exposes the internal
structure to the user via QMP, which I really don't think we want to
do.

> +
> +    int id;
> +    const char *name;
> +    target_ulong addr;
> +    ppc_intr_fn_t setup_regs;
> +};
> +
>  #define PPC_INPUT(env) ((env)->bus_model)
> =20
>  /***********************************************************************=
******/
> @@ -1115,7 +1142,7 @@ struct CPUPPCState {
>      uint32_t irq_input_state;
>      void **irq_inputs;
> =20
> -    target_ulong excp_vectors[POWERPC_EXCP_NB]; /* Exception vectors */
> +    PPCInterrupt entry_points[POWERPC_EXCP_NB];
>      target_ulong excp_prefix;
>      target_ulong ivor_mask;
>      target_ulong ivpr_mask;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d0411e7302..d91183357d 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -46,6 +46,7 @@
>  #include "helper_regs.h"
>  #include "internal.h"
>  #include "spr_tcg.h"
> +#include "ppc_intr.h"
> =20
>  /* #define PPC_DEBUG_SPR */
>  /* #define USE_APPLE_GDB */
> @@ -2132,16 +2133,16 @@ static void register_8xx_sprs(CPUPPCState *env)
>  static void init_excp_4xx_real(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_PIT]      =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      =3D 0x00001010;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00001020;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00002000;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_CRITICAL);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_PIT);
> +    ppc_intr_add(env, 0x00001010, POWERPC_EXCP_FIT);
> +    ppc_intr_add(env, 0x00001020, POWERPC_EXCP_WDT);
> +    ppc_intr_add(env, 0x00002000, POWERPC_EXCP_DEBUG);
>      env->ivor_mask =3D 0x0000FFF0UL;
>      env->ivpr_mask =3D 0xFFFF0000UL;
>      /* Hardware reset vector */
> @@ -2152,20 +2153,20 @@ static void init_excp_4xx_real(CPUPPCState *env)
>  static void init_excp_4xx_softmmu(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_PIT]      =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      =3D 0x00001010;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00001020;
> -    env->excp_vectors[POWERPC_EXCP_DTLB]     =3D 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00002000;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_CRITICAL);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_PIT);
> +    ppc_intr_add(env, 0x00001010, POWERPC_EXCP_FIT);
> +    ppc_intr_add(env, 0x00001020, POWERPC_EXCP_WDT);
> +    ppc_intr_add(env, 0x00001100, POWERPC_EXCP_DTLB);
> +    ppc_intr_add(env, 0x00001200, POWERPC_EXCP_ITLB);
> +    ppc_intr_add(env, 0x00002000, POWERPC_EXCP_DEBUG);
>      env->ivor_mask =3D 0x0000FFF0UL;
>      env->ivpr_mask =3D 0xFFFF0000UL;
>      /* Hardware reset vector */
> @@ -2176,21 +2177,21 @@ static void init_excp_4xx_softmmu(CPUPPCState *en=
v)
>  static void init_excp_MPC5xx(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_FPA]      =3D 0x00000E00;
> -    env->excp_vectors[POWERPC_EXCP_EMUL]     =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_DABR]     =3D 0x00001C00;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001C00;
> -    env->excp_vectors[POWERPC_EXCP_MEXTBR]   =3D 0x00001E00;
> -    env->excp_vectors[POWERPC_EXCP_NMEXTBR]  =3D 0x00001F00;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000E00, POWERPC_EXCP_FPA);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_EMUL);
> +    ppc_intr_add(env, 0x00001C00, POWERPC_EXCP_DABR);
> +    ppc_intr_add(env, 0x00001C00, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001E00, POWERPC_EXCP_MEXTBR);
> +    ppc_intr_add(env, 0x00001F00, POWERPC_EXCP_NMEXTBR);
>      env->ivor_mask =3D 0x0000FFF0UL;
>      env->ivpr_mask =3D 0xFFFF0000UL;
>      /* Hardware reset vector */
> @@ -2201,27 +2202,27 @@ static void init_excp_MPC5xx(CPUPPCState *env)
>  static void init_excp_MPC8xx(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_FPA]      =3D 0x00000E00;
> -    env->excp_vectors[POWERPC_EXCP_EMUL]     =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_DTLB]     =3D 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_ITLBE]    =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_DTLBE]    =3D 0x00001400;
> -    env->excp_vectors[POWERPC_EXCP_DABR]     =3D 0x00001C00;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001C00;
> -    env->excp_vectors[POWERPC_EXCP_MEXTBR]   =3D 0x00001E00;
> -    env->excp_vectors[POWERPC_EXCP_NMEXTBR]  =3D 0x00001F00;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000E00, POWERPC_EXCP_FPA);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_EMUL);
> +    ppc_intr_add(env, 0x00001100, POWERPC_EXCP_ITLB);
> +    ppc_intr_add(env, 0x00001200, POWERPC_EXCP_DTLB);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_ITLBE);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_DTLBE);
> +    ppc_intr_add(env, 0x00001C00, POWERPC_EXCP_DABR);
> +    ppc_intr_add(env, 0x00001C00, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001E00, POWERPC_EXCP_MEXTBR);
> +    ppc_intr_add(env, 0x00001F00, POWERPC_EXCP_NMEXTBR);
>      env->ivor_mask =3D 0x0000FFF0UL;
>      env->ivpr_mask =3D 0xFFFF0000UL;
>      /* Hardware reset vector */
> @@ -2232,23 +2233,23 @@ static void init_excp_MPC8xx(CPUPPCState *env)
>  static void init_excp_G2(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] =3D 0x00000A00;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_IFTLB]    =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_DLTLB]    =3D 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_DSTLB]    =3D 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000A00, POWERPC_EXCP_CRITICAL);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_IFTLB);
> +    ppc_intr_add(env, 0x00001100, POWERPC_EXCP_DLTLB);
> +    ppc_intr_add(env, 0x00001200, POWERPC_EXCP_DSTLB);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2257,26 +2258,26 @@ static void init_excp_G2(CPUPPCState *env)
>  static void init_excp_e200(CPUPPCState *env, target_ulong ivpr_mask)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000FFC;
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_APU]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DTLB]     =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_SPEU]     =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_EFPDI]    =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_EFPRI]    =3D 0x00000000;
> +    ppc_intr_add(env, 0x00000FFC, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_CRITICAL);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_APU);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_FIT);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_WDT);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DTLB);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_ITLB);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DEBUG);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_SPEU);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_EFPDI);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_EFPRI);
>      env->ivor_mask =3D 0x0000FFF7UL;
>      env->ivpr_mask =3D ivpr_mask;
>      /* Hardware reset vector */
> @@ -2287,22 +2288,22 @@ static void init_excp_e200(CPUPPCState *env, targ=
et_ulong ivpr_mask)
>  static void init_excp_BookE(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_APU]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DTLB]     =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00000000;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00000000;
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_CRITICAL);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_APU);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_FIT);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_WDT);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DTLB);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_ITLB);
> +    ppc_intr_add(env, 0x00000000, POWERPC_EXCP_DEBUG);
>      env->ivor_mask =3D 0x0000FFF0UL;
>      env->ivpr_mask =3D 0xFFFF0000UL;
>      /* Hardware reset vector */
> @@ -2313,18 +2314,18 @@ static void init_excp_BookE(CPUPPCState *env)
>  static void init_excp_601(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_IO]       =3D 0x00000A00;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_RUNM]     =3D 0x00002000;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000A00, POWERPC_EXCP_IO);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00002000, POWERPC_EXCP_RUNM);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2334,24 +2335,24 @@ static void init_excp_602(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      /* XXX: exception prefix has a special behavior on 602 */
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_IFTLB]    =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_DLTLB]    =3D 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_DSTLB]    =3D 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      =3D 0x00001500;
> -    env->excp_vectors[POWERPC_EXCP_EMUL]     =3D 0x00001600;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_IFTLB);
> +    ppc_intr_add(env, 0x00001100, POWERPC_EXCP_DLTLB);
> +    ppc_intr_add(env, 0x00001200, POWERPC_EXCP_DSTLB);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
> +    ppc_intr_add(env, 0x00001500, POWERPC_EXCP_WDT);
> +    ppc_intr_add(env, 0x00001600, POWERPC_EXCP_EMUL);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2360,22 +2361,22 @@ static void init_excp_602(CPUPPCState *env)
>  static void init_excp_603(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_IFTLB]    =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_DLTLB]    =3D 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_DSTLB]    =3D 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_IFTLB);
> +    ppc_intr_add(env, 0x00001100, POWERPC_EXCP_DLTLB);
> +    ppc_intr_add(env, 0x00001200, POWERPC_EXCP_DSTLB);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2384,20 +2385,20 @@ static void init_excp_603(CPUPPCState *env)
>  static void init_excp_604(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2406,21 +2407,21 @@ static void init_excp_604(CPUPPCState *env)
>  static void init_excp_7x0(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> -    env->excp_vectors[POWERPC_EXCP_THERM]    =3D 0x00001700;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
> +    ppc_intr_add(env, 0x00001700, POWERPC_EXCP_THERM);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2429,20 +2430,20 @@ static void init_excp_7x0(CPUPPCState *env)
>  static void init_excp_750cl(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2451,20 +2452,20 @@ static void init_excp_750cl(CPUPPCState *env)
>  static void init_excp_750cx(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_THERM]    =3D 0x00001700;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001700, POWERPC_EXCP_THERM);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2474,24 +2475,24 @@ static void init_excp_750cx(CPUPPCState *env)
>  static void init_excp_7x5(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_IFTLB]    =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_DLTLB]    =3D 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_DSTLB]    =3D 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> -    env->excp_vectors[POWERPC_EXCP_THERM]    =3D 0x00001700;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_IFTLB);
> +    ppc_intr_add(env, 0x00001100, POWERPC_EXCP_DLTLB);
> +    ppc_intr_add(env, 0x00001200, POWERPC_EXCP_DSTLB);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
> +    ppc_intr_add(env, 0x00001700, POWERPC_EXCP_THERM);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2500,23 +2501,23 @@ static void init_excp_7x5(CPUPPCState *env)
>  static void init_excp_7400(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_VPU]      =3D 0x00000F20;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> -    env->excp_vectors[POWERPC_EXCP_VPUA]     =3D 0x00001600;
> -    env->excp_vectors[POWERPC_EXCP_THERM]    =3D 0x00001700;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00000F20, POWERPC_EXCP_VPU);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
> +    ppc_intr_add(env, 0x00001600, POWERPC_EXCP_VPUA);
> +    ppc_intr_add(env, 0x00001700, POWERPC_EXCP_THERM);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2525,25 +2526,25 @@ static void init_excp_7400(CPUPPCState *env)
>  static void init_excp_7450(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_VPU]      =3D 0x00000F20;
> -    env->excp_vectors[POWERPC_EXCP_IFTLB]    =3D 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_DLTLB]    =3D 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_DSTLB]    =3D 0x00001200;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_SMI]      =3D 0x00001400;
> -    env->excp_vectors[POWERPC_EXCP_VPUA]     =3D 0x00001600;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00000F20, POWERPC_EXCP_VPU);
> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_IFTLB);
> +    ppc_intr_add(env, 0x00001100, POWERPC_EXCP_DLTLB);
> +    ppc_intr_add(env, 0x00001200, POWERPC_EXCP_DSTLB);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001400, POWERPC_EXCP_SMI);
> +    ppc_intr_add(env, 0x00001600, POWERPC_EXCP_VPUA);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x00000100UL;
>  #endif
> @@ -2553,26 +2554,26 @@ static void init_excp_7450(CPUPPCState *env)
>  static void init_excp_970(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_DSEG]     =3D 0x00000380;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_ISEG]     =3D 0x00000480;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_HDECR]    =3D 0x00000980;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_VPU]      =3D 0x00000F20;
> -    env->excp_vectors[POWERPC_EXCP_IABR]     =3D 0x00001300;
> -    env->excp_vectors[POWERPC_EXCP_MAINT]    =3D 0x00001600;
> -    env->excp_vectors[POWERPC_EXCP_VPUA]     =3D 0x00001700;
> -    env->excp_vectors[POWERPC_EXCP_THERM]    =3D 0x00001800;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000380, POWERPC_EXCP_DSEG);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000480, POWERPC_EXCP_ISEG);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000980, POWERPC_EXCP_HDECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00000F20, POWERPC_EXCP_VPU);
> +    ppc_intr_add(env, 0x00001300, POWERPC_EXCP_IABR);
> +    ppc_intr_add(env, 0x00001600, POWERPC_EXCP_MAINT);
> +    ppc_intr_add(env, 0x00001700, POWERPC_EXCP_VPUA);
> +    ppc_intr_add(env, 0x00001800, POWERPC_EXCP_THERM);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x0000000000000100ULL;
>  #endif
> @@ -2581,27 +2582,27 @@ static void init_excp_970(CPUPPCState *env)
>  static void init_excp_POWER7(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_RESET]    =3D 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   =3D 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_DSI]      =3D 0x00000300;
> -    env->excp_vectors[POWERPC_EXCP_DSEG]     =3D 0x00000380;
> -    env->excp_vectors[POWERPC_EXCP_ISI]      =3D 0x00000400;
> -    env->excp_vectors[POWERPC_EXCP_ISEG]     =3D 0x00000480;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] =3D 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    =3D 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  =3D 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_FPU]      =3D 0x00000800;
> -    env->excp_vectors[POWERPC_EXCP_DECR]     =3D 0x00000900;
> -    env->excp_vectors[POWERPC_EXCP_HDECR]    =3D 0x00000980;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  =3D 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_TRACE]    =3D 0x00000D00;
> -    env->excp_vectors[POWERPC_EXCP_HDSI]     =3D 0x00000E00;
> -    env->excp_vectors[POWERPC_EXCP_HISI]     =3D 0x00000E20;
> -    env->excp_vectors[POWERPC_EXCP_HV_EMU]   =3D 0x00000E40;
> -    env->excp_vectors[POWERPC_EXCP_HV_MAINT] =3D 0x00000E60;
> -    env->excp_vectors[POWERPC_EXCP_PERFM]    =3D 0x00000F00;
> -    env->excp_vectors[POWERPC_EXCP_VPU]      =3D 0x00000F20;
> -    env->excp_vectors[POWERPC_EXCP_VSXU]     =3D 0x00000F40;
> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_RESET);
> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
> +    ppc_intr_add(env, 0x00000300, POWERPC_EXCP_DSI);
> +    ppc_intr_add(env, 0x00000380, POWERPC_EXCP_DSEG);
> +    ppc_intr_add(env, 0x00000400, POWERPC_EXCP_ISI);
> +    ppc_intr_add(env, 0x00000480, POWERPC_EXCP_ISEG);
> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
> +    ppc_intr_add(env, 0x00000800, POWERPC_EXCP_FPU);
> +    ppc_intr_add(env, 0x00000900, POWERPC_EXCP_DECR);
> +    ppc_intr_add(env, 0x00000980, POWERPC_EXCP_HDECR);
> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
> +    ppc_intr_add(env, 0x00000D00, POWERPC_EXCP_TRACE);
> +    ppc_intr_add(env, 0x00000E00, POWERPC_EXCP_HDSI);
> +    ppc_intr_add(env, 0x00000E20, POWERPC_EXCP_HISI);
> +    ppc_intr_add(env, 0x00000E40, POWERPC_EXCP_HV_EMU);
> +    ppc_intr_add(env, 0x00000E60, POWERPC_EXCP_HV_MAINT);
> +    ppc_intr_add(env, 0x00000F00, POWERPC_EXCP_PERFM);
> +    ppc_intr_add(env, 0x00000F20, POWERPC_EXCP_VPU);
> +    ppc_intr_add(env, 0x00000F40, POWERPC_EXCP_VSXU);
>      /* Hardware reset vector */
>      env->hreset_vector =3D 0x0000000000000100ULL;
>  #endif
> @@ -2612,10 +2613,10 @@ static void init_excp_POWER8(CPUPPCState *env)
>      init_excp_POWER7(env);
> =20
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_SDOOR]    =3D 0x00000A00;
> -    env->excp_vectors[POWERPC_EXCP_FU]       =3D 0x00000F60;
> -    env->excp_vectors[POWERPC_EXCP_HV_FU]    =3D 0x00000F80;
> -    env->excp_vectors[POWERPC_EXCP_SDOOR_HV] =3D 0x00000E80;
> +    ppc_intr_add(env, 0x00000A00, POWERPC_EXCP_SDOOR);
> +    ppc_intr_add(env, 0x00000F60, POWERPC_EXCP_FU);
> +    ppc_intr_add(env, 0x00000F80, POWERPC_EXCP_HV_FU);
> +    ppc_intr_add(env, 0x00000E80, POWERPC_EXCP_SDOOR_HV);
>  #endif
>  }
> =20
> @@ -2624,8 +2625,8 @@ static void init_excp_POWER9(CPUPPCState *env)
>      init_excp_POWER8(env);
> =20
>  #if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_HVIRT]    =3D 0x00000EA0;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] =3D 0x00017000;
> +    ppc_intr_add(env, 0x00000EA0, POWERPC_EXCP_HVIRT);
> +    ppc_intr_add(env, 0x00017000, POWERPC_EXCP_SYSCALL_VECTORED);
>  #endif
>  }
> =20
> @@ -8375,13 +8376,8 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>      CPUPPCState *env =3D &cpu->env;
>  #if !defined(CONFIG_USER_ONLY)
> -    int i;
> =20
>      env->irq_inputs =3D NULL;
> -    /* Set all exception vectors to an invalid address */
> -    for (i =3D 0; i < POWERPC_EXCP_NB; i++) {
> -        env->excp_vectors[i] =3D (target_ulong)(-1ULL);
> -    }
>      env->ivor_mask =3D 0x00000000;
>      env->ivpr_mask =3D 0x00000000;
>      /* Default MMU definitions */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 12bf829c8f..26cbfab923 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -29,14 +29,6 @@
>  #endif
> =20
>  /* #define DEBUG_OP */
> -/* #define DEBUG_SOFTWARE_TLB */
> -/* #define DEBUG_EXCEPTIONS */
> -
> -#ifdef DEBUG_EXCEPTIONS
> -#  define LOG_EXCP(...) qemu_log(__VA_ARGS__)
> -#else
> -#  define LOG_EXCP(...) do { } while (0)
> -#endif
> =20
>  /***********************************************************************=
******/
>  /* Exception processing */
> @@ -58,32 +50,6 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>      env->error_code =3D 0;
>  }
>  #else /* defined(CONFIG_USER_ONLY) */
> -static inline void dump_syscall(CPUPPCState *env)
> -{
> -    qemu_log_mask(CPU_LOG_INT, "syscall r0=3D%016" PRIx64
> -                  " r3=3D%016" PRIx64 " r4=3D%016" PRIx64 " r5=3D%016" P=
RIx64
> -                  " r6=3D%016" PRIx64 " r7=3D%016" PRIx64 " r8=3D%016" P=
RIx64
> -                  " nip=3D" TARGET_FMT_lx "\n",
> -                  ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
> -                  ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
> -                  ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
> -                  ppc_dump_gpr(env, 8), env->nip);
> -}
> -
> -static inline void dump_hcall(CPUPPCState *env)
> -{
> -    qemu_log_mask(CPU_LOG_INT, "hypercall r3=3D%016" PRIx64
> -                  " r4=3D%016" PRIx64 " r5=3D%016" PRIx64 " r6=3D%016" P=
RIx64
> -                  " r7=3D%016" PRIx64 " r8=3D%016" PRIx64 " r9=3D%016" P=
RIx64
> -                  " r10=3D%016" PRIx64 " r11=3D%016" PRIx64 " r12=3D%016=
" PRIx64
> -                  " nip=3D" TARGET_FMT_lx "\n",
> -                  ppc_dump_gpr(env, 3), ppc_dump_gpr(env, 4),
> -                  ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
> -                  ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
> -                  ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
> -                  ppc_dump_gpr(env, 11), ppc_dump_gpr(env, 12),
> -                  env->nip);
> -}
> =20
>  static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
>                                  target_ulong *msr)
> @@ -311,17 +277,6 @@ static inline void powerpc_set_excp_state(PowerPCCPU=
 *cpu, target_ulong new_nip,
>      check_tlb_flush(env, false);
>  }
> =20
> -struct ppc_intr_args {
> -    target_ulong nip;
> -    target_ulong msr;
> -    target_ulong new_nip;
> -    target_ulong new_msr;
> -    int sprn_srr0;
> -    int sprn_srr1;
> -    int sprn_asrr0;
> -    int sprn_asrr1;
> -};
> -
>  /*
>   * Note that this function should be greatly optimized when called
>   * with a constant excp, from ppc_hw_interrupt
> @@ -331,11 +286,21 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>      CPUState *cs =3D CPU(cpu);
>      CPUPPCState *env =3D &cpu->env;
>      struct ppc_intr_args regs;
> -    int lev =3D -1;
> +    PPCInterrupt *intr;
> +    bool ignore =3D false;
> =20
>      qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                    " =3D> %08x (%02x)\n", env->nip, excp, env->error_code=
);
> =20
> +    if (excp =3D=3D POWERPC_EXCP_NONE) {
> +        return;
> +    }
> +
> +    if (excp < POWERPC_EXCP_NONE || excp >=3D POWERPC_EXCP_NB) {
> +        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> +        return;
> +    }
> +
>      /* new srr1 value excluding must-be-zero bits */
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {
>          regs.msr =3D env->msr;
> @@ -380,469 +345,21 @@ static inline void powerpc_excp(PowerPCCPU *cpu, i=
nt excp_model, int excp)
>          excp =3D POWERPC_EXCP_PROGRAM;
>      }
> =20
> -    switch (excp) {
> -    case POWERPC_EXCP_NONE:
> -        /* Should never happen */
> -        return;
> -    case POWERPC_EXCP_CRITICAL:    /* Critical input                    =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            regs.sprn_srr0 =3D SPR_40x_SRR2;
> -            regs.sprn_srr1 =3D SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> -            regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
> -            break;
> -        case POWERPC_EXCP_G2:
> -            break;
> -        default:
> -            goto excp_invalid;
> -        }
> -        break;
> -    case POWERPC_EXCP_MCHECK:    /* Machine check exception             =
     */
> -        if (msr_me =3D=3D 0) {
> -            /*
> -             * Machine check exception is not enabled.  Enter
> -             * checkstop state.
> -             */
> -            fprintf(stderr, "Machine check while not allowed. "
> -                    "Entering checkstop state\n");
> -            if (qemu_log_separate()) {
> -                qemu_log("Machine check while not allowed. "
> -                        "Entering checkstop state\n");
> -            }
> -            cs->halted =3D 1;
> -            cpu_interrupt_exittb(cs);
> -        }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR).
> -             */
> -            regs.new_msr |=3D (target_ulong)MSR_HVB;
> -        }
> -
> -        /* machine check exceptions don't have ME set */
> -        regs.new_msr &=3D ~((target_ulong)1 << MSR_ME);
> -
> -        /* XXX: should also have something loaded in DAR / DSISR */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            regs.sprn_srr0 =3D SPR_40x_SRR2;
> -            regs.sprn_srr1 =3D SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            /* FIXME: choose one or the other based on CPU type */
> -            regs.sprn_srr0 =3D SPR_BOOKE_MCSRR0;
> -            regs.sprn_srr1 =3D SPR_BOOKE_MCSRR1;
> -            regs.sprn_asrr0 =3D SPR_BOOKE_CSRR0;
> -            regs.sprn_asrr1 =3D SPR_BOOKE_CSRR1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
> -        LOG_EXCP("DSI exception: DSISR=3D" TARGET_FMT_lx" DAR=3D" TARGET=
_FMT_lx
> -                 "\n", env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> -        break;
> -    case POWERPC_EXCP_ISI:       /* Instruction storage exception       =
     */
> -        LOG_EXCP("ISI exception: msr=3D" TARGET_FMT_lx ", nip=3D" TARGET=
_FMT_lx
> -                 "\n", regs.msr, regs.nip);
> -        regs.msr |=3D env->error_code;
> -        break;
> -    case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
> -    {
> -        bool lpes0;
> -
> -        cs =3D CPU(cpu);
> -
> -        /*
> -         * Exception targeting modifiers
> -         *
> -         * LPES0 is supported on POWER7/8/9
> -         * LPES1 is not supported (old iSeries mode)
> -         *
> -         * On anything else, we behave as if LPES0 is 1
> -         * (externals don't alter MSR:HV)
> -         */
> -#if defined(TARGET_PPC64)
> -        if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> -            excp_model =3D=3D POWERPC_EXCP_POWER10) {
> -            lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> -        } else
> -#endif /* defined(TARGET_PPC64) */
> -        {
> -            lpes0 =3D true;
> -        }
> -
> -        if (!lpes0) {
> -            regs.new_msr |=3D (target_ulong)MSR_HVB;
> -            regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -            regs.sprn_srr0 =3D SPR_HSRR0;
> -            regs.sprn_srr1 =3D SPR_HSRR1;
> -        }
> -        if (env->mpic_proxy) {
> -            /* IACK the IRQ on delivery */
> -            env->spr[SPR_BOOKE_EPR] =3D ldl_phys(cs->as, env->mpic_iack);
> -        }
> -        break;
> +    intr =3D &env->entry_points[excp];
> +    if (!intr->setup_regs) {
> +        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> +                  excp);
>      }
> -    case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
> -        /* Get rS/rD and rA from faulting opcode */
> -        /*
> -         * Note: the opcode fields will not be set properly for a
> -         * direct store load/store, but nobody cares as nobody
> -         * actually uses direct store segments.
> -         */
> -        env->spr[SPR_DSISR] |=3D (env->error_code & 0x03FF0000) >> 16;
> -        break;
> -    case POWERPC_EXCP_PROGRAM:   /* Program exception                   =
     */
> -        switch (env->error_code & ~0xF) {
> -        case POWERPC_EXCP_FP:
> -            if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D =
0) {
> -                LOG_EXCP("Ignore floating point exception\n");
> -                cs->exception_index =3D POWERPC_EXCP_NONE;
> -                env->error_code =3D 0;
> -                return;
> -            }
> =20
> -            /*
> -             * FP exceptions always have NIP pointing to the faulting
> -             * instruction, so always use store_next and claim we are
> -             * precise in the MSR.
> -             */
> -            regs.msr |=3D 0x00100000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
> -            break;
> -        case POWERPC_EXCP_INVAL:
> -            LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", regs.=
nip);
> -            regs.msr |=3D 0x00080000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
> -            break;
> -        case POWERPC_EXCP_PRIV:
> -            regs.msr |=3D 0x00040000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PPR;
> -            break;
> -        case POWERPC_EXCP_TRAP:
> -            regs.msr |=3D 0x00020000;
> -            env->spr[SPR_BOOKE_ESR] =3D ESR_PTR;
> -            break;
> -        default:
> -            /* Should never occur */
> -            cpu_abort(cs, "Invalid program exception %d. Aborting\n",
> -                      env->error_code);
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_SYSCALL:   /* System call exception               =
     */
> -        lev =3D env->error_code;
> -
> -        if ((lev =3D=3D 1) && cpu->vhyp) {
> -            dump_hcall(env);
> -        } else {
> -            dump_syscall(env);
> -        }
> +    regs.new_nip =3D intr->addr | env->excp_prefix;
> +    intr->setup_regs(cpu, intr, excp_model, &regs, &ignore);
> =20
> +    if (ignore) {
>          /*
> -         * We need to correct the NIP which in this case is supposed
> -         * to point to the next instruction. We also set env->nip here
> -         * because the modification needs to be accessible by the
> -         * virtual hypervisor code below.
> +         * The interrupt was ignored or delivered by other means
> +         * (e.g. vhyp).
>           */
> -        regs.nip +=3D 4;
> -        env->nip =3D regs.nip;
> -
> -        /* "PAPR mode" built-in hypercall emulation */
> -        if ((lev =3D=3D 1) && cpu->vhyp) {
> -            PPCVirtualHypervisorClass *vhc =3D
> -                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> -            vhc->hypercall(cpu->vhyp, cpu);
> -            return;
> -        }
> -
> -        if (lev =3D=3D 1) {
> -            regs.new_msr |=3D (target_ulong)MSR_HVB;
> -        }
> -        break;
> -    case POWERPC_EXCP_SYSCALL_VECTORED: /* scv exception                =
     */
> -        lev =3D env->error_code;
> -        dump_syscall(env);
> -        regs.nip +=3D 4;
> -        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> -        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -        break;
> -    case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception=
     */
> -    case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable     =
     */
> -    case POWERPC_EXCP_DECR:      /* Decrementer exception               =
     */
> -        break;
> -    case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt      =
     */
> -        /* FIT on 4xx */
> -        LOG_EXCP("FIT exception\n");
> -        break;
> -    case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt            =
     */
> -        LOG_EXCP("WDT exception\n");
> -        switch (excp_model) {
> -        case POWERPC_EXCP_BOOKE:
> -            regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> -            regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
> -            break;
> -        default:
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_DTLB:      /* Data TLB error                      =
     */
> -    case POWERPC_EXCP_ITLB:      /* Instruction TLB error               =
     */
> -        break;
> -    case POWERPC_EXCP_DEBUG:     /* Debug interrupt                     =
     */
> -        if (env->flags & POWERPC_FLAG_DE) {
> -            /* FIXME: choose one or the other based on CPU type */
> -            regs.sprn_srr0 =3D SPR_BOOKE_DSRR0;
> -            regs.sprn_srr1 =3D SPR_BOOKE_DSRR1;
> -            regs.sprn_asrr0 =3D SPR_BOOKE_CSRR0;
> -            regs.sprn_asrr1 =3D SPR_BOOKE_CSRR1;
> -            /* DBSR already modified by caller */
> -        } else {
> -            cpu_abort(cs, "Debug exception triggered on unsupported mode=
l\n");
> -        }
> -        break;
> -    case POWERPC_EXCP_SPEU:      /* SPE/embedded floating-point unavaila=
ble  */
> -        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interru=
pt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Embedded floating point data exception "
> -                  "is not implemented yet !\n");
> -        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interr=
upt  */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Embedded floating point round exception "
> -                  "is not implemented yet !\n");
> -        env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> -        break;
> -    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interru=
pt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "Performance counter exception is not implemented yet =
!\n");
> -        break;
> -    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt         =
     */
> -        break;
> -    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt=
     */
> -        regs.sprn_srr0 =3D SPR_BOOKE_CSRR0;
> -        regs.sprn_srr1 =3D SPR_BOOKE_CSRR1;
> -        break;
> -    case POWERPC_EXCP_RESET:     /* System reset exception              =
     */
> -        /* A power-saving exception sets ME, otherwise it is unchanged */
> -        if (msr_pow) {
> -            /* indicate that we resumed from power save mode */
> -            regs.msr |=3D 0x10000;
> -            regs.new_msr |=3D ((target_ulong)1 << MSR_ME);
> -        }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
> -             */
> -            regs.new_msr |=3D (target_ulong)MSR_HVB;
> -        } else {
> -            if (msr_pow) {
> -                cpu_abort(cs, "Trying to deliver power-saving system res=
et "
> -                          "exception %d with no HV support\n", excp);
> -            }
> -        }
> -        break;
> -    case POWERPC_EXCP_DSEG:      /* Data segment exception              =
     */
> -    case POWERPC_EXCP_ISEG:      /* Instruction segment exception       =
     */
> -    case POWERPC_EXCP_TRACE:     /* Trace exception                     =
     */
> -        break;
> -    case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
> -        regs.msr |=3D env->error_code;
> -        /* fall through */
> -    case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
> -    case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
> -    case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception   =
     */
> -    case POWERPC_EXCP_HISEG:     /* Hypervisor instruction segment excep=
tion */
> -    case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt       =
     */
> -    case POWERPC_EXCP_HV_EMU:
> -    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization           =
     */
> -        regs.sprn_srr0 =3D SPR_HSRR0;
> -        regs.sprn_srr1 =3D SPR_HSRR1;
> -        regs.new_msr |=3D (target_ulong)MSR_HVB;
> -        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -        break;
> -    case POWERPC_EXCP_VPU:       /* Vector unavailable exception        =
     */
> -    case POWERPC_EXCP_VSXU:       /* VSX unavailable exception          =
     */
> -    case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
> -#endif
> -        break;
> -    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
> -#ifdef TARGET_PPC64
> -        env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
> -        regs.sprn_srr0 =3D SPR_HSRR0;
> -        regs.sprn_srr1 =3D SPR_HSRR1;
> -        regs.new_msr |=3D (target_ulong)MSR_HVB;
> -        regs.new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> -#endif
> -        break;
> -    case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
> -        LOG_EXCP("PIT exception\n");
> -        break;
> -    case POWERPC_EXCP_IO:        /* IO error exception                  =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "601 IO error exception is not implemented yet !\n=
");
> -        break;
> -    case POWERPC_EXCP_RUNM:      /* Run mode exception                  =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "601 run mode exception is not implemented yet !\n=
");
> -        break;
> -    case POWERPC_EXCP_EMUL:      /* Emulation trap exception            =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "602 emulation trap exception "
> -                  "is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error         =
     */
> -    case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                  =
     */
> -    case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                 =
     */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_602:
> -        case POWERPC_EXCP_603:
> -        case POWERPC_EXCP_603E:
> -        case POWERPC_EXCP_G2:
> -            /* Swap temporary saved registers with GPRs */
> -            if (!(regs.new_msr & ((target_ulong)1 << MSR_TGPR))) {
> -                regs.new_msr |=3D (target_ulong)1 << MSR_TGPR;
> -                hreg_swap_gpr_tgpr(env);
> -            }
> -            /* fall through */
> -        case POWERPC_EXCP_7x5:
> -#if defined(DEBUG_SOFTWARE_TLB)
> -            if (qemu_log_enabled()) {
> -                const char *es;
> -                target_ulong *miss, *cmp;
> -                int en;
> -
> -                if (excp =3D=3D POWERPC_EXCP_IFTLB) {
> -                    es =3D "I";
> -                    en =3D 'I';
> -                    miss =3D &env->spr[SPR_IMISS];
> -                    cmp =3D &env->spr[SPR_ICMP];
> -                } else {
> -                    if (excp =3D=3D POWERPC_EXCP_DLTLB) {
> -                        es =3D "DL";
> -                    } else {
> -                        es =3D "DS";
> -                    }
> -                    en =3D 'D';
> -                    miss =3D &env->spr[SPR_DMISS];
> -                    cmp =3D &env->spr[SPR_DCMP];
> -                }
> -                qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -                         TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> -                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cm=
p,
> -                         env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> -                         env->error_code);
> -            }
> -#endif
> -            regs.msr |=3D env->crf[0] << 28;
> -            regs.msr |=3D env->error_code; /* key, D/I, S/L bits */
> -            /* Set way using a LRU mechanism */
> -            regs.msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << =
17;
> -            break;
> -        case POWERPC_EXCP_74xx:
> -#if defined(DEBUG_SOFTWARE_TLB)
> -            if (qemu_log_enabled()) {
> -                const char *es;
> -                target_ulong *miss, *cmp;
> -                int en;
> -
> -                if (excp =3D=3D POWERPC_EXCP_IFTLB) {
> -                    es =3D "I";
> -                    en =3D 'I';
> -                    miss =3D &env->spr[SPR_TLBMISS];
> -                    cmp =3D &env->spr[SPR_PTEHI];
> -                } else {
> -                    if (excp =3D=3D POWERPC_EXCP_DLTLB) {
> -                        es =3D "DL";
> -                    } else {
> -                        es =3D "DS";
> -                    }
> -                    en =3D 'D';
> -                    miss =3D &env->spr[SPR_TLBMISS];
> -                    cmp =3D &env->spr[SPR_PTEHI];
> -                }
> -                qemu_log("74xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cm=
p,
> -                         env->error_code);
> -            }
> -#endif
> -            regs.msr |=3D env->error_code; /* key bit */
> -            break;
> -        default:
> -            cpu_abort(cs, "Invalid TLB miss exception\n");
> -            break;
> -        }
> -        break;
> -    case POWERPC_EXCP_FPA:       /* Floating-point assist exception     =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Floating point assist exception "
> -                  "is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_DABR:      /* Data address breakpoint             =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "DABR exception is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_IABR:      /* Instruction address breakpoint      =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "IABR exception is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_SMI:       /* System management interrupt         =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "SMI exception is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_THERM:     /* Thermal interrupt                   =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Thermal management exception "
> -                  "is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interru=
pt   */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "Performance counter exception is not implemented yet =
!\n");
> -        break;
> -    case POWERPC_EXCP_VPUA:      /* Vector assist exception             =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "VPU assist exception is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_SOFTP:     /* Soft patch exception                =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "970 soft-patch exception is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_MAINT:     /* Maintenance exception               =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs,
> -                  "970 maintenance exception is not implemented yet !\n"=
);
> -        break;
> -    case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint        =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Maskable external exception "
> -                  "is not implemented yet !\n");
> -        break;
> -    case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint    =
     */
> -        /* XXX: TODO */
> -        cpu_abort(cs, "Non maskable external exception "
> -                  "is not implemented yet !\n");
> -        break;
> -    default:
> -    excp_invalid:
> -        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> -        break;
> +        return;
>      }
> =20
>      /* Sanity check */
> @@ -892,14 +409,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>      }
>  #endif
> =20
> -    regs.new_nip =3D env->excp_vectors[excp];
> -    if (regs.new_nip =3D=3D (target_ulong)-1ULL) {
> -        cpu_abort(cs, "Raised an exception without defined vector %d\n",
> -                  excp);
> -    }
> -
> -    regs.new_nip |=3D env->excp_prefix;
> -
>      /* If any alternate SRR register are defined, duplicate saved values=
 */
>      if (regs.sprn_asrr0 !=3D -1) {
>          env->spr[regs.sprn_asrr0] =3D regs.nip;
> @@ -925,24 +434,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>      }
>  #endif
> =20
> -    if (excp !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
> +    if (intr->id !=3D POWERPC_EXCP_SYSCALL_VECTORED) {
>          /* Save PC */
>          env->spr[regs.sprn_srr0] =3D regs.nip;
> =20
>          /* Save MSR */
>          env->spr[regs.sprn_srr1] =3D regs.msr;
> -
> -#if defined(TARGET_PPC64)
> -    } else {
> -        regs.new_nip +=3D lev * 0x20;
> -
> -        env->lr =3D regs.nip;
> -        env->ctr =3D regs.msr;
> -#endif
>      }
> =20
>      /* This can update regs.new_msr and regs.new_nip if AIL applies */
> -    ppc_excp_apply_ail(cpu, excp_model, excp, regs.msr, &regs.new_msr,
> +    ppc_excp_apply_ail(cpu, excp_model, intr->id, regs.msr, &regs.new_ms=
r,
>                         &regs.new_nip);
> =20
>      powerpc_set_excp_state(cpu, regs.new_nip, regs.new_msr);
> diff --git a/target/ppc/interrupts.c b/target/ppc/interrupts.c
> new file mode 100644
> index 0000000000..31faea84c5
> --- /dev/null
> +++ b/target/ppc/interrupts.c
> @@ -0,0 +1,638 @@
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "cpu.h"
> +#include "ppc_intr.h"
> +
> +/* for hreg_swap_gpr_tgpr */
> +#include "helper_regs.h"
> +
> +/* #define DEBUG_SOFTWARE_TLB */
> +/* #define DEBUG_EXCEPTIONS */
> +
> +#ifdef DEBUG_EXCEPTIONS
> +#  define LOG_EXCP(...) qemu_log(__VA_ARGS__)
> +#else
> +#  define LOG_EXCP(...) do { } while (0)
> +#endif
> +
> +void __ppc_intr_add(CPUPPCState *env, target_ulong addr, int id,
> +                   const char *intr_name)
> +{
> +    PPCInterrupt *intr =3D &env->entry_points[id];
> +
> +    object_initialize(intr, sizeof(*intr), intr_name);
> +    intr->addr =3D addr;
> +}
> +
> +static const TypeInfo ppc_interrupt_info =3D {
> +    .name =3D TYPE_PPC_INTERRUPT,
> +    .parent =3D TYPE_OBJECT,
> +    .abstract =3D true,
> +};
> +
> +static void ppc_interrupt_register_types(void)
> +{
> +    type_register_static(&ppc_interrupt_info);
> +}
> +type_init(ppc_interrupt_register_types);
> +
> +
> +
> +static void ppc_intr_def_log(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                             int excp_model, ppc_intr_args *regs, bool *=
ignore)
> +{
> +    LOG_EXCP("%s interrupt\n", intr->name);
> +}
> +
> +static void ppc_intr_def_not_impl(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                  int excp_model, ppc_intr_args *regs,
> +                                  bool *ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +
> +    cpu_abort(cs, "%s interrupt not implemented yet.\n", intr->name);
> +}
> +
> +static void ppc_intr_def_no_op(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                               int excp_model, ppc_intr_args *regs,
> +                               bool *ignore)
> +{
> +}
> +
> +/* Default implementation for interrupts that set the MSR_HV bit */
> +static void ppc_intr_def_hv(PowerPCCPU *cpu, PPCInterrupt *intr, int exc=
p_model,
> +                            ppc_intr_args *regs, bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    regs->sprn_srr0 =3D SPR_HSRR0;
> +    regs->sprn_srr1 =3D SPR_HSRR1;
> +    regs->new_msr |=3D (target_ulong)MSR_HVB;
> +    regs->new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +}
> +
> +/* Default implementation for Facility Unavailable interrupts */
> +static void ppc_intr_def_fac_unavail_64(PowerPCCPU *cpu, PPCInterrupt *i=
ntr,
> +                                        int excp_model, ppc_intr_args *r=
egs,
> +                                        bool *ignore)
> +{
> +#ifdef TARGET_PPC64
> +    CPUPPCState *env =3D &cpu->env;
> +    env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << FSCR_IC_PO=
S);
> +#endif
> +}
> +
> +static void ppc_debug_software_tlb(CPUPPCState *env, int excp, int excp_=
model,
> +                                   int imiss_sprn, int icmp_sprn,
> +                                   int dmiss_sprn, int dcmp_sprn)
> +{
> +#if defined(DEBUG_SOFTWARE_TLB)
> +    if (qemu_log_enabled()) {
> +        const char *es;
> +        target_ulong *miss, *cmp;
> +        int en;
> +
> +        if (excp =3D=3D POWERPC_EXCP_IFTLB) {
> +            es =3D "I";
> +            en =3D 'I';
> +            miss =3D &env->spr[imiss_sprn];
> +            cmp =3D &env->spr[icmp_sprn];
> +        } else {
> +            if (excp =3D=3D POWERPC_EXCP_DLTLB) {
> +                es =3D "DL";
> +            } else {
> +                es =3D "DS";
> +            }
> +            en =3D 'D';
> +            miss =3D &env->spr[dmiss_sprn];
> +            cmp =3D &env->spr[dcmp_srpn];
> +        }
> +
> +        if (excp_model =3D=3D POWERPC_EXCP_74xx) {
> +            qemu_log("74xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> +                     TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> +                     env->error_code);
> +        } else {
> +            qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> +                     TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> +                     TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> +                     env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> +                     env->error_code);
> +        }
> +    }
> +#endif
> +}
> +
> +static void ppc_intr_def_tlb_miss(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                  int excp_model, ppc_intr_args *regs,
> +                                  bool *ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    switch (excp_model) {
> +    case POWERPC_EXCP_602:
> +    case POWERPC_EXCP_603:
> +    case POWERPC_EXCP_603E:
> +    case POWERPC_EXCP_G2:
> +        /* Swap temporary saved registers with GPRs */
> +        if (!(regs->new_msr & ((target_ulong)1 << MSR_TGPR))) {
> +            regs->new_msr |=3D (target_ulong)1 << MSR_TGPR;
> +            hreg_swap_gpr_tgpr(env);
> +        }
> +
> +        ppc_debug_software_tlb(env, intr->id, excp_model,
> +                               SPR_IMISS, SPR_ICMP,
> +                               SPR_DMISS, SPR_DCMP);
> +
> +        /* fall through */
> +    case POWERPC_EXCP_7x5:
> +        regs->msr |=3D env->crf[0] << 28;
> +        regs->msr |=3D env->error_code; /* key, D/I, S/L bits */
> +
> +        /* Set way using a LRU mechanism */
> +        regs->msr |=3D ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
> +
> +        break;
> +    case POWERPC_EXCP_74xx:
> +        ppc_debug_software_tlb(env, intr->id, excp_model,
> +                               SPR_TLBMISS, SPR_PTEHI,
> +                               SPR_TLBMISS, SPR_PTEHI);
> +
> +        regs->msr |=3D env->error_code; /* key bit */
> +        break;
> +    default:
> +        cpu_abort(cs, "Invalid instruction TLB miss exception\n");
> +        break;
> +    }
> +}
> +
> +static void ppc_intr_critical(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                              int excp_model, ppc_intr_args *regs, bool =
*ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +
> +    switch (excp_model) {
> +    case POWERPC_EXCP_40x:
> +        regs->sprn_srr0 =3D SPR_40x_SRR2;
> +        regs->sprn_srr1 =3D SPR_40x_SRR3;
> +        break;
> +    case POWERPC_EXCP_BOOKE:
> +        regs->sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +        regs->sprn_srr1 =3D SPR_BOOKE_CSRR1;
> +        break;
> +    case POWERPC_EXCP_G2:
> +        break;
> +    default:
> +        cpu_abort(cs, "Invalid Critical interrupt for model %d. Aborting=
\n",
> +                  excp_model);
> +        break;
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_CRITICAL, critical, "Critical input");
> +
> +static void ppc_intr_machine_check(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                   int excp_model, ppc_intr_args *regs,
> +                                   bool *ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    if (msr_me =3D=3D 0) {
> +        /*
> +         * Machine check exception is not enabled.  Enter
> +         * checkstop state.
> +         */
> +        fprintf(stderr, "Machine check while not allowed. "
> +                "Entering checkstop state\n");
> +        if (qemu_log_separate()) {
> +            qemu_log("Machine check while not allowed. "
> +                     "Entering checkstop state\n");
> +        }
> +        cs->halted =3D 1;
> +        cpu_interrupt_exittb(cs);
> +    }
> +    if (env->msr_mask & MSR_HVB) {
> +        /*
> +         * ISA specifies HV, but can be delivered to guest with HV
> +         * clear (e.g., see FWNMI in PAPR).
> +         */
> +        regs->new_msr |=3D (target_ulong)MSR_HVB;
> +    }
> +
> +    /* machine check exceptions don't have ME set */
> +    regs->new_msr &=3D ~((target_ulong)1 << MSR_ME);
> +
> +    /* XXX: should also have something loaded in DAR / DSISR */
> +    switch (excp_model) {
> +    case POWERPC_EXCP_40x:
> +        regs->sprn_srr0 =3D SPR_40x_SRR2;
> +        regs->sprn_srr1 =3D SPR_40x_SRR3;
> +        break;
> +    case POWERPC_EXCP_BOOKE:
> +        /* FIXME: choose one or the other based on CPU type */
> +        regs->sprn_srr0 =3D SPR_BOOKE_MCSRR0;
> +        regs->sprn_srr1 =3D SPR_BOOKE_MCSRR1;
> +        regs->sprn_asrr0 =3D SPR_BOOKE_CSRR0;
> +        regs->sprn_asrr1 =3D SPR_BOOKE_CSRR1;
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_MCHECK, machine_check, "Machine check");
> +
> +static void ppc_intr_data_storage(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                  int excp_model, ppc_intr_args *regs,
> +                                  bool *ignore)
> +{
> +    LOG_EXCP("DSI exception: DSISR=3D" TARGET_FMT_lx" DAR=3D" TARGET_FMT=
_lx
> +             "\n", env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_DSI, data_storage, "Data storage");
> +
> +static void ppc_intr_insn_storage(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                  int excp_model, ppc_intr_args *regs,
> +                                  bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    LOG_EXCP("ISI exception: msr=3D" TARGET_FMT_lx ", nip=3D" TARGET_FMT=
_lx
> +             "\n", regs->msr, regs->nip);
> +    regs->msr |=3D env->error_code;
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_ISI, insn_storage, "Instruction storage");
> +
> +static void ppc_intr_external(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                              int excp_model, ppc_intr_args *regs, bool =
*ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +    bool lpes0;
> +
> +    /*
> +     * Exception targeting modifiers
> +     *
> +     * LPES0 is supported on POWER7/8/9
> +     * LPES1 is not supported (old iSeries mode)
> +     *
> +     * On anything else, we behave as if LPES0 is 1
> +     * (externals don't alter MSR:HV)
> +     */
> +#if defined(TARGET_PPC64)
> +    if (excp_model =3D=3D POWERPC_EXCP_POWER7 ||
> +        excp_model =3D=3D POWERPC_EXCP_POWER8 ||
> +        excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> +        excp_model =3D=3D POWERPC_EXCP_POWER10) {
> +        lpes0 =3D !!(env->spr[SPR_LPCR] & LPCR_LPES0);
> +    } else
> +#endif /* defined(TARGET_PPC64) */
> +    {
> +        lpes0 =3D true;
> +    }
> +
> +    if (!lpes0) {
> +        regs->new_msr |=3D (target_ulong)MSR_HVB;
> +        regs->new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +        regs->sprn_srr0 =3D SPR_HSRR0;
> +        regs->sprn_srr1 =3D SPR_HSRR1;
> +    }
> +    if (env->mpic_proxy) {
> +        /* IACK the IRQ on delivery */
> +        env->spr[SPR_BOOKE_EPR] =3D ldl_phys(cs->as, env->mpic_iack);
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_EXTERNAL, external, "External");
> +
> +static void ppc_intr_alignment(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                               int excp_model, ppc_intr_args *regs,
> +                               bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    /* Get rS/rD and rA from faulting opcode */
> +    /*
> +     * Note: the opcode fields will not be set properly for a
> +     * direct store load/store, but nobody cares as nobody
> +     * actually uses direct store segments.
> +     */
> +    env->spr[SPR_DSISR] |=3D (env->error_code & 0x03FF0000) >> 16;
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_ALIGN, alignment, "Alignment");
> +
> +static void ppc_intr_program(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                             int excp_model, ppc_intr_args *regs, bool *=
ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    switch (env->error_code & ~0xF) {
> +    case POWERPC_EXCP_FP:
> +        if ((msr_fe0 =3D=3D 0 && msr_fe1 =3D=3D 0) || msr_fp =3D=3D 0) {
> +            LOG_EXCP("Ignore floating point exception\n");
> +            cs->exception_index =3D POWERPC_EXCP_NONE;
> +            env->error_code =3D 0;
> +
> +            *ignore =3D true;
> +            return;
> +        }
> +
> +        /*
> +         * FP exceptions always have NIP pointing to the faulting
> +         * instruction, so always use store_next and claim we are
> +         * precise in the MSR.
> +         */
> +        regs->msr |=3D 0x00100000;
> +        env->spr[SPR_BOOKE_ESR] =3D ESR_FP;
> +        break;
> +    case POWERPC_EXCP_INVAL:
> +        LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", regs->nip=
);
> +        regs->msr |=3D 0x00080000;
> +        env->spr[SPR_BOOKE_ESR] =3D ESR_PIL;
> +        break;
> +    case POWERPC_EXCP_PRIV:
> +        regs->msr |=3D 0x00040000;
> +        env->spr[SPR_BOOKE_ESR] =3D ESR_PPR;
> +        break;
> +    case POWERPC_EXCP_TRAP:
> +        regs->msr |=3D 0x00020000;
> +        env->spr[SPR_BOOKE_ESR] =3D ESR_PTR;
> +        break;
> +    default:
> +        /* Should never occur */
> +        cpu_abort(cs, "Invalid program exception %d. Aborting\n",
> +                  env->error_code);
> +        break;
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_PROGRAM, program, "Program");
> +
> +
> +static inline void dump_syscall(CPUPPCState *env)
> +{
> +    qemu_log_mask(CPU_LOG_INT, "syscall r0=3D%016" PRIx64
> +                  " r3=3D%016" PRIx64 " r4=3D%016" PRIx64 " r5=3D%016" P=
RIx64
> +                  " r6=3D%016" PRIx64 " r7=3D%016" PRIx64 " r8=3D%016" P=
RIx64
> +                  " nip=3D" TARGET_FMT_lx "\n",
> +                  ppc_dump_gpr(env, 0), ppc_dump_gpr(env, 3),
> +                  ppc_dump_gpr(env, 4), ppc_dump_gpr(env, 5),
> +                  ppc_dump_gpr(env, 6), ppc_dump_gpr(env, 7),
> +                  ppc_dump_gpr(env, 8), env->nip);
> +}
> +
> +static inline void dump_hcall(CPUPPCState *env)
> +{
> +    qemu_log_mask(CPU_LOG_INT, "hypercall r3=3D%016" PRIx64
> +                  " r4=3D%016" PRIx64 " r5=3D%016" PRIx64 " r6=3D%016" P=
RIx64
> +                  " r7=3D%016" PRIx64 " r8=3D%016" PRIx64 " r9=3D%016" P=
RIx64
> +                  " r10=3D%016" PRIx64 " r11=3D%016" PRIx64 " r12=3D%016=
" PRIx64
> +                  " nip=3D" TARGET_FMT_lx "\n",
> +                  ppc_dump_gpr(env, 3), ppc_dump_gpr(env, 4),
> +                  ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
> +                  ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
> +                  ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
> +                  ppc_dump_gpr(env, 11), ppc_dump_gpr(env, 12),
> +                  env->nip);
> +}
> +
> +
> +static void ppc_intr_system_call(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                 int excp_model, ppc_intr_args *regs,
> +                                 bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    int lev;
> +
> +    lev =3D env->error_code;
> +
> +    if ((lev =3D=3D 1) && cpu->vhyp) {
> +        dump_hcall(env);
> +    } else {
> +        dump_syscall(env);
> +    }
> +
> +    /*
> +     * We need to correct the NIP which in this case is supposed
> +     * to point to the next instruction. We also set env->nip here
> +     * because the modification needs to be accessible by the
> +     * virtual hypervisor code below.
> +     */
> +    regs->nip +=3D 4;
> +    env->nip =3D regs->nip;
> +
> +    /* "PAPR mode" built-in hypercall emulation */
> +    if ((lev =3D=3D 1) && cpu->vhyp) {
> +        PPCVirtualHypervisorClass *vhc =3D
> +            PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
> +        vhc->hypercall(cpu->vhyp, cpu);
> +
> +        *ignore =3D true;
> +        return;
> +    }
> +
> +    if (lev =3D=3D 1) {
> +        regs->new_msr |=3D (target_ulong)MSR_HVB;
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_SYSCALL, system_call, "System call");
> +
> +static void ppc_intr_system_call_vectored(PowerPCCPU *cpu, PPCInterrupt =
*intr,
> +                                          int excp_model, ppc_intr_args =
*regs,
> +                                          bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +    int lev;
> +
> +    lev =3D env->error_code;
> +    dump_syscall(env);
> +
> +    regs->nip +=3D 4;
> +    regs->new_msr |=3D env->msr & ((target_ulong)1 << MSR_EE);
> +    regs->new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
> +    regs->new_nip +=3D lev * 0x20;
> +
> +    env->lr =3D regs->nip;
> +    env->ctr =3D regs->msr;
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_SYSCALL_VECTORED, system_call_vectored,
> +                     "System call vectored");
> +
> +static void ppc_intr_watchdog(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                              int excp_model, ppc_intr_args *regs, bool =
*ignore)
> +{
> +    LOG_EXCP("WDT exception\n");
> +    switch (excp_model) {
> +    case POWERPC_EXCP_BOOKE:
> +        regs->sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +        regs->sprn_srr1 =3D SPR_BOOKE_CSRR1;
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_WDT, watchdog, "Watchdog timer");
> +
> +static void ppc_intr_debug(PowerPCCPU *cpu, PPCInterrupt *intr, int excp=
_model,
> +                           ppc_intr_args *regs, bool *ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    if (env->flags & POWERPC_FLAG_DE) {
> +        /* FIXME: choose one or the other based on CPU type */
> +        regs->sprn_srr0 =3D SPR_BOOKE_DSRR0;
> +        regs->sprn_srr1 =3D SPR_BOOKE_DSRR1;
> +        regs->sprn_asrr0 =3D SPR_BOOKE_CSRR0;
> +        regs->sprn_asrr1 =3D SPR_BOOKE_CSRR1;
> +        /* DBSR already modified by caller */
> +    } else {
> +        cpu_abort(cs, "Debug exception triggered on unsupported model\n"=
);
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_DEBUG, debug, "Debug");
> +
> +static void ppc_intr_spe_unavailable(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                     int excp_model, ppc_intr_args *regs,
> +                                     bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_SPEU, spe_unavailable,
> +                     "SPE/embedded floating-point unavailable");
> +
> +static void ppc_intr_embedded_fp_data(PowerPCCPU *cpu, PPCInterrupt *int=
r,
> +                                      int excp_model, ppc_intr_args *reg=
s,
> +                                      bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    ppc_intr_def_not_impl(cpu, intr, excp_model, regs, ignore);
> +    env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_EFPDI, embedded_fp_data,
> +                     "Embedded floating-point data");
> +
> +static void ppc_intr_embedded_fp_round(PowerPCCPU *cpu, PPCInterrupt *in=
tr,
> +                                       int excp_model, ppc_intr_args *re=
gs,
> +                                       bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    ppc_intr_def_not_impl(cpu, intr, excp_model, regs, ignore);
> +    env->spr[SPR_BOOKE_ESR] =3D ESR_SPV;
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_EFPRI, embedded_fp_round,
> +                     "Embedded floating-point round");
> +
> +static void ppc_intr_embedded_doorbell_crit(PowerPCCPU *cpu, PPCInterrup=
t *intr,
> +                                            int excp_model, ppc_intr_arg=
s *regs,
> +                                            bool *ignore)
> +{
> +    regs->sprn_srr0 =3D SPR_BOOKE_CSRR0;
> +    regs->sprn_srr1 =3D SPR_BOOKE_CSRR1;
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_DOORCI, embedded_doorbell_crit,
> +                     "Embedded doorbell critical");
> +
> +static void ppc_intr_system_reset(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                  int excp_model, ppc_intr_args *regs,
> +                                  bool *ignore)
> +{
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    /* A power-saving exception sets ME, otherwise it is unchanged */
> +    if (msr_pow) {
> +        /* indicate that we resumed from power save mode */
> +        regs->msr |=3D 0x10000;
> +        regs->new_msr |=3D ((target_ulong)1 << MSR_ME);
> +    }
> +    if (env->msr_mask & MSR_HVB) {
> +        /*
> +         * ISA specifies HV, but can be delivered to guest with HV
> +         * clear (e.g., see FWNMI in PAPR, NMI injection in QEMU).
> +         */
> +        regs->new_msr |=3D (target_ulong)MSR_HVB;
> +    } else {
> +        if (msr_pow) {
> +            cpu_abort(cs, "Trying to deliver power-saving system reset "
> +                      "exception with no HV support\n");
> +        }
> +    }
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_RESET, system_reset, "System reset");
> +
> +static void ppc_intr_hv_insn_storage(PowerPCCPU *cpu, PPCInterrupt *intr,
> +                                     int excp_model, ppc_intr_args *regs,
> +                                     bool *ignore)
> +{
> +    CPUPPCState *env =3D &cpu->env;
> +
> +    regs->msr |=3D env->error_code;
> +    ppc_intr_def_hv(cpu, intr, excp_model, regs, ignore);
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_HISI, hv_insn_storage,
> +                     "Hypervisor instruction storage");
> +
> +static void ppc_intr_hv_facility_unavail(PowerPCCPU *cpu, PPCInterrupt *=
intr,
> +                                         int excp_model, ppc_intr_args *=
regs,
> +                                         bool *ignore)
> +{
> +#ifdef TARGET_PPC64
> +    ppc_intr_def_fac_unavail_64(cpu, intr, excp_model, regs, ignore);
> +    ppc_intr_def_hv(cpu, intr, excp_model, regs, ignore);
> +#endif
> +}
> +PPC_DEFINE_INTR(POWERPC_EXCP_HV_FU, hv_facility_unavail,
> +                "Hypervisor facility unavailable");
> +
> +PPC_DEFINE_INTR(POWERPC_EXCP_HDECR,    def_hv, "Hypervisor decrementer");
> +PPC_DEFINE_INTR(POWERPC_EXCP_HDSI,     def_hv, "Hypervisor data storage"=
);
> +PPC_DEFINE_INTR(POWERPC_EXCP_HDSEG,    def_hv, "Hypervisor data segment"=
);
> +PPC_DEFINE_INTR(POWERPC_EXCP_HISEG,    def_hv, "Hypervisor insn segment"=
);
> +PPC_DEFINE_INTR(POWERPC_EXCP_SDOOR_HV, def_hv, "Hypervisor doorbell");
> +PPC_DEFINE_INTR(POWERPC_EXCP_HV_EMU,   def_hv, "Hypervisor emulation ass=
ist");
> +PPC_DEFINE_INTR(POWERPC_EXCP_HVIRT,    def_hv, "Hypervisor virtualizatio=
n");
> +
> +PPC_DEFINE_INTR(POWERPC_EXCP_VPU,  def_fac_unavail_64, "Vector unavailab=
le");
> +PPC_DEFINE_INTR(POWERPC_EXCP_VSXU, def_fac_unavail_64, "VSX unavailable"=
);
> +PPC_DEFINE_INTR(POWERPC_EXCP_FU,   def_fac_unavail_64, "Facility unavail=
able");
> +
> +PPC_DEFINE_INTR(POWERPC_EXCP_IFTLB, def_tlb_miss, "Insn fetch TLB error"=
);
> +PPC_DEFINE_INTR(POWERPC_EXCP_DLTLB, def_tlb_miss, "Data load TLB error");
> +PPC_DEFINE_INTR(POWERPC_EXCP_DSTLB, def_tlb_miss, "Data store TLB error"=
);
> +
> +PPC_DEFINE_INTR(POWERPC_EXCP_FIT, def_log, "Fixed-interval timer");
> +PPC_DEFINE_INTR(POWERPC_EXCP_PIT, def_log, "Programmable interval timer"=
);
> +
> +PPC_DEFINE_INTR(POWERPC_EXCP_FPU,   def_no_op, "Floating-point unavailab=
le");
> +PPC_DEFINE_INTR(POWERPC_EXCP_APU,   def_no_op, "Aux. processor unavailab=
le");
> +PPC_DEFINE_INTR(POWERPC_EXCP_DECR,  def_no_op, "Decrementer");
> +PPC_DEFINE_INTR(POWERPC_EXCP_DTLB,  def_no_op, "Data TLB error");
> +PPC_DEFINE_INTR(POWERPC_EXCP_ITLB,  def_no_op, "Instruction TLB error");
> +PPC_DEFINE_INTR(POWERPC_EXCP_DOORI, def_no_op, "Embedded doorbell");
> +PPC_DEFINE_INTR(POWERPC_EXCP_DSEG,  def_no_op, "Data segment");
> +PPC_DEFINE_INTR(POWERPC_EXCP_ISEG,  def_no_op, "Instruction segment");
> +PPC_DEFINE_INTR(POWERPC_EXCP_TRACE, def_no_op, "Trace");
> +
> +PPC_DEFINE_INTR(POWERPC_EXCP_EPERFM,  def_not_impl, "Embedded perf. moni=
tor");
> +PPC_DEFINE_INTR(POWERPC_EXCP_IO,      def_not_impl, "IO error");
> +PPC_DEFINE_INTR(POWERPC_EXCP_RUNM,    def_not_impl, "Run mode");
> +PPC_DEFINE_INTR(POWERPC_EXCP_EMUL,    def_not_impl, "Emulation trap");
> +PPC_DEFINE_INTR(POWERPC_EXCP_FPA,     def_not_impl, "Floating-point assi=
st");
> +PPC_DEFINE_INTR(POWERPC_EXCP_DABR,    def_not_impl, "Data address breakp=
oint");
> +PPC_DEFINE_INTR(POWERPC_EXCP_IABR,    def_not_impl, "Insn address breakp=
oint");
> +PPC_DEFINE_INTR(POWERPC_EXCP_SMI,     def_not_impl, "System management");
> +PPC_DEFINE_INTR(POWERPC_EXCP_THERM,   def_not_impl, "Thermal management"=
);
> +PPC_DEFINE_INTR(POWERPC_EXCP_PERFM,   def_not_impl, "Performance counter=
");
> +PPC_DEFINE_INTR(POWERPC_EXCP_VPUA,    def_not_impl, "Vector assist");
> +PPC_DEFINE_INTR(POWERPC_EXCP_SOFTP,   def_not_impl, "Soft patch");
> +PPC_DEFINE_INTR(POWERPC_EXCP_MAINT,   def_not_impl, "Maintenance");
> +PPC_DEFINE_INTR(POWERPC_EXCP_MEXTBR,  def_not_impl, "Maskable external");
> +PPC_DEFINE_INTR(POWERPC_EXCP_NMEXTBR, def_not_impl, "Non-maskable extern=
al");
> +
> +/* These are used by P7 and P8 but were never implemented */
> +PPC_DEFINE_INTR(POWERPC_EXCP_SDOOR, def_not_impl, "Server doorbell");
> +PPC_DEFINE_INTR(POWERPC_EXCP_HV_MAINT, def_not_impl, "Hypervisor mainten=
ance");
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 93972df58e..3927359c7b 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -115,7 +115,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, in=
t version_id)
>      qemu_get_be32s(f, &env->pending_interrupts);
>      qemu_get_be32s(f, &env->irq_input_state);
>      for (i =3D 0; i < POWERPC_EXCP_NB; i++) {
> -        qemu_get_betls(f, &env->excp_vectors[i]);
> +        qemu_get_betls(f, &env->entry_points[i].addr);
>      }
>      qemu_get_betls(f, &env->excp_prefix);
>      qemu_get_betls(f, &env->ivor_mask);
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index a6a53a8d5c..740eac25f7 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -30,6 +30,7 @@ ppc_softmmu_ss.add(files(
>    'mmu-hash32.c',
>    'mmu_helper.c',
>    'monitor.c',
> +  'interrupts.c',
>  ))
>  ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files(
>    'tcg-stub.c'
> diff --git a/target/ppc/ppc_intr.h b/target/ppc/ppc_intr.h
> new file mode 100644
> index 0000000000..e588736c6d
> --- /dev/null
> +++ b/target/ppc/ppc_intr.h
> @@ -0,0 +1,55 @@
> +#ifndef PPC_INTR_H
> +#define PPC_INTR_H
> +
> +#include "qom/object.h"
> +#include "cpu-qom.h"
> +
> +#define TYPE_PPC_INTERRUPT "ppc-interrupt"
> +OBJECT_DECLARE_SIMPLE_TYPE(PPCInterrupt, PPC_INTERRUPT)
> +
> +void __ppc_intr_add(CPUPPCState *env, target_ulong addr, int id,
> +                    const char *intr_name);
> +
> +#define ppc_intr_add(_env, _addr, _id)                  \
> +    do {                                                \
> +        QEMU_BUILD_BUG_ON(_id <=3D POWERPC_EXCP_NONE);    \
> +        QEMU_BUILD_BUG_ON(_id >=3D POWERPC_EXCP_NB);      \
> +        __ppc_intr_add(_env, _addr, _id, #_id);         \
> +    } while (0)                                         \
> +
> +/*
> + * Registers an interrupt callback as a class. This makes it so that
> + * the interrupt callback implementation is stored on QOM and we can
> + * instantiate only the ones needed for a specific processor later.
> + *
> + * @_id: The interrupt id as in the POWERPC_EXCP_* enum. This will be
> + *   the QOM hash table key for the type.
> + * @_sym: The interrupt name as a valid C identifier. This will be
> + *   used to compose the symbol name for the callback to be invoked
> + *   for this interrupt.
> + * @_name: The interrupt name as a string for display.
> + */
> +#define PPC_DEFINE_INTR(_id, _sym, _name)       \
> +                                                \
> +    static void __##_id##_init(Object *obj)     \
> +    {                                           \
> +        PPCInterrupt *pi =3D PPC_INTERRUPT(obj);  \
> +                                                \
> +        pi->id =3D _id;                           \
> +        pi->name =3D _name;                       \
> +        pi->setup_regs =3D ppc_intr_##_sym;       \
> +    }                                           \
> +                                                \
> +    static const TypeInfo __##_id##_info =3D {    \
> +        .parent =3D TYPE_PPC_INTERRUPT,           \
> +        .name =3D #_id,                           \
> +        .instance_init =3D __##_id##_init,        \
> +    };                                          \
> +                                                \
> +    static void __##_id##_register_types(void)  \
> +    {                                           \
> +        type_register_static(&__##_id##_info);  \
> +    }                                           \
> +    type_init(__##_id##_register_types);        \
> +
> +#endif /* PPC_INTR_H */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e16a2721e2..2c82bda8cc 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -951,7 +951,8 @@ void spr_write_excp_vector(DisasContext *ctx, int spr=
n, int gprn)
>      TCGv t0 =3D tcg_temp_new();
>      tcg_gen_ld_tl(t0, cpu_env, offsetof(CPUPPCState, ivor_mask));
>      tcg_gen_and_tl(t0, t0, cpu_gpr[gprn]);
> -    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, excp_vectors[sprn_o=
ffs]));
> +    tcg_gen_st_tl(t0, cpu_env, offsetof(CPUPPCState, entry_points[sprn_o=
ffs]) +
> +                  offsetof(PPCInterrupt, addr));
>      gen_store_spr(sprn, t0);
>      tcg_temp_free(t0);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gAVct/IatSXbPq/Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9mXYACgkQbDjKyiDZ
s5JDQg//YtL2SZp6pxH72g65MaR1UxsRhp2pIQrV7T16MUKtFvrnEQNmX7MfDaB2
AVLtUmrbOfjkKTSbg9ZMswApnXjnF/Wgxe9r2c0aDbP2ksucG9vW/rJBwXlk7shp
T4VHORo96PguQ5bnuo46i0ht6uUTz54eCArEj98b691jfJE0qBLg84hmC/uRHc/Q
4Irktkawcrf8GIx/v+ElPMd1a3oZq5vmVUEl55eYfQFojL7Phjenj7V+vDDnzMKp
CMzHUS5uAb/jdwoAKWVovQRWhJtPFYFx/2TbvbWKfr+ALuHZx5tBZBDcG/S1w9fV
Tfh8IKUXeYurHiIpK49T5XGrcnVmobvAx62FgqSnWhTNwENVljswrSzOYRuqO2pj
I++tnis+x26l+8n5xTTk9sEWj8aAKRPyVHkUzV4wq0mUV3Q5nCKF3hQWLb6d/uV+
r/Hpyqi4YQGWTHEU072fJVmYVZs6DBbawvNt+VsdnZvYvbDyNt6291nevJ0fnAYB
/8dZ18a8dMY4DbMg+5LfgoMFp/DRzp5UZRgdvIKSiY2XU+IgHxJ6L0p1JrMjCBxd
1Ct0ndEHGBSpm3in8zYnqzcq9JG6Qd9EN3nDclUkJ6eEeTBzp82apcqMtv60jjQd
OoVfv6dxBZhFbZVRv4GSam8E+HO5jPk2P6B1HndhtN4PC4nn6io=
=JayK
-----END PGP SIGNATURE-----

--gAVct/IatSXbPq/Z--

