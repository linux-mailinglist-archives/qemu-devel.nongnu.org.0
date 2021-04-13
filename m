Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3DA35E346
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:57:23 +0200 (CEST)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLPm-00029M-Cu
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWLN7-0000pB-ME; Tue, 13 Apr 2021 11:54:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWLN5-0007qf-V4; Tue, 13 Apr 2021 11:54:37 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DFri58148470; Tue, 13 Apr 2021 11:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=JPkzQYCY8Rl6OVvxSY+puG7hdQ6clCMKCCapE5O9OCg=;
 b=iImx73prq3SAP9BeKmW7neVqAfLnloyGL3RnzvADAL/CwdjGu437O0MvaewwceKkk60T
 iA/iCdh5pIDQQIy3fqPTCV19HIGt40a6G0+YoK3EDECXCApjbIEzoN7s2y6mmGuIEfdq
 axeyAdSY8wR/xT+AIGEGLrJiFUbTnpYhLFlt6ef2WGrei1pPD5Y0ngFc2OLx5IF7+tPb
 z2U6laDHEwOt2fcA5/YsZVa7QSI/bvZaOxsSwE6iWyJ9CSV43fG7yb+fHPJclHu7IxJI
 obZVTPIwwJI6zkBRGY7otd+GwHfSCOrHPB2ZqXZCG2bxGFcPmAFeziEgMWDiDyRkgZy5 bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37webgr0km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 11:54:30 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13DFsTUX154090;
 Tue, 13 Apr 2021 11:54:29 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37webgr0kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 11:54:29 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DFm0i5004324;
 Tue, 13 Apr 2021 15:54:29 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 37u3na1w4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:54:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DFsSGV6423192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 15:54:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C03B4AC05B;
 Tue, 13 Apr 2021 15:54:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAB4BAC05E;
 Tue, 13 Apr 2021 15:54:27 +0000 (GMT)
Received: from localhost (unknown [9.211.159.146])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Apr 2021 15:54:27 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH v1 2/3] target/ppc: POWER10 supports scv
In-Reply-To: <20210413125448.1689545-3-npiggin@gmail.com>
References: <20210413125448.1689545-1-npiggin@gmail.com>
 <20210413125448.1689545-3-npiggin@gmail.com>
Date: Tue, 13 Apr 2021 12:54:25 -0300
Message-ID: <87sg3u41u6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UdVSFsRUZdwgOoJq37UmkDHGc3oiWLVs
X-Proofpoint-ORIG-GUID: ZKM6JX0KUTVKTsqBDF3RUdGgo4vTTpHJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_09:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130108
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This must have slipped through the cracks between adding POWER10 support
> and scv support.
>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/translate_init.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index c03a7c4f52..70f9b9b150 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -9323,7 +9323,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>      pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
>                   POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
>                   POWERPC_FLAG_BUS_CLK | POWERPC_FLAG_CFAR |
> -                 POWERPC_FLAG_VSX | POWERPC_FLAG_TM;
> +                 POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
>      pcc->l1_dcache_size = 0x8000;
>      pcc->l1_icache_size = 0x8000;
>      pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;

