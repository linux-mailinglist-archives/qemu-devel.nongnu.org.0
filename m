Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD865F7DA2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 21:10:32 +0200 (CEST)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogsjv-00033T-8j
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 15:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ogshg-0000Du-Cd; Fri, 07 Oct 2022 15:08:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ogshe-0005yp-Q8; Fri, 07 Oct 2022 15:08:12 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297ItXNh025777;
 Fri, 7 Oct 2022 19:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=UIfcOCwCtU4V4Cuwpvz9gIpLlG2iIjy9ivgK3WT8bHQ=;
 b=rGo234cwz/M4QDG+Sjof5HwIPeBLcmez8NPmL9EPxkLNciF+/vsPwCF0ShvwgprVXzf5
 uGn5vXzOQU+XjcH6kxlld2KPNYfPL6EUH/xMEjxPkhikMJGFsjVM/NviZHKb+Sks5lKx
 13h7+z7p99IGCFLTCAK8nHVpg7+D6x1sx2tJjrka3CrrYnri4YFYisItcDXQEHO0n2W6
 QtFe7oSST3Z8lJhMutGs0GjpMVID1l2HybruWiH4S064TDal0uOrKBWopDRstWkIq9bb
 KW6WfXtt/QFGw0CKKj9qD+0F+scn6G3iMTOGJx9nxbkSVRgMG2J/1tcO4x5bSi0cdwXu Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2pq06ydj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:07:54 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 297IxFs5012286;
 Fri, 7 Oct 2022 19:07:54 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2pq06ycg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:07:54 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 297J59t6011291;
 Fri, 7 Oct 2022 19:07:53 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3jxd6aan1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 19:07:53 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 297J7pZk66388228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Oct 2022 19:07:51 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 170F85804E;
 Fri,  7 Oct 2022 19:07:52 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8388D5805A;
 Fri,  7 Oct 2022 19:07:51 +0000 (GMT)
Received: from localhost (unknown [9.160.33.130])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri,  7 Oct 2022 19:07:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH 1/6] target/ppc: fix msgclr/msgsnd insns flags
In-Reply-To: <20221006200654.725390-2-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
 <20221006200654.725390-2-matheus.ferst@eldorado.org.br>
Date: Fri, 07 Oct 2022 16:07:49 -0300
Message-ID: <877d1b8nay.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w3cpfOdxz0S-bQo8EQjgkwllBlW9R7jA
X-Proofpoint-ORIG-GUID: OQAqorhupVeat2WbbHi7URdmZHErzwG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1015 mlxlogscore=660 mlxscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

> On Power ISA v2.07, the category for these instructions became
> "Embedded.Processor Control" or "Book S".
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e810842925..37d7018d18 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6902,9 +6902,9 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
>  GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
>                 PPC_NONE, PPC2_BOOKE206),
>  GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
> -               PPC_NONE, PPC2_PRCNTL),
> +               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
>  GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
> -               PPC_NONE, PPC2_PRCNTL),
> +               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
>  GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
>                 PPC_NONE, PPC2_PRCNTL),
>  GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),

