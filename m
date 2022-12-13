Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3364B9F9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58Kt-0004zo-OK; Tue, 13 Dec 2022 11:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p58Kd-0004vD-H7; Tue, 13 Dec 2022 11:40:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p58Ka-0006MT-L9; Tue, 13 Dec 2022 11:40:38 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDGJRKB039473; Tue, 13 Dec 2022 16:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1PoXFVvKmVqFqqxRyvTqqyyBymr37klRNOqJHjEXgGo=;
 b=DkzgSaQDsYiw/GNDmcSv+o2DEaMPoYuNUvLbFSDuVfkkHnLXauBF1Lte0xXlZrbWXyky
 iLtqndoWzrHIfVOSUr1qAGQO6HBXk9Xr7/DTt23SMTUcZ/zcdRpHRcyJJqSpp8ZiFaqg
 jqLI0nH+baH2ItZRPx9rfQrFp7AhzN9kbWCS8z1O+EVNZ+nO/mf3Bd6Wp1eHOvlfclxb
 jGBH5DtB5gL/ee+BXUFbmXxyhrS8N419GqICa5EzQ/RZUXmnm2XmHINyuGCVEWucKXEV
 KeD19J+IFZVsxeQndnepr0f9oZjpKnASKPVZkjN0Y8Ipw4chxE7wGgnstf14zRVZ2/D4 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mevtk8q2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:40:25 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BDGK5VC002219;
 Tue, 13 Dec 2022 16:40:24 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mevtk8q1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:40:24 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BDF0FHj019467;
 Tue, 13 Dec 2022 16:40:23 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3mchr6sneh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:40:23 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BDGeLXt5440214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 16:40:22 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCF8358052;
 Tue, 13 Dec 2022 16:40:21 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 837265804E;
 Tue, 13 Dec 2022 16:40:16 +0000 (GMT)
Received: from [9.43.109.223] (unknown [9.43.109.223])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 13 Dec 2022 16:40:16 +0000 (GMT)
Message-ID: <a49294f9-bdae-bf55-71f0-8de80d23010d@linux.ibm.com>
Date: Tue, 13 Dec 2022 22:10:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH-for-8.0 4/4] hw/ppc/spapr_ovec: Avoid target_ulong
 spapr_ovec_parse_vector()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Neuling <mikey@neuling.org>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-5-philmd@linaro.org>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <20221213123550.39302-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HnCDKmRv4FMx7JMGUhEODaWWPqk8Z3lO
X-Proofpoint-GUID: tnG3eKKuifj_FEC3bm0-meeTJyjX_kGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212130147
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/13/22 18:05, Philippe Mathieu-Daudé wrote:
> spapr_ovec.c is a device, but it uses target_ulong which is
> target specific. The hwaddr type (declared in "exec/hwaddr.h")
> better fits hardware addresses.
> 
> Change spapr_ovec_parse_vector() to take a hwaddr argument,
> allowing the removal of "cpu.h" in a device header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ppc/spapr_ovec.c         | 3 ++-
>   include/hw/ppc/spapr_ovec.h | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
> index b2567caa5c..a18a751b57 100644
> --- a/hw/ppc/spapr_ovec.c
> +++ b/hw/ppc/spapr_ovec.c
> @@ -19,6 +19,7 @@
>   #include "qemu/error-report.h"
>   #include "trace.h"
>   #include <libfdt.h>
> +#include "cpu.h"
>   
>   #define OV_MAXBYTES 256 /* not including length byte */
>   #define OV_MAXBITS (OV_MAXBYTES * BITS_PER_BYTE)
> @@ -176,7 +177,7 @@ static target_ulong vector_addr(target_ulong table_addr, int vector)
>       return table_addr;
>   }
>   
> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector)
> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector)

IIUC, Option vectors represents a data structure of vectors to advertise 
guest capabilities to the platform (ref b20b7b7adda4) and doesn't really 
represent a hardware device by itself. IMHO, target_ulong appears to be 
more appropriate for this purpose. However, the header file inclusion 
could be changed to cpu-defs.h if target_ulong is the only requirement here.

regards,
Harsh
>   {
>       SpaprOptionVector *ov;
>       target_ulong addr;
> diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
> index c3e8b98e7e..d756b916e4 100644
> --- a/include/hw/ppc/spapr_ovec.h
> +++ b/include/hw/ppc/spapr_ovec.h
> @@ -37,7 +37,7 @@
>   #ifndef SPAPR_OVEC_H
>   #define SPAPR_OVEC_H
>   
> -#include "cpu.h"
> +#include "exec/hwaddr.h"
>   
>   typedef struct SpaprOptionVector SpaprOptionVector;
>   
> @@ -73,7 +73,7 @@ void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
>   void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
>   bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
>   bool spapr_ovec_empty(SpaprOptionVector *ov);
> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector);
> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector);
>   int spapr_dt_ovec(void *fdt, int fdt_offset,
>                     SpaprOptionVector *ov, const char *name);
>   

