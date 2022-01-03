Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30218482FC8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 11:09:30 +0100 (CET)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4KHQ-0007NV-Ut
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 05:09:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1n4KG8-0006Rv-KJ; Mon, 03 Jan 2022 05:08:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1n4KG6-0004VM-T4; Mon, 03 Jan 2022 05:08:08 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2037ngth021128; 
 Mon, 3 Jan 2022 10:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BVsqHrIHwyN8iqlnJfmO4+hMMdm81bTnAYlTIHLjsmU=;
 b=U+8YEbwJGGrJe4IAgT4h/JeopgVDoQlJnfeSsmnbLuNqhgBTAUZCTfhY81B8bO4KTjYF
 +ARzTOIfVugYrXYESFvGsj1j5+Yujd8duM313thc7dqPNtJ2pv4oq3S20GAZ5oU7u1mz
 N6VCiieq3nVwMNH2w6aF7YJLm/jr59GEMhNe5v9dHM1CzBBr7PWJJKxiK4xwAi3UCTjM
 ruP+mGVlKHfshXxH48jUNFUNqE/eFSOIf+EgDSHaY4iKBL+iFyWzbtPgJ6VlpVOzgdlL
 bwV/Ikkb1quhNb6qplT04DvTxfWavuIfez6dI8EqLPFYjF0HnY3bf7D38fDhy681PK5f ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dbw3jt7ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 10:07:51 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203A1kKF006748;
 Mon, 3 Jan 2022 10:07:50 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dbw3jt7mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 10:07:50 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203A3gFN007635;
 Mon, 3 Jan 2022 10:07:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek99hsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 10:07:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203A7jbm28442930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 10:07:46 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCA204C040;
 Mon,  3 Jan 2022 10:07:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 918904C052;
 Mon,  3 Jan 2022 10:07:45 +0000 (GMT)
Received: from [9.145.163.160] (unknown [9.145.163.160])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 10:07:45 +0000 (GMT)
Message-ID: <468b0860-fcd1-f7d0-4180-d75e4e25e9c1@linux.ibm.com>
Date: Mon, 3 Jan 2022 11:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/ppc: Check effective address validity
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211231073122.3183583-1-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211231073122.3183583-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SLC1M6A_APsYtbQUxUU-6KrydWcpc24r
X-Proofpoint-GUID: o2hzcPeeV6XziLgmjaDdTWs0GQkMmY9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_03,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030068
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/12/2021 08:31, Cédric Le Goater wrote:
> For Radix translation, the EA range is 64-bits. when EA(2:11) are
> nonzero, a segment interrupt should occur.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


Looks ok to me.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   target/ppc/mmu-radix64.h | 1 +
>   target/ppc/mmu-radix64.c | 5 +++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
> index b70357cf345c..4c768aa5cc74 100644
> --- a/target/ppc/mmu-radix64.h
> +++ b/target/ppc/mmu-radix64.h
> @@ -5,6 +5,7 @@
>   
>   /* Radix Quadrants */
>   #define R_EADDR_MASK            0x3FFFFFFFFFFFFFFF
> +#define R_EADDR_VALID_MASK      0xC00FFFFFFFFFFFFF
>   #define R_EADDR_QUADRANT        0xC000000000000000
>   #define R_EADDR_QUADRANT0       0x0000000000000000
>   #define R_EADDR_QUADRANT1       0x4000000000000000
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index d10ae001d7c9..040c055bff65 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -32,6 +32,11 @@ static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
>                                                    vaddr eaddr,
>                                                    uint64_t *lpid, uint64_t *pid)
>   {
> +    /* When EA(2:11) are nonzero, raise a segment interrupt */
> +    if (eaddr & ~R_EADDR_VALID_MASK) {
> +        return false;
> +    }
> +
>       if (msr_hv) { /* MSR[HV] -> Hypervisor/bare metal */
>           switch (eaddr & R_EADDR_QUADRANT) {
>           case R_EADDR_QUADRANT0:

