Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001C25F116D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 20:16:29 +0200 (CEST)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeKYm-0003gl-7C
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 14:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeKWN-00026F-Hf; Fri, 30 Sep 2022 14:13:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oeKWL-0002Bu-Q6; Fri, 30 Sep 2022 14:13:59 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UICEO4031362;
 Fri, 30 Sep 2022 18:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=c6CCeiTSEkdSkqnq60+qZ/yj9cji/jkzG4Ac+1bOONM=;
 b=ry6x8Q8OcwsGXaA3WW6+VGD7Vj+/ypv0tabEOltgar3h3TqqhMod5rJmOlwHCw7yfHcs
 GLLuD62s3XLPvS0+NzHtalXE9N5Jd193vZWbfy9OAEKQQqFarVlcqW+qDp94uwmkFMBf
 VQXqSmonZufDcT+Aas5ezcLpprfDYaqTJnppEeFxibGxVXg2cfBzoZZANaHOFcDkhHcw
 34NDYUBXABtE+lNtZunniNvRPAbOFDHdmIDBnoArIG1CloMDwDEiMRmZhzstP8EY/KZJ
 m1QyOP6YY8eyjsEm98bMKYpGwJyFOpPvDndajInjFyRTJuqpaoVCkk6njyFYhAAuwnBj 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx5h7812m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 18:13:38 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UIDb0Q006808;
 Fri, 30 Sep 2022 18:13:37 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jx5h78125-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 18:13:37 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28UI5YMu004589;
 Fri, 30 Sep 2022 18:13:36 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3jsshamevc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 18:13:36 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28UIDYAE21889358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Sep 2022 18:13:34 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4047B58055;
 Fri, 30 Sep 2022 18:13:35 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9450458043;
 Fri, 30 Sep 2022 18:13:34 +0000 (GMT)
Received: from localhost (unknown [9.160.76.206])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Sep 2022 18:13:34 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 09/29] target/ppc: remove generic architecture
 checks from p9_deliver_interrupt
In-Reply-To: <20220927201544.4088567-10-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-10-matheus.ferst@eldorado.org.br>
Date: Fri, 30 Sep 2022 15:13:32 -0300
Message-ID: <87r0zs688j.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8N1d_XkBzokjH4W4dKQTY2kkSce26ngU
X-Proofpoint-ORIG-GUID: LOpB-tryM3YIyYL7hLCAPC31Q2LeECET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=746 mlxscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300113
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

> No functional change intended.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  target/ppc/excp_helper.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 603c956588..67e73f30ab 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1919,18 +1919,11 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
>          break;
>  
>      case PPC_INTERRUPT_DECR: /* Decrementer exception */
> -        if (ppc_decr_clear_on_delivery(env)) {
> -            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
> -        }

Maybe I'm missing something, but this should continue to clear the bit,
no? Same comment for P8.

>          powerpc_excp(cpu, POWERPC_EXCP_DECR);
>          break;
>      case PPC_INTERRUPT_DOORBELL:
>          env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
> -        if (is_book3s_arch2x(env)) {
> -            powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
> -        } else {
> -            powerpc_excp(cpu, POWERPC_EXCP_DOORI);
> -        }
> +        powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
>          break;
>      case PPC_INTERRUPT_HDOORBELL:
>          env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;

