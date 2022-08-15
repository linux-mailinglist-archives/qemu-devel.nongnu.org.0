Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CE593AA0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 22:28:23 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNghB-0000r1-VD
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 16:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNgek-00068G-KD; Mon, 15 Aug 2022 16:25:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48484
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1oNgei-0002Pp-Pi; Mon, 15 Aug 2022 16:25:50 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FKJp13010257;
 Mon, 15 Aug 2022 20:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=x5aSsFdzRH62V4MuqAazOoxAxVEUmPJt7tVMIpfkVCM=;
 b=QchjTTLoMTj2JkvcjkERuxHfzQHJwX0H1Pj6NDUNmtVKw9FSK2/t7bwb/yjSu2BpCjHS
 vVyrXxo5SsJITbRnlMzJPprVyABKo964zo2W/o7LWtN/bMRedsLRMGshpM5ZtdaCWKWq
 vWkCmBMu6IB139EU4V4rXY5r+BQ4wdqKGwD8dYvKUbuSv5RncbkeydzGvjrTjSJFTSdh
 WM9p7J6/+T8irTwjnckPiAcQRRDUbz8q41prMYgbKGmu+lKdLNi3JRClRPvwP+owsGSC
 Zyo9sovkqzdC8xD4kXiSC8ksLtTdmuET/bls1w8mrPoId1cbG95eTq2r270xvOy5MPh9 MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyuw727ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 20:25:39 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27FKK92I013117;
 Mon, 15 Aug 2022 20:25:39 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hyuw727ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 20:25:39 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27FKLVcA018248;
 Mon, 15 Aug 2022 20:25:38 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3hx3k9wyq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 20:25:38 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27FKPcoi9437724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Aug 2022 20:25:38 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 041F5112067;
 Mon, 15 Aug 2022 20:25:38 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70B10112062;
 Mon, 15 Aug 2022 20:25:37 +0000 (GMT)
Received: from localhost (unknown [9.160.104.128])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Aug 2022 20:25:37 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH 04/13] target/ppc: prepare to split
 ppc_interrupt_pending by excp_model
In-Reply-To: <20220815162020.2420093-5-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
 <20220815162020.2420093-5-matheus.ferst@eldorado.org.br>
Date: Mon, 15 Aug 2022 17:25:36 -0300
Message-ID: <877d396ypr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3Srda-p3MzdRbpvBl7nYnR9-zyoatOB-
X-Proofpoint-GUID: VfID_ckw2nCsrijm9hSuGJphH8x_3nwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208150077
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

> Rename the method to ppc_interrupt_pending_legacy and create a new
> ppc_interrupt_pending that will call the appropriate interrupt masking
> method based on env->excp_model.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  target/ppc/excp_helper.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8690017c70..59981efd16 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1678,7 +1678,7 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>      powerpc_excp(cpu, cs->exception_index);
>  }
>  
> -static int ppc_pending_interrupt(CPUPPCState *env)
> +static int ppc_pending_interrupt_legacy(CPUPPCState *env)

Won't this code continue to be used for the older CPUs? If so, I don't
think the term legacy is appropriate. It ends up being dependent on
context and what people's definitions of "legacy" are.

(if this function is removed in a later patch, then that's ok).

>  {
>      bool async_deliver;
>  
> @@ -1790,6 +1790,14 @@ static int ppc_pending_interrupt(CPUPPCState *env)
>      return 0;
>  }
>  
> +static int ppc_pending_interrupt(CPUPPCState *env)
> +{
> +    switch (env->excp_model) {
> +    default:
> +        return ppc_pending_interrupt_legacy(env);
> +    }
> +}
> +
>  static void ppc_hw_interrupt(CPUPPCState *env, int pending_interrupt)
>  {
>      PowerPCCPU *cpu = env_archcpu(env);

