Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB7593EAD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 23:25:11 +0200 (CEST)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNhaA-0002G5-CA
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 17:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNhZ5-0000l6-DI; Mon, 15 Aug 2022 17:24:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61734
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNhZ3-00024V-Du; Mon, 15 Aug 2022 17:24:03 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FKnq1L003421;
 Mon, 15 Aug 2022 21:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=SzjSYdc0aF4B1iAMUVwuSOinHC+AqLxFqIABhF2VNiE=;
 b=dib9TcCq4JhZDSNBlCqYdwnk6g46aZRHG1o/WbHf976WQqo+gZdQg8bwDTwIjSlzPgiQ
 HqLvaQb+eGNsav3J+P8YMYVRKfbkbn4wdc9cXKarOEqGtQ+WSpWPP+l7xmyOVBNQJLfR
 I8p+IFqjBp3sK3wbHrrDv62tgXChTGY3YB6ndUT1W3JYrV7z8xWNHaaV9WWznsD7M2pr
 lft98cMEQko2H+aJpE1m230mrJIB4MAB2Pz5R6hX3SdAWz7eWf7a+w16V6mprxgHaaR8
 2ipXWv+0jbrhqv8HsVAHufRtXTdcZSfiDNYpeAn4CL8LuKSdcDm9lfEEx33rBWKPuV/Q Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyuw73b0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 21:23:46 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27FKnuxY003901;
 Mon, 15 Aug 2022 21:23:45 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyuw73b02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 21:23:45 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27FLK4V8018025;
 Mon, 15 Aug 2022 21:23:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3hx3ka9p4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 21:23:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27FLNhi260817804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Aug 2022 21:23:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE5EAE05C;
 Mon, 15 Aug 2022 21:23:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31D9EAE063;
 Mon, 15 Aug 2022 21:23:43 +0000 (GMT)
Received: from localhost (unknown [9.160.104.128])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Aug 2022 21:23:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH 06/13] target/ppc: remove embedded interrupts from
 ppc_pending_interrupt_p9
In-Reply-To: <20220815162020.2420093-7-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-7-matheus.ferst@eldorado.org.br>
Date: Mon, 15 Aug 2022 18:23:41 -0300
Message-ID: <8735dx6w0y.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: K-dvxKu6_yRFcgDBSQznJTOeE3K3PFOk
X-Proofpoint-GUID: 3tHHJPx4aZeK1tXvTDl6GcDINO2EzLdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=961
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208150081
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Critical Input, Watchdog Timer, and Fixed Interval Timer are only
> defined for embedded CPUs. The Programmable Interval Timer is 40x-only.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  target/ppc/excp_helper.c | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 2ca6a917b2..42b57019ba 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1780,28 +1780,10 @@ static int ppc_pending_interrupt_p9(CPUPPCState *env)
>              return PPC_INTERRUPT_EXT;
>          }
>      }
> -    if (FIELD_EX64(env->msr, MSR, CE)) {
> -        /* External critical interrupt */
> -        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
> -            return PPC_INTERRUPT_CEXT;
> -        }
> -    }
>      if (async_deliver != 0) {
> -        /* Watchdog timer on embedded PowerPC */
> -        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
> -            return PPC_INTERRUPT_WDT;
> -        }
>          if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
>              return PPC_INTERRUPT_CDOORBELL;
>          }

This one too.

And the Thermal.

> -        /* Fixed interval timer on embedded PowerPC */
> -        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
> -            return PPC_INTERRUPT_FIT;
> -        }
> -        /* Programmable interval timer on embedded PowerPC */
> -        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
> -            return PPC_INTERRUPT_PIT;
> -        }
>          /* Decrementer exception */
>          if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
>              return PPC_INTERRUPT_DECR;

