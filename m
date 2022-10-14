Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D55FF178
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 17:35:16 +0200 (CEST)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojMiA-00016N-UI
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 11:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojMPS-0007RD-NQ; Fri, 14 Oct 2022 11:15:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojMPQ-0007zp-Nb; Fri, 14 Oct 2022 11:15:38 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EEj8nw026554;
 Fri, 14 Oct 2022 15:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=H1Qb7uMcapqDqFZS3kBSKVcZi9GNZVGIuN5YtF3MIXo=;
 b=Fl+0hfWdvC3RNEitpGUKv/Aou6Q0T8S/9aHxnFAryZkC4k9b9w85AcPTLiX+ops8gtZY
 Tv6Ggqfy386xG80JQ7lfH9AiF8DWVxV3gFbEKabxTona0LL5yCDIqkPt9ftf5STwnbhx
 47DjzxOFZ5XZFSkAl858CkSwAw36RJUqg35/d3fDutENLwGmtWY0gUwfhbyMGWxXs5FA
 EzV5NKOxpZYU6rSPrxJJz5l6AJxF5bDxxSXT9D2QYHXP/w4DQjaIkunqKlNrSFWmZGBi
 4VzsLrq8t5ZcSLG1rjAvNM7wXBg3ogOxNamRPNyWdVkBzquf9EJ52ZIogpFuELd1EGu0 aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k75q1h8e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:15:20 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EE8W5S008132;
 Fri, 14 Oct 2022 15:15:19 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k75q1h8dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:15:19 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EF5B8d029804;
 Fri, 14 Oct 2022 15:15:18 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3k30uatbk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 15:15:18 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EFFH9g23790304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 15:15:17 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19AD358064;
 Fri, 14 Oct 2022 15:15:17 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52CAB58052;
 Fri, 14 Oct 2022 15:15:16 +0000 (GMT)
Received: from localhost (unknown [9.77.138.198])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Oct 2022 15:15:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 23/29] target/ppc: remove generic architecture checks
 from p7_deliver_interrupt
In-Reply-To: <20221011204829.1641124-24-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-24-matheus.ferst@eldorado.org.br>
Date: Fri, 14 Oct 2022 12:15:14 -0300
Message-ID: <87wn92308t.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CSsL6N7fKyOrr71ob9Pk9lV6AXnxN2HB
X-Proofpoint-GUID: QW0ugEN6TyqRWvojc4r0fyevRxEDORXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=680 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210140083
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/excp_helper.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 055f1de20e..1c373c1a7c 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2077,9 +2077,6 @@ static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
>          break;
>  
>      case PPC_INTERRUPT_DECR: /* Decrementer exception */
> -        if (ppc_decr_clear_on_delivery(env)) {
> -            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
> -        }
>          powerpc_excp(cpu, POWERPC_EXCP_DECR);
>          break;
>      case PPC_INTERRUPT_PERFM:

