Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ADE497AAB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 09:49:26 +0100 (CET)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBv2T-0005UB-Oa
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 03:49:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nBucv-0007LB-9r; Mon, 24 Jan 2022 03:23:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nBuct-0005Vg-7I; Mon, 24 Jan 2022 03:23:00 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20O7xGEU003304; 
 Mon, 24 Jan 2022 08:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=X+tn/ZRpdRMoivLjAG5o1pzEVXiF6J5B4BzlmFzwGVY=;
 b=Cm/sOoZDUuesyFrYo4VMjNOvGi+J/BqZEtZ83zzZH2y+g9KxtWH2nqomlSu2BIP1IoIN
 J94Luw/gbOlCNVfpTL8un0Slxu9J7gx+/wcz5varzGyTOiaxGaSElXjkaGfuVWNcchvo
 L0mIcuzV3qG1kjZATZo6HK12sPijFY/Gm6kfjfp51Nkt3o4eWka5wqrtKDK9IqIW9iBL
 GySzjgxhy/9y08Nh3HxyCngSv+5wrbGxYSewNvdyKOcTqSvPRj5Kj22uTg9VR8+Rz6dq
 dUe0tkXTvZuwZYCb5ms+K6ZrzU5OeMdSlIul4wF4p6pLbhnhX0W59BZZoTPnRJvX+0Ec HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsmvbc04q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 08:22:48 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20O8GMVn013300;
 Mon, 24 Jan 2022 08:22:48 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsmvbc04f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 08:22:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20O89X3C009861;
 Mon, 24 Jan 2022 08:22:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3dr9j8sw99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 08:22:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20O8Mic644761534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 08:22:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79C3FA4059;
 Mon, 24 Jan 2022 08:22:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3441EA405E;
 Mon, 24 Jan 2022 08:22:44 +0000 (GMT)
Received: from [9.145.183.18] (unknown [9.145.183.18])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 08:22:44 +0000 (GMT)
Message-ID: <cf8ae400-2721-08d2-9e91-0578a71ab9d8@linux.ibm.com>
Date: Mon, 24 Jan 2022 09:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ppc/pnv: Fail DMA access if page permissions are not
 correct
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, danielhb413@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220121152350.381685-1-fbarrat@linux.ibm.com>
 <ae1f4df9-ff4e-e49b-4365-711c6476b90c@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <ae1f4df9-ff4e-e49b-4365-711c6476b90c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lYq9VOK0SY5hz3ooayh-ZcCNa9GdcdQn
X-Proofpoint-ORIG-GUID: IEMcip2J_MDELxF47vTa6yAmRLj8ZJ-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: aik@ozlabs.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21/01/2022 18:35, Cédric Le Goater wrote:
> On 1/21/22 16:23, Frederic Barrat wrote:
>> If an iommu page has wrong permissions, an error message is displayed,
>> but the access is allowed, which is odd. This patch fixes it.
> 
> 
> Being curious. How do you generate such errors ? could we have the
> output ?


By acking the code building the tce table to remove permissions on the 
page. See pnv_tce_build().
Also, on bare metal, device drivers using 64-bit dma will hit a 
translation entry (TVE#1) configured in bypass mode. So to avoid that 
and force translation, you need to add "iommu=nobypass" to the kernel 
boot args.

Then you will see:
phb4[0:1]: TCE access fault at 0x2a510080
phb4[0:1]:  xlate 100000:R TVE=32c702505
phb4[0:1]:  tta=32c70 lev=-2 tts=5 tps=5
Invalid read at addr 0x100000, size 4, region '(null)', reason: rejected

P8 is more complicated...

   Fred



> 
> Thanks,
> 
> C.
> 
> 
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   hw/pci-host/pnv_phb3.c | 11 ++++++-----
>>   hw/pci-host/pnv_phb4.c | 11 ++++++-----
>>   2 files changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index 7fb35dc031..a757f1a58e 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -816,18 +816,19 @@ static void 
>> pnv_phb3_translate_tve(PnvPhb3DMASpace *ds, hwaddr addr,
>>           }
>>           /* We exit the loop with TCE being the final TCE */
>> -        tce_mask = ~((1ull << tce_shift) - 1);
>> -        tlb->iova = addr & tce_mask;
>> -        tlb->translated_addr = tce & tce_mask;
>> -        tlb->addr_mask = ~tce_mask;
>> -        tlb->perm = tce & 3;
>>           if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>>               phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
>>               phb3_error(phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
>>                          is_write ? 'W' : 'R', tve);
>>               phb3_error(phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
>>                          tta, lev, tts, tps);
>> +            return;
>>           }
>> +        tce_mask = ~((1ull << tce_shift) - 1);
>> +        tlb->iova = addr & tce_mask;
>> +        tlb->translated_addr = tce & tce_mask;
>> +        tlb->addr_mask = ~tce_mask;
>> +        tlb->perm = tce & 3;
>>       }
>>   }
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index a78add75b0..ee56377c02 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1291,18 +1291,19 @@ static void 
>> pnv_phb4_translate_tve(PnvPhb4DMASpace *ds, hwaddr addr,
>>           }
>>           /* We exit the loop with TCE being the final TCE */
>> -        tce_mask = ~((1ull << tce_shift) - 1);
>> -        tlb->iova = addr & tce_mask;
>> -        tlb->translated_addr = tce & tce_mask;
>> -        tlb->addr_mask = ~tce_mask;
>> -        tlb->perm = tce & 3;
>>           if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>>               phb_error(ds->phb, "TCE access fault at 0x%"PRIx64, taddr);
>>               phb_error(ds->phb, " xlate %"PRIx64":%c TVE=%"PRIx64, addr,
>>                          is_write ? 'W' : 'R', tve);
>>               phb_error(ds->phb, " tta=%"PRIx64" lev=%d tts=%d tps=%d",
>>                          tta, lev, tts, tps);
>> +            return;
>>           }
>> +        tce_mask = ~((1ull << tce_shift) - 1);
>> +        tlb->iova = addr & tce_mask;
>> +        tlb->translated_addr = tce & tce_mask;
>> +        tlb->addr_mask = ~tce_mask;
>> +        tlb->perm = tce & 3;
>>       }
>>   }
>>
> 

