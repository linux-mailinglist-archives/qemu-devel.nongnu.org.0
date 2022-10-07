Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524D5F7DA1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 21:10:22 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogsjl-0002ht-7h
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 15:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ogshX-0008Qk-1a; Fri, 07 Oct 2022 15:08:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ogshV-0005yb-4i; Fri, 07 Oct 2022 15:08:02 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297Is68C018840;
 Fri, 7 Oct 2022 19:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ARrR3y8tNw7RzqHK9xXpNeUnNHtLA9bIYTs7KdaAsAs=;
 b=DqLZVwTwjbvHgXSr2uNud6Dz418V79o7UAfo9iKBi7PDBSOASyE1yiTHq1brU+B3v5qA
 VPxAfDt53+6lo2qn88TxxCv3Qj+u/QIl/7pRsuUQYrpTvEl89cTXQhvab/kR/nBhbqbA
 Tkhf06fdDIO5wFi+vQNZ+Xq+O55joQSIudSoblJr0tUWsJsYDNHvI0Ga4A9Olc/QpxZh
 XIUnrJDZHDp4/Z3erbYEc8K9UqjW2y20rP67hlb3fQyrd1DUYwqIDYwbKNYeEmI8X+Xk
 LODUV+0cc52VjLCv4lG/MuHBiAZBCxYW1iIxYy4Mcd8PxrIevyl4CftPTXdKbssLkAQh Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2st28d6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:07:42 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 297ItLbO023083;
 Fri, 7 Oct 2022 19:07:42 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2st28d5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:07:42 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 297J5IGY027552;
 Fri, 7 Oct 2022 19:07:41 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3jxd6a2jxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:07:41 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 297J7gVG8520444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Oct 2022 19:07:43 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B42D5805D;
 Fri,  7 Oct 2022 19:07:40 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3C6F58043;
 Fri,  7 Oct 2022 19:07:39 +0000 (GMT)
Received: from localhost (unknown [9.160.33.130])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri,  7 Oct 2022 19:07:39 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH 3/6] target/ppc: fix REQUIRE_HV macro definition
In-Reply-To: <20221006200654.725390-4-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
 <20221006200654.725390-4-matheus.ferst@eldorado.org.br>
Date: Fri, 07 Oct 2022 16:07:37 -0300
Message-ID: <87a6678nba.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3uMitHmHficyOjR1aC4OLUK1vVj01AaJ
X-Proofpoint-ORIG-GUID: eIlkTNLGLMHdPZiPZu48QRZ9xMLo_m0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=725 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> The macro is missing a '{' after the if condition. Any use of REQUIRE_HV
> would cause a compilation error.
>
> Fixes: fc34e81acd51 ("target/ppc: add macros to check privilege level")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/translate.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index eaac8670b1..435066c4a3 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6545,12 +6545,12 @@ static int64_t dw_compose_ea(DisasContext *ctx, int x)
>          }                           \
>      } while (0)
>  
> -#define REQUIRE_HV(CTX)                         \
> -    do {                                        \
> -        if (unlikely((CTX)->pr || !(CTX)->hv))  \
> -            gen_priv_opc(CTX);                  \
> -            return true;                        \
> -        }                                       \
> +#define REQUIRE_HV(CTX)                             \
> +    do {                                            \
> +        if (unlikely((CTX)->pr || !(CTX)->hv)) {    \
> +            gen_priv_opc(CTX);                      \
> +            return true;                            \
> +        }                                           \
>      } while (0)
>  #else
>  #define REQUIRE_SV(CTX) do { gen_priv_opc(CTX); return true; } while (0)

