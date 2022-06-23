Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0616557D8A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:09:16 +0200 (CEST)
Received: from localhost ([::1]:44826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4NWF-0007Q1-So
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4NUE-0005h6-5m; Thu, 23 Jun 2022 10:07:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o4NU8-0004E1-GC; Thu, 23 Jun 2022 10:07:09 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NE0FQK010508;
 Thu, 23 Jun 2022 14:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ab3Kyl1v3Lt1iAaCV1JzbPXMln7+ZCjbZ2aABfcj/qI=;
 b=HPmB09qPG4Z+x7OOn3wRvTrGxg68IHoUNf6UErZn/Fkgy6zHL6Do6/Wci/DdvhIPpt3p
 szDeF6V196hbpVAm/rTTVZDw9Ph+soCXFKClo79ajOQpPp4V9GlO09PreR9BrXHynsdd
 4gvQWbvLkgv2z89dbnvqM9xKoj6WPovyjvPuuCu6F6tcJfFO+xuCDsXyh7PdhX03xXfi
 zrD+j5AmUhn6rV0H3t9Le4RPftKnTqr1bbnRxHVTU0kcURE58vBHO11Mh7uUXTY1vlZL
 DaEYhIwVfoBWYpMpMjO5huE4giJJS2p/2gFlQ0pqSQL4JwSKtvVe0CHlS9PSF+LGWEye 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvm1mapx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 14:06:42 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25NBUQvM031707;
 Thu, 23 Jun 2022 14:06:42 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvm1mapwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 14:06:42 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NE62tV002337;
 Thu, 23 Jun 2022 14:06:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3gt009np5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 14:06:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25NE6d2x14090882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jun 2022 14:06:39 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFE81BE04F;
 Thu, 23 Jun 2022 14:06:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07E44BE056;
 Thu, 23 Jun 2022 14:06:39 +0000 (GMT)
Received: from localhost (unknown [9.160.47.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jun 2022 14:06:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?V=C3=ADctor?= Colombo <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, lucas.coutinho@eldorado.org.br,
 leandro.lupori@eldorado.org.br
Subject: Re: [PATCH] target/ppc: Change FPSCR_* to follow POWER ISA
 numbering convention
In-Reply-To: <20220622193203.127698-1-victor.colombo@eldorado.org.br>
References: <20220622193203.127698-1-victor.colombo@eldorado.org.br>
Date: Thu, 23 Jun 2022 11:06:36 -0300
Message-ID: <87bkuja2z7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y_ulPNFzczYTxhsxBARHY3j_3gJ50yxz
X-Proofpoint-GUID: k80NB8hjCcQUuv9rEDAy1OvflHOw37Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_06,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 mlxlogscore=637 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206230055
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V=C3=ADctor Colombo <victor.colombo@eldorado.org.br> writes:

> FPSCR_* bit values in QEMU are in the 'inverted' order from what Power
> ISA defines (e.g. FPSCR.FI is bit 46 but is defined as 17 in cpu.h).
> Now that PPC_BIT_NR macro was introduced to fix this situation for the
> MSR bits, we can use it for the FPSCR bits too.
>
> Also, adjust the comments to make then fit in 80 columns
>
> Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Apart form the typo below.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/cpu.h | 72 ++++++++++++++++++++++++------------------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6d78078f37..c78f64cced 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -694,42 +694,42 @@ enum {

<snip>

> +#define FPSCR_DRN2   PPC_BIT_NR(29) /* Decimal Floating-Point rounding c=
trl. */
> +#define FPSCR_DRN1   PPC_BIT_NR(30) /* Decimal Floating-Point rounding c=
trl. */
> +#define FPSCR_DRN0   PPC_BIT_NR(31) /* Decimal Floating-Point rounding c=
trl. */
> +#define FPSCR_FX     PPC_BIT_NR(32) /* Floating-point exception summary =
     */
> +#define FPSCR_FEX    PPC_BIT_NR(33) /* Floating-point enabled exception =
summ.*/
> +#define FPSCR_VX     PPC_BIT_NR(34) /* Floating-point invalid op. excp. =
summ.*/
> +#define FPSCR_OX     PPC_BIT_NR(35) /* Floating-point overflow exception=
     */
> +#define FPSCR_UX     PPC_BIT_NR(36) /* Floating-point underflow exceptio=
     */

exception

> +#define FPSCR_ZX     PPC_BIT_NR(37) /* Floating-point zero divide except=
ion  */
> +#define FPSCR_XX     PPC_BIT_NR(38) /* Floating-point inexact exception =
     */
> +#define FPSCR_VXSNAN PPC_BIT_NR(39) /* Floating-point invalid op. excp (=
sNan)*/
> +#define FPSCR_VXISI  PPC_BIT_NR(40) /* Floating-point invalid op. excp (=
inf) */
> +#define FPSCR_VXIDI  PPC_BIT_NR(41) /* Floating-point invalid op. excp (=
inf) */
> +#define FPSCR_VXZDZ  PPC_BIT_NR(42) /* Floating-point invalid op. excp (=
zero)*/
> +#define FPSCR_VXIMZ  PPC_BIT_NR(43) /* Floating-point invalid op. excp (=
inf) */
> +#define FPSCR_VXVC   PPC_BIT_NR(44) /* Floating-point invalid op. excp (=
comp)*/
> +#define FPSCR_FR     PPC_BIT_NR(45) /* Floating-point fraction rounded  =
     */
> +#define FPSCR_FI     PPC_BIT_NR(46) /* Floating-point fraction inexact  =
     */
> +#define FPSCR_C      PPC_BIT_NR(47) /* Floating-point result class descr=
iptor*/
> +#define FPSCR_FL     PPC_BIT_NR(48) /* Floating-point less than or negat=
ive  */
> +#define FPSCR_FG     PPC_BIT_NR(49) /* Floating-point greater than or ne=
g.   */
> +#define FPSCR_FE     PPC_BIT_NR(50) /* Floating-point equal or zero     =
     */
> +#define FPSCR_FU     PPC_BIT_NR(51) /* Floating-point unordered or NaN  =
     */
> +#define FPSCR_FPCC   PPC_BIT_NR(51) /* Floating-point condition code    =
     */
> +#define FPSCR_FPRF   PPC_BIT_NR(51) /* Floating-point result flags      =
     */
> +#define FPSCR_VXSOFT PPC_BIT_NR(53) /* Floating-point invalid op. excp (=
soft)*/
> +#define FPSCR_VXSQRT PPC_BIT_NR(54) /* Floating-point invalid op. excp (=
sqrt)*/
> +#define FPSCR_VXCVI  PPC_BIT_NR(55) /* Floating-point invalid op. excp (=
int) */
> +#define FPSCR_VE     PPC_BIT_NR(56) /* Floating-point invalid op. excp e=
nable*/
> +#define FPSCR_OE     PPC_BIT_NR(57) /* Floating-point overflow excp. ena=
ble  */
> +#define FPSCR_UE     PPC_BIT_NR(58) /* Floating-point underflow excp. en=
able */
> +#define FPSCR_ZE     PPC_BIT_NR(59) /* Floating-point zero divide excp e=
nable*/
> +#define FPSCR_XE     PPC_BIT_NR(60) /* Floating-point inexact excp. enab=
le   */
> +#define FPSCR_NI     PPC_BIT_NR(61) /* Floating-point non-IEEE mode     =
     */
> +#define FPSCR_RN1    PPC_BIT_NR(62)
> +#define FPSCR_RN0    PPC_BIT_NR(63) /* Floating-point rounding control  =
     */
>  /* Invalid operation exception summary */
>  #define FPSCR_IX     ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
>                        (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \

