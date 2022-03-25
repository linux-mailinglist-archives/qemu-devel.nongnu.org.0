Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D934E7692
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:14:49 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXleK-0003uJ-CD
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:14:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXlbv-0002AC-Ui; Fri, 25 Mar 2022 11:12:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25800
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXlbt-0006hY-OF; Fri, 25 Mar 2022 11:12:19 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PEiXGO018112; 
 Fri, 25 Mar 2022 15:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Eo/UeWeu6WxEfai3GArH17YVpXgYk+jSkHPdw4O9qeI=;
 b=bNBeDcVyJ+HhFHKviNHFfZV3RBrkVNfZb1P2lluEAv9atjHfiIDZ5kcAo3lhu1Ccjeje
 z3TpZIdBwuKIVca4HYiwOWenlV8APWWrIEmHwTthNtyBPZNBQoNhNWHvYNTrvgMT4tlz
 gmN5Qr2sbymGVUAiw9a5NfpyMaxphJXIaVAqtUr18wiijS7RFxUrevpDIgQ0EQ0PkpfT
 cL0StI71je2RgzYf85c+ndHgH8Vwx8lxfLwT4mQp67KEG+MdBpfw7ySJhZDGM68C1n9X
 E/HD8iwikFO/nT/z+oOiWIP9s6qnycrUwguf7pYCuQTd02I+4jFKc17rkIitKMntR3IH EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0pxdp183-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 15:11:59 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PEkQtA026615;
 Fri, 25 Mar 2022 15:11:59 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0pxdp17s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 15:11:59 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PEx41o009851;
 Fri, 25 Mar 2022 15:11:58 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 3ew6taycyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 15:11:58 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PFBuB129950440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 15:11:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F1F0C6055;
 Fri, 25 Mar 2022 15:11:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20E7CC605A;
 Fri, 25 Mar 2022 15:11:55 +0000 (GMT)
Received: from localhost (unknown [9.160.36.55])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Mar 2022 15:11:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH 1/6] target/ppc: Add support for the Processor
 Attention instruction
In-Reply-To: <20220324190854.156898-2-leandro.lupori@eldorado.org.br>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <20220324190854.156898-2-leandro.lupori@eldorado.org.br>
Date: Fri, 25 Mar 2022 12:11:47 -0300
Message-ID: <87tubm12z0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BtsbC9z1RL4IY6W6oPxsppf1dHVO8eoq
X-Proofpoint-ORIG-GUID: zMkiq8iPkxiBIOyDmCBj5tHJKI9NA6va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_04,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leandro Lupori <leandro.lupori@eldorado.org.br> writes:

> From: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Check the HID0 bit to send signal, currently modeled as a checkstop.
> The QEMU implementation adds an exit using the GPR[3] value (that's a
> hack for tests)
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>  target/ppc/cpu.h         |  8 ++++++++
>  target/ppc/excp_helper.c | 27 +++++++++++++++++++++++++++
>  target/ppc/helper.h      |  1 +
>  target/ppc/translate.c   | 14 ++++++++++++++
>  4 files changed, 50 insertions(+)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 047b24ba50..12f9f3a880 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -173,6 +173,12 @@ enum {
>      POWERPC_EXCP_PRIV_REG      =3D 0x02,  /* Privileged register excepti=
on     */
>      /* Trap                                                             =
     */
>      POWERPC_EXCP_TRAP          =3D 0x40,
> +    /* Processor Attention                                              =
     */
> +    POWERPC_EXCP_ATTN          =3D 0x100,
> +    /*
> +     * NOTE: POWERPC_EXCP_ATTN uses values from 0x100 to 0x1ff to return
> +     *       error codes.
> +     */
>  };
>=20=20
>  #define PPC_INPUT(env) ((env)->bus_model)
> @@ -2089,6 +2095,8 @@ void ppc_compat_add_property(Object *obj, const cha=
r *name,
>  #define HID0_DOZE           (1 << 23)           /* pre-2.06 */
>  #define HID0_NAP            (1 << 22)           /* pre-2.06 */
>  #define HID0_HILE           PPC_BIT(19) /* POWER8 */
> +#define HID0_ATTN           PPC_BIT(31) /* Processor Attention */
> +#define HID0_POWER9_ATTN    PPC_BIT(3)
>  #define HID0_POWER9_HILE    PPC_BIT(4)
>=20=20
>  /***********************************************************************=
******/
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index d3e2cfcd71..b0c629905c 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1379,6 +1379,9 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int=
 excp)
