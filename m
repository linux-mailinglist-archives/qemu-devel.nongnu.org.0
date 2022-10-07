Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527855F7DD0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 21:17:45 +0200 (CEST)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogsqt-0001Vu-VY
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 15:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ogsk8-0003Su-Cs; Fri, 07 Oct 2022 15:10:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ogsk4-0006Po-C8; Fri, 07 Oct 2022 15:10:41 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297J7xl7025864;
 Fri, 7 Oct 2022 19:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jH53fcqsszRbZx1TTa49kVZRS0s8zdfWbb2JBgDXRus=;
 b=cR6dCenDCHitUts17ekvoznvSgs9qFeaHGh4EtcVjILTiu0lXllxpgwTfZ0LsQh82Xqy
 dnzU2VEriuu25KvYKjydVWf7afvxZNuKRi0bRI+zeZL0WtA/qgxhalOJ02qxBK2dBIs4
 Beb2hVOvbidOaEYsnJ6mXwuLeXiAydbn5nIQ5ZnGIg97KlwH0d52bkEN/i+ygGJ2oW1d
 4ib3uEJdusVhUJ927T1OIruJ6v4DcwMDQ5AioCQhFdFT9AidD7GwoSoR5MJcVTFVal3f
 7HPq3q1F2sdGCC8aSLO3I0LS01VJ8z4+tjbCn9yN1THUKeDMIicvqAvXv5PpL09mAgN/ ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2mfq458p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:10:24 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 297J8kRB001116;
 Fri, 7 Oct 2022 19:10:24 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2mfq457v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:10:24 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 297J5kVh031679;
 Fri, 7 Oct 2022 19:10:23 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3k28d2eenr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:10:23 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 297JALRx51642624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Oct 2022 19:10:22 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACF7658054;
 Fri,  7 Oct 2022 19:10:21 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 124AD58050;
 Fri,  7 Oct 2022 19:10:21 +0000 (GMT)
Received: from localhost (unknown [9.160.33.130])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri,  7 Oct 2022 19:10:20 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH 2/6] target/ppc: fix msgsync insns flags
In-Reply-To: <20221006200654.725390-3-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
 <20221006200654.725390-3-matheus.ferst@eldorado.org.br>
Date: Fri, 07 Oct 2022 16:10:19 -0300
Message-ID: <874jwf8n6s.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ylZOLnwwp4fbH6kxh9aM9YAYpIEn1sGS
X-Proofpoint-ORIG-GUID: cRIx-BFwb4nmwc5oMuk3f9dTEaf1rR4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=550 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070112
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

> This instruction was added by Power ISA 3.0, using PPC2_PRCNTL makes it
> available for older processors, like de e5500 and e6500.
>
> Fixes: 7af1e7b02264 ("target/ppc: add support for hypervisor doorbells on book3s CPUs")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 37d7018d18..eaac8670b1 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6906,7 +6906,7 @@ GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
>  GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
>                 PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
>  GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
> -               PPC_NONE, PPC2_PRCNTL),
> +               PPC_NONE, PPC2_ISA300),
>  GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
>  GEN_HANDLER(wrteei, 0x1F, 0x03, 0x05, 0x000E7C01, PPC_WRTEE),
>  GEN_HANDLER(dlmzb, 0x1F, 0x0E, 0x02, 0x00000000, PPC_440_SPEC),

