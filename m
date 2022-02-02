Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB814A7904
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:53:33 +0100 (CET)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLh6-0001DJ-16
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFL3a-0000m7-3s; Wed, 02 Feb 2022 14:12:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58360
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFL3H-0006jb-3p; Wed, 02 Feb 2022 14:12:41 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212IfoxH015875; 
 Wed, 2 Feb 2022 19:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=NuxH35tRz2VETEQ6cKiR+Td3xoTjvwo1p8ZUQ0WihWg=;
 b=ecESvJDBhh2Q5cxz+y5snNQBqbgS/atoHNUlCOzGULGszkQ/yit/NZQRoSCseDT4iCeE
 DtYH9XphxmtkZkRzQsr1TzHO+7DCw7u8T2IkRlZ3+upi4ITOBW8+pOFfEu/mHfO+kd97
 ae2ONi/pduZ6uGTKSg24vkBLtI8AAgIpmRG2OKJdpqAxU0JtdAr1xllIROw1De8XI92c
 zsbTwzBeIvrCW5apt/YnrziorI5Ok+7N1SSgUA3yeqj5Fk2Bs5hDiHjPpoIva0Skj1oc
 RhOHoOEM8HC/lNb8dvm1TqKqTnaEq9YzFQCalO+hwQuti+21bZpgexVb+z00AdHeU8zx og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dyr2cjwdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 19:12:08 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 212J1LLl024553;
 Wed, 2 Feb 2022 19:12:07 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dyr2cjwda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 19:12:07 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 212IqSRr006369;
 Wed, 2 Feb 2022 19:12:07 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3dvw7bkypu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 19:12:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 212JC6ue8782742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Feb 2022 19:12:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CE27AC067;
 Wed,  2 Feb 2022 19:12:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8629EAC065;
 Wed,  2 Feb 2022 19:12:05 +0000 (GMT)
Received: from localhost (unknown [9.211.139.55])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Feb 2022 19:12:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH v3 3/3] target/ppc: Fix gen_priv_exception error
 value in mfspr/mtspr
In-Reply-To: <20220113170456.1796911-4-matheus.ferst@eldorado.org.br>
References: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
 <20220113170456.1796911-4-matheus.ferst@eldorado.org.br>
Date: Wed, 02 Feb 2022 16:12:02 -0300
Message-ID: <8735l19j7h.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6h2uZacYPhm81QSAmJyWg5ehQ__mQIQI
X-Proofpoint-ORIG-GUID: rPaeIkPLKXA76ma_E28oXHleQekBHAb0
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_09,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

matheus.ferst@eldorado.org.br writes:

> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> The code in linux-user/ppc/cpu_loop.c expects POWERPC_EXCP_PRIV
> exception with error POWERPC_EXCP_PRIV_OPC or POWERPC_EXCP_PRIV_REG,
> while POWERPC_EXCP_INVAL_SPR is expected in POWERPC_EXCP_INVAL
> exceptions. This mismatch caused an EXCP_DUMP with the message "Unknown
> privilege violation (03)", as seen in [1].
>
> Fixes: 9b2fadda3e01 ("ppc: Rework generation of priv and inval interrupts")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/588
>
> [1] https://gitlab.com/qemu-project/qemu/-/issues/588
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

This patch seems to do the right thing. So:

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>


Now, I'm not sure if the code around it does the right thing. =)

Specifically the else blocks (read_cb == NULL) and (write_cb ==
NULL). From _spr_register I understand that cb == NULL means this is not
a recognized SPR by this processor*. So in my mind 100% of them should be
invalid SPR exceptions.

The reserved SPRs should be registered in cpu_init and handled as
"known, but privileged" or "known, but noop". Maybe using SPR_NOACCESS
and/or a new SPR_NOOP. It might be a bit tricky because they have no names,
but that is an implementation detail.

* - there's some nuance here because of the system vs. linux-user build
    time configuration so I'm not entirely sure.

Let's think a bit more about this. Everything seems to work just fine
the way it is so there's no rush. But I think this code could perhaps be
simplified and some of these assumptions handled at build time with
spr_register.

> ---
> Is there any case where throwing a PRIV/INVAL exception with a
> INVAL/PRIV error makes sense? It seems wrong, but maybe I'm missing
> something... especially with the HV_EMU to program check conversion.
>
> Also, if this patch is correct, it seems that all invalid SPR access
> would be nop or privilege exceptions. In this case, is
> POWERPC_EXCP_INVAL_SPR still needed?

I agree that as it stands this is not needed. But we might want to bring
it back given the points I mentioned above. So let's keep it for now.

> ---
>  target/ppc/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 40232201bb..abbc3a5bb9 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4827,11 +4827,11 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>           */
>          if (sprn & 0x10) {
>              if (ctx->pr) {
> -                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>              }
>          } else {
>              if (ctx->pr || sprn == 0 || sprn == 4 || sprn == 5 || sprn == 6) {
> -                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>              }
>          }
>      }
> @@ -5014,11 +5014,11 @@ static void gen_mtspr(DisasContext *ctx)
>           */
>          if (sprn & 0x10) {
>              if (ctx->pr) {
> -                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>              }
>          } else {
>              if (ctx->pr || sprn == 0) {
> -                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
> +                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>              }
>          }
>      }