>              }
>              cs->halted =3D 1;
>              cpu_interrupt_exittb(cs);
> +            if ((env->error_code & ~0xff) =3D=3D POWERPC_EXCP_ATTN) {
> +                exit(env->error_code & 0xff);
> +            }
>          }
>          if (env->msr_mask & MSR_HVB) {
>              /*
> @@ -1971,6 +1974,30 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_in=
sn_t insn)
>      env->resume_as_sreset =3D (insn !=3D PPC_PM_STOP) ||
>          (env->spr[SPR_PSSCR] & PSSCR_EC);
>  }
> +
> +/*
> + * Processor Attention instruction (Implementation dependent)
> + */
> +void helper_attn(CPUPPCState *env, target_ulong r3)
> +{
> +    bool attn =3D false;
> +
> +    if (env->excp_model =3D=3D POWERPC_EXCP_POWER8) {
> +        attn =3D !!(env->spr[SPR_HID0] & HID0_ATTN);
> +    } else if (env->excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> +               env->excp_model =3D=3D POWERPC_EXCP_POWER10) {
> +        attn =3D !!(env->spr[SPR_HID0] & HID0_POWER9_ATTN);
> +    }

The excp_model is not a CPU identifier. This should ideally be a flag
set during init_proc. Something like HID0_ATTN_P8/HID0_ATTN_P9.

Maybe we should consider adding a hid0_mask similar to lpcr_mask.

> +
> +    if (attn) {
> +        raise_exception_err(env, POWERPC_EXCP_MCHECK,
> +                            POWERPC_EXCP_ATTN | (r3 & 0xff));
> +    } else {
> +        raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                               POWERPC_EXCP_INVAL |
> +                               POWERPC_EXCP_INVAL_INVAL, GETPC());
> +    }
> +}
>  #endif /* defined(TARGET_PPC64) */
>=20=20
>  static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 57da11c77e..9a2497569b 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -14,6 +14,7 @@ DEF_HELPER_1(rfmci, void, env)
>  #if defined(TARGET_PPC64)
>  DEF_HELPER_2(scv, noreturn, env, i32)
>  DEF_HELPER_2(pminsn, void, env, i32)
> +DEF_HELPER_2(attn, void, env, tl)
>  DEF_HELPER_1(rfid, void, env)
>  DEF_HELPER_1(rfscv, void, env)
>  DEF_HELPER_1(hrfid, void, env)
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 408ae26173..5ace6f3a29 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4123,6 +4123,19 @@ static void gen_rvwinkle(DisasContext *ctx)
>      gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
> +
> +static void gen_attn(DisasContext *ctx)
> +{
> + #if defined(CONFIG_USER_ONLY)
> +    GEN_PRIV;
> +#else
> +    CHK_SV;
> +
> +    gen_helper_attn(cpu_env, cpu_gpr[3]);
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
> +#endif
> +}
> +
>  #endif /* #if defined(TARGET_PPC64) */
>=20=20
>  static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
> @@ -6844,6 +6857,7 @@ GEN_HANDLER_E(nap, 0x13, 0x12, 0x0d, 0x03FFF801, PP=
C_NONE, PPC2_PM_ISA206),
>  GEN_HANDLER_E(sleep, 0x13, 0x12, 0x0e, 0x03FFF801, PPC_NONE, PPC2_PM_ISA=
206),
>  GEN_HANDLER_E(rvwinkle, 0x13, 0x12, 0x0f, 0x03FFF801, PPC_NONE, PPC2_PM_=
ISA206),
>  GEN_HANDLER(hrfid, 0x13, 0x12, 0x08, 0x03FF8001, PPC_64H),
> +GEN_HANDLER(attn, 0x0, 0x00, 0x8, 0xfffffdff, PPC_FLOW),
>  #endif
>  /* Top bit of opc2 corresponds with low bit of LEV, so use two handlers =
*/
>  GEN_HANDLER(sc, 0x11, 0x11, 0xFF, 0x03FFF01D, PPC_FLOW),

