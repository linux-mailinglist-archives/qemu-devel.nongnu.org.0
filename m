Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258214673E0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:22:16 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4lj-0006ge-7U
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:22:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4gH-0000Ou-Ud; Fri, 03 Dec 2021 04:16:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mt4gD-00077p-M3; Fri, 03 Dec 2021 04:16:37 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B38mQLd022720; 
 Fri, 3 Dec 2021 09:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gKu3TX1HIHQ7UcLBnNinLcMLLiZRf2/7W76YePSoKoA=;
 b=Y5OaMprYzWlS7Xq3qntAHRacdjKN5WU3RLhN5kTEqsfb7G2GwQElBZ/cEMr54c3kSvfq
 Y/tWJlSyaVyxABhoqsGRikpjk76lWUooSUmvKBcHkJzLQ2zX5oDlQs/b5YZ4gl7aUqOe
 SAUWS2AQAktVUgwDrEoCO7S3VRWoZFe7P9of0T+a6ToApG7TVLrqH8066d7PHlCxKEL7
 Fe5Cer58y7sred0ZhGmRqv5T3xHmYcrmMETlpNvStgRGJ1XEoaaXQhIvvCxgAJRpljSP
 W9ghTyyC5ZJjJPIorz5XGoHQPwhzuR7XpYNzk0zbWH1u8aeH8Gj4LVdLSnOj1TCyGbEP fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqg258epg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:16:27 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B39907x027599;
 Fri, 3 Dec 2021 09:16:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqg258ena-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:16:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B39Dmk1031443;
 Fri, 3 Dec 2021 09:16:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ckcaac5yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 09:16:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B39GLaH30146936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 09:16:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 110D44C044;
 Fri,  3 Dec 2021 09:16:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C34E4C046;
 Fri,  3 Dec 2021 09:16:20 +0000 (GMT)
Received: from [9.171.47.125] (unknown [9.171.47.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 09:16:20 +0000 (GMT)
Message-ID: <6abb4114-3e5b-1cd6-4048-4f0ccc987dec@linux.ibm.com>
Date: Fri, 3 Dec 2021 10:17:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/4] s390x/pci: don't use hard-coded dma range in reg_ioat
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-3-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211202164110.326947-3-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v8MsRhcWgDqjzW36KIa_LDt3CtKJcbr1
X-Proofpoint-ORIG-GUID: OxYyKUFpn6ouKvJdLdH4X1WS9rYxsi_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_05,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=856 malwarescore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030057
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 17:41, Matthew Rosato wrote:
> Instead use the values from clp info, they will either be the hard-coded
> values or what came from the host driver via vfio.
> 
> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-inst.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 1c8ad91175..11b7f6bfa1 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -916,9 +916,10 @@ int pci_dereg_irqs(S390PCIBusDevice *pbdev)
>       return 0;
>   }
>   
> -static int reg_ioat(CPUS390XState *env, S390PCIIOMMU *iommu, ZpciFib fib,
> +static int reg_ioat(CPUS390XState *env, S390PCIBusDevice *pbdev, ZpciFib fib,
>                       uintptr_t ra)
>   {
> +    S390PCIIOMMU *iommu = pbdev->iommu;
>       uint64_t pba = ldq_p(&fib.pba);
>       uint64_t pal = ldq_p(&fib.pal);
>       uint64_t g_iota = ldq_p(&fib.iota);
> @@ -927,7 +928,7 @@ static int reg_ioat(CPUS390XState *env, S390PCIIOMMU *iommu, ZpciFib fib,
>   
>       pba &= ~0xfff;
>       pal |= 0xfff;
> -    if (pba > pal || pba < ZPCI_SDMA_ADDR || pal > ZPCI_EDMA_ADDR) {
> +    if (pba > pal || pba < pbdev->zpci_fn.sdma || pal > pbdev->zpci_fn.edma) {
>           s390_program_interrupt(env, PGM_OPERAND, ra);
>           return -EINVAL;
>       }
> @@ -1125,7 +1126,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
>           } else if (pbdev->iommu->enabled) {
>               cc = ZPCI_PCI_LS_ERR;
>               s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
> -        } else if (reg_ioat(env, pbdev->iommu, fib, ra)) {
> +        } else if (reg_ioat(env, pbdev, fib, ra)) {
>               cc = ZPCI_PCI_LS_ERR;
>               s390_set_status_code(env, r1, ZPCI_MOD_ST_INSUF_RES);
>           }
> @@ -1150,7 +1151,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
>               s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
>           } else {
>               pci_dereg_ioat(pbdev->iommu);
> -            if (reg_ioat(env, pbdev->iommu, fib, ra)) {
> +            if (reg_ioat(env, pbdev, fib, ra)) {
>                   cc = ZPCI_PCI_LS_ERR;
>                   s390_set_status_code(env, r1, ZPCI_MOD_ST_INSUF_RES);
>               }
> 
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
-- 
Pierre Morel
IBM Lab Boeblingen

