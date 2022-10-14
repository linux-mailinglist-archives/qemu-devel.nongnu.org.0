Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD65FF0A9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:53:20 +0200 (CEST)
Received: from localhost ([::1]:42276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojM3q-0001Wj-UH
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojLyr-0005PN-VH; Fri, 14 Oct 2022 10:48:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ojLyq-0003KO-DW; Fri, 14 Oct 2022 10:48:09 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EEVfZX030158;
 Fri, 14 Oct 2022 14:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=F0iM+LFy3RQr7Aw2OtR4Ru61z+stg7NbD1nh5Prfedc=;
 b=jHuC46U75Re/Ug+TDj5s3iB7Rla+tvrFuEj7JInbDQLvBw7BjV4JvnLKg7bvr1p2wws1
 rXLndizrSwrGkemCQZ8BoAg9aVTSvE3UbvSGhjaYITRl2RnT9WNoprwsQCXdWEcz73kR
 g64jpjL8+k3WG8+x+06HC9my057cRO/1PJMgCVeECD4hLLhmmo7duN5a2jvI18L1pRfd
 GmllZphf7BaS6vwT0ufKJta6Wb6qjRF5dARn6Alu4HD8hdA22socx2hv/8Af4pHfiJRj
 ZYU/Ma70cSAJaXblMlWohTWEfRrm7d2OV2vTnbUocQ0UwVwvyQnOuU/Y2q8LFTh+Xmo4 OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k79kurs0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:47:59 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EEVlt0030532;
 Fri, 14 Oct 2022 14:47:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k79kurry4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:47:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EEaBZU032530;
 Fri, 14 Oct 2022 14:47:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3k30uat6q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:47:56 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EElr4430343502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 14:47:53 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32DE558043;
 Fri, 14 Oct 2022 14:47:55 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9394C5805F;
 Fri, 14 Oct 2022 14:47:54 +0000 (GMT)
Received: from localhost (unknown [9.77.138.198])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Oct 2022 14:47:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v3 16/29] target/ppc: remove generic architecture checks
 from p8_deliver_interrupt
In-Reply-To: <20221011204829.1641124-17-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <20221011204829.1641124-17-matheus.ferst@eldorado.org.br>
Date: Fri, 14 Oct 2022 11:47:52 -0300
Message-ID: <87h7064g2v.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S6kaC6hymA-UA_S4o08H89Y0zXB6ZfA4
X-Proofpoint-GUID: 4WKTPtVx-O3hIPKbmNEtT5NQMrnerMkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=737
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210140081
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

> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/excp_helper.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 662daad796..aaf1c95087 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -2004,9 +2004,6 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
>          break;
>  
>      case PPC_INTERRUPT_DECR: /* Decrementer exception */
> -        if (ppc_decr_clear_on_delivery(env)) {
> -            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
> -        }
>          powerpc_excp(cpu, POWERPC_EXCP_DECR);
>          break;
>      case PPC_INTERRUPT_DOORBELL:

